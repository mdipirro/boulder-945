import Toybox.Application;
import Toybox.ActivityRecording;
import Toybox.System;
import Toybox.WatchUi;

class ClimbViewDelegate extends WatchUi.BehaviorDelegate {

private var app;

	function initialize() {
        BehaviorDelegate.initialize();
        
        app = Application.getApp();
    }
    
    function onSelect() {
    	var session = app.getSession();
    	if (session == null) {
    		session = ActivityRecording.createSession({
    			:name => "Intellighenzia Bouldering",
    			:sport => ActivityRecording.SPORT_GENERIC
    		});
    		session.start();
    		
    		app.setSession(session);
    		app.startWorkout();
    		WatchUi.requestUpdate();
    	} else if (!session.isRecording()) {
			session.start();
    	} else { // session exists and is recording
			session.stop();
			WatchUi.pushView(new Rez.Menus.SaveSessionMenu(), new SaveSessionMenuDelegate(), WatchUi.SLIDE_LEFT);	
    	}
    }

    function onBack() as Boolean {
    	WatchUi.popView(WatchUi.SLIDE_UP); // remove climb view
    	if (app.isWorkoutStarted()) {
    		WatchUi.pushView(new Rez.Menus.AfterClimbMenu(), new AfterClimbMenuDelegate(), WatchUi.SLIDE_LEFT);
    	}
    	return true;    	
    }

}