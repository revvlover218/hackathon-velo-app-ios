//
//  SearchBicyclesViewController.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/06.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class SearchBicyclesViewController: BaseViewController {
    
    @IBOutlet var searchView: CustomUIView!
    @IBOutlet var searchtextField: UITextField!
    
    private var bicycles = MainBicyclesList()
    private var filteredBicycles = MainBicyclesList()
    private var selectedBicycle: BicycleItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredBicycles = bicycles
        configureSearchTextField()
    }
}

extension SearchBicyclesViewController {
    
    private func configureSearchTextField() {
        let placeHolderText = NSAttributedString(string: "Search for a bike...",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        searchtextField.attributedPlaceholder = placeHolderText
    }
}

extension SearchBicyclesViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let searchText = textField.text {
            print(searchText)
            //Call search method here
        }
    }
    
    private func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

extension SearchBicyclesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredBicycles.bicylesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BicycleCollectionViewCell", for: indexPath) as! BicycleCollectionViewCell
        let bicycle = filteredBicycles.bicylesList[indexPath.row]
        cell.setBicyle(with: bicycle)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedBicycle = filteredBicycles.bicylesList[indexPath.row]
        performSegue(withIdentifier: "LoginSegue", sender: self)
    }
}
