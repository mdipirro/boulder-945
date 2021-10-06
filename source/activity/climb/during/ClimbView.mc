using Toybox.Activity;
using Toybox.Application;
using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.Timer;

class ClimbView extends WatchUi.View {

	private var _app;

	private var _currentClimb;
	private var _timer;
	private var _duration;
	
	private const INTERVAL = 1; // seconds
	
	private var _durationLabel;
	private var _attemptsLabel;
	private var _hrLabel;
	private var _currentAttempts; // needed as WatchUi.Text does not provide a method to access the text 
	private var _currentHeartRate; // needed to avoid unnecessary updates of the current heart rate

	private var _started;

    function initialize(activeClimb as Climb) {
        View.initialize();
        
        _app = Application.getApp();
        
        _currentClimb = activeClimb;
        _timer = new Timer.Timer();
        _duration = 0;
        _currentAttempts = 0;
        _currentHeartRate = 0;

		_started = false;
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.ClimbLayout(dc));
        var gradeLabel = View.findDrawableById("grade") as Text;
        gradeLabel.setText(Grades.toString(_currentClimb.getGrade()));
        
        _durationLabel = View.findDrawableById("timer") as Text;
        _attemptsLabel = View.findDrawableById("attempts") as Text;
        _hrLabel = View.findDrawableById("hr") as Text;
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        
        if (_currentClimb.getAttempts() > _currentAttempts) {
        	// Here we know there's a new attempt w.r.t. the last time we showed the view
        	_currentAttempts = _currentClimb.getAttempts();
        	_attemptsLabel.setText(_currentAttempts.format("%d"));
        	
        	// reset the timer or start it if the user just started the activity
			if (!_started) {
				_started = true;
				startTimer();
			}
        	_duration = 0;
        }
		
		writeDuration();
		writeHeartRate();
    }
    
    function onShow() as Void {
    	// Restart the timer but don't count that as a new attempt only if the climb is still in progress
    	if (_currentClimb.isInProgress()) {
	    	startTimer();
	    } else {
	    	WatchUi.popView(WatchUi.SLIDE_LEFT); // pop the view is the current climb was ended (either successfully or not)
	    }
    }

    function onHide() as Void {
    	_timer.stop();
    }

	function onTimer() as Void {
		if (_app.isWorkoutStarted()) {
			_duration += INTERVAL;
			WatchUi.requestUpdate();
		}
	}
	
	private function startTimer() as Void {
		_timer.start(method(:onTimer), INTERVAL * 1000, true);
	}
	
	private function writeDuration() as Void {
		var minutes = _duration / 60;
        var seconds = _duration % 60;
        _durationLabel.setText(Lang.format("$1$:$2$", [minutes, seconds.format("%02d")]));
	}
	
	private function writeHeartRate() as Void {
		var lastHrSample = Activity.getActivityInfo().currentHeartRate;
		if (lastHrSample != null && lastHrSample != _currentHeartRate) {
			_hrLabel.setText(lastHrSample.format("%d"));
		}
	}
}
