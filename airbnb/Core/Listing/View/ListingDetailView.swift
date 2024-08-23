//
//  ListingDetailView.swift
//  airbnb
//
//  Created by 炜季 on 2024/8/12.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    let listing:Listing
    @State private var cameraPosition:MapCameraPosition
    
    init(listing:Listing) {
        self.listing = listing
        let region = MKCoordinateRegion(center: listing.city == "Los Angeles" ? .logAngeles : .miami,
                                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing:listing)
                    .frame(height: 320)
                
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32,height: 32)
                        }
                        .padding(32)
                }
                
            }
            
            VStack(alignment: .leading,spacing: 8){
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment:.leading){
                    HStack(spacing:2) {
                        Image(systemName: "star.fill")
                        
                        Text("\(listing.rating)")
                        
                        Text(" - ")
                        
                        Text("28reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city),\(listing.state)")
                }
                .font(.caption)

            }
            .padding(.leading)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Divider()
            
            // host info view
            HStack{
                VStack(alignment: .leading) {
                    Text("entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250,alignment: .leading)
                    
                    HStack {
                        Text("\(listing.numberOfGuests) guests - ")
                        Text("\(listing.numberOfBedrooms) bedroms - ")
                        Text("\(listing.numberOfBeds) beds - ")
                        Text("\(listing.numberOfBathrooms) baths - ")
                    }
                    .font(.caption)
                }
                .frame(width: 300)
                
                Spacer()
                
                Image("male-profile-photo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64,height: 64)
                    .clipShape(Circle())
                
            }
            
            Divider()
            
            // listing features
            VStack(alignment: .leading,spacing: 16) {
                ForEach(listing.features){ feature in
                    HStack(spacing:12) {
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading){
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            
            // bedrooms view
            VStack(alignment:.leading) {
                Text("where you ll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing:16) {
                        ForEach(1 ... listing.numberOfBedrooms,id: \.self) { bedroom in
                            VStack {
                                Image(systemName: "bed.double")
                                
                                Text("bedroom \(bedroom)")
                            }
                        }
                        .frame(width: 132, height: 100)
                        .overlay{
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(.gray)
                            
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
            VStack(spacing:16) {
                Text("what this place offers")
                    .font(.headline)
                
                ForEach(listing.amenities) {amentiy in
                    HStack {
                        Image(systemName: amentiy.imageName)
                            .frame(width: 32)
                        
                        Text(amentiy.title)
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment:.leading, spacing: 16) {
                Text("where you will be")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden,for:.tabBar)
        .ignoresSafeArea()
        .padding(.bottom,64)
        .overlay(alignment:.bottom){
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("total before taxi")
                            .font(.footnote)
                        
                        Text("oct 15 -20")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .underline()
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reverse")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140,height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal,32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView(listing: DevelopPreview.shared.listings[1])
}
