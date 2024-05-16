//
//  UIScreen.swift
//  MarkdownNote
//
//  Created by Home on 15/5/2024.
//

import SwiftUI

#if os(iOS)
extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
}
#endif



//https://coolors.co/palette/ffadad-ffd6a5-fdffb6-caffbf-9bf6ff-a0c4ff-bdb2ff-ffc6ff-fffffc
