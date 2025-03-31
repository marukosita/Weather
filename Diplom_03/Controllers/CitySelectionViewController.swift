//
//  CitySelectionViewController.swift
//  Diplom_03
//
//

import UIKit
import SnapKit

class CitySelectionViewController: UIViewController {
    
    var onCitySelected: ((Int) -> Void)?
    
    private var viewModel: CitySelectionViewModel!
    
    private let backBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("< Back", for: .normal)
        btn.setTitleColor(Cnst.textColor, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = Cnst.btnBackgroundColor
        btn.layer.cornerRadius = Cnst.cornerRadius
        return btn
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CitySelectionTableViewCell.self, forCellReuseIdentifier: CitySelectionTableViewCell.identifaer)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = Cnst.backgroundColor
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupViewModel()
    }
    // MARK: - ConfigureUI()
    private func configureUI() {
        view.backgroundColor = Cnst.backgroundColor
        view.addSubview(tableView)
        view.addSubview(backBtn)
        
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(Cnst.UI.smallHorizontalOffset)
            make.height.equalTo(Cnst.UI.mainHeight)
            make.width.equalTo(Cnst.UI.backBtnWidth)
        }
        let backBtnAction = UIAction { _ in
            self.backBtnTapped()
        }
        backBtn.addAction(backBtnAction, for: .touchUpInside)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(backBtn.snp.bottom).offset(Cnst.UI.mediumVerticalOffset)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK: - SetupViewModel()
    private func setupViewModel() {
        self.viewModel = CitySelectionViewModel()
        
        self.viewModel.onCitySelected = { index in
            self.onCitySelected?(index)
        }
    }
    
    // MARK: - BtnTapped
    private func backBtnTapped() {
        moveToPreviousVC()
    }
    
    // MARK: - Navigation
    private func moveToPreviousVC() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - extension
extension CitySelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cities.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CitySelectionTableViewCell.identifaer, for: indexPath) as? CitySelectionTableViewCell else {
            return UITableViewCell()
        }
        cell.configureRecordsTable(with: self.viewModel.cities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.onCitySelected?(indexPath.row)
        moveToPreviousVC()
    }
}
