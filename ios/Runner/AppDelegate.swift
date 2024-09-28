import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  private let MSC_CHANNEL = "message_services_checker"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    FlutterMethodChannel(name: MSC_CHANNEL, binaryMessenger: controller.binaryMessenger)
      .setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
        if call.method == "isGMS" {
          result(false)
        } else if call.method == "isHMS" {
          result(false)
        } else {
          result(FlutterMethodNotImplemented)
        }
      })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
