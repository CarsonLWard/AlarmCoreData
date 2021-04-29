//
//  AlarmScheduler.swift
//  AlarmCoreData
//
//  Created by Carson Ward on 4/29/21.
//

import UserNotifications

// MARK: - Protocol

protocol AlarmScheduler: class {
    
    func scheduleUserNotification(for alarm: Alarm)
    
    func cancelUserNotification(for alarm: Alarm)
    
}//End of protocol

// MARK: - Extension

extension AlarmScheduler {
    
    func scheduleUserNotification(for alarm: Alarm) {
        
        let content = UNMutableNotificationContent()
        
        content.title = "Time to get up"
        
        content.body = "Your alarm \"\(alarm.title!)\" is going off!"
        
        content.sound = UNNotificationSound.default
        
        let components = Calendar.current.dateComponents([.month, .day, .year, .hour, .minute, .second], from: alarm.fireDate!)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        let request = UNNotificationRequest(identifier: alarm.uuidString!, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            
            if let error = error {
                
                print("Error scheduling notifications \(error.localizedDescription) : \(error)")
                
            }
            
        }
        
    }
    
    func cancelUserNotification(for alarm: Alarm) {
        
        guard let id = alarm.uuidString else {return}
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
        
    }
    
}//End of extension
