import Toybox.Application;
import Toybox.Time;

using Grades;

class WorkoutController {

	private var workout; 

	function initialize() {
		workout = Application.getApp().getWorkout();
	}
	
	function newClimb(grade as String) {
		workout.newClimb(Grades.fromString(grade));
	}
	
	function newAttemptOnActiveClimb(startTime as Time.Moment) {
		workout.activeClimb().newAttempt(startTime);
	} 
	
	function attemptComplete(endTime as Time.Moment) {
		workout.activeClimb().endAttempt(endTime);
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