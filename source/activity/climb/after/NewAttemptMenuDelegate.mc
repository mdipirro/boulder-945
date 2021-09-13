import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Application;

class NewAttemptMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
    	WatchUi.popView(WatchUi.SLIDE_UP); // remove the current menu
    	switch (item.getId()) {
    		case :newAtt:
    			// If we're gonna do a new attempt, show the ClimbView as before
    			var currentClimb = Application.getApp().workout.activeClimb();
    			pushView(new ClimbView(currentClimb.getGrade()), new ClimbViewDelegate(), WatchUi.SLIDE_LEFT);
    			break;
    		case :newClimb:
    			// If the climb was not completed, let the user decide whether to attempt again or not
    			WatchUi.pushView(new Rez.Menus.GradeMenu(), new GradeMenuDelegate(), WatchUi.SLIDE_LEFT);
    			break;
    	}
    }

}