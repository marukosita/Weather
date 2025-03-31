//
//  CitySelectionTableViewCell.swift
//  Diplom_03
//
//

import UIKit

class CitySelectionTableViewCell: UITableViewCell {
    
    static var identifaer: String { "\(Self.self)" }
    
    private let cityLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = Cnst.textColor
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI() {
        contentView.backgroundColor = Cnst.backgroundColor
        
        contentView.addSubview(cityLabel)
        
        cityLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    func configureRecordsTable(with model: City) {
        cityLabel.text = model.city
    }
}
