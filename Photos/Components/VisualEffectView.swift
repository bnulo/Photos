//
//  VisualEffectView.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {

    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView,
                      context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
