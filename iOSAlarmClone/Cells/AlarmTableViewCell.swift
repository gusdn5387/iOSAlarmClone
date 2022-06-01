//
//  AlarmTableViewCell.swift
//  iOSAlarmClone
//
//  Created by 박현우 on 2022/06/01.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension AlarmTableViewCell {
    // MARK: 레이아웃 설정
    private func setupLayout() {
        backgroundColor = .clear
    }
}
