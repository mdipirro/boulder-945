class Workout {
	
	private var avgHr;
	private var climbs;
	
	function initialize() {
		avgHr = 0;
		climbs = [];	
	}
	
	function newClimb(grade as String) {
		climbs.add(new Climb(grade));
	}
	
	function activeClimb() as Climb {
		return climbs[climbs.size() - 1];
	}
	
	function getClimbs() as Array {
		return climbs;
	}
}