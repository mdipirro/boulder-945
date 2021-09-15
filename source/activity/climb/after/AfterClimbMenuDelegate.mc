import Toybox.Application;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time;

class AfterClimbMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
        
        var controller = Application.getApp().getWorkoutController();
    	controller.attemptComplete(Time.now());
    }

    function onSelect(item as MenuItem) as Void {
    	WatchUi.popView(WatchUi.SLIDE_UP);
    	if (item.getId() == :att) {
			// If the climb was not completed, let the user decide whether to attempt again or not
			WatchUi.pushView(new Rez.Menus.NewAttemptMenu(), new NewAttemptMenuDelegate(), WatchUi.SLIDE_LEFT);    	
    	}
    	// If the climb was completed, then we'll show the intial menu to the the user choose a new grade so do nothing
    }

}