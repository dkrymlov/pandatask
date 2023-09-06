//
//  Overlay.swift
//  pandatask
//
//  Created by Даниил Крымлов on 06.09.2023.
//

import Foundation
import SwiftUI

// Overlay to show with animation
struct OverlayView<OverlayContent: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    var modalContent: OverlayContent
    var transition: AnyTransition = .move(edge: .top)
    var animation: Animation = .easeInOut
    
    func body(content: Content) -> some View {
        
        GeometryReader { geo in
            ZStack {
                content
                VStack {
                    if self.isPresented {
                        self.modalContent
                            .transition(self.transition)
                            .animation(self.animation)
                    } else {
                        Spacer()
                    }
                    
                }
            }
        }
    }
}

// Extenstion to create a modal view over screen
extension View {
    func overlayFromTop<ModalContent: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> ModalContent) -> some View {
        self.modifier(OverlayView(isPresented: isPresented, modalContent: content()))
    }
}
