//
//  MainListViewController.swift
//  Slave2Rave
//
//  Created by Ambuj Shukla on 03/07/16.
//  Copyright © 2016 Ambuj Shukla. All rights reserved.
//

import UIKit

class MainListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //IBoutlets
    @IBOutlet var tblView : UITableView!
    @IBOutlet var imgHeader: UIImageView!
    var barButtonSlide : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.decorateNavigationBar()
    }
    
    func decorateUI()
    {
        self.imgHeader.image = UIImage(named: "120x120 Home")
    }
    
    func decorateNavigationBar()
    {
        self.title = "Home"
        
        let slideMenuButton = UIButton()
        slideMenuButton.setImage(UIImage(named: "menu"), forState: .Normal)
        slideMenuButton.frame = CGRectMake(0, 0, 30, 30)
        
        barButtonSlide = UIBarButtonItem()
        barButtonSlide.customView = slideMenuButton
        
        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = 300
            barButtonSlide.target = revealViewController()
            barButtonSlide.action = "revealToggle:"
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.navigationItem.leftBarButtonItem = barButtonSlide
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : HomeViewTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! HomeViewTableViewCell
        
        return cell
    }
}