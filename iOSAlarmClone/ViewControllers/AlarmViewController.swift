//
//  AlarmViewController.swift
//  iOSAlarmClone
//
//  Created by 박현우 on 2022/06/01.
//

import UIKit

class AlarmViewController: UIViewController {
    // 테스트 데이터
    var testArray = [
        Alarm(amPm: "오전", time: "05:00", description: "1번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "05:07", description: "2번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "05:16", description: "3번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "05:50", description: "4번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "06:00", description: "5번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "06:10", description: "6번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "06:20", description: "7번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "06:25", description: "8번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "06:35", description: "9번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "06:40", description: "11번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "06:45", description: "12번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "07:05", description: "13번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "07:10", description: "14번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "07:16", description: "15번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "07:24", description: "16번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "07:30", description: "17번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "07:35", description: "18번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "07:42", description: "19번째 알람", onOff: false),
        Alarm(amPm: "오전", time: "07:57", description: "20번째 알람", onOff: false)
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    // MARK: '편집' 버튼 클릭 시
    @IBAction func editTable(_ sender: Any) {
        if self.tableView.isEditing {
            navigationItem.leftBarButtonItem?.title = "편집"
            navigationItem.leftBarButtonItem?.style = .plain
            self.tableView.setEditing(false, animated: true)
        } else {
            navigationItem.leftBarButtonItem?.title = "완료"
            navigationItem.leftBarButtonItem?.style = .done
            self.tableView.setEditing(true, animated: true)
        }
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
            return testArray.count
        }
    }
    
    // 셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SleepCell", for: indexPath) as! SleepTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath) as! AlarmTableViewCell
            cell.delegate = self
            cell.update(testArray[indexPath.row], index: indexPath.row)
            
            return cell
        }
    }
    
    // editingStyle 설정
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            testArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // 특정 셀의 editingStyle 설정
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == 0 {
            return .none
        } else {
            return .delete
        }
    }
    
    // 스와이프 액션 > 삭제 버튼 타이틀 설정
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    // 편집 모드 여부 설정
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1 ? true : false
    }
}

// MARK: - AlarmTableViewCellDelegate
extension AlarmViewController: AlarmTableViewCellDelegate {
    func setOnOff(_ onOff: Bool, index: Int) {
        let content = testArray[index]
        
        testArray[index] = Alarm(amPm: content.amPm, time: content.time, description: content.description, onOff: onOff)
    }
}
