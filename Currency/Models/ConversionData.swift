//
//  ConversionData.swift
//  EcbCurrencyConverter
//
//  Created by Rahul Mehndiratta on 26/11/2022.
//  Copyright © 2022 Rahul Mehndiratta. All rights reserved.
//

struct ConversionData {
    var fromCurrency: String?
    var toCurrency: String?
    var convertDate: String?
    var fromAmount: Double?
}

struct ConversionDetails {
    var source: String?
    var amount: String?
}

struct ConversionCurrencyData {
    var currency: Currency?
    var details: ConversionDetails?
}
