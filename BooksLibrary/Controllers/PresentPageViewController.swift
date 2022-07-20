//
//  PresentPageViewController.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 06.07.2022.
//

import UIKit
import PinLayout

class PresentPageViewController: UIPageViewController {

    var firstVC: PresentContentViewController
    var secondVC: PresentContentViewController
    var thirdVC: PresentContentViewController
    var orderedViewControllers: [PresentContentViewController]
    let pageControl = UIPageControl()
    
    init() {
        firstVC = PresentContentViewController(StringsLibrary.welcomeStringOne)
        secondVC = PresentContentViewController(StringsLibrary.welcomeStringTwo)
        thirdVC = PresentContentViewController(StringsLibrary.welcomeStringThree, false)
        orderedViewControllers = [firstVC, secondVC, thirdVC]
        pageControl.currentPage = 0
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        
        dataSource = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        setPageControl()
    }
    
    func setPageControl() {
        view.addSubview(pageControl)
        pageControl.pin.bottomCenter(view.pin.safeArea.bottom + 20).height(44).width(200)
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .brown
        pageControl.numberOfPages = orderedViewControllers.count
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PresentPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? PresentContentViewController,
            let viewControllerIndex = orderedViewControllers.firstIndex(of: vc) else {
            return nil
        }
        pageControl.currentPage = viewControllerIndex
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let vc = viewController as? PresentContentViewController,
            let viewControllerIndex = orderedViewControllers.firstIndex(of: vc) else {
            return nil
        }
        pageControl.currentPage = viewControllerIndex
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
}
