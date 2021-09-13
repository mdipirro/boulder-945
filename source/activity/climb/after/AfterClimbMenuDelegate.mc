import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class AfterClimbMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
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