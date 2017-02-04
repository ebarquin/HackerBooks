//
//  AppDelegate.swift
//  HackerBooks
//
//  Created by Eugenio Barquín on 23/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
    
        //Check if the app has been launched before
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore {
            print("Anteriormente Iniciada")
            do{
                let json = try loadFromSandbox()
                var books = [Book]()
                for dict in json{
                    do {
                        let book = try decode(Book: dict)
                        books.append(book)
                    }catch{
                        print("Error processing \(dict)")
                    }
                }
                //Create Model
                let model = Library(books: books)
                
                //Create LibraryVC
                let libraryVC = LibraryTableViewController(model: model)
                
                //Create Nav
                let libraryNav = UINavigationController(rootViewController: libraryVC)
                
                //Window
                window?.rootViewController = libraryNav
                
                //Show Window
                window?.makeKeyAndVisible()
                
                return true
                
            }catch{
                fatalError("Error while loading Model from JSON")
            }

 
        } else {
            print("se inicia por primera vez")
            do{
                try downloadAndSaveJSONFile()
                
                
            } catch {
                fatalError("Error downloading JSON File")
            }
            do {
                let json = try loadFromSandbox()
                var books = [Book]()
                for dict in json{
                    do {
                        let book = try decode(Book: dict)
                        books.append(book)
                    }catch{
                        print("Error processing \(dict)")
                    }
                }
                //Create Model
                let model = Library(books: books)
                
                //Create LibraryVC
                let libraryVC = LibraryTableViewController(model: model)
                
                //Create Nav
                let libraryNav = UINavigationController(rootViewController: libraryVC)
                
                //Window
                window?.rootViewController = libraryNav
                
                //Show Window
                window?.makeKeyAndVisible()
                
                return true

            }catch{
                fatalError("Error while loading Model from JSON")
            }
            
            
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            
            
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

