using Toybox.Lang;
using Toybox.System;
using Toybox.WatchUi;
using Grades;

class GradeMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
		var app = Application.getApp();
		var workout = app.getWorkout();
		var grade = item.getLabel();
		workout.newClimb(Grades.fromString(grade));
		if (app.isWorkoutStarted()) {
        	// This is needed to init a new attempt on the climbs from the second on, as they start immediately (i.e. without waiting for the pressure on Start)
        	workout.activeClimb().newAttempt();
        }
    	pushView(new ClimbView(workout.activeClimb()), new ClimbViewDelegate(), WatchUi.SLIDE_LEFT);
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