//
//  RatesModel.swift
//  EcbCurrencyConverter
//
//  Created by Rahul Mehndiratta on 26/11/2022.
//  Copyright © 2022 Rahul Mehndiratta. All rights reserved.
//

struct RatesDetailModel: Decodable {
    let base: String
    let date: String
    let rates: [RateDetail]
}

struct RateDetail: Decodable {
    let symbol: String
    let currency: String
    let value: Double
}

struct currencyDetailModel: Decodable {
    let result: Double
    let success: Bool
    let date: String?
    let info: convertInfo?
}

struct convertInfo: Decodable {
    let quote: Double
    let timestamp: Int
}
