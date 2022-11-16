//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Саидов Тимур on 15.11.2022.
//

import UIKit

class ManufacturersViewController: UIViewController {
    
    private enum Constants {
        static let defaultCellId = "DefaultCellId"
        static let manufacturerCellId = "ManufacturerCellId"
        
        static let numberOfItemsInLine: CGFloat = 3
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var manufacturers: [Manufacturer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "ManufacturerSegueId",
            let navigationController = segue.destination as? UINavigationController,
            let manufacturerViewController = navigationController.visibleViewController as? ManufacturerViewController
        else { return }
        
        manufacturerViewController.delegate = self
    }
}

extension ManufacturersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.manufacturers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.manufacturerCellId, for: indexPath) as? ManufacturerCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.defaultCellId, for: indexPath)
            return cell
        }

        cell.setup(usingManufacturer: self.manufacturers[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        let interItemSpacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0

        let width = collectionView.frame.width - (Constants.numberOfItemsInLine - 1) * interItemSpacing - insets.left - insets.right
        let itemWidth = floor(width / Constants.numberOfItemsInLine)

        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension ManufacturersViewController: ManufacturerViewDelegate {
    
    func didSaveNewManufacturer(_ manufacturerName: String) {
        self.manufacturers.insert(Manufacturer(name: manufacturerName,
                                               devices: Mock.shared.data[manufacturerName] ?? []),
                                  at: 0)
        self.collectionView.performBatchUpdates {
            self.collectionView.insertItems(at: [IndexPath(row: 0, section: 0)])
        }
    }
}
