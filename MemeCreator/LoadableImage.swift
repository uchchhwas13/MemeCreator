//
//  LoadableImage.swift
//  MemeCreator
//
//  Created by Uchchhwas Roy on 24/3/23.
//

import SwiftUI

struct LoadableImage: View {
    var imageMetaData: Panda
    
    var body: some View {
        AsyncImage(url: imageMetaData.imageUrl) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .accessibility(hidden: false)
                    .accessibilityLabel(Text(imageMetaData.description))
            } else if phase.error != nil {
                VStack {
                    Image("pandaplaceholder")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 300)
                    Text("The Pandas were all busy.")
                        .font(.title2)
                    Text("Please try again")
                        .font(.title3)
                }
            } else {
                ProgressView()
            }
        }
    }
}

struct Panda_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImage(imageMetaData: Panda.defaultPanda)
    }
}
