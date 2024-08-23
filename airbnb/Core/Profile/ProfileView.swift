//
//  ProfileView.swift
//  airbnb
//
//  Created by 炜季 on 2024/8/12.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack {
            /// profile login view
            VStack(alignment:.leading, spacing: 32){
                
                VStack(alignment:.leading, spacing: 8) {
                    Text("profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("log in to start planning your next trip")
                    
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
                
                
                HStack {
                    Text("dont have an account")
                    
                    Text("sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
                
            }
            
            VStack(spacing:24) {
                ProfileOptionRowView(imageName: "gear", title: "settings")
                ProfileOptionRowView(imageName: "gear", title: "accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "visit the help center")
            }
            .padding(.vertical)
            
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
