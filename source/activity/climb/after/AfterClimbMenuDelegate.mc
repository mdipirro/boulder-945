using Toybox.Application;
using Toybox.System;
using Toybox.WatchUi;
using Toybox.Time;

class AfterClimbMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
    	WatchUi.popView(WatchUi.SLIDE_UP); // remove the current menu
    	switch (item.getId()) {
    		case :att:
    			// If the climb was not completed, let the user decide whether to attempt again or not
				WatchUi.pushView(new Rez.Menus.NewAttemptMenu(), new NewAttemptMenuDelegate(), WatchUi.SLIDE_LEFT);
    			break;
    		case :done:
    			Application.getApp().getWorkout().activeClimb().complete();
    			break;
    	} 
    }
	
	function onBack() as Void {
		WatchUi.popView(WatchUi.SLIDE_UP); // remove the current menu
	}
}