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
    // MARK: - 테이블뷰 설정
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "alarmCell")
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension AlarmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmTableViewCell
        
        return cell
    }
}
