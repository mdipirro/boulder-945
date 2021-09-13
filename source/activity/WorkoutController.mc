import Toybox.Application;

class WorkoutController {

	private var workout; 

	function initialize() {
		workout = Application.getApp().workout;
	}
	
	function newClimb(grade as String) {
		workout.newClimb(grade);
	}
	
	function activeClimb() as Climb {
		return workout.activeClimb();
	}
}