//
//  ExploreViewModel.swift
//  airbnb
//
//  Created by 炜季 on 2024/8/13.
//

import Foundation

class ExploreViewModel:ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = "new york"
    private let service:ExploreService
    private var listingsCopy = [Listing]()
    
    init(service:ExploreService){
        self.service = service
        
        Task {await fetchListings()}
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingsCopy = listings
        } catch  {
            print("DEBUG: failed to fetch listings with error \(error.localizedDescription)")
        }
        
    }
    
    func updateListingsForLocation() {
        let filteredListings = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
    
    
    
}
