//
//  AppDelegate.swift
//  FlightsApp
//
//  Created by Shivam Seth on 6/26/19.
//  Copyright © 2019 Shivam Seth. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        
        let controller = FlightsListViewController.newInstance()
        let params = FlightsListViewModelInitParams()
        let viewModel = FlightsListViewModel(params: params)
        controller.viewModel = viewModel
        
        let navCtrl = UINavigationController(rootViewController: controller)
        
        window?.rootViewController = navCtrl
        
        window?.makeKeyAndVisible()

        return true
    }

}

