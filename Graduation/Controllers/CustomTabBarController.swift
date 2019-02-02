//
//  CustomTabBarController.swift
//  Graduation
//
//  Created by Flint Pham on 1/30/19.
//  Copyright © 2019 Flint Pham. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    var tabItem: UITabBarItem! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpItems()
    }
    
    func setUpItems() -> Void {
        let img01 = UIImage.resizeImage(image: UIImage.init(named: "home-icon.png")!, targetSize: CGSize(width: 50, height: 50))
        let img02 = UIImage.resizeImage(image: UIImage.init(named: "map-icon.png")!, targetSize: CGSize(width: 50, height: 50))
        let img03 = UIImage.resizeImage(image: UIImage.init(named: "chat-icon.png")!, targetSize: CGSize(width: 50, height: 50))
        let img04 = UIImage.resizeImage(image: UIImage.init(named: "profile_icon.png")!, targetSize: CGSize(width: 50, height: 50))
        
        let selectedImg01   = img01.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        let deselectedImg01 = img01.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        tabItem = self.tabBar.items![0]
        tabItem.image = deselectedImg01
        tabItem.selectedImage = selectedImg01
        
        let selectedImg02   = img02.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        let deselectedImg02 = img02.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        tabItem = self.tabBar.items![1]
        tabItem.image = deselectedImg02
        tabItem.selectedImage = selectedImg02
        
        let selectedImg03   = img03.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        let deselectedImg03 = img03.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        tabItem = self.tabBar.items![2]
        tabItem.image = deselectedImg03
        tabItem.selectedImage = selectedImg03
        
        let selectedImg04   = img04.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        let deselectedImg04 = img04.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        tabItem = self.tabBar.items![3]
        tabItem.image = deselectedImg04
        tabItem.selectedImage = selectedImg04
        
        let numberOfTab = CGFloat((tabBar.items?.count)!)
        
        let tabBarItemSize = CGSize(width: tabBar.frame.width/numberOfTab, height: tabBar.frame.size.height+BOTTOM_STATUS_HEIGHT-5)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: #colorLiteral(red: 0.9469114313, green: 0.9413575894, blue: 0.9385269107, alpha: 1), size: tabBarItemSize)
        
        self.selectedIndex = 0
        tabBar.tintColor = #colorLiteral(red: 1, green: 0.2977393846, blue: 0.440032694, alpha: 1)
    }
}
