//
//  FavouritesContainerViewController.swift
//  NekoNihongo
//
//  Created by Bao on 5/27/18.
//  Copyright © 2018 ViBao. All rights reserved.
//

import UIKit

class FavouritesContainerViewController: UIPageViewController {
    
    // MARK: Properties
    private let defaultSelectedIndex: Int = 0
    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "MinnaLessonFavouriteViewController"),
            self.getViewController(withIdentifier: "FlashcardFavouriteViewController")
        ]
    }()
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        setUpPageVC(nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setUpPageVC(_:)), name: Notification.Name.updateSelectedUserFavouriteSection, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning - FavouritesContainerViewController")
    }
    
    deinit {
        print("deinit")
    }
    
    @objc private func setUpPageVC(_ notification: NSNotification?) {
        if let selectedIndex = notification?.userInfo?[Constant.kUserFavouriteSectionIndex] as? Int {
            if selectedIndex == 0 {
                setViewControllers([pages[selectedIndex]], direction: .reverse, animated: true, completion: nil)
            } else {
                setViewControllers([pages[selectedIndex]], direction: .forward, animated: true, completion: nil)
            }
        } else {
            if defaultSelectedIndex >= 0 && defaultSelectedIndex <= pages.count {
                setViewControllers([pages[defaultSelectedIndex]], direction: .forward, animated: true, completion: nil)
            }
        }
    }
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    func updateSegmentFavouriteSelectedIndex(value: Int) {
        if let navigationVCStack = self.navigationController?.viewControllers {
            for viewController in navigationVCStack {
                if let userFavouriteVC = viewController as? UserFavouriteViewController {
                    userFavouriteVC.updateSegmentSelectedIndex(value: value)
                }
            }
        }
    }
    
}

// MARK: Extension - UIPageViewControllerDataSource
extension FavouritesContainerViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return pages.last }
        guard pages.count > previousIndex else { return nil }
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < pages.count else { return pages.first }
        guard pages.count > nextIndex else { return nil }
        return pages[nextIndex]
    }
    
}

// MARK: Extension - UIPageViewControllerDelegate
extension FavouritesContainerViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let _ = previousViewControllers.last as? MinnaLessonFavouriteViewController {
                updateSegmentFavouriteSelectedIndex(value: 1)
            } else {
                updateSegmentFavouriteSelectedIndex(value: 0)
            }
        }
    }
}
