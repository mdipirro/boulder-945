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
	
	function newAttempt(seconds as Int) {
		attempts.add(new Attempt(seconds));
	}
}