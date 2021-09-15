import Toybox.Application;
import Toybox.ActivityRecording;
import Toybox.System;
import Toybox.WatchUi;

class ClimbViewDelegate extends WatchUi.BehaviorDelegate {

	function initialize() {
        BehaviorDelegate.initialize();
    }
    
    function onSelect() {
    	var session = Application.getApp().getSession();
    	if (session == null) {
    		session = ActivityRecording.createSession({
    			:name => "Intellighenzia Bouldering",
    			:sport => ActivityRecording.SPORT_GENERIC
    		});
    		session.start();
    		
    		Application.getApp().setSession(session);
    	} else if (!session.isRecording()) {
			session.start();
    	} else { // session exists and is recording
			session.stop();
			WatchUi.pushView(new Rez.Menus.SaveSessionMenu(), new SaveSessionMenuDelegate(), WatchUi.SLIDE_LEFT);	
    	}
    }

    function onBack() as Boolean {
    	WatchUi.popView(WatchUi.SLIDE_UP); // remove climb view
    	WatchUi.pushView(new Rez.Menus.AfterClimbMenu(), new AfterClimbMenuDelegate(), WatchUi.SLIDE_LEFT);
    	return true;    	
    }

}