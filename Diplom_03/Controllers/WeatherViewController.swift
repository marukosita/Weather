//
//  WeatherViewController.swift
//  Diplom_03
//
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    private var viewModel: WeatherViewModel!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifaer)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = .leastNonzeroMagnitude
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = Cnst.backgroundColor
        return tableView
    }()
    
    private let chooseCityBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle(Cnst.Text.chooseCityBtn, for: .normal)
        btn.setTitleColor(Cnst.textColor, for: .normal)
        btn.titleLabel?.textAlignment = .left
        btn.backgroundColor = Cnst.btnBackgroundColor
        btn.layer.cornerRadius = Cnst.cornerRadius
        return btn
    }()
    
    private let cityLabel: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textAlignment = .center
        lbl.textColor = Cnst.textColor
        lbl.backgroundColor = Cnst.btnBackgroundColor
        lbl.layer.cornerRadius = Cnst.cornerRadius
        return lbl
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupViewModel()
    }
    
    // MARK: - configureUI()
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(chooseCityBtn)
        view.addSubview(cityLabel)
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        
        chooseCityBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.equalToSuperview().offset(-Cnst.UI.smallHorizontalOffset)
            make.width.equalTo(view.frame.width * Cnst.UI.chooseCityBtnWidth)
            make.height.equalTo(Cnst.UI.mainHeight)
        }
        let chooseCityBtnAction = UIAction { _ in
            self.chooseCityBtnTapped()
        }
        chooseCityBtn.addAction(chooseCityBtnAction, for: .touchUpInside)
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(chooseCityBtn.snp.bottom).offset(Cnst.UI.mediumVerticalOffset)
            make.right.equalToSuperview().offset(-Cnst.UI.smallHorizontalOffset)
            make.left.equalToSuperview().offset(Cnst.UI.smallHorizontalOffset)
            make.height.equalTo(Cnst.UI.mainHeight)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom)
            make.right.left.bottom.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        activityIndicator.hidesWhenStopped = true
    }
    
    // MARK: - SetupViewModel()
    private func setupViewModel() {
        self.viewModel = WeatherViewModel()
        
        self.viewModel.didUpdateCurrentIndex = {
            guard let currentIndex = self.viewModel.currentIndex else {
                return
            }
            self.cityLabel.text = Cnst.cities[currentIndex].city
            
            self.activityIndicator.startAnimating()
            self.viewModel.updateWeatherInfo()
        }
        self.viewModel.didUpdateWeatherInfo = {
            
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
        
        self.viewModel.updateCurrentIndex(newIndex: 0)
    }
    
    // MARK: - BtnTapped
    private func chooseCityBtnTapped() {
        moveToCitySelectionVC()
    }
    
    // MARK: - Navigation
    private func moveToCitySelectionVC() {
        let controller = CitySelectionViewController()
        controller.onCitySelected = { newIndex in
            self.viewModel.updateCurrentIndex(newIndex: newIndex)
        }
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - extension
extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.weatherInfoForCell.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifaer, for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        cell.configureTable(with: self.viewModel.weatherInfoForCell[indexPath.row])
        return cell
    }
}

