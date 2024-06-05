//
//  Today.swift
//  naemem
//
//  Created by 백록담 on 4/18/24.
//

import Foundation
import SwiftUI
import SwiftData

func today() -> String {
    let date:Date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let today = dateFormatter.string(from: date)
    
    return today
}

