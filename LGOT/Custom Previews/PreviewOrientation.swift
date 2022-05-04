//
//  PreviewOrientation.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//

import SwiftUI

struct PreviewOrientation<Value: View>: View {
    private let viewToPreview: Value

    init(_ viewToPreview: Value) {
        self.viewToPreview = viewToPreview
    }

    var body: some View {
        Group {
            viewToPreview
            viewToPreview.previewInterfaceOrientation(.landscapeRight)
        }
    }
}
