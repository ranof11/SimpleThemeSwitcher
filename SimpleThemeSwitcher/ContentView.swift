//
//  ContentView.swift
//  SimpleThemeSwitcher
//
//  Created by Rajesh Triadi Noftarizal on 20/05/25.
//

import SwiftUI

struct ThemeSwitcher<Content: View>: View {
    @ViewBuilder var content: Content
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    
    var body: some View {
        content
            .preferredColorScheme(appTheme.colorScheme)
    }
}

enum AppTheme: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case systemDefault = "Default"
    
    var colorScheme: ColorScheme?  {
        // nil mean System Default in SwiftUI
        switch self {
        case .light: .light
        case .dark: .dark
        case .systemDefault: nil
        }
    }
}

struct ContentView: View {
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    
    var body: some View {
        NavigationStack {
            List {
                Picker("", selection: $appTheme) {
                    ForEach(AppTheme.allCases, id: \.rawValue) { theme in
                        Text(theme.rawValue)
                            .tag(theme)
                    }
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Theme Switcher")
        }
    }
}

#Preview {
    ContentView()
}
