//
//  ListingItemView.swift
//  airbnb
//
//  Created by 炜季 on 2024/8/12.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    
    var body: some View {
        VStack(spacing:8){
            
            ListingImageCarouselView(listing:listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // listing details
            HStack(alignment: .top) {
                //details
                VStack(alignment:.leading){
                    Text("\(listing.city),\(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("nov 3-10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing:4) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(.black)
                }
                .font(.footnote)
                
                Spacer()
                
                //rating
                HStack(spacing:2){
                    Image(systemName: "star.fill")
                    
                    Text("\(listing.rating)")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
            
        }
    }
}

#Preview {
    ListingItemView(listing: DevelopPreview.shared.listings[0])
}
