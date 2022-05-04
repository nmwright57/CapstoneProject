//
//  PreviewColorScheme.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//


import SwiftUI

struct PreviewColorScheme<Value: View>: View {
    private let viewToPreview: Value

    init(_ viewToPreview: Value) {
        self.viewToPreview = viewToPreview
    }

    var body: some View {
        Group {
            viewToPreview
            viewToPreview.preferredColorScheme(.dark)
        }
    }
}
