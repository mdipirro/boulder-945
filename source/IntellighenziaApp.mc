import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class IntellighenziaApp extends Application.AppBase {

	private var workout;
	private var controller;
	private var session;

    function initialize() {
        AppBase.initialize();
        workout = new $.Workout();
        controller = new $.WorkoutController();
        session = null;
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new Rez.Menus.GradeMenu(), new GradeMenuDelegate() ] as Array<Views or InputDelegates>;
    }
    
    function getWorkout() as Workout {
    	return workout;
    }
    
    function getSession() as Session {
    	return session;
    }
    
    function setSession(sess as Session) {
    	session = sess;
    }
	
	function getWorkoutController() as WorkoutController {
    	return controller;
    }
}

function getApp() as IntellighenziaApp {
    return Application.getApp() as IntellighenziaApp;
}