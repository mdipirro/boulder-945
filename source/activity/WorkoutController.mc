import Toybox.Application;
import Toybox.Time;

class WorkoutController {

	private var workout; 

	function initialize() {
		workout = Application.getApp().getWorkout();
	}
	
	function newClimb(grade as String) {
		workout.newClimb(grade);
	}
	
	function newAttemptOnActiveClimb(startTime as Time.Moment) {
		workout.activeClimb().newAttempt(startTime);
	} 
	
	function attemptComplete(endTime as Time.Moment) {
		workout.activeClimb().endAttempt(endTime);
	}
}