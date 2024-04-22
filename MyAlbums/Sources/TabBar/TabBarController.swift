//
//  TabBar.swift
//  MyAlbums
//
//  Created by Bema on 22/4/24.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setSelectedIndex()
    }
    // MARK: - Setups
    
    private func setupViewControllers() {
        let library = UITabBarItem(
            title: "Library",
            image: UIImage(systemName: "photo.on.rectangle"),
            selectedImage: UIImage(systemName: "photo.on.rectangle.fill")
        )
        let libraryViewController = DetailViewController()
        libraryViewController.title = "Library"
        libraryViewController.tabBarItem = library
        
        let forYou = UITabBarItem(
            title: "For You",
            image: UIImage(systemName: "heart.text.square"),
            selectedImage: UIImage(systemName: "heart.text.square.fill")
        )
        let forYouViewController = DetailViewController()
        forYouViewController.title = "For You"
        forYouViewController.tabBarItem = forYou
        
        let albums = UITabBarItem(
            title: "Albums",
            image: UIImage(systemName: "rectangle.stack"),
            selectedImage: UIImage(systemName: "rectangle.stack.fill")
        )
        let albumsViewController = ViewController()
        albumsViewController.title = "Albums"
        albumsViewController.tabBarItem = albums
        
        let search = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass.fill")
        )
        let searchViewController = DetailViewController()
        searchViewController.title = "Search"
        searchViewController.tabBarItem = search
        
        let controllers = [
            libraryViewController,
            forYouViewController,
            albumsViewController,
            searchViewController
        ]
        viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
    }
    
    private func setSelectedIndex() {
            let tabsCount = viewControllers?.count ?? 0
            if tabsCount > 2 {
                selectedIndex = tabsCount - 2
            }
        }
    
    
}
