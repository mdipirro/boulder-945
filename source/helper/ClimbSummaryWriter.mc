using Toybox.Application;
using Toybox.FitContributor;
using Toybox.WatchUi;

using Grades;

using Toybox.System;

class ClimbSummaryWriter {
	
	private static var _fields = [];
	
	private static const GRADES = [
		Grades.GRADE_A,
		Grades.GRADE_B,
		Grades.GRADE_C,
		Grades.GRADE_D,
		Grades.GRADE_E,
		Grades.GRADE_F
	];
	
	private static const LABELS = [
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
	
	static function writeSummary(session as Session, workout as Workout) as Void {
		if (_fields.size() == 0) {
			// do something only if it's the first time this method gets called, otherwise do nothing. This way the operation is idempotent
			var summary = new WorkoutSummary(workout);
			for (var i = 0; i < GRADES.size(); i++) {
				var gradeSummary = summary.getSummaryForGrade(GRADES[i]);
				if (gradeSummary.getAttempts() > 0) { // add fields only if there's at least 1 attempt
					var gradeIndex = i * 3; // three fields for each grade
					
					if (gradeSummary.getSuccessful() > 0) {
						var completedField = session.createField(WatchUi.loadResource(LABELS[gradeIndex]), gradeIndex, FitContributor.DATA_TYPE_UINT8, {
							:mesgType => FitContributor.MESG_TYPE_SESSION
						});
						completedField.setData(gradeSummary.getSuccessful());
						_fields.add(completedField);
					}
					
					if (gradeSummary.getFailed() > 0) {
						var failedField = session.createField(WatchUi.loadResource(LABELS[gradeIndex + 1]), gradeIndex + 1, FitContributor.DATA_TYPE_UINT8, {
							:mesgType => FitContributor.MESG_TYPE_SESSION
						});
						failedField.setData(gradeSummary.getFailed());
						_fields.add(failedField);
					}
					
					var attemptsField = session.createField(WatchUi.loadResource(LABELS[gradeIndex + 2]), gradeIndex + 2, FitContributor.DATA_TYPE_UINT8, {
						:mesgType => FitContributor.MESG_TYPE_SESSION
					});
					attemptsField.setData(gradeSummary.getAttempts());
					_fields.add(attemptsField);
				}
			}
		}
	}
}