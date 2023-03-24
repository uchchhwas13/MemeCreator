//
//  MemeCreator.swift
//  MemeCreator
//
//  Created by Uchchhwas Roy on 24/3/23.
//

import SwiftUI

struct MemeCreator: View, Sendable {
    @EnvironmentObject var fetcher: PandaCollectionFetcher
    
    @State private var memeText = ""
    @State private var textSize = 60.0
    @State private var textColor = Color.white
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            LoadableImage(imageMetaData: fetcher.currentPanda)
                .overlay(alignment: .bottom) {
                    TextField(
                        "Meme Text",
                        text: $memeText,
                        prompt: Text("")
                    )
                    .focused($isFocused)
                    .font(.system(size: textSize, weight: .heavy))
                    .shadow(radius: 10)
                    .foregroundColor(textColor)
                    .multilineTextAlignment(.center)
                }
                .frame(minHeight: 150)
            
            Spacer()
            if memeText.isEmpty == false {
                VStack {
                    HStack {
                        Text("Font Size")
                            .fontWeight(.semibold)
                        Slider(value: $textSize, in: 20...140)
                    }
                    
                    HStack {
                        Text("Font Color")
                            .fontWeight(.semibold)
                        ColorPicker("Font Color", selection: $textColor)
                            .labelsHidden()
                            .frame(width: 124, height: 23, alignment: .leading)
                        Spacer()
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: 325)
                
            }
        }
        
        HStack {
            Button {
                isFocused = true
            } label: {
                VStack {
                    Image(systemName: "textformat")
                        .font(.largeTitle)
                        .padding(.bottom, 4)
                    Text("Add Text")
                }
                .frame(maxWidth: 180, maxHeight: .infinity)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            Button {
                isFocused = true
            } label: {
                VStack {
                    Image(systemName: "textformat")
                        .font(.largeTitle)
                        .padding(.bottom, 4)
                    Text("Add Text")
                }
                .frame(maxWidth: 180, maxHeight: .infinity)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxHeight: 180, alignment: .center)
    }
}

//struct MemeCreator_Previews: PreviewProvider {
//    static var previews: some View {
//        MemeCreator(fetcher: fetcher)
//    }
//}
