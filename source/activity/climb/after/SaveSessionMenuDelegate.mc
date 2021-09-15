import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Timer;

class SaveSessionMenuDelegate extends WatchUi.Menu2InputDelegate {

	private var timer;

    function initialize() {
        Menu2InputDelegate.initialize();
        
        timer = new Timer.Timer();
    }

    function onSelect(item as MenuItem) as Void {
    	var session = Application.getApp().getSession();
    	switch(item.getId()) {
    		case :save:
    			session.save();
    			endApp("Salvataggio...");
    			break;
    		case :discard:
    			session.discard();
    			endApp("Eliminazione...");
    			break;
    		case :start:
    			session.start();
    			WatchUi.popView();
    			break;
    	}
    }
    
    private function endApp(msg as String) {
    	new Timer.Timer().start(method(:exit), 5000, false);
    	WatchUi.pushView(new WatchUi.ProgressBar(msg, null), null, WatchUi.SLIDE_DOWN);
    }

	function exit() {
		System.exit();	
	}
}