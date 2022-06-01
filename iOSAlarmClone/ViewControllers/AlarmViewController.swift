//
//  AlarmViewController.swift
//  iOSAlarmClone
//
//  Created by 박현우 on 2022/06/01.
//

import UIKit

class AlarmViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
}

extension AlarmViewController {
    // MARK: 테이블뷰 설정
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SleepTableViewCell", bundle: nil), forCellReuseIdentifier: "SleepCell")
        tableView.register(UINib(nibName: "AlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "AlarmCell")
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension AlarmViewController: UITableViewDelegate, UITableViewDataSource {
    // 섹션 개수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 섹션별 타이틀 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "수면 | 기상"
        default:
            return "기타"
        }
    }
    
    // 섹션 헤더 뷰 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    // 섹션 헤더 뷰 설정
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
        header.textLabel?.font = .boldSystemFont(ofSize: 20)
    }
    
    // 섹션별 셀 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 10
        }
    }
    
    // 셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "SleepCell", for: indexPath) as! SleepTableViewCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath) as! AlarmTableViewCell
        }
        
        return cell
    }
}
