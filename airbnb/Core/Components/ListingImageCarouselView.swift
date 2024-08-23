//
//  ListingImageCarouselView.swift
//  airbnb
//
//  Created by 炜季 on 2024/8/12.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    let listing:Listing
    
    var body: some View {
        TabView{
            ForEach(listing.imageURLs, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DevelopPreview.shared.listings[0])
}
