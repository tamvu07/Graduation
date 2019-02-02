//
//  HomeViewController.swift
//  Graduation
//
//  Created by Flint Pham on 1/29/19.
//  Copyright © 2019 Flint Pham. All rights reserved.
//



import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var mainScreen: UIScrollView!
    @IBOutlet weak var adBanner: UIScrollView!
    
    @IBOutlet weak var quickSearch: UIView!
    @IBOutlet weak var txtSearchField: UITextField!
    @IBOutlet weak var btnCity: UIButton!
    
    @IBOutlet weak var imgFastFind: UIImageView!
    @IBOutlet weak var imgAroundFind: UIImageView!
    @IBOutlet weak var imgSeperatedFind: UIImageView!
    @IBOutlet weak var imgPostRoom: UIImageView!
    
    @IBOutlet weak var lblFastFind: UILabel!
    @IBOutlet weak var lblAroundFind: UILabel!
    @IBOutlet weak var lblSeperatedFind: UILabel!
    @IBOutlet weak var lblPostRoom: UILabel!
    
    var advertise = ["Advertise01.jpg","Advertise02.jpg","Advertise03.jpg","Advertise04.jpg"]
    static var adCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpComponents()
        
    }
    
    func setUpComponents() -> Void {
        // SET UP CONTAINER VIEW
        let tabBarHeight: CGFloat = tabBarController!.tabBar.frame.size.height
        container.frame = CGRect.init(x: 0, y: TOP_STATUS_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-TOP_STATUS_HEIGHT-tabBarHeight-BOTTOM_STATUS_HEIGHT)
        
        // SET UP MAIN SCREEN
        mainScreen.delegate = self
        mainScreen.frame = CGRect(x: 0, y: 0, width: container.bounds.width, height: container.bounds.height)
        mainScreen.contentSize = CGSize.init(width: container.bounds.width, height: 1500)
        mainScreen.isScrollEnabled = true
        mainScreen.bounces = false
        
        // SET UP ADVERTISE BANNER
        adBanner.delegate = self
        adBanner.frame = CGRect(x: mainScreen.frame.origin.x, y: mainScreen.frame.origin.y, width: mainScreen.bounds.width, height: container.bounds.height*2/5)
        adBanner.contentSize = CGSize.init(width: adBanner.bounds.size.width*CGFloat(advertise.count), height: adBanner.bounds.size.height)
        adBanner.bounces = false
            // SET UP IMAGE AND ANIMATION FOR AD BANNER
            for adCount in 0..<advertise.count{
                let imageview = UIImageView.init(frame: CGRect(x: self.adBanner.bounds.size.width * CGFloat(adCount), y: self.adBanner.frame.origin.y, width: self.adBanner.bounds.size.width, height: self.adBanner.bounds.size.height))
                imageview.image = UIImage.init(named: advertise[adCount])
                imageview.contentMode = .scaleAspectFill
                imageview.clipsToBounds = true
                adBanner.addSubview(imageview)
            }
        
            let scrollingTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.newStartScrolling), userInfo: nil, repeats: true)
            scrollingTimer.fire()
            // END SET UP IMAGE AND ANIMATION FOR ADVERTISEMENT
        
        // SET UP QUICK SEARCH
        quickSearch.frame = CGRect(x: 10, y: adBanner.frame.origin.y + adBanner.bounds.height - 20, width: container.bounds.width - 20, height: container.bounds.height/4)
        quickSearch.layer.masksToBounds = true
        quickSearch.layer.cornerRadius = 10
        quickSearch.backgroundColor = UIColor.init(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
        
        txtSearchField.frame = CGRect(x: 10, y: 15, width: quickSearch.bounds.width - 20, height: quickSearch.bounds.height/4)
        txtSearchField.leftViewMode = .always
        txtSearchField.layer.masksToBounds = true
        txtSearchField.layer.cornerRadius = 10
        txtSearchField.layer.borderColor = UIColor.init(red: 30/255, green: 144/255 , blue: 255/255, alpha: 1.0).cgColor
        txtSearchField.layer.borderWidth = 1.0
        btnCity.frame = CGRect(x: txtSearchField.frame.origin.x+1, y: txtSearchField.frame.origin.y+1, width: txtSearchField.bounds.width/4-2, height: txtSearchField.bounds.height-2)
        btnCity.backgroundColor = UIColor.red
        btnCity.setTitle("HCM", for: .normal)
        btnCity.layer.masksToBounds = true
        btnCity.layer.cornerRadius = 10
        txtSearchField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: btnCity.bounds.width + 10, height: txtSearchField.bounds.height))
        
        imgFastFind.frame = CGRect(x: txtSearchField.frame.origin.x+1, y: txtSearchField.frame.origin.y + txtSearchField.bounds.height + 5, width: 85, height: 85)
        imgAroundFind.frame = CGRect(x: imgFastFind.frame.origin.x + imgFastFind.bounds.width + 10 + 1, y: txtSearchField.frame.origin.y + txtSearchField.bounds.height + 5, width: 85, height: 85)
        imgSeperatedFind.frame = CGRect(x: imgAroundFind.frame.origin.x + imgAroundFind.bounds.width + 10 + 1, y: txtSearchField.frame.origin.y + txtSearchField.bounds.height + 5, width: 85, height: 85)
        imgPostRoom.frame = CGRect(x: imgSeperatedFind.frame.origin.x + imgSeperatedFind.bounds.width + 10 + 1, y: txtSearchField.frame.origin.y + txtSearchField.bounds.height + 5, width: 85, height: 85)
    }
    
    // MARK: - OBJC FUNC
    
    @objc func newStartScrolling()
    {
        if HomeViewController.adCount == advertise.count {
            HomeViewController.adCount = 0
        }
        let x = CGFloat(HomeViewController.adCount) * adBanner.frame.size.width
        adBanner.setContentOffset(CGPoint(x: x, y: 0), animated: false)
        HomeViewController.adCount += 1
    }
    
    // MARK: - IBACTION FUNC
    
}
