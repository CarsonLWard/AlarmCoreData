//
//  AlarmTableViewCell.swift
//  AlarmCoreData
//
//  Created by Carson Ward on 4/29/21.
//

import UIKit

// MARK: - Protocol

protocol AlarmTableViewCellDelegate: class {
    
    func alarmWasToggled(sender: AlarmTableViewCell)
    
}

// MARK: - Class

class AlarmTableViewCell: UITableViewCell {

    // MARK: Outlets
    
    @IBOutlet weak var alarmTitleLabel: UILabel!
    
    @IBOutlet weak var alarmFireDateLabel: UILabel!
    
    @IBOutlet weak var isEnabledSwitch: UISwitch!
    
    // MARK: - Properties
    
    weak var delegate: AlarmTableViewCellDelegate?
    
    // MARK: - Helper Functions
    
    func updateViews(with alarm: Alarm) {
        
        alarmTitleLabel.text = alarm.title
        
        alarmFireDateLabel.text = alarm.fireDate!.stringValue()
        
        isEnabledSwitch.isOn = alarm.isEnabled
        
    }
    
    // MARK: - Actions
        
    @IBAction func isEnabledSwitchToggled(_ sender: Any) {
        
        delegate?.alarmWasToggled(sender: self)
        
    }
    
}//End of class
