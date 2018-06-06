//
//  ViewController.swift
//  slideMenu
//
//  Created by quoccuong on 2018/06/02.
//  Copyright © 2018 quoccuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideViewLeading: NSLayoutConstraint!
    @IBOutlet weak var slideView: UIView!
    @IBOutlet weak var hiddenButton: UIButton!
    
    var slideMenuIsVisible = false {
        didSet {
            
            UIView.animate(withDuration: 0.35) {
                self.slideViewLeading.constant = self.slideMenuIsVisible ? 0 : -(2 * self.slideView.frame.width)
                self.hiddenButton.alpha = self.slideMenuIsVisible ? 1 : 0
                self.view.layoutIfNeeded()
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
        if segue.identifier == "container" {
            let containerView = (segue.destination as? UINavigationController)?.topViewController as? ContainerView
            containerView?.onCompletion = {
                self.slideMenuIsVisible = !self.slideMenuIsVisible
            }
        }
    }
    @IBAction func hideSlideMenu(_ sender: UIButton) {
        slideMenuIsVisible = !slideMenuIsVisible
    }
}

