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
		attempts = 0;
		status = InProgress;
	}
	
	function getGrade() as Grades {
		return grade;
	}
	
	function getAttempts() as Number {
		return attempts;
	}
	
	function newAttempt() as Void {
		attempts++;
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