//
//  WishListView.swift
//  airbnb
//
//  Created by 炜季 on 2024/8/12.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading,spacing: 32) {
                
                VStack(alignment:.leading){
                    Text("log in to view your wishlists")
                        .font(.headline)
                    
                    Text("you can create view or edit wishlists once you have logged")
                        .font(.footnote)
                }
                
                Button {
                    print("log in")
                } label: {
                    Text("log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360,height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                  
                Spacer()
            }
            .padding()
            .navigationTitle("wishlists")
        }
      
    }
}

#Preview {
    WishListView()
}
