//
//  TransitionPixelatedStyle.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

final class TransitionPixelatedStyle: TransitionStyle {
    
    fileprivate lazy var size: CGSize = {
        return CGSize(width: 50, height: 50)
    }()
    
    override var dispatch: TransitionDispatch {
        return super.dispatch
    }
    
    override init(_ presenting: UIViewController? = nil) {
        super.init(presenting)
    }
    
    
    override func dismiss(duration: TimeInterval, completion: (() -> Void)? = nil) {
        /* TODO */
    }
    
    override func present(_ viewControllerToPresent: UIViewController, duration: TimeInterval, completion: (() -> Void)? = nil) {
        
        guard let presenting   = presenting,
              let viewWindow   = presenting.view.window,
              let viewSnapshot = presenting.view?.snapshotView() else {
            return
        }
        
        viewWindow.addSubview(viewSnapshot)
        viewControllerToPresent.view.alpha = .zero
        
        presenting.present(viewControllerToPresent, animated: false) { [weak self] in
            let snapshots = self?.snapshots(presenting: presenting, snapshot: viewSnapshot.image) { snapshot in
                viewWindow.addSubview(snapshot)
            }
            
            viewControllerToPresent.view.alpha = 1.0
            viewSnapshot.removeFromSuperview()
            
            self?.dispatch.main.async {  [weak self] in
                self?.animate(snapshots: snapshots ?? [], duration: duration)
            }
        }
    }
    
    fileprivate func animate(snapshots: [UIView], duration: TimeInterval, completion: (() -> Void)? = nil) {
        let durationPerSquare = duration / TimeInterval(snapshots.count)
        
        for (index, snapshot) in snapshots.enumerated() {
            UIView.animate(withDuration: duration, delay: TimeInterval(index) * durationPerSquare, options: []) {
                snapshot.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            } completion: { _ in
                snapshot.removeFromSuperview()
                if index == snapshots.count - 1 { completion?() }
            }
        }
    }
    
    fileprivate func snapshots(presenting: UIViewController, snapshot: UIImage?, block: (UIView) -> Void) -> [UIView] {
        var values = [UIView] ()
        let xCount = Int(ceil(presenting.view.frame.width  / size.width))
        let yCount = Int(ceil(presenting.view.frame.height / size.height))
        
        guard let snapshot = snapshot else {
            return []
        }
        
        for x in 0..<xCount {
            for y in 0..<yCount {
                let w = presenting.view.frame.width  / CGFloat(xCount)
                let h = presenting.view.frame.height / CGFloat(yCount)
                let r = CGRect(x: CGFloat(x) * w, y: CGFloat(y) * h, width: w, height: h)
                
                guard let croppedImage = snapshot.cropping(to: r) else {
                    continue
                }
                let imageView = UIImageView(image: croppedImage, frame: r)
                values.append(imageView)
                block(imageView)
            }
        }
        return values
    }
}




