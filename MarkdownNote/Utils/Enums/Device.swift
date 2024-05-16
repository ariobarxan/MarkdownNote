//
//  Device.swift
//  MarkdownNote
//
//  Created by Home on 15/5/2024.
//

import SwiftUI

enum Device {
    static var screenBound: CGRect {
#if os(macOS)
        return NSScreen.main!.visibleFrame
#else
        return UIScreen.current!.bounds
#endif
    }
    
    static var screenWidth: CGFloat {
        return Device.screenBound.width
    }
    
    static var screenHeight: CGFloat {
        return Device.screenBound.height
    }
    
    static var hasMacOS: Bool {
#if os(macOS)
        return true
#else
        return false
#endif
    }
}

