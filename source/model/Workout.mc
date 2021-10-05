using Grades;

class Workout {
	
	private var climbs;
	
	function initialize() {
		climbs = [];	
	}
	
	function newClimb(grade as Grades) as Void {
		climbs.add(new Climb(grade));
	}
	
	function activeClimb() as Climb {
		return climbs[climbs.size() - 1];
	}
	
	function getClimbs() as Array {
		return climbs;
	}
}