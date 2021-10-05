using Toybox.Application;

using Grades;

class WorkoutController {

	private var workout; 

	function initialize() {
		workout = Application.getApp().getWorkout();
	}
	
	function newClimb(grade as String) as Void {
		workout.newClimb(Grades.fromString(grade));
	}
	
	function newAttemptOnActiveClimb() as Void {
		workout.activeClimb().newAttempt();
	}
	
	function climbDone() as Climb {
		var activeClimb = workout.activeClimb(); 
		activeClimb.complete();
		return activeClimb;
	}
	
	function climbFailed() as Climb {
		var activeClimb = workout.activeClimb(); 
		activeClimb.fail();
		return activeClimb;
	}
}