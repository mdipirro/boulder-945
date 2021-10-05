using Toybox.Lang;
using Toybox.System;
import Toybox.WatchUi;

class GradeMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
		var app = Application.getApp();
		var controller = app.getWorkoutController();
		var grade = item.getLabel();
		controller.newClimb(grade);
		if (app.isWorkoutStarted()) {
        	// This is needed to init a new attempt on the climbs from the second on, as they start immediately (i.e. without waiting for the pressure on Start)
        	controller.newAttemptOnActiveClimb();
        }
    	pushView(new ClimbView(app.getWorkout().activeClimb()), new ClimbViewDelegate(), WatchUi.SLIDE_LEFT);
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