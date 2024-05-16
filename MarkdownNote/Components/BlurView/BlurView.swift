//
//  BlurView.swift
//  MarkdownNote
//
//  Created by Home on 16/5/2024.
//

import SwiftUI

// Since the app supports the ios 14
#if os(iOS)
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
#endif
