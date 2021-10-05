import Toybox.Activity;
import Toybox.Application;
import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;

class ClimbView extends WatchUi.View {

	private var app;

	private var currentClimb;
	private var timer;
	private var controller;
	private var duration;
	
	private const interval = 1; // seconds
	
	private var durationLabel;
	private var attemptsLabel;
	private var hrLabel;
	private var currentAttempts; // needed as WatchUi.Text does not provide a method to access the text 
	private var currentHeartRate; // needed to avoid unnecessary updates of the current heart rate

    function initialize() {
        View.initialize();
        
        app = Application.getApp();
        
        currentClimb = app.getWorkout().activeClimb();
        controller = app.getWorkoutController();
        timer = new Timer.Timer();
        duration = 0;
        currentAttempts = 0;
        currentHeartRate = 0;
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.ClimbLayout(dc));
        var gradeLabel = View.findDrawableById("grade") as Text;
        gradeLabel.setText(Grades.toString(currentClimb.getGrade()));
        
        durationLabel = View.findDrawableById("timer") as Text;
        attemptsLabel = View.findDrawableById("attempts") as Text;
        hrLabel = View.findDrawableById("hr") as Text;
        
        startTimer();
        
        if (app.isWorkoutStarted()) {
        	// This is needed to init a new attempt on the climbds from the second on, as they start immediately (i.e. without waiting for the pressure on Start)
        	controller.newAttemptOnActiveClimb(Time.now());
        }
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        
        if (currentClimb.getAttempts() > currentAttempts) {
        	// Here we know there's a new attempt w.r.t. the last time we showed the view
        	currentAttempts = currentClimb.getAttempts();
        	attemptsLabel.setText(currentAttempts.format("%d"));
        	
        	// reset the timer
        	duration = 0;
        	writeDuration();
        }
		
		writeDuration();
		writeHeartRate();
    }
    
    function onShow() as Void {
    	// Restart the timer but don't count that as a new attempt only if the climb is still in progress
    	if (currentClimb.isInProgress()) {
	    	startTimer();
	    } else {
	    	WatchUi.popView(WatchUi.SLIDE_LEFT); // pop the view is the current climb was ended (either successfully or not)
	    }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    	timer.stop();
    }

	function onTimer() {
		if (app.isWorkoutStarted()) {
			duration += interval;
			WatchUi.requestUpdate();
		}
	}
	
	private function startTimer() {
		timer.start(method(:onTimer), interval * 1000, true);
	}
	
	private function writeDuration() {
		var minutes = duration / 60;
        var seconds = duration % 60;
        durationLabel.setText(Lang.format("$1$:$2$", [minutes, seconds.format("%02d")]));
	}
	
	private function writeHeartRate() {
		var lastHrSample = Activity.getActivityInfo().currentHeartRate;
		if (lastHrSample != null && lastHrSample != currentHeartRate) {
			hrLabel.setText(lastHrSample.format("%d"));
		}
	}
}
