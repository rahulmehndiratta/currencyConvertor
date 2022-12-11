//
//  CurrenciesVC.swift
//  EcbCurrencyConverter
//
//  Created by Rahul Mehndiratta on 26/11/2022.
//  Copyright © 2022 Rahul Mehndiratta. All rights reserved.
//

import UIKit

class CurrenciesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Declarations
    // --------------------
    private let cellId = "CurrencyCell"
    private var currenciesData: [String:String]?
    private var currencyList: [String]?
    internal var selectedCurrency = ConversionCurrencyData()
    
    // MARK: - IBOutlets
    // ----------------
    @IBOutlet weak var tblCurrencies: UITableView!
    
    // MARK: - Main methods
    // ------------------
    func getSupportedCurrencies() {
        let spinner = showLoader(view: self.view)
        ApiService.shared.fetchApiData(urlString: Routes.currenciesUri) { (currencies: CurrencyResponse?, error: ErrorModel?) in
            if let error = error {
                spinner.dismissLoader()
                self.showAlertMessage(titleStr: "Error", messageStr: error.Message ?? "")
            }
            self.currenciesData = currencies?.currencies
            self.currencyList = [String]()
            self.currencyList = (currencies?.currencies as? [String:String])?.keys.map({$0})
            self.tblCurrencies.reloadData()
            spinner.dismissLoader()
        }
    }
    
    // MARK: - Table View delegate methods
    // ---------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? CurrencyCell else { return UITableViewCell() }
        guard let data = currenciesData else { return cell }
        guard let currency = currencyList?[indexPath.row] else { return cell }
        cell.imgCurrency.image = UIImage(named: "\(currency.lowercased())")
        if cell.imgCurrency.image == nil {
            cell.imgCurrency.image = UIImage(named: "mul")
        }
        cell.lblCurrencyDescr.text = "\(data["\(currency)"] ?? "") (\(currency))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = currenciesData else { return }
        guard let currency = currencyList?[indexPath.row] else { return }
        selectedCurrency.currency = Currency(symbol: currency, description: "\(data["\(currency)"] ?? "")")
        self.performSegue(withIdentifier: "unwindFromCurrenciesList", sender: self)
    }
    
    // MARK: - View Controller Lifecycle
    // ---------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Supported currencies"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        getSupportedCurrencies()
    }

}
