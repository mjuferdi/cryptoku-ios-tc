//
//  NewsTableCell.swift
//  Cryptoku
//
//  Created by Mario MJ on 13.06.21.
//

import UIKit

class NewsTableCell: UITableViewCell {
    static let reuseIdentifier: String = String(describing: NewsTableCell.self)
    static let height = CGFloat(200)
    
    lazy var newsBodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    lazy var sourceInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.subviewDidInit()
        self.subviewMakeConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.newsBodyLabel.text = ""
        self.newsTitleLabel.text = ""
        self.sourceInfoLabel.text = ""

    }
    
    private func subviewDidInit() {
        self.contentView.addSubview(self.newsBodyLabel)
        self.contentView.addSubview(self.newsTitleLabel)
        self.contentView.addSubview(self.sourceInfoLabel)
    }
    
    private func subviewMakeConstraint() {
        self.sourceInfoLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.contentView).inset(15)
            $0.top.equalTo(self.contentView).inset(12)
        }
        self.newsTitleLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.sourceInfoLabel)
            $0.top.equalTo(self.sourceInfoLabel.snp.bottom).offset(6)
        }
        self.newsBodyLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.sourceInfoLabel)
            $0.top.equalTo(self.newsTitleLabel.snp.bottom).offset(6)
            $0.bottom.equalTo(self.contentView).inset(12)
            $0.height.greaterThanOrEqualTo(20)
        }
        
    }
    
    func configureCell(with data: [NewsData], indexPath: IndexPath) {
        self.newsBodyLabel.text = data[indexPath.row].body
        self.newsTitleLabel.text = data[indexPath.row].title
        self.sourceInfoLabel.text = data[indexPath.row].sourceInfo?.name
    }
    
}



