//
//  ViewController.swift
//  MoneyKeeper__2
//
//  Created by Hoang on 5/30/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    var mainVc: MainTableViewController?
    var keboardVc: KeyboardViewController?
    var pageVC: PageViewController?
    var sideMenuVC: SideMenuTableViewController?
    @IBOutlet weak var sideMenuViewContainer: UIView!
    @IBOutlet weak var mainViewContainer: UIView!
    @IBOutlet weak var topSideMenuConstraint: NSLayoutConstraint!
    @IBOutlet weak var coverButton: UIButton!
    @IBOutlet weak var keyboardViewContainer: UIView!
    @IBOutlet weak var bottomKeyboardConstraint: NSLayoutConstraint!
    @IBOutlet weak var SideMenuButton: UIButton!
    
    var isSideMenuOpen: Bool = true {
        didSet {
            setStageSideMenu(isSideMenu: isSideMenuOpen)
            
        }
    }
    var isKeyboardOpen: Bool = true {
        didSet {
            setStageKeyboard(isKeyboard: isKeyboardOpen)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isSideMenuOpen = false
        isKeyboardOpen = false
        registerNotificationContainer()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case SegueIdentifier.PageVC:
            pageVC = segue.destination as? PageViewController
        case SegueIdentifier.SideMenuVC:
            sideMenuVC = segue.destination as? SideMenuTableViewController
            sideMenuVC?.delegate = self
        default:
            break
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func registerNotificationContainer() {
        
            NotificationCenter.default.addObserver(self, selector: #selector(hidenSideMenu), name: NotificationKey.hideSideMenu, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeKeyboard), name: NSNotification.Name.init(rawValue: NotificationKey.keyboardClick), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(closeKeyboard), name: NotificationKey.hiddenKeyboard, object: nil)
    }
    
        
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @IBAction func onClickCoverButton(_ sender: UIButton) {
        isSideMenuOpen = !isSideMenuOpen
    }

}

