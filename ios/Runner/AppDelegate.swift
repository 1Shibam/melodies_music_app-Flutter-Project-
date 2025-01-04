import UIKit
import Flutter
import AVFoundation

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController
        let mediaChannel = FlutterMethodChannel(name: "com.example.musicplayer/media", binaryMessenger: controller.binaryMessenger)

        mediaChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "getAudioFiles" {
                self.fetchAudioFiles(result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func fetchAudioFiles(result: @escaping FlutterResult) {
        let fileManager = FileManager.default
        let musicDir = fileManager.urls(for: .musicDirectory, in: .userDomainMask).first!

        do {
            let audioFiles = try fileManager.contentsOfDirectory(at: musicDir, includingPropertiesForKeys: nil)
                .filter { $0.pathExtension == "mp3" || $0.pathExtension == "m4a" }
                .map { ["title": $0.lastPathComponent, "uri": $0.path] }
            result(audioFiles)
        } catch {
            result(FlutterError(code: "UNAVAILABLE", message: "Cannot access music directory", details: nil))
        }
    }
}

