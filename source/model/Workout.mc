using Grades;

class Workout {
	
	private var _climbs;
	
	function initialize() {
		_climbs = [];	
	}
	
	function newClimb(grade as Grades) as Void {
		_climbs.add(new Climb(grade));
	}
	
	function activeClimb() as Climb {
		return _climbs[_climbs.size() - 1];
	}
	
	function getClimbs() as Array {
		return _climbs;
	}
}