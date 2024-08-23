//
//  DestinationSearchView.swift
//  airbnb
//
//  Created by 炜季 on 2024/8/12.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show:Bool
    @ObservedObject var viewModel:ExploreViewModel
    @State private var selectedOption:DestinationSearchOptions = .dates
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    

    var body: some View {
        
        VStack(alignment:.leading) {
            
            HStack {
                Button{
                    withAnimation(.snappy){
                        show.toggle()
                    }
                    
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                    
                }
                
                Spacer()
                
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear"){
                        viewModel.searchLocation = ""
                        viewModel.updateListingsForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                
                
            }
            .padding()
            
            VStack(alignment:.leading){
                if selectedOption == .location {
                    Text("where to")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("search destinations",text:$viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                print("update listings")
                                viewModel.updateListingsForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }else {
                    CollapsedPickerView(title: "where", description: "add locations")
                        .onTapGesture {
                                        withAnimation(.snappy) { selectedOption = .location }
                                    }
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120: 64)
//            .onTapGesture {
//                withAnimation(.snappy) { selectedOption = .location }
//            }
            
            VStack(alignment:.leading) {
                if selectedOption == .dates {
                        Text("when is your trip")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        VStack {
                            DatePicker("Form",selection: $startDate,displayedComponents: .date)
                            
                            Divider()
                            
                            DatePicker("To",selection: $endDate,displayedComponents: .date)

                        }
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                }else {
                    // date selection view
                    CollapsedPickerView(title: "when", description: "add dates")
                                .onTapGesture {
                                    withAnimation(.snappy) { selectedOption = .dates }
                                }
                       
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 150: 64)

            
            VStack{
                if selectedOption == .guests {
                    VStack(alignment:.leading){
                        Text("who is coming")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Stepper {
                            Text("\(numGuests) adults")
                        }
                        onIncrement: {
                            numGuests += 1
                        }
                       onDecrement: {
                           guard numGuests > 0 else {return}
                           numGuests -= 1
                        }

                    }
                    
                }else {
                    // num guests view
                    CollapsedPickerView(title: "who", description: "add guests")
                        .onTapGesture {
                                        withAnimation(.snappy) { selectedOption = .guests }
                                    }
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120: 64)
//            .onTapGesture {
//                withAnimation(.snappy) { selectedOption = .guests }
//            }
            
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false),viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsibleDestinationViewModifier:ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
    
}
