//
//  ThumbNail.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//

import UIKit
import SwiftUI

struct Thumbnail: View {
    let imageData: Data
    
    var body: some View {
        Image(uiImage: (UIImage(data: imageData) ?? UIImage()))
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
}

struct Thumbnail_Previews: PreviewProvider {
    static var previews: some View {
        AppearancePreviews(
            Thumbnail(imageData: (UIImage(named: "mugShotThumb") ?? UIImage()).jpegData(compressionQuality: 0.8)!)
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
