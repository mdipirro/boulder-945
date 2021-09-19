class WorkoutSummary {
	
	private var summary;
	
	function initialize(workout as Workout) {
		summary = {
			"A" => new GradeSummary(),
			"B" => new GradeSummary(),
			"C" => new GradeSummary(),
			"D" => new GradeSummary(),
			"E" => new GradeSummary(),
			"F" => new GradeSummary()
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