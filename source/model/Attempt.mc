using Toybox.Time;

class Attempt {
	
	private var startTime;
	private var endTime;
	
	function initialize(st as Time.Moment) {
		startTime = st;
		endTime = null;
	}
	
	function end(time as Time.Moment) as Void {
		endTime = time;
	}
	
	function getDuration() as Number {
		if (endTime != null) { 
			return endTime.subtract(startTime).value();
		} else {
			return Time.now().subtract(startTime).value();	
		}
	}
}