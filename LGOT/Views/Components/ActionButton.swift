//
//  ActionButton.swift
//  LGOT
//
//  Created by Natalie Wright on 3/26/22.
//

import SwiftUI

struct ActionButton: View {
    var title: String
    var isNavigation = false
    
    var body: some View {
        HStack {
          Text(title)
            .font(.headline)
            .foregroundColor(.white)
          
          Image(systemName: "arrow.forward")
            .foregroundColor(.white)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.mint)
        .cornerRadius(24)
      }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(title:"Login")
    }
}
