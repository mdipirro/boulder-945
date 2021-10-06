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
		} else if (climb.isFailed() || climb.isInProgress()) {
			// Count the climb as failed if the activity is ended while the climb is still in progress
			_failed++;
		} else {
			throw new Lang.InvalidValueException("Unexpected climb state");
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