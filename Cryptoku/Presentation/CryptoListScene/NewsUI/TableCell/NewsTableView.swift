//
//  NewsTableView.swift
//  Cryptoku
//
//  Created by Mario MJ on 13.06.21.
//

import UIKit

final class NewsTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.configureTableView()
        self.registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        self.alwaysBounceHorizontal = false
        self.alwaysBounceVertical = false
        self.backgroundColor = .white
        self.estimatedRowHeight = NewsTableCell.height
        self.rowHeight = UITableView.automaticDimension
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.allowsSelection = false
    }
    
    private func registerCells() {
        self.register(NewsTableCell.self, forCellReuseIdentifier: NewsTableCell.reuseIdentifier)

    }
    
}
