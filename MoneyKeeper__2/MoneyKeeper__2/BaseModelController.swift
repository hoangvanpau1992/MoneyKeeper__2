//
//  BaseModelController.swift
//  MoneyKeeper__2
//
//  Created by Hoang on 6/9/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

class BaseModelController: NSObject, UIPageViewControllerDataSource {
    
    var viewcontrollers: [UIViewController] = {
        let greenVC = GreenVC.instance
        let redVC = RedVC.instance
        let yellowVC = YellowVC.instance
        let mainTaleVC = MainTableViewController.instance
        
        let menuControllers = [mainTaleVC, greenVC, redVC, yellowVC]
        return menuControllers
    }()
    
    var index = 0
    
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
       // Return the data view controller for the given index.
        if (self.viewcontrollers.count == 0) || (index >= self.viewcontrollers.count) || (index < 0) {
            return nil
        }
        self.index = index
        
        return viewcontrollers[index]
    }
    func indexOfViewController(_ viewController: UIViewController) -> Int {
        return viewcontrollers.index(of: viewController) ?? NSNotFound
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if index == NSNotFound {
            return nil
        }
        index += 1
        if index == self.viewcontrollers.count{
            return nil
        }
        return self.viewControllerAtIndex(index)
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
