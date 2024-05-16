//
//  UIWindow.swift
//  MarkdownNote
//
//  Created by Home on 15/5/2024.
//

import SwiftUI

#if os(iOS)
extension UIWindow {
    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}
#endif
