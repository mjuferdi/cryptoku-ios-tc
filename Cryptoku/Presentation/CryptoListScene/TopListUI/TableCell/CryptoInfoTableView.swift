//
//  CryptoInfoTableView.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import UIKit

final class CryptoInfoTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.configureTableView()
        self.registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        self.backgroundColor = .white
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }
    
    private func registerCells() {
        self.register(CryptoInfoTableCell.self, forCellReuseIdentifier: CryptoInfoTableCell.reuseIdentifier)

    }
    
}
