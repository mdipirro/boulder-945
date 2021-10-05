using Grades;

class WorkoutSummary {
	
	private var summary;
	
	function initialize(workout as Workout) {
		summary = {
			Grades.A => new GradeSummary(),
			Grades.B => new GradeSummary(),
			Grades.C => new GradeSummary(),
			Grades.D => new GradeSummary(),
			Grades.E => new GradeSummary(),
			Grades.F => new GradeSummary()
		};
		
		var climbs = workout.getClimbs();
		for (var i = 0; i < climbs.size(); i++) {
			var climb = climbs[i];
			summary[climb.getGrade()].newClimb(climb);
		}
	}
	
	function getSummaryForGrade(grade as String) as GradeSummary {
		return summary[grade];
	}
}