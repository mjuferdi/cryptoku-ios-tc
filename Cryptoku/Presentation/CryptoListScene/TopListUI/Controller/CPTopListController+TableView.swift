//
//  CPTopListController+TableView.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import UIKit

extension CPTopListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let row = self.toplistDomain.data?.count else { return 0 }
        return row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.configCell(for: tableView,indexPath: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CryptoInfoTableCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // nein todo
        print("nein", indexPath.row)
    }
    
    private func configCell(for tableview: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: CryptoInfoTableCell.reuseIdentifier, for: indexPath) as? CryptoInfoTableCell else { return UITableViewCell() }
        guard let data = self.toplistDomain.data else { return UITableViewCell() }
        cell.configureCell(with: data, indexPath: indexPath)
        cell.selectionStyle = .none
        return cell
    }

    
}
