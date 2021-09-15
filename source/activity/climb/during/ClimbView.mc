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

    function initialize() {
        View.initialize();
        
        app = Application.getApp();
        
        currentClimb = app.getWorkout().activeClimb();
        controller = app.getWorkoutController();
        timer = new Timer.Timer();
        duration = 0;
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.ClimbLayout(dc));
        var gradeLabel = View.findDrawableById("grade") as Text;
        gradeLabel.setText(currentClimb.getGrade());
        
        var attemptsLabel = View.findDrawableById("attempts") as Text;
        attemptsLabel.setText(currentClimb.getAttempts().format("%d"));
        
        durationLabel = View.findDrawableById("timer") as Text;
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        
        // Start the timer if the workout was started and the duration is still 0
        if (app.isWorkoutStarted() && duration == 0) {
			timer.start(method(:onTimer), interval * 1000, true);
    		controller.newAttemptOnActiveClimb(Time.now());    	
    	} else { // or else update the view
			var minutes = duration / 60;
	        var seconds = duration % 60;
	        durationLabel.setText(Lang.format("$1$:$2$", [minutes, seconds.format("%02d")]));    	
    	}
    }
    
    function onShow() as Void {
    	// Restart the timer but don't count that as a new attempt
    	if (app.isWorkoutStarted()) {
    		timer.start(method(:onTimer), interval * 1000, true);
    	}
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    	timer.stop();
    }

	function onTimer() {
		duration += interval;
		WatchUi.requestUpdate();
	}
}
