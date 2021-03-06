//
//  ToplistTopTierDomain.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import Foundation

// MARK: - ToplistTopTier
public struct ToplistTopTierDomain: Codable {
    let message: String?
    let type: Int?
    let metaData: MetaData?
    let sponsoredData: [SponsoredData]?
    let data: [CoinData]?
    let rateLimit: RateLimit?
    let hasWarning: Bool?

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case type = "Type"
        case metaData = "MetaData"
        case sponsoredData = "SponsoredData"
        case data = "Data"
        case rateLimit = "RateLimit"
        case hasWarning = "HasWarning"
    }
}

// MARK: - CoinData
struct CoinData: Codable {
    let coinInfo: CoinInfo?
    let raw: Raw?
    let display: Display?

    enum CodingKeys: String, CodingKey {
        case coinInfo = "CoinInfo"
        case raw = "RAW"
        case display = "DISPLAY"
    }
}

// MARK: - CoinInfo
struct CoinInfo: Codable {
    let id, name, fullName, coinInfoInternal: String?
    let imageURL, url, algorithm, proofType: String?
    let rating: Rating?
    let netHashesPerSecond: Double?
    let blockNumber: Int?
    let blockTime, blockReward: Double?
    let assetLaunchDate: String?
    let maxSupply: Double?
    let type: Int?
    let documentType: DocumentType?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case fullName = "FullName"
        case coinInfoInternal = "Internal"
        case imageURL = "ImageUrl"
        case url = "Url"
        case algorithm = "Algorithm"
        case proofType = "ProofType"
        case rating = "Rating"
        case netHashesPerSecond = "NetHashesPerSecond"
        case blockNumber = "BlockNumber"
        case blockTime = "BlockTime"
        case blockReward = "BlockReward"
        case assetLaunchDate = "AssetLaunchDate"
        case maxSupply = "MaxSupply"
        case type = "Type"
        case documentType = "DocumentType"
    }
}

enum DocumentType: String, Codable {
    case webpagecoinp = "Webpagecoinp"
}

// MARK: - Rating
struct Rating: Codable {
    let weiss: Weiss?

    enum CodingKeys: String, CodingKey {
        case weiss = "Weiss"
    }
}

// MARK: - Weiss
struct Weiss: Codable {
    let rating, technologyAdoptionRating, marketPerformanceRating: String?

    enum CodingKeys: String, CodingKey {
        case rating = "Rating"
        case technologyAdoptionRating = "TechnologyAdoptionRating"
        case marketPerformanceRating = "MarketPerformanceRating"
    }
}

// MARK: - Display
struct Display: Codable {
    let usd: DisplayUsd?

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

// MARK: - DisplayUsd
struct DisplayUsd: Codable {
    let fromsymbol: String?
    let tosymbol: String?
    let market: String?
    let price: String?
    let lastupdate: String?
    let lastvolume, lastvolumeto, lasttradeid, volumeday: String?
    let volumedayto, volume24Hour, volume24Hourto, openday: String?
    let highday, lowday, open24Hour, high24Hour: String?
    let low24Hour, lastmarket, volumehour, volumehourto: String?
    let openhour, highhour, lowhour, toptiervolume24Hour: String?
    let toptiervolume24Hourto, change24Hour, changepct24Hour, changeday: String?
    let changepctday, changehour, changepcthour: String?
    let conversiontype: String?
    let conversionsymbol, supply, mktcap: String?
    let mktcappenalty: String?
    let totalvolume24H, totalvolume24Hto, totaltoptiervolume24H, totaltoptiervolume24Hto: String?
    let imageurl: String?

