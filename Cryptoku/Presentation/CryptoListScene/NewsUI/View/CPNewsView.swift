//
//  CPNewsView.swift
//  Cryptoku
//
//  Created by Mario MJ on 13.06.21.
//  Copyright (c) 2021 All rights reserved.

import UIKit

// MARK: CPNewsViewDelegate
protocol CPNewsViewDelegate: AnyObject {
    func closeview()
}

// MARK: CPNewsViewFunction
protocol CPNewsViewFunction {
    func viewWillAppear(navigationBar: UINavigationBar?,
                        navigationItem: UINavigationItem,
                        tabBarController: UITabBarController?)
    func viewWillDisappear()
}

// MARK: CPNewsViewSubview
protocol CPNewsViewSubview {
    var tableView: NewsTableView { get set }
}

// MARK: CPNewsViewVariable
protocol CPNewsViewVariable {
    var delegate: CPNewsViewDelegate? { get set }
}

// MARK: CPNewsView
protocol CPNewsView: CPNewsViewFunction, CPNewsViewSubview, CPNewsViewVariable { }

// MARK: DefaultCPNewsView
final class DefaultCPNewsView: UIView, CPNewsView {

    // MARK: CPNewsViewSubview
    lazy var tableView: NewsTableView = NewsTableView(frame: .zero, style: .plain)

    lazy var titleContainerView: UIView = {
        var view = UIView()
        var label = UILabel()
        var iconClose = UIImageView()
        
        // icon close available for iOS 13.0 version below
        iconClose.contentMode = .scaleAspectFit
        iconClose.image = .imageCloseIcon
        iconClose.isHidden = false
        iconClose.isUserInteractionEnabled = true
        
        if #available(iOS 13, *) {
            iconClose.isHidden = true
            iconClose.isUserInteractionEnabled = false
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        iconClose.addGestureRecognizer(tap)
        
        // Title news label
        label.text = "News"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        view.addSubview(label)
        view.addSubview(iconClose)
        
        iconClose.snp.makeConstraints {
            $0.leading.equalTo(view).inset(15)
            $0.centerY.equalTo(view)
            $0.height.width.equalTo(24)
        }
        label.snp.makeConstraints {
            $0.center.equalTo(view)
        }
        
        view.backgroundColor = .white
        return view
    }()

    // MARK: CPNewsViewVariable
    weak var delegate: CPNewsViewDelegate?
    
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
    
    @objc
    func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.delegate?.closeview()
    }

}

// MARK: Internal Function
extension DefaultCPNewsView {
    
    func subviewDidAdd() {
        self.addSubview(self.titleContainerView)
        self.addSubview(self.tableView)
    }
    
    func subviewConstraintDidMake() {
        self.titleContainerView.snp.makeConstraints {
            $0.leading.top.trailing.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(48)
        }
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(self.titleContainerView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    func viewDidInit() {
        
    }
    
}

// MARK: CPNewsViewFunction
extension DefaultCPNewsView {
    
    func viewWillAppear(navigationBar: UINavigationBar?,
                        navigationItem: UINavigationItem,
                        tabBarController: UITabBarController?) {
        self.backgroundColor = .white
    }
    
    func viewWillDisappear() {
        
    }
    
}
