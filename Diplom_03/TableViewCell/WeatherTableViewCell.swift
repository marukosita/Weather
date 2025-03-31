//
//  WeatherTableViewCell.swift
//  Diplom_03
//
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    static var identifaer: String { "\(Self.self)" }
    
    private let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = Cnst.textColor
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let minTempLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textColor = Cnst.textColor
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let maxTempLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = Cnst.textColor
        lbl.textAlignment = .right
        return lbl
    }()
    
    private let windDirectionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = Cnst.textColor
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let maxWindSpeedLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
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
        
        contentView.addSubview(dateLabel)
        contentView.addSubview(minTempLabel)
        contentView.addSubview(maxTempLabel)
        contentView.addSubview(windDirectionLabel)
        contentView.addSubview(maxWindSpeedLabel)
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(contentView.frame.width * Cnst.UI.cellHorizontalOffset)
            make.right.equalTo(minTempLabel.snp.left).offset(-contentView.frame.width * Cnst.UI.cellHorizontalOffset)
            make.width.equalTo(contentView.frame.width * Cnst.UI.dateLabelWidth)
        }
        minTempLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(maxTempLabel.snp.left)
        }
        maxTempLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(windDirectionLabel.snp.left).offset(-contentView.frame.width * Cnst.UI.cellHorizontalOffset)
        }
        windDirectionLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(maxWindSpeedLabel.snp.left).offset(-contentView.frame.width * Cnst.UI.cellHorizontalOffset)
            make.width.equalTo(contentView.frame.width * Cnst.UI.windDirectionLabelWidth)
        }
        maxWindSpeedLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-contentView.frame.width * Cnst.UI.cellHorizontalOffset)
            make.width.equalTo(contentView.frame.width * Cnst.UI.maxWindSpeedLabelWidth)
        }
    }
    
    func configureTable(with model: WeatherModel) {
        dateLabel.text = model.date
        minTempLabel.text = model.minTemp
        maxTempLabel.text = model.maxTemp
        windDirectionLabel.text = model.windDirection
        maxWindSpeedLabel.text = model.maxWindSpeed
    }

}
