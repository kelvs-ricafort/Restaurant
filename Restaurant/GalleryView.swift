//
//  GalleryView.swift
//  Restaurant
//
//  Created by Kelvin on 17/05/2024.
//

import SwiftUI

struct GalleryView: View {
    @State var photoData = [String]()
    @State var sheetVisible = false
    var dataService = DataService()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gallery")
                .font(.largeTitle)
                .bold()
            GeometryReader { proxy in
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(),
                        GridItem(),
                        GridItem()
                    ],
                        spacing: 10
                    ) {
                        ForEach(photoData, id: \.self) { photo in
                            Image(photo)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: (proxy.size.width-20)/3)
                                .clipped()
                                .onTapGesture {
                                    sheetVisible = true
                                }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            photoData = dataService.getPhotos()
        }
        .sheet(isPresented: $sheetVisible) {
            PhotoView()
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
