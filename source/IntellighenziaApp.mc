using Toybox.Application;
using Toybox.Lang;
using Toybox.WatchUi;

class IntellighenziaApp extends Application.AppBase {

	private var workout;
	private var session;
	
	// flow control flags
	private var workoutStarted;

    function initialize() {
        AppBase.initialize();
        workout = new Workout();
        session = null;
        
        workoutStarted = false;
    }

    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new Rez.Menus.GradeMenu(), new GradeMenuDelegate() ] as Array<Views or InputDelegates>;
    }
    
    function getWorkout() as Workout {
    	return workout;
    }
    
    function getSession() as Session {
    	return session;
    }
    
    function setSession(sess as Session) as Void {
    	session = sess;
    }
    
    function startWorkout() as Void {
    	workoutStarted = true;
    }
    
    function isWorkoutStarted() as Bool {
    	return workoutStarted;
    }
}

function getApp() as IntellighenziaApp {
    return Application.getApp() as IntellighenziaApp;
}