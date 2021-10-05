using Toybox.Lang;
using Toybox.System;
using Toybox.WatchUi;
using Toybox.Application;

class NewAttemptMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
    	var controller = Application.getApp().getWorkoutController();
    	switch (item.getId()) {
    		case :newAtt:
    			// If we're gonna do a new attempt, show the ClimbView as before and start a new attempt
    			controller.newAttemptOnActiveClimb(Time.now());
    			popView(WatchUi.SLIDE_LEFT);
    			break;
    		case :newClimb:
    			var climb = controller.climbFailed();
    			WatchUi.switchToView(new Rez.Menus.GradeMenu(), new GradeMenuDelegate(), WatchUi.SLIDE_LEFT);
    			break;
    	}
    }

}