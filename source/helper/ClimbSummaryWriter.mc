import Toybox.Application;
import Toybox.FitContributor;
import Toybox.WatchUi;

using Grades;

class ClimbSummaryWriter {
	
	private static var fields = [];
	
	private static const grades = [
		Grades.A,
		Grades.B,
		Grades.C,
		Grades.D,
		Grades.E,
		Grades.F
	];
	
	private static const labels = [
		Rez.Strings.gradeASuccessful,
		Rez.Strings.gradeAFailed,
		Rez.Strings.gradeAAttempts,
		Rez.Strings.gradeBSuccessful,
		Rez.Strings.gradeBFailed,
		Rez.Strings.gradeBAttempts,
		Rez.Strings.gradeCSuccessful,
		Rez.Strings.gradeCFailed,
		Rez.Strings.gradeCAttempts,
		Rez.Strings.gradeDSuccessful,
		Rez.Strings.gradeDFailed,
		Rez.Strings.gradeDAttempts,
		Rez.Strings.gradeESuccessful,
		Rez.Strings.gradeEFailed,
		Rez.Strings.gradeEAttempts,
		Rez.Strings.gradeFSuccessful,
		Rez.Strings.gradeFFailed,
		Rez.Strings.gradeFAttempts
	];
	
	static function writeSummary(session as Session, workout as Workout) {
		if (fields.size() == 0) {
			// do something only if it's the first time this method gets called, otherwise do nothing. This way the operation is idempotent
			var summary = new WorkoutSummary(workout);
			for (var i = 0; i < grades.size(); i++) {
				var gradeSummary = summary.getSummaryForGrade(grades[i]);
				if (gradeSummary.getAttempts() > 0) { // add fields only if there's at least 1 attempt
					var gradeIndex = i * 3; // three fields for each grade
					
					var completedField = session.createField(WatchUi.loadResource(labels[gradeIndex]), gradeIndex, FitContributor.DATA_TYPE_UINT8, {
						:mesgType => FitContributor.MESG_TYPE_SESSION
					});
					completedField.setData(gradeSummary.getSuccessful());
					
					var failedField = session.createField(WatchUi.loadResource(labels[gradeIndex + 1]), gradeIndex + 1, FitContributor.DATA_TYPE_UINT8, {
						:mesgType => FitContributor.MESG_TYPE_SESSION
					});
					failedField.setData(gradeSummary.getFailed());
					
					var attemptsField = session.createField(WatchUi.loadResource(labels[gradeIndex + 2]), gradeIndex + 2, FitContributor.DATA_TYPE_UINT8, {
						:mesgType => FitContributor.MESG_TYPE_SESSION
					});
					attemptsField.setData(gradeSummary.getAttempts());
					
					fields.add(completedField);
					fields.add(failedField);
					fields.add(attemptsField);
				}
			}
		}
	}
}