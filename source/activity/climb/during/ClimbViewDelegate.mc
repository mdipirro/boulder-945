using Toybox.Application;
using Toybox.ActivityRecording;
using Toybox.System;
using Toybox.WatchUi;
using Toybox.Attention;

class ClimbViewDelegate extends WatchUi.BehaviorDelegate {

	private var _app;

	function initialize() {
        BehaviorDelegate.initialize();
        
        _app = Application.getApp();
    }
    
    function onSelect() as Boolean {
    	var session = _app.getSession();
    	if (session == null) {
    		session = ActivityRecording.createSession({
    			:name => "Intellighenzia Bouldering",
    			:sport => ActivityRecording.SPORT_ROCK_CLIMBING
    		});
    		session.start();
    		Attention.vibrate([new Attention.VibeProfile(50, 1000)]);
    		
    		
    		_app.setSession(session);
    		_app.startWorkout();
    		_app.getWorkout().activeClimb().newAttempt();
    		WatchUi.requestUpdate();
    	} else if (!session.isRecording()) {
			session.start();
    	} else { // session exists and is recording
			session.stop();
			WatchUi.pushView(new Rez.Menus.SaveSessionMenu(), new SaveSessionMenuDelegate(), WatchUi.SLIDE_LEFT);	
    	}
		return true;
    }

    function onBack() as Boolean {
    	if (_app.isWorkoutStarted()) {
    		WatchUi.pushView(new Rez.Menus.AfterClimbMenu(), new AfterClimbMenuDelegate(), WatchUi.SLIDE_LEFT);
    	} else {
			WatchUi.popView(WatchUi.SLIDE_UP);    	
    	}
    	return true;    	
    }

}