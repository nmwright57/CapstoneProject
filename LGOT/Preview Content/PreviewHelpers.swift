//
//  PreviewHelpers.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//


import SwiftUI

struct AppearancePreviews<Value: View>: View {
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

struct Landscape<Value: View>: View {
    private let viewToPreview: Value

    init(_ viewToPreview: Value) {
        self.viewToPreview = viewToPreview
    }
    let height = UIScreen.main.bounds.width
    let width = UIScreen.main.bounds.height
    var body: some View {
        viewToPreview
            .previewLayout(.fixed(width: width, height: height))
    }
}
