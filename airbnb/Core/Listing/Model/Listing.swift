//
//  Listing.swift
//  airbnb
//
//  Created by 炜季 on 2024/8/13.
//

import Foundation

struct Listing :Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    let pricePerNight: Int
    let latitude: Double
    let longtitude: Double
    var imageURLs:[String]
    let address: String
    let city: String
    let state: String
    let title: String
    var rating: Double
    var features:[ListingFeatures]
    var amenities:[ListingAmenities]
    let type: ListingType
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    var id: Int {return self.rawValue }
    
    case selfChekIn
    case superHost
    
    var imageName:String {
        switch self {
        case .selfChekIn: return "door.left.hand.open"
        case .superHost: return "medal"

        }
    }
    
    var title:String {
        switch self {
        case .selfChekIn: return "self check-in"
        case .superHost: return "superhost"

        }
    }
    
    var subtitle:String {
        switch self {
        case .selfChekIn: return "Check yourself in with the keyboard"
        case .superHost: return "superhosts are experienced, highly rated hosts who are commited to providing great stars for guests"

        }
    }
    
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    var id: Int {return self.rawValue }

    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title:String {
        switch self {
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .laundry: return "Laundry"
        case .tv: return "TV"
        case .alarmSystem: return "Alarm System"
        case .office: return "Office"
        case .balcony: return "balcony"
        }
    }
    
    
    var imageName:String {
        switch self {
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "checkerboard.shield"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }

}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa
    
    var description:String {
        switch self {
        case .apartment: return "apartment"
        case .house: return "House"
        case .townHouse: return "Town house"
        case .villa: return "Villa"

        }
    }
    
    var id: Int {return self.rawValue}
}
