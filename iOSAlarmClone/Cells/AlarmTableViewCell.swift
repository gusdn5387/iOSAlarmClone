//
//  AlarmTableViewCell.swift
//  iOSAlarmClone
//
//  Created by 박현우 on 2022/06/01.
//

import UIKit

protocol AlarmTableViewCellDelegate {
    func setOnOff(_ onOff: Bool, index: Int)
}

class AlarmTableViewCell: UITableViewCell {
    var delegate: AlarmTableViewCellDelegate?
    
    @IBOutlet weak var amPmLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var onOffSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
        
        onOffSwitch.addTarget(self, action: #selector(handleTapSwitch), for: .valueChanged)
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
    
    // MARK: 내용 업데이트
    public func update(_ content: Alarm, index: Int) {
        amPmLabel.text = content.amPm
        timeLabel.text = content.time
        descriptionLabel.text = content.description
        onOffSwitch.isOn = content.onOff
        onOffSwitch.tag = index
    }
    
    // MARK: 알람 on / off
    @objc private func handleTapSwitch(_ sender: UISwitch) {
        delegate?.setOnOff(sender.isOn, index: sender.tag)
    }
}
