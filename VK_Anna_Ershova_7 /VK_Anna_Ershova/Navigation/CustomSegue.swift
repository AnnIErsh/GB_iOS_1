//
//  CustomSegue.swift
//  VK_Anna_Ershova
//
//  Created by Anna Ershova on 2/1/19.
//  Copyright © 2019 Anna Ershova. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        guard let containerView = source.view.superview else { return }
        let containerViewFrame = containerView.frame
        let sourceViewTargetFrame = CGRect(x: 0,
                                           y: -containerViewFrame.height,
                                           width: source.view.frame.width,
                                           height: source.view.frame.height)
        let destinationViewTargetFrame = source.view.frame
        containerView.addSubview(destination.view)
        destination.view.frame = CGRect(x: 0,
                                        y: containerViewFrame.height,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)
        UIView.animate(withDuration: 0.5, animations: {
                        self.source.view.frame = sourceViewTargetFrame
                        self.destination.view.frame = destinationViewTargetFrame
            }) { finished in self.source.dismiss(animated: true, completion: nil)
        }
    }
}
