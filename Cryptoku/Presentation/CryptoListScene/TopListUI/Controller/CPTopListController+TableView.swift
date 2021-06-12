//
//  CPTopListController+TableView.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import UIKit

extension CPTopListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoInfoTableCell.reuseIdentifier, for: indexPath) as? CryptoInfoTableCell else { return UITableViewCell() }
        // nein todo
        cell.configureCell()
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CryptoInfoTableCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // nein todo
        print("nein", indexPath.row)
    }
    
}
