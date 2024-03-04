//
//  AppDelegate.swift
//  AnchorsLab
//
//  Created by Ranjit Mahto on 23/09/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let navigationController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navigationController
        
        return true
    }

}

