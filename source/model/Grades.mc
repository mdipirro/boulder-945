using Toybox.Lang;

module Grades {
	enum {
		A,
		B,
		C,
		D,
		E,
		F
	}
	
	function fromString(grade as String) as Grades {
		switch (grade) {
			case "A":
				return A;
			case "B":
				return B;
			case "C":
				return C;
			case "D":
				return D;
			case "E":
				return E;
			case "F":
				return F;
			default:
				throw new Lang.InvalidValueException("Unrecognized grade: " + grade);
		}
	}
	
	function toString(grade as Grades) as String {
		switch (grade) {
			case A:
				return "A";
			case B:
				return "B";
			case C:
				return "C";
			case D:
				return "D";
			case E:
				return "E";
			case F:
				return "F";
		}
	}
}