import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class SpeedApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new SpeedView() ] as Array<Views or InputDelegates>;
    }

    function getGlanceView() {
        return [new SpeedGlanceView()];
    }

}

function getApp() as SpeedApp {
    return Application.getApp() as SpeedApp;
}