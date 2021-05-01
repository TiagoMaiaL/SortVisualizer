//
//  SortVisualizerApp.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import SwiftUI

@main
struct SortVisualizerApp: App {
    var body: some Scene {
        WindowGroup {
            SortVisualizerView()
                .frame(width: 600, height: 400, alignment: .center)
        }
    }
}
