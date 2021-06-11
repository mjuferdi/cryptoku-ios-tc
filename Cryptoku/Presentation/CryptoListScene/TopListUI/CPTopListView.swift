//
//  CPTopListView.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//  Copyright (c) 2021 All rights reserved.

import UIKit

// MARK: CPTopListViewDelegate
protocol CPTopListViewDelegate: AnyObject {
    
}

// MARK: CPTopListViewFunction
protocol CPTopListViewFunction {
    func viewWillAppear(navigationBar: UINavigationBar?,
                        navigationItem: UINavigationItem,
                        tabBarController: UITabBarController?)
    func viewWillDisappear()
}

// MARK: CPTopListViewSubview
protocol CPTopListViewSubview {
}

// MARK: CPTopListViewVariable
protocol CPTopListViewVariable {
    var delegate: CPTopListViewDelegate? { get }
}

// MARK: CPTopListView
protocol CPTopListView: CPTopListViewFunction, CPTopListViewSubview, CPTopListViewVariable { }

// MARK: DefaultCPTopListView
final class DefaultCPTopListView: UIView, CPTopListView {

    // MARK: CPTopListViewSubview

    // MARK: CPTopListViewVariable
    weak var delegate: CPTopListViewDelegate?
    
    // MARK: Init Function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: UIScreen.main.fixedCoordinateSpace.bounds)
        self.subviewDidAdd()
        self.subviewConstraintDidMake()
        self.viewDidInit()
    }

}

// MARK: Internal Function
extension DefaultCPTopListView {
    
    func subviewDidAdd() {
    }
    
    func subviewConstraintDidMake() {
    }
    
    func viewDidInit() {
        
    }
    
}

// MARK: CPTopListViewFunction
extension DefaultCPTopListView {
    
    func viewWillAppear(navigationBar: UINavigationBar?,
                        navigationItem: UINavigationItem,
                        tabBarController: UITabBarController?) {
        self.backgroundColor = .systemGreen
    }
    
    func viewWillDisappear() {
        
    }
    
}
