//
//  DateHelper.swift
//  AlarmCoreData
//
//  Created by Carson Ward on 4/29/21.
//

import Foundation

// MARK: - Extension

extension Date {
    
    // MARK: - Properties
    
    func stringValue() -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        
        formatter.timeStyle = .medium
        
        return formatter.string(from: self)
        
    }
    
}//End of extension
