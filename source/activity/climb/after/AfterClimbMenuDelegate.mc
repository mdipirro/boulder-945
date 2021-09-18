import Toybox.Application;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time;

class AfterClimbMenuDelegate extends WatchUi.Menu2InputDelegate {

	private var controller;

    function initialize() {
        Menu2InputDelegate.initialize();
        
        controller = Application.getApp().getWorkoutController();
    	controller.attemptComplete(Time.now());
    }

    function onSelect(item as MenuItem) as Void {
    	WatchUi.popView(WatchUi.SLIDE_UP); // remove the current menu
    	switch (item.getId()) {
    		case :att:
    			// If the climb was not completed, let the user decide whether to attempt again or not
				WatchUi.pushView(new Rez.Menus.NewAttemptMenu(), new NewAttemptMenuDelegate(), WatchUi.SLIDE_LEFT);
    			break;
    		case :done:
    			controller.climbDone();
    			break;
    	} 
    }
	
	function onBack() {
		WatchUi.popView(WatchUi.SLIDE_UP); // remove the current menu
	}
}