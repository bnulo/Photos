//
//  Toast.swift
//  Photos
//
//  Created by bnulo on 10/24/22.
//

import SwiftUI

struct Toast: ViewModifier {

    @Binding var showToast: Bool
    let message: String
    let onDismiss: (() -> Void)?

    @State private var timer: Timer?
    private let timeout = 2.double
    private let transition = AnyTransition.asymmetric(
        insertion: AnyTransition.opacity.animation(.easeIn),
        removal: AnyTransition.opacity.animation(.easeOut)
    )

    init(showToast: Binding<Bool>, message: String, onDismiss: (() -> Void)? = nil) {
        self._showToast = showToast
        self.message = message
        self.onDismiss = onDismiss
    }

    func body(content: Content) -> some View {
        ZStack {
            content
            if showToast {
                ToastView(message: message)
                    .transition(transition)
                    .zIndex(3)
                    .onAppear(perform: dismissAfterTimeout)
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .top)
            }
        }
    }

    private func dismissAfterTimeout() {
        if showToast {
            DispatchQueue.main.async { [self] in
                timer?.invalidate()
                timer = Timer.scheduledTimer(withTimeInterval: timeout,
                                             repeats: false,
                                             block: { _ in dismiss() })
            }
        }
    }

    private func dismiss() {
        withAnimation {
            timer?.invalidate()
            timer = nil
            showToast = false
            onDismiss?()
        }
    }
}

// MARK: -

extension View {

    func toast(isPresented: Binding<Bool>, message: String,
               onDismiss: (() -> Void)? = nil) -> some View {

        self.modifier(Toast(showToast: isPresented,
                            message: message, onDismiss: onDismiss))
    }
}
