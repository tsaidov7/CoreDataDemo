//
//  DetailManufacturersViewController.swift
//  CoreDataDemo
//
//  Created by Саидов Тимур on 16.11.2022.
//

import UIKit

protocol ManufacturerViewDelegate: AnyObject {
    func didSaveNewManufacturer(_ manufacturerName: String)
}

class ManufacturerViewController: UIViewController {

    @IBOutlet weak var manufacturerNameTextField: UITextField!
    
    weak var delegate: ManufacturerViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGestures()
        self.manufacturerNameTextField.delegate = self
        self.manufacturerNameTextField.becomeFirstResponder()
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func didTapSaveButton(_ sender: UIBarButtonItem) {
        guard
            let manufacturerName = self.manufacturerNameTextField.text,
            !manufacturerName.isEmpty
        else {
            #warning("Валидация поля. Показ алерта.")
            return
        }
        
        sender.isEnabled = false
        self.dismiss(animated: true) { [weak self] in
            self?.delegate?.didSaveNewManufacturer(manufacturerName)
        }
    }
}

extension ManufacturerViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.forcedHidingKeyboard()
        return true
    }
}
