//
//  SearchBicyclesViewController.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/06.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class SearchBicyclesViewController: BaseViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var searchtextField: UITextField!
    @IBOutlet var quickFilterLabel: CustomLabel!
    @IBOutlet var removeFilterButton: RoundedSquareButton!
    @IBOutlet var quickFilterCollectionView: UICollectionView!
    
    
    private var bicycles = MainBicyclesList()
    private var filteredBicycles = MainBicyclesList()
    private var selectedBicycle: BicycleItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredBicycles = bicycles
        configureUI()
    }
    
    // MARK: - IBActions
    
    @IBAction func removeFilterButtonTapped(_ sender: RoundedSquareButton) {
        configureQuickFilter(with: "", isSelected: false)
        animateReloadQuickFilter()
        filteredBicycles = bicycles
    }
    
    // MARK: - Private

    private func configureUI() {
        removeFilterButton.isHidden = true
        configureNameLabel()
        configureSearchTextField()
    }
    
    private func configureNameLabel() {
        let name = "John"
        nameLabel.text = "Hi \(name),"
    }
    
    private func configureQuickFilter(with text: String, isSelected: Bool) {
        if (isSelected) {
            self.quickFilterLabel.text = "Quick Filter: \(text)"
            self.removeFilterButton.isHidden = false
        } else {
            self.quickFilterLabel.text = "Quick Filter"
            self.removeFilterButton.isHidden = true
        }
    }
    
    private func configureSearchTextField() {
        let placeHolderText = NSAttributedString(string: "Search for a bike...",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        searchtextField.attributedPlaceholder = placeHolderText
    }
    
    private func animateReloadQuickFilter() {
        UIView.animate(withDuration: 0.2) {
            self.quickFilterCollectionView.reloadData()
        }
    }
}

// MARK: - UITextFieldDelegate
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

// MARK: - UICollectionViewDelegate
extension SearchBicyclesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case quickFilterCollectionView:
            let selectedFilter = QuickFilterList.list[indexPath.row]
            var filterList = [BicycleItem]()
            _ = bicycles.bicylesList.map { (bicycle) in
                if (bicycle.type == selectedFilter.type) {
                    filterList.append(bicycle)
                }
            }
            filteredBicycles.bicylesList = filterList
            configureQuickFilter(with: selectedFilter.title, isSelected: true)
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        switch collectionView {
        case quickFilterCollectionView:
            configureQuickFilter(with: "", isSelected: false)
        default:
            break
        }
    }
}

// MARK: - UICollectionViewDataSource
extension SearchBicyclesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case quickFilterCollectionView:
            return QuickFilterList.list.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case quickFilterCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickFilterCell", for: indexPath) as! QuickFilterCollectionViewCell
            cell.setup(with: QuickFilterList.list[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
//func numberOfSections(in collectionView: UICollectionView) -> Int {
//    return 1
//}
//
//func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return filteredBicycles.bicylesList.count
//}
//
//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BicycleCollectionViewCell", for: indexPath) as! BicycleCollectionViewCell
//    let bicycle = filteredBicycles.bicylesList[indexPath.row]
//    cell.setBicyle(with: bicycle)
//    return cell
//}
//
//func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    selectedBicycle = filteredBicycles.bicylesList[indexPath.row]
//    performSegue(withIdentifier: "LoginSegue", sender: self)
//}
