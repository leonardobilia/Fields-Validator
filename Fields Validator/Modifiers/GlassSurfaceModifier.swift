//
//  GlassSurfaceModifier.swift
//  Fields Validator
//
//  Created by Leonardo Bilia on 23/08/20.
//

import SwiftUI

extension View {
    func glassSurface(cornerRadius: CGFloat) -> some View {
        modifier(GlassSurfaceModifier(cornerRadius: cornerRadius))
    }
}

private struct GlassSurfaceModifier: ViewModifier {
    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .background(.ultraThinMaterial, in: .rect(cornerRadius: cornerRadius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(.white.opacity(0.28), lineWidth: 1)
            }
            .glassEffect(.regular, in: .rect(cornerRadius: cornerRadius))
    }
}
