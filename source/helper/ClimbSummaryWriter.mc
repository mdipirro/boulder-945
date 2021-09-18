import Toybox.Application;
import Toybox.FitContributor;

class ClimbSummaryWriter {
	
	private static const fieldName = "Workout Summary";
	
	private static var fields = [];

	static function writeFiled(climb as Climb) {
		var msg = climb.toString();
		var counter = fields.size() + 1;
		var session = Application.getApp().getSession();
		var field = session.createField(fieldName + " " + counter, counter, FitContributor.DATA_TYPE_STRING, {
			:count => msg.length() + 1, // account for null terminator
			:mesgType => FitContributor.MESG_TYPE_SESSION
		});
		field.setData(msg);
		fields.add(field);
	}
}