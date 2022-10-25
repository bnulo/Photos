//
//  ToastView.swift
//  Photos
//
//  Created by bnulo on 10/24/22.
//

import SwiftUI

struct ToastView: View {

    let message: String

    var body: some View {
        HStack {
            Text(message)
                .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color.red)
        .cornerRadius(Constants.Size.cornerRadius)
        .padding(.horizontal)
        .shadow(color: Color.red.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}
