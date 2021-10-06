using Toybox.Application;
using Toybox.Lang;
using Toybox.WatchUi;

class IntellighenziaApp extends Application.AppBase {

	private var _workout;
	private var _session;
	
	// flow control flags
	private var _workoutStarted;

    function initialize() {
        AppBase.initialize();
        _workout = new Workout();
        _session = null;
        
        _workoutStarted = false;
    }

    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new Rez.Menus.GradeMenu(), new GradeMenuDelegate() ] as Array<Views or InputDelegates>;
    }
    
    function getWorkout() as Workout {
    	return _workout;
    }
    
    function getSession() as Session {
    	return _session;
    }
    
    function setSession(sess as Session) as Void {
    	_session = sess;
    }
    
    function startWorkout() as Void {
    	_workoutStarted = true;
    }
    
    function isWorkoutStarted() as Bool {
    	return _workoutStarted;
    }
}

function getApp() as IntellighenziaApp {
    return Application.getApp() as IntellighenziaApp;
}