//
//  SleepTableViewCell.swift
//  iOSAlarmClone
//
//  Created by 박현우 on 2022/06/01.
//

import UIKit

class SleepTableViewCell: UITableViewCell {
    @IBOutlet weak var alarmSettingBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
        
    }
}

extension SleepTableViewCell {
    // MARK: 레이아웃 설정
    private func setupLayout() {
        backgroundColor = .clear
        alarmSettingBtn.layer.cornerRadius = alarmSettingBtn.frame.size.height / 2
        alarmSettingBtn.layer.masksToBounds = true
    }
}
