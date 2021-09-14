import Toybox.Time;

class Climb {
	
	private var grade;
	private var attempts;
	

	function initialize(difficulty as String) {
		grade = difficulty;
		attempts = [];
	}
	
	function getGrade() as String {
		return grade;
	}
	
	function getAttempts() as Number {
		return attempts.size();
	}
	
	function newAttempt(startTime as Time.Moment) {
		attempts.add(new Attempt(startTime));
	}
	
	function endAttempt(endTime as Time.Moment) {
		var currentAttempt = attempts[attempts.size() - 1];
		currentAttempt.end(endTime);
	}
}