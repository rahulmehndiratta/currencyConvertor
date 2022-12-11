//
//  CurrencyHistory.swift
//  EcbCurrencyConverter
//
//  Created by Rahul Mehndiratta on 26/11/2022.
//  Copyright © 2022 Rahul Mehndiratta. All rights reserved.
//

struct CurrencyHistory: Decodable {
    let symbol: String
    let description: String
    let rates: [CurrencyHistoryRate]
}

struct CurrencyHistoryRate: Decodable {
    let date: String
    let value: Double
}
