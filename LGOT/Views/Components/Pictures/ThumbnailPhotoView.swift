//
//  ThumbNailPhotoView.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//

import SwiftUI

struct ThumbnailPhotoView: View {
    let photo: Photo
    var imageSize: CGFloat = 64
    
    var body: some View {
        if let photo = photo.thumbNail {
            let mugShot = UIImage(data: photo)
            Image(uiImage: mugShot ?? UIImage())
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageSize, height: imageSize)
        }
    }
}

struct ThumbnailPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        AppearancePreviews(ThumbnailPhotoView(photo: .sample))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}