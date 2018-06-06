//
//  ViewController.swift
//  slideMenu
//
//  Created by quoccuong on 2018/06/02.
//  Copyright © 2018 quoccuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ContainerViewDelegate {

    @IBOutlet weak var slideViewLeading: NSLayoutConstraint!
    @IBOutlet weak var slideView: UIView!
    @IBOutlet weak var hiddenButton: UIButton!
    
    var slideMenuIsVisible = false {
        didSet {
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                if self.slideMenuIsVisible {
                    self.slideViewLeading.constant = 0
                    self.hiddenButton.alpha = 1
                } else {
                    self.hiddenButton.alpha = 0
                    self.slideViewLeading.constant = -(2 * self.slideView.frame.width)
                }
                self.view.layoutIfNeeded()
            }) { (animationCompletet) in
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        slideMenuIsVisible = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //MARK: step 5 create a reference of Class B and bind them through the prepareforsegue method
        if let nav = segue.destination as? UINavigationController, let containerView = nav.topViewController as? ContainerView {
            containerView.delegate = self
        }
    }
    
    func unhideSideMenu() {
        slideMenuIsVisible = !slideMenuIsVisible
    }
    @IBAction func hideSlideMenu(_ sender: UIButton) {
        slideMenuIsVisible = !slideMenuIsVisible
    }
}

