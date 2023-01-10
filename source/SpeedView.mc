import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Position;
import Toybox.System;
import Toybox.Timer;
import Toybox.Lang;

class SpeedView extends WatchUi.View {

    var spdLabel;
    var currentSpeed = 0;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));

        spdLabel = self.findDrawableById("labelSpeed") as WatchUi.Text;

        // Start a recurring timer to check for speed changes every 1s
        var procressTimer = new Timer.Timer();
        procressTimer.start(method(:checkSpeed), 1000, true);
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        spdLabel.setText(currentSpeed.toString());
    }

    function checkSpeed() as Void {
        var posInfo = Position.getInfo();
        currentSpeed = metersPerSecondToMilesPerHour(posInfo.speed);

        WatchUi.requestUpdate();
    }

    // Arg: metersPerSecond as Any
    // Desc: Returns a miles per hour (Number) from a metersPerSecond value
    function metersPerSecondToMilesPerHour(metersPerSecond) as Number {
        return (metersPerSecond * 2.237).toNumber();
    }

}
