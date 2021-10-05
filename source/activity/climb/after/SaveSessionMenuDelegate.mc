using Toybox.Lang;
using Toybox.System;
using Toybox.WatchUi;
using Toybox.Application;
using Toybox.Timer;
using Toybox.Attention;

class SaveSessionMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
    	var app = Application.getApp();
    	var session = app.getSession();
    	switch(item.getId()) {
    		case :save:
    			ClimbSummaryWriter.writeSummary(session, app.getWorkout());
    			session.save();
    			endApp("Salvataggio...");
    			break;
    		case :discard:
    			session.discard();
    			endApp("Eliminazione...");
    			break;
    		case :start:
    			session.start();
    			WatchUi.popView(WatchUi.SLIDE_UP);
    			break;
    	}
    }
    
    private function endApp(msg as String) as Void {
    	new Timer.Timer().start(method(:exit), 5000, false);
    	WatchUi.pushView(new WatchUi.ProgressBar(msg, null), null, WatchUi.SLIDE_DOWN);
    }

	function exit() as Void {
		Attention.vibrate([new Attention.VibeProfile(50, 1000)]);
		System.exit();	
	}
}