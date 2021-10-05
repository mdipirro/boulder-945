using Toybox.Time;
using Grades;

class Climb {
	
	private var grade;
	private var attempts;
	private var status;
	
	enum {
		InProgress,
		Completed,
		Failed
	}
	

	function initialize(difficulty as Grades) {
		grade = difficulty;
		attempts = [];
		status = InProgress;
	}
	
	function getGrade() as Grades {
		return grade;
	}
	
	function getAttempts() as Number {
		return attempts.size();
	}
	
	function newAttempt(startTime as Time.Moment) as Void {
		attempts.add(new Attempt(startTime));
	}
	
	function endAttempt(endTime as Time.Moment) as Void {
		var currentAttempt = attempts[attempts.size() - 1];
		currentAttempt.end(endTime);
	}
	
	function isInProgress() as Boolean {
		return status == InProgress;
	}
	
	function fail() as Void {
		status = Failed;
	}
	
	function isFailed() as Boolean {
		return status == Failed;
	}
	
	function complete() as Void {
		status = Completed;
	}
	
	function isComplete() as Boolean {
		return status == Completed;
	}
	
	function toString() as String {
		var msg = "";
		if (isComplete()) {
			msg += "Completata"; 		
		} else {
			msg += "Fallita";
		}
		return msg + " in " + getAttempts() + " tentativi.";
	}
}