//
//  GameVC.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit

class GameVC: UIViewController {
    
    @IBOutlet weak var lifeLabel:   UILabel!
    @IBOutlet weak var scoreLabel:  UILabel!
    @IBOutlet weak var stateButton: UIButton!
    
    @IBOutlet weak var snakeView:     SCSnakeView!
    @IBOutlet weak var containerView: IBDesignableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInfo()
        self.observe()
        self.snakeView.start(after: 1.0)
    }

    fileprivate func setInfo() {
        self.lifeLabel.text  = "x\(snakeView.data.life)"
        self.scoreLabel.text = "\(snakeView.data.score)"
        self.stateButton.setImage(snakeView.data.state == .running ? .pauseFill : .playFill, for: .normal)
    }
    
    fileprivate func observe() {
        snakeView.observe
            .state(self).didSet { [weak self] new, old in self?.setInfo() }
                
        snakeView.observe
            .score(self).didSet { [weak self] new, old in self?.setInfo() }
        
        snakeView.observe
            .life(self).didSet { [weak self] new, old in self?.setInfo() }
    }
    
    @IBAction func changeStateTouch(_ sender: UIButton) {
        snakeView.data.state == .running ? snakeView.stop() : snakeView.start()
    }
}

extension GameVC {
    internal static func show(over vc: UIViewController?) {
        let storyboard = UIStoryboard(name: "Game", bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! GameVC
        vc?.transition.present(controller, type: .pixelated, duration: 1.0)
    }
}


