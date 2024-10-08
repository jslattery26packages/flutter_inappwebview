import AppKit

public class StatusBarController {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
    private var popover: NSPopover

    init(_ popover: NSPopover) {
        self.popover = popover
        statusBar = NSStatusBar()
        statusItem = statusBar.statusItem(withLength: 28.0)

        if let statusBarButton = statusItem.button {
            statusBarButton.image = #imageLiteral(resourceName: "AppIcon") // change this to your desired image
            statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
            statusBarButton.image?.isTemplate = true
            statusBarButton.action = #selector(togglePopover(sender:))
            statusBarButton.target = self
        }
    }

    @objc func togglePopover(sender: AnyObject) {
        if popover.isShown {
            hidePopover(sender)
        } else {
            showPopover(sender)
        }
    }

    func showPopover(_ sender: AnyObject) {
        if let statusBarButton = statusItem.button {
            popover.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: NSRectEdge.maxY)
        }
    }

    func doubleShowPopover(_ sender: AnyObject) {
        statusItem.button?.isHidden = false
        if let statusBarButton = statusItem.button {
            popover.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: NSRectEdge.maxY)
        }
    }

    func hidePopover(_ sender: AnyObject) {
        popover.performClose(sender)
    }

    func doubleHidePopover(_ sender: AnyObject) {
        popover.performClose(sender)
        statusItem.button?.isHidden = true
    }
}
