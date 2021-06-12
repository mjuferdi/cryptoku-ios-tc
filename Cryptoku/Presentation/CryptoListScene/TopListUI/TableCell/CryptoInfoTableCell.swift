//
//  CryptoInfoTableCell.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import UIKit
import SnapKit

class CryptoInfoTableCell: UITableViewCell {
    
    static let reuseIdentifier: String = String(describing: CryptoInfoTableCell.self)
    static let height = CGFloat(65)
    
    lazy var cryptoNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Bitcoin"
        return label
    }()
    lazy var cryptoShortNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "BTC"
        return label
    }()
    lazy var cryptoPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "$ 9.513.98"
        return label
    }()
    lazy var cryptoPriceChangeContainerView: UIView = {
        var view = UIView()
        view.makeRound()
        return view
    }()
    lazy var cryptoPriceChangeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.makeRound()
        label.sizeToFit()
        label.textColor = .white
        label.text = "-23.22(-0.24%)"
        label.textAlignment = .center
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
        self.cryptoNameLabel.text = ""
        self.cryptoPriceChangeContainerView.backgroundColor = .white
        self.cryptoPriceChangeLabel.text = ""
        self.cryptoPriceLabel.text = ""
        self.cryptoShortNameLabel.text = ""

    }
    
    private func subviewDidInit() {
        self.contentView.addSubview(self.cryptoShortNameLabel)
        self.contentView.addSubview(self.cryptoNameLabel)
        self.contentView.addSubview(self.cryptoPriceLabel)
        self.contentView.addSubview(self.cryptoPriceChangeContainerView)
        self.cryptoPriceChangeContainerView.addSubview(self.cryptoPriceChangeLabel)
        
    }
    
    private func subviewMakeConstraint() {
        self.cryptoShortNameLabel.snp.makeConstraints {
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(15)
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(10)
        }
        self.cryptoNameLabel.snp.makeConstraints {
            $0.leading.equalTo(self.cryptoShortNameLabel)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(10)
            $0.trailing.lessThanOrEqualTo(self.cryptoPriceChangeLabel).inset(10)
        }
        self.cryptoPriceLabel.snp.makeConstraints {
            $0.top.equalTo(self.cryptoShortNameLabel)
            $0.trailing.equalTo(self.safeAreaLayoutGuide).inset(15)
        }
        
        self.cryptoPriceChangeContainerView.snp.makeConstraints {
            $0.bottom.equalTo(self.cryptoNameLabel)
            $0.trailing.equalTo(self.cryptoPriceLabel)
            $0.height.equalTo(24)
        }
        
        self.cryptoPriceChangeLabel.snp.makeConstraints {
            $0.edges.equalTo(self.cryptoPriceChangeContainerView).inset(5)
        }
       
    }
    
    func configureCell(with data: [CoinData], indexPath: IndexPath) {
        self.cryptoShortNameLabel.text = data[indexPath.row].coinInfo?.name?.uppercased()
        self.cryptoNameLabel.text
            = data[indexPath.row].coinInfo?.fullName?.capitalized
        self.cryptoPriceLabel.text = data[indexPath.row].display?.usd?.price
        let changeHour = data[indexPath.row].display?.usd?.changehour
        let changePctHour = data[indexPath.row].display?.usd?.changepcthour ?? "0.0%"
        let formatChangeHour = changeHour?.trimmingCharacters(in: CharacterSet(charactersIn: "$")) ?? "0.0"
        print(formatChangeHour) // nein
        let priceChangePerHour = formatChangeHour.contains("-") ? "\(formatChangeHour)(\(changePctHour))%" : "+\(formatChangeHour)(\(changePctHour))%"
        self.cryptoPriceChangeContainerView.backgroundColor = formatChangeHour.contains("-") ? .systemRed : .systemGreen
        self.cryptoPriceChangeLabel.text = priceChangePerHour
    }
    
    
}
