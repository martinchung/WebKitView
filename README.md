# WebKitView
Quick and dirty embedded web browser app using WebKitView instead of WebView.

Uses storyboard and WebKitView. Many similar examples use the older WebView control that takes a little less code, but that control has been deprecated.

This example also shows how to load default settings from Settings.bundle/Root.plist (in this case, the URL to open in the WebKitView). This helps to bridge the somewhat missing link between the application settings defined in the application bundle and using these settings when the setting has not been explicitly saved as a default.

iOS seems happy to render the Settings bundle preferences in the Settings app UI, but the application's UserDefaults object does not automatically include the settings from the bundle, until the setting is touched; i.e. explicitly saved in code using UserDefault.set() call or modified through the Settings app UI.

There is a func, registerDefaultsFromSettingsBundle(), that loads the preferences in Settings.bundle into UserDefaults.standard.
