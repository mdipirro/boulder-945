using Toybox.Lang;
using Toybox.System;
using Toybox.WatchUi;

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

	function onBack() {
		if (Application.getApp().isWorkoutStarted()) {
			// if the workous is ongoing, show the SaveSession menu to let the user save the session after a climb
			WatchUi.pushView(new Rez.Menus.SaveSessionMenu(), new SaveSessionMenuDelegate(), WatchUi.SLIDE_LEFT);
		} else {
			// or else exit the app
			WatchUi.popView(WatchUi.SLIDE_UP);
		}
	}
}