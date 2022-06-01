//
//  AlarmTableViewCell.swift
//  iOSAlarmClone
//
//  Created by 박현우 on 2022/06/01.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    
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
    
    public func update(_ title: String) {
        timeLabel.text = title
    }
}
