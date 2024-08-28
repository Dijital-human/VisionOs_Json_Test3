//
//  Json_Api_ThirdApp.swift
//  Json_Api_Third
//
//  Created by Famil Mustafayev on 20.06.24.
//

import SwiftUI

@main
struct Json_Api_ThirdApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