    enum CodingKeys: String, CodingKey {
        case fromsymbol = "FROMSYMBOL"
        case tosymbol = "TOSYMBOL"
        case market = "MARKET"
        case price = "PRICE"
        case lastupdate = "LASTUPDATE"
        case lastvolume = "LASTVOLUME"
        case lastvolumeto = "LASTVOLUMETO"
        case lasttradeid = "LASTTRADEID"
        case volumeday = "VOLUMEDAY"
        case volumedayto = "VOLUMEDAYTO"
        case volume24Hour = "VOLUME24HOUR"
        case volume24Hourto = "VOLUME24HOURTO"
        case openday = "OPENDAY"
        case highday = "HIGHDAY"
        case lowday = "LOWDAY"
        case open24Hour = "OPEN24HOUR"
        case high24Hour = "HIGH24HOUR"
        case low24Hour = "LOW24HOUR"
        case lastmarket = "LASTMARKET"
        case volumehour = "VOLUMEHOUR"
        case volumehourto = "VOLUMEHOURTO"
        case openhour = "OPENHOUR"
        case highhour = "HIGHHOUR"
        case lowhour = "LOWHOUR"
        case toptiervolume24Hour = "TOPTIERVOLUME24HOUR"
        case toptiervolume24Hourto = "TOPTIERVOLUME24HOURTO"
        case change24Hour = "CHANGE24HOUR"
        case changepct24Hour = "CHANGEPCT24HOUR"
        case changeday = "CHANGEDAY"
        case changepctday = "CHANGEPCTDAY"
        case changehour = "CHANGEHOUR"
        case changepcthour = "CHANGEPCTHOUR"
        case conversiontype = "CONVERSIONTYPE"
        case conversionsymbol = "CONVERSIONSYMBOL"
        case supply = "SUPPLY"
        case mktcap = "MKTCAP"
        case mktcappenalty = "MKTCAPPENALTY"
        case totalvolume24H = "TOTALVOLUME24H"
        case totalvolume24Hto = "TOTALVOLUME24HTO"
        case totaltoptiervolume24H = "TOTALTOPTIERVOLUME24H"
        case totaltoptiervolume24Hto = "TOTALTOPTIERVOLUME24HTO"
        case imageurl = "IMAGEURL"
    }
}

/*enum Conversiontype: String, Codable {
    case direct = "direct"
}

enum Lastupdate: String, Codable {
    case justNow = "Just now"
}

enum PurpleMARKET: String, Codable {
    case cryptoCompareIndex = "CryptoCompare Index"
}

enum Mktcappenalty: String, Codable {
    case the0 = "0 %"
}

enum PurpleTOSYMBOL: String, Codable {
    case empty = "$"
}*/

// MARK: - Raw
struct Raw: Codable {
    let usd: RawUsd?

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

// MARK: - RawUsd
struct RawUsd: Codable {
    let type: String?
    let market: String?
    let fromsymbol: String?
    let tosymbol: String?
    let flags: String?
    let price: Double?
    let lastupdate: Int?
    let median, lastvolume, lastvolumeto: Double?
    let lasttradeid: String?
    let volumeday, volumedayto, volume24Hour, volume24Hourto: Double?
    let openday, highday, lowday, open24Hour: Double?
    let high24Hour, low24Hour: Double?
    let lastmarket: String?
    let volumehour, volumehourto, openhour, highhour: Double?
    let lowhour, toptiervolume24Hour, toptiervolume24Hourto, change24Hour: Double?
    let changepct24Hour, changeday, changepctday, changehour: Double?
    let changepcthour: Double?
    let conversiontype: String?
    let conversionsymbol: String?
    let supply, mktcap: Double?
    let mktcappenalty: Int?
    let totalvolume24H, totalvolume24Hto, totaltoptiervolume24H, totaltoptiervolume24Hto: Double?
    let imageurl: String?

    enum CodingKeys: String, CodingKey {
        case type = "TYPE"
        case market = "MARKET"
        case fromsymbol = "FROMSYMBOL"
        case tosymbol = "TOSYMBOL"
        case flags = "FLAGS"
        case price = "PRICE"
        case lastupdate = "LASTUPDATE"
        case median = "MEDIAN"
        case lastvolume = "LASTVOLUME"
        case lastvolumeto = "LASTVOLUMETO"
        case lasttradeid = "LASTTRADEID"
        case volumeday = "VOLUMEDAY"
        case volumedayto = "VOLUMEDAYTO"
        case volume24Hour = "VOLUME24HOUR"
        case volume24Hourto = "VOLUME24HOURTO"
        case openday = "OPENDAY"
        case highday = "HIGHDAY"
        case lowday = "LOWDAY"
        case open24Hour = "OPEN24HOUR"
        case high24Hour = "HIGH24HOUR"
        case low24Hour = "LOW24HOUR"
        case lastmarket = "LASTMARKET"
        case volumehour = "VOLUMEHOUR"
        case volumehourto = "VOLUMEHOURTO"
        case openhour = "OPENHOUR"
        case highhour = "HIGHHOUR"
        case lowhour = "LOWHOUR"
        case toptiervolume24Hour = "TOPTIERVOLUME24HOUR"
        case toptiervolume24Hourto = "TOPTIERVOLUME24HOURTO"
        case change24Hour = "CHANGE24HOUR"
        case changepct24Hour = "CHANGEPCT24HOUR"
        case changeday = "CHANGEDAY"
        case changepctday = "CHANGEPCTDAY"
        case changehour = "CHANGEHOUR"
        case changepcthour = "CHANGEPCTHOUR"
        case conversiontype = "CONVERSIONTYPE"
        case conversionsymbol = "CONVERSIONSYMBOL"
        case supply = "SUPPLY"
        case mktcap = "MKTCAP"
        case mktcappenalty = "MKTCAPPENALTY"
        case totalvolume24H = "TOTALVOLUME24H"
        case totalvolume24Hto = "TOTALVOLUME24HTO"
        case totaltoptiervolume24H = "TOTALTOPTIERVOLUME24H"
        case totaltoptiervolume24Hto = "TOTALTOPTIERVOLUME24HTO"
        case imageurl = "IMAGEURL"
    }
}

/*enum FluffyMARKET: String, Codable {
    case cccagg = "CCCAGG"
}

enum FluffyTOSYMBOL: String, Codable {
    case usd = "USD"
}*/

// MARK: - MetaData
struct MetaData: Codable {
    let count: Int?

    enum CodingKeys: String, CodingKey {
        case count = "Count"
    }
}

// MARK: - RateLimit
struct RateLimit: Codable {
}

// MARK: - SponsoredData
struct SponsoredData: Codable {
    let coinInfo: CoinInfo?

    enum CodingKeys: String, CodingKey {
        case coinInfo = "CoinInfo"
    }
}


