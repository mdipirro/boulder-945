import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class ClimbViewDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onBack() as Boolean {
    	WatchUi.popView(WatchUi.SLIDE_UP); // remove climb view
    	WatchUi.pushView(new Rez.Menus.AfterClimbMenu(), new AfterClimbMenuDelegate(), WatchUi.SLIDE_LEFT);
    	return true;    	
    }

}