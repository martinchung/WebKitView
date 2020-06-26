# WebKitView
Quick and dirty embedded web browser app using WebKitView instead of WebView

Uses storyboard and WebKitView. Many similar examples use the older WebView control that takes a little less code, but that control has been deprecated.

This example also shows how to load default settings from Settings.bundle/Root.plist (in this case, the URL to open in the WebKitView). This helps to correct the somewhat missing link between the application settings set inside the application bundle and actually using these settings as a default setting upon first launch of the application, or when the application settings have not been changed from default.
