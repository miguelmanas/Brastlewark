//
//  GnomesListVC.swift
//  Brastlewark
//
//  Created by Miguel Mañas on 17/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import UIKit
import Moya

class GnomesListVC: BaseVC {
    
    //Outlets
    @IBOutlet weak var gnomeCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //
    var presenter :GnomesActionListener?
    
    var gnomes:[Gnome]?
    
    var isSearching:Bool = false
    var gnomesSearched:[Gnome]?

    
//MARK: View functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gnomeCollectionView.delegate = self
        gnomeCollectionView.dataSource = self
        
        searchBar.delegate = self
        
        let intectactor = GnomesInteractor()
        presenter = GnomesPresenter(interactor: intectactor, view: self)
        
        presenter?.getGnomesData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func sortButtonPressed(_ sender: Any) {

    let alert = UIAlertController(title: "Sort Alphabetically:", message: nil, preferredStyle: .alert)

    let clearAction = UIAlertAction(title: "A-Z", style: .default, handler: {(action:UIAlertAction!) in
        print ("A-Z")
        if self.isSearching {
            if let gnomesSearched = self.gnomesSearched {
                self.gnomesSearched = gnomesSearched.sorted(by: {($0.name)! < ($1.name)!})
                self.gnomeCollectionView.reloadData()
                self.gnomeCollectionView.setContentOffset(CGPoint.zero, animated: false)
            }
        }else{
            if let gnomes = self.gnomes {
                self.gnomes = gnomes.sorted(by: {($0.name)! < ($1.name)!})
                self.gnomeCollectionView.reloadData()
                self.gnomeCollectionView.setContentOffset(CGPoint.zero, animated: false)
            }
        }
    })
    alert.addAction(clearAction)

    let cancelAction = UIAlertAction(title: "Z-A", style: .default, handler: {(action:UIAlertAction!) in
        print ("Z-A")
        if self.isSearching {
            if let gnomesSearched = self.gnomesSearched {
                self.gnomesSearched = gnomesSearched.sorted(by: {($0.name)! > ($1.name)!})
                self.gnomeCollectionView.reloadData()
                self.gnomeCollectionView.setContentOffset(CGPoint.zero, animated: false)
            }
        }else{
            if let gnomes = self.gnomes {
                self.gnomes = gnomes.sorted(by: {($0.name)! > ($1.name)!})
                self.gnomeCollectionView.reloadData()
                self.gnomeCollectionView.setContentOffset(CGPoint.zero, animated: false)
            }
        }
    })
    alert.addAction(cancelAction)

    let cancelActione = UIAlertAction(title: "Cancel", style: .destructive, handler: {(action:UIAlertAction!) in
        print ("Cancel")
    })
    alert.addAction(cancelActione)
        
    self.present(alert, animated: true, completion: nil)
    }
    
}




//MARK: CollectionView functions
extension GnomesListVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var itemsInSection:Int=0
        if isSearching {
            if let gnomes = self.gnomesSearched {
                itemsInSection = gnomes.count
            }
        } else {
            if let gnomes = self.gnomes {
                itemsInSection = gnomes.count
            }else {
                itemsInSection = 0
            }
        }
        return itemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gnomeCollectionView.dequeueReusableCell(withReuseIdentifier: "GnomeCell", for: indexPath) as? GnomeCell
        if isSearching{
            cell?.configCell(gnome: (self.gnomesSearched?[indexPath.row])!)
        }else{
            cell?.configCell(gnome: (self.gnomes?[indexPath.row])!)
        }

        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var itemsPerRow : CGFloat = 2
        if UIScreen.main.bounds.width > 320 {
            itemsPerRow = 3
        }
        let padding:CGFloat = 10.0
        let paddingSpace = padding * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem*1.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if isSearching{
            self.wireframe.GoTGnomeDetail(vc: self, gnome: (self.gnomesSearched?[indexPath.row])!)
        }
        else{
            self.wireframe.GoTGnomeDetail(vc: self, gnome: (self.gnomes?[indexPath.row])!)
        }
        self.gnomeCollectionView.deselectItem(at: indexPath, animated: false)
    }
    
    
}

//MARK: GnomesView functions
extension GnomesListVC:GnomesView{
    func startLoadingView() {
        self.startLoading()
    }
    
    func stopLoadingView() {
        self.stopLoading()
    }
    
    func getGnomesDataResponse(gnomes: Brastlewark?){
        if let gnomes = gnomes, let gnomesArray = gnomes.arrayGnomes{
            self.gnomes = gnomesArray
            self.gnomeCollectionView.reloadData()
            for gnome in gnomesArray {
                print("\(gnome.id): \(gnome.name)")
            }
        } else {
            let alert = UIAlertController(title: "Without internet connection", message: "Please, verify that you have internet connection to charge the data", preferredStyle: .alert)
            
            let retryActione = UIAlertAction(title: "Retry", style: .default, handler: {(action:UIAlertAction!) in
                print ("Retry")
                self.presenter?.getGnomesData()
            })
            alert.addAction(retryActione)
            
            let cancelActione = UIAlertAction(title: "Cancel", style: .destructive, handler: {(action:UIAlertAction!) in
                print ("Cancel")
            })
            alert.addAction(cancelActione)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}

//MARK: Search Bar functions
extension GnomesListVC:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if self.searchBar.text == "" {
            self.isSearching = false
            self.gnomesSearched?.removeAll()
            self.gnomeCollectionView.reloadData()
        }else {
            self.isSearching = true
            self.gnomesSearched = self.gnomes?.filter{ ($0.name?.lowercased().contains(searchText.lowercased()))!}
            self.gnomeCollectionView.reloadData()
        }
    }
}
