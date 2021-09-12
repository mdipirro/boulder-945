import Toybox.Lang;
import Toybox.WatchUi;

class IntellighenziaDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new IntellighenziaMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}