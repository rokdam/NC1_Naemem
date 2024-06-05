//
//  naememApp.swift
//  naemem
//
//  Created by 백록담 on 4/11/24.
//

import SwiftUI
import SwiftData

@main
//나 되나 이거 
struct naememApp: App {
    var modelContainer: ModelContainer = {
        let schema = Schema([Diary.self, PostImage.self])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false) //디스크저장
            
            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
    
    
    var body: some Scene {
        WindowGroup {
            TabContentView()
                .modelContainer(modelContainer)
        }
    }
}
