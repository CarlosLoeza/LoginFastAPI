//
//  DismissKeyboard.swift
//  Login-FastAPI
//
//  Created by Carlos on 5/20/24.
//

import Foundation
import SwiftUI


struct DismissKeyboardOnTapGesture: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func dismissKeyboardOnTap() -> some View {
        self.modifier(DismissKeyboardOnTapGesture())
    }
}
