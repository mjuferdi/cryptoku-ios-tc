//
//  CPNewsController+TableView.swift
//  Cryptoku
//
//  Created by Mario MJ on 13.06.21.
//

import UIKit

extension CPNewsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let row = self.newsDomain.data?.count else { return 0 }
        return row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.configCell(for: tableView, indexPath: indexPath)
    }
    
    private func configCell(for tableview: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: NewsTableCell.reuseIdentifier, for: indexPath) as? NewsTableCell else { return UITableViewCell() }
        guard let data = self.newsDomain.data else { return UITableViewCell() }
        cell.configureCell(with: data, indexPath: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
}
