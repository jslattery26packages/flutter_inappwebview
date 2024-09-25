import Cocoa
import FlutterMacOS

private let widgetGroupId = "group.com.jackslattery.spotifyfriends"

@main
class AppDelegate: FlutterAppDelegate {
    var statusBar: StatusBarController?
    var popover = NSPopover()
    override init() {
        popover.behavior = NSPopover.Behavior.transient // to make the popover hide when the user clicks outside of it
    }

    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
    }

    override func applicationDidFinishLaunching(_ aNotification: Notification) {
        let controller: FlutterViewController =
            mainFlutterWindow?.contentViewController as! FlutterViewController
        popover.contentSize = NSSize(width: 500, height: 360) // change this to your desired size
        popover.contentViewController = controller // set the content view controller for the popover to flutter view controller
        statusBar = StatusBarController(popover)
        mainFlutterWindow.close()
        super.applicationDidFinishLaunching(aNotification)
    }
}
