//
//  SCSnakeMetaData.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import Foundation

struct SCSnakeMetaData: SCSnakeData, SCSnakeMetaObservable {

    typealias State = SCSnakeState
    
    @ObservableProperty var life:  Int   = .init(3)
    @ObservableProperty var score: Int   = .init(0)
    @ObservableProperty var state: State = .initial
    
    internal mutating func set(life: Int) {
        self.life = life
    }
    
    internal mutating func set(score: Int) {
        self.score = score
    }
    
    internal mutating func set(state: State) {
        self.state = state
    }
    
    internal func life(_ target: NSObject) -> any ReciveablePropertyObserve<Int> {
        return self.$life.observe(target)
    }
    
    internal func score(_ target: NSObject) -> any ReciveablePropertyObserve<Int> {
        return self.$score.observe(target)
    }
    
    internal func state(_ target: NSObject) -> any ReciveablePropertyObserve<State> {
        return self.$state.observe(target)
    }
}

protocol SCSnakeData {
    var life:  Int          { get }
    var score: Int          { get }
    var state: SCSnakeState { get }
}

protocol SCSnakeMetaObservable {
    func life(_ target: NSObject)  -> any ReciveablePropertyObserve<Int>
    func score(_ target: NSObject) -> any ReciveablePropertyObserve<Int>
    func state(_ target: NSObject) -> any ReciveablePropertyObserve<SCSnakeState>
}



