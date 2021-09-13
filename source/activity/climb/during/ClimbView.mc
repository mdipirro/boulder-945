import Toybox.Graphics;
import Toybox.WatchUi;

class ClimbView extends WatchUi.View {

	private var currentGrade;

    function initialize(grade as String) {
        View.initialize();
        currentGrade = grade;
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.ClimbLayout(dc));
        var gradeLabel = View.findDrawableById("grade") as Text;
        gradeLabel.setText(currentGrade);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
