//
//  AppDelegate.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 5/28/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)
        changeRootController(to: ChannelsViewController(), animation: false)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


}


// MARK: - Public methods
extension AppDelegate {
    func changeRootController(to controller: UIViewController, animation: Bool = true, animationDuration: Double = 0.2) {
        window?.clipsToBounds = true
        window?.layer.cornerRadius = 3

        guard animation else {
            window?.rootViewController = controller
            window?.makeKeyAndVisible()
            return
        }
        let overlayView = UIScreen.main.snapshotView(afterScreenUpdates: false)
        controller.view.addSubview(overlayView)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()

        UIView.animate(withDuration: animationDuration, delay: 0, options: .transitionCrossDissolve, animations: {
            overlayView.alpha = 0
        }, completion: { finished in
            overlayView.removeFromSuperview()
        })
    }
}
