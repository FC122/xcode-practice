//
//  DataEntryViewController.swift
//  MyDestinations
//
//  Created by Ivan Barisic on 21/05/2020.
//  Copyright © 2020 Ivan Barisic. All rights reserved.
//

import UIKit

protocol DataEntryViewControllerDelegate: AnyObject {
    func created(newDestination: Destination)
}

class DataEntryViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    // MARK: - Variables
    weak var delegate: DataEntryViewControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Unos nove destinacije"
        
        titleLabel.text = "Naziv:"
        descriptionLabel.text = "Opis:"
        
        saveButton.setTitle("Save", for: .normal)
        
        titleTextField.delegate = self
        descriptionTextField.delegate = self
    }

    // MARK: - Actions
    @IBAction func onTouchSaveButton(_ sender: Any) {
        
        guard let titleText = titleTextField.text else {return}
        guard let descriptionText = descriptionTextField.text else {return}
        guard let longitudeText = longitudeTextField.text else {return}
        guard let langitudeText = latitudeTextField.text else {return}
        guard let urlText = urlTextField.text else {return}
        
        guard titleText.count > 0 && descriptionText.count > 0 && langitudeText.count > 0 else {return}
        
        let destination = Destination(title: titleText, description: descriptionText, langitude: langitudeText, longitude: longitudeText, url: urlText)
        delegate?.created(newDestination: destination)
        navigationController?.popViewController(animated: true)
    }
}

extension DataEntryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
