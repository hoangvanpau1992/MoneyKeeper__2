//
//  YellowVC.swift
//  MoneyKeeper__2
//
//  Created by Hoang on 6/9/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

class YellowVC: UIViewController {
    
    static var instance: YellowVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "YellowVC") as! YellowVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: NotificationKey.hiddenKeyboard, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
