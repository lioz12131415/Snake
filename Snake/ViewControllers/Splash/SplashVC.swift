//
//  SplashVC.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

class SplashVC: UIViewController {
        
    @IBOutlet weak var pixelsView: UIPixelsBackgroundView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**/ /*¯\_(ツ)_/¯*/ /**/
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { [weak self] in
            GameVC.show(over: self)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.pixelsView.stop()
    }
}



