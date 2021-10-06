using Grades;

class Climb {
	
	private var _grade;
	private var _attempts;
	private var _status;
	
	enum {
		InProgress,
		Completed,
		Failed
	}
	

	function initialize(difficulty as Grades) {
		_grade = difficulty;
		_attempts = 0;
		_status = InProgress;
	}
	
	function getGrade() as Grades {
		return _grade;
	}
	
	function getAttempts() as Number {
		return _attempts;
	}
	
	function newAttempt() as Void {
		_attempts++;
	}
	
	function isInProgress() as Boolean {
		return _status == InProgress;
	}
	
	function fail() as Void {
		_status = Failed;
	}
	
	function isFailed() as Boolean {
		return _status == Failed;
	}
	
	function complete() as Void {
		_status = Completed;
	}
	
	function isComplete() as Boolean {
		return _status == Completed;
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