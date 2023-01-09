import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Position;
import Toybox.System;

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

        var posInfo = Position.getInfo();
        currentSpeed = metersPerSecondToMilesPerHour(posInfo.speed);

        spdLabel.setText(currentSpeed.toString());
    }

    function metersPerSecondToMilesPerHour(speed) {
        return speed * 2.237;
    }

}
