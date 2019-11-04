//
//  MyAwesomeViewController.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 04/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import PullToDismissTransition
import UIKit

class MyAwesomeViewController: UIViewController, PullToDismissable {
    
        
    //    MARK: - Properties

    lazy var reciboViewSize = CGRect(x:  view.bounds.size.width/2 - (view.bounds.size.width/2), y: 70, width: view.frame.width, height: view.frame.height - 70)
    let recibo = ReciboViewController()
    
    internal lazy var pullToDismissTransition: PullToDismissTransition = {
        let pullToDismissTransition = PullToDismissTransition(
            viewController: self,
            transitionType: .slideDynamic
        )

        return pullToDismissTransition
    }()
    
//    MARK: - Functions

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        setupPullToDismiss()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.addChild(recibo)
        view.addSubview(recibo.view)
        recibo.view.frame = reciboViewSize
        setupPullToDismiss()
    }
}

extension MyAwesomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            guard isPullToDismissEnabled else { return nil }
            return pullToDismissTransition
    }

    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning)
        -> UIViewControllerInteractiveTransitioning? {
            guard isPullToDismissEnabled else { return nil }
            return pullToDismissTransition
    }
}

