//
//  Settings.swift
//  EcbCurrencyConverter
//
//  Created by Rahul Mehndiratta on 26/11/2022.
//  Copyright © 2022 Rahul Mehndiratta. All rights reserved.
//

class GlobalSettings {
    static let shared = GlobalSettings()

    // Rates Exchange API key [YOUR_API_KEY]
    // Get your own api key from https://api.apilayer.com
    let currencyApiKey = "LiEKBxJ7SfnC1SHn1KY2cxjat58TlrZe"
}

struct Routes {
    private static let s = GlobalSettings.shared
    
    static let apiBaseUrl = "https://api.apilayer.com/currency_data"
    static let apiCheckOnLine = "\(apiBaseUrl)/checkapi"
    static let apiKeyParam = "?apiKey=\(s.currencyApiKey)"
    static let latestDetailedRatesUri = "\(apiBaseUrl)/convert"
    static let currenciesUri = "\(apiBaseUrl)/list"
    static let convertRatesUri = "\(apiBaseUrl)/convert"
    static let currencyHistoryRatesUri = "\(apiBaseUrl)/historydates\(apiKeyParam)"
    static let historyRatesForCurrency = "\(apiBaseUrl)/historydetails\(apiKeyParam)"
}
