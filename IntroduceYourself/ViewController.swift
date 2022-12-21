//
//  ViewController.swift
//  IntroduceYourself
//
//  Created by Aaron Jacob on 12/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numPetsLabel: UILabel!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var introduceSelfButton: UIButton!
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numPetsLabel.text = "\(Int(sender.value))"
    }
    @IBAction func introduceSelfButtonPressed(_ sender: UIButton) {
        
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        let introduction = "☄️ Hey, I'm \(firstNameTextField.text!) \(lastNameTextField.text!), and I'm whooshing at \(schoolNameTextField.text!). I'm a \(year!)-Year student here. I'm owned by \(numPetsLabel.text!) pets. It is \(morePetsSwitch.isOn) I want more pets to own me."
        
        print(introduction)
        
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Nice to meet you, \(firstNameTextField.text!)", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

