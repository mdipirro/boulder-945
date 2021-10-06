using Grades;

class WorkoutSummary {
	
	private var _summary;
	
	function initialize(workout as Workout) {
		_summary = {
			Grades.GRADE_A => new GradeSummary(),
			Grades.GRADE_B => new GradeSummary(),
			Grades.GRADE_C => new GradeSummary(),
			Grades.GRADE_D => new GradeSummary(),
			Grades.GRADE_E => new GradeSummary(),
			Grades.GRADE_F => new GradeSummary()
		};
		
		var climbs = workout.getClimbs();
		for (var i = 0; i < climbs.size(); i++) {
			var climb = climbs[i];
			_summary[climb.getGrade()].newClimb(climb);
		}
	}
	
	function getSummaryForGrade(grade as String) as GradeSummary {
		return _summary[grade];
	}
}