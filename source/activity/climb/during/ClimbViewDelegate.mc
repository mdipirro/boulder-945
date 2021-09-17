import Toybox.Application;
import Toybox.ActivityRecording;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Attention;

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
    		Attention.vibrate([new Attention.VibeProfile(50, 1000)]);
    		
    		
    		app.setSession(session);
    		app.startWorkout();
    		app.getWorkoutController().newAttemptOnActiveClimb(Time.now());
    		WatchUi.requestUpdate();
    	} else if (!session.isRecording()) {
			session.start();
    	} else { // session exists and is recording
			session.stop();
			WatchUi.pushView(new Rez.Menus.SaveSessionMenu(), new SaveSessionMenuDelegate(), WatchUi.SLIDE_LEFT);	
    	}
    }

    function onBack() as Boolean {
    	if (app.isWorkoutStarted()) {
    		WatchUi.pushView(new Rez.Menus.AfterClimbMenu(), new AfterClimbMenuDelegate(), WatchUi.SLIDE_LEFT);
    	} else {
			WatchUi.popView(WatchUi.SLIDE_UP);    	
    	}
    	return true;    	
    }

}