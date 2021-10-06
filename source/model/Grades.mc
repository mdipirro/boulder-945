using Toybox.Lang;

module Grades {
	enum {
		GRADE_A,
		GRADE_B,
		GRADE_C,
		GRADE_D,
		GRADE_E,
		GRADE_F
	}
	
	function fromString(grade as String) as Grades {
		switch (grade) {
			case "A":
				return GRADE_A;
			case "B":
				return GRADE_B;
			case "C":
				return GRADE_C;
			case "D":
				return GRADE_D;
			case "E":
				return GRADE_E;
			case "F":
				return GRADE_F;
			default:
				throw new Lang.InvalidValueException("Unrecognized grade: " + grade);
		}
	}
	
	function toString(grade as Grades) as String {
		switch (grade) {
			case GRADE_A:
				return "A";
			case GRADE_B:
				return "B";
			case GRADE_C:
				return "C";
			case GRADE_D:
				return "D";
			case GRADE_E:
				return "E";
			case GRADE_F:
				return "F";
		}
	}
}