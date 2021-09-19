import Toybox.Lang;

class GradeSummary {
	
	private var attempts;
	private var successful;
	private var failed;
	
	function initialize() {
		attempts = 0;
		successful = 0;
		failed = 0;
	}
	
	function newClimb(climb as Climb) {
		attempts += climb.getAttempts();
		if (climb.isComplete()) {
			successful++;
		} else if (climb.isFailed()) {
			failed++;
		} else {
			throw new Lang.InvalidValueException("Detected a climb that is still in progress");
		} 
	}
	
	function getAttempts() as Number {
		return attempts;
	}
	
	function getSuccessful() as Number {
		return successful;
	}
	
	function getFailed() as Number {
		return failed;
	}
}