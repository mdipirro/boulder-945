using Toybox.Lang;

class GradeSummary {
	
	private var _attempts;
	private var _successful;
	private var _failed;
	
	function initialize() {
		_attempts = 0;
		_successful = 0;
		_failed = 0;
	}
	
	function newClimb(climb as Climb) as Void {
		_attempts += climb.getAttempts();
		if (climb.isComplete()) {
			_successful++;
		} else if (climb.isFailed()) {
			_failed++;
		} else {
			throw new Lang.InvalidValueException("Detected a climb that is still in progress");
		} 
	}
	
	function getAttempts() as Number {
		return _attempts;
	}
	
	function getSuccessful() as Number {
		return _successful;
	}
	
	function getFailed() as Number {
		return _failed;
	}
}