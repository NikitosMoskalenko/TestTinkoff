//
//  CompaniesStocksView.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/29/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

// MARK: - CompaniesStocksMainView

final class CompaniesStocksMainView: UIViewController, ICompaniesStocksMainView {
    
    // MARK: - Private properties
    
    private var data: CompaniesStocksModel?
    private var selectedRow = 0
    
    // MARK: - Constants
    
    struct Constants {
        static let nameLabel: String = "Company name"
        static let symbolLabel: String = "Symbol"
        static let stockPriceLabel: String = "Price"
        static let priceChangeLabel: String = "Price change"
        static let aapl = "AAPL"
        static let msft = "MSFT"
        static let goog = "GOOG"
        static let amzn = "AMZN"
        static let fb = "FB"
        static let apple: String = "Apple"
        static let microsoft: String = "Microsoft"
        static let google: String = "Google"
        static let amazone: String = "Amazone"
        static let facabook: String = "Facebook"
    }
    
    // MARK: Public properties
    
    var presenter: ICompaniesStocksMainViewPresenter?
    var pickerTitle: String?
    let activityIndicator = UIActivityIndicatorView()
    let companyNameLabel = UILabel()
    let companyTitle = UILabel()
    let companySymbolLabel = UILabel()
    let companySymbol = UILabel()
    let stockPriceLabel = UILabel()
    let stockPrice = UILabel()
    let priceChangeLabel = UILabel()
    let priceChange = UILabel()
    let companies = UIPickerView()
    let progressiveView = UIProgressView()
    let symbolsArray = [Constants.aapl,
                        Constants.fb,
                        Constants.amzn,
                        Constants.goog,
                        Constants.msft]
    let companiesArray = [Constants.apple,
                          Constants.facabook,
                          Constants.amazone,
                          Constants.google,
                          Constants.microsoft]
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        companiesPickerViewSetUp()
        requestUpdate()
        activityIndicatorSetUp()
        nameLableSetUp()
        titleLabelSetUp()
        symbolLabelSetUp()
        companySymbolLabelSetUp()
        stockPriceLabelSetUp()
        stockPriceSetUp()
        priceChangeLabelSetUp()
        priceChangeSetUp()
    }
    
    private func activityIndicatorSetUp() {
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
    }
    
    private func nameLableSetUp() {
        companyNameLabel.text = Constants.nameLabel
        companyNameLabel.font = UIFont.systemFont(ofSize: 17)
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        companyNameLabel.textColor = .black
        view.addSubview(companyNameLabel)
        
        NSLayoutConstraint.activate([
            companyNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            companyNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)])
    }
    
    private func symbolLabelSetUp() {
        companySymbolLabel.text = Constants.symbolLabel
        companySymbolLabel.font = UIFont.systemFont(ofSize: 17)
        companySymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        companySymbolLabel.textColor = .black
        view.addSubview(companySymbolLabel)
        
        NSLayoutConstraint.activate([
            companySymbolLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            companySymbolLabel.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 40)])
    }
    
    private func stockPriceLabelSetUp() {
        stockPriceLabel.text = Constants.stockPriceLabel
        stockPriceLabel.font = UIFont.systemFont(ofSize: 17)
        stockPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        stockPriceLabel.textColor = .black
        view.addSubview(stockPriceLabel)
        
        NSLayoutConstraint.activate([
            stockPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stockPriceLabel.topAnchor.constraint(equalTo: companySymbolLabel.bottomAnchor, constant: 40)])
    }
    
    private func priceChangeLabelSetUp() {
        priceChangeLabel.text = Constants.priceChangeLabel
        priceChangeLabel.font = UIFont.systemFont(ofSize: 17)
        priceChangeLabel.translatesAutoresizingMaskIntoConstraints = false
        priceChangeLabel.textColor = .black
        view.addSubview(priceChangeLabel)
        
        NSLayoutConstraint.activate([
            priceChangeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            priceChangeLabel.topAnchor.constraint(equalTo: stockPriceLabel.bottomAnchor, constant: 40)])
    }
    
    private func titleLabelSetUp() {
        companyTitle.text = data?.companyName
        companyTitle.font = UIFont.systemFont(ofSize: 17)
        companyTitle.textAlignment = .right
        companyTitle.textColor = .black
        companyTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(companyTitle)
        
        NSLayoutConstraint.activate([
            companyTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            companyTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)])
    }
    
    private func companySymbolLabelSetUp() {
        companySymbol.text = data?.symbol
        companySymbol.font = UIFont.systemFont(ofSize: 17)
        companySymbol.textAlignment = .right
        companySymbol.textColor = .black
        companySymbol.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(companySymbol)
        
        NSLayoutConstraint.activate([
            companySymbol.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            companySymbol.topAnchor.constraint(equalTo: companyTitle.bottomAnchor, constant: 40)])
    }
    
    private func stockPriceSetUp() {
        stockPrice.text = "\(String(describing: data?.latestPrice))"
        stockPrice.font = UIFont.systemFont(ofSize: 17)
        stockPrice.textAlignment = .right
        stockPrice.textColor = .black
        stockPrice.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stockPrice)
        
        NSLayoutConstraint.activate([
            stockPrice.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stockPrice.topAnchor.constraint(equalTo: companySymbol.bottomAnchor, constant: 40)])
    }
    
    private func priceChangeSetUp() {
        priceChange.text = "\(String(describing: data?.extendedChange))"
        priceChange.font = UIFont.systemFont(ofSize: 17)
        priceChange.textAlignment = .right
        priceChange.textColor = .black
        priceChange.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceChange)
        
        NSLayoutConstraint.activate([
            priceChange.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            priceChange.topAnchor.constraint(equalTo: stockPrice.bottomAnchor, constant: 40)])
    }
    
    private func companiesPickerViewSetUp() {
        companies.translatesAutoresizingMaskIntoConstraints = false
        companies.delegate = self
        companies.dataSource = self
        
        view.addSubview(companies)
        
        NSLayoutConstraint.activate([
            companies.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            companies.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            companies.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)])
    }
    
    private func requestUpdate() {
        activityIndicator.startAnimating()
        
        let selectedRow = companies.selectedRow(inComponent: 0)
        let selectedSymbol = symbolsArray[selectedRow]
        presenter?.fetchData(selectedSymbol, { (data) in
            guard let price = data?.latestPrice, let change = data?.extendedChange else { return }
            self.companyTitle.text = data?.companyName
            self.companySymbol.text = data?.symbol
            self.stockPrice.text = "\(price)"
            self.priceChange.text = "\(change)"
            self.pickerTitle = data?.companyName
            self.activityIndicator.stopAnimating()
        })
    }
    
}

extension CompaniesStocksMainView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return symbolsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return companiesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        requestUpdate()
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: companiesArray[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
}
