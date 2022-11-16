//
//  ManufacturerCollectionViewCell.swift
//  CoreDataDemo
//
//  Created by Саидов Тимур on 16.11.2022.
//

import UIKit

class ManufacturerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var manufacturerImageView: UIImageView!
    @IBOutlet weak var manufacturerNameLabel: UILabel!
    
    func setup(usingManufacturer manufacturer: Manufacturer) {
        self.contentView.backgroundColor = .secondarySystemBackground
        self.manufacturerImageView.image = UIImage(systemName: "camera")
        self.manufacturerNameLabel.text = manufacturer.name
    }
}
