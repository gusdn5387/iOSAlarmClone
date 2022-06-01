//
//  SleepTableViewCell.swift
//  iOSAlarmClone
//
//  Created by 박현우 on 2022/06/01.
//

import UIKit

class SleepTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
}

extension SleepTableViewCell {
    // MARK: 레이아웃 설정
    private func setupLayout() {
        backgroundColor = .clear
    }
}
