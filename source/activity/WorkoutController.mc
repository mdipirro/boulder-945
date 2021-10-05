using Toybox.Application;
using Toybox.Time;

using Grades;

class WorkoutController {

	private var workout; 

	function initialize() {
		workout = Application.getApp().getWorkout();
	}
	
	function newClimb(grade as String) as Void {
		workout.newClimb(Grades.fromString(grade));
	}
	
	function newAttemptOnActiveClimb(startTime as Time.Moment) as Void {
		workout.activeClimb().newAttempt(startTime);
	} 
	
	function attemptComplete(endTime as Time.Moment) as Void {
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