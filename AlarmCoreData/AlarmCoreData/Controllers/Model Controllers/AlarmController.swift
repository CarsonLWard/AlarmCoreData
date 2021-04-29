//
//  AlarmController.swift
//  AlarmCoreData
//
//  Created by Carson Ward on 4/29/21.
//

import CoreData

// MARK: - Class

class AlarmController: AlarmScheduler {
    
    // MARK: - Properties
    
    static let sharedInstance = AlarmController()
    
    var alarms: [Alarm] {
        
        let fetchRequest: NSFetchRequest<Alarm> = Alarm.fetchRequest()
        
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        
    }
    
    // MARK: - CRUD
    
    func createAlarm(withTitle title: String, on isEnabled: Bool, and fireDate: Date) {
        
        let alarm = Alarm(title: title, isEnabled: isEnabled, fireDate: fireDate)
        
        if isEnabled {
            
            scheduleUserNotification(for: alarm)
            
        }
        
        saveToPersistenceStore()
        
    }
    
    func updateAlarm(alarm: Alarm, newTitle: String, newFireDate: Date, isEnabled: Bool) {
        
        cancelUserNotification(for: alarm)
        
        alarm.title = newTitle
        
        alarm.fireDate = newFireDate
        
        alarm.isEnabled = isEnabled
        
        if isEnabled {
            
            scheduleUserNotification(for: alarm)
            
        }
        
        saveToPersistenceStore()
        
    }
    
    func toggleIsEnabledFor(alarm: Alarm) {
        
        alarm.isEnabled = !alarm.isEnabled
        
        alarm.isEnabled ? scheduleUserNotification(for: alarm) : cancelUserNotification(for: alarm)
        
        saveToPersistenceStore()
        
    }
    
    func deleteAlarm(alarm: Alarm) {
        
        cancelUserNotification(for: alarm)
        
        CoreDataStack.context.delete(alarm)
        
        saveToPersistenceStore()
        
    }
    
    //MARK: -  Persistence

    func saveToPersistenceStore(){
        
        do{

            try CoreDataStack.context.save()
            
        }catch{
            
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            
        }
        
    }

}//End of class
