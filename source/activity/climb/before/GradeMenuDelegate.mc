import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class GradeMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
		var controller = Application.getApp().getWorkoutController();
		var grade = item.getLabel();
		controller.newClimb(grade);
    	pushView(new ClimbView(), new ClimbViewDelegate(), WatchUi.SLIDE_LEFT);
    }

}