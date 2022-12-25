//
//  ViewController.swift
//  IntroduceYourself
//
//  Created by Aaron Jacob on 12/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    //Create UserDefaults object named "defaults"
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numPetsLabel: UILabel!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var introduceSelfButton: UIButton!
    @IBOutlet weak var backgroundColorButton: UIButton!
    
    // Method for updating label displaying pet count when stepper is pressed
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numPetsLabel.text = "\(Int(sender.value))"
    }
    
    // Method for introduce yourself button
    @IBAction func introduceSelfButtonPressed(_ sender: UIButton) {
        
        var errorMessage = "Hold on."
        
        //Find empty textfields and write error message if necessary
        if (firstNameTextField.text == "") {
            errorMessage += " What's your first name?"
        }
        if (lastNameTextField.text == "") {
            errorMessage += " What's your last name?"
        }
        if (schoolNameTextField.text == "") {
            errorMessage += " Where do you go to school?"
        }
        if (majorTextField.text == "") {
            errorMessage += " What's your major?"
        }
        
        if (errorMessage == "Hold on.") { // If all fields complete
            
            // Write introduction
            let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
            var introduction = "☄️ Hey, I'm \(firstNameTextField.text!) \(lastNameTextField.text!), and I'm whooshing at \(schoolNameTextField.text!). I'm a \(year!)-Year student here pursuing a degree in \(majorTextField.text!)."
            if (numPetsLabel.text! == "1") {
                introduction += " I'm owned by \(numPetsLabel.text!) pet."
            }
            else {
                introduction += " I'm owned by \(numPetsLabel.text!) pets."
            }
            introduction += " It is \(morePetsSwitch.isOn) I want more pets to own me."
            
            // Save entered data
            defaults.set(firstNameTextField.text!, forKey: "FirstName")
            defaults.set(lastNameTextField.text!, forKey: "LastName")
            defaults.set(schoolNameTextField.text!, forKey: "SchoolName")
            defaults.set(majorTextField.text!, forKey: "Major")
            defaults.set(yearSegmentedControl.selectedSegmentIndex, forKey: "YearIndex")
            defaults.set(numPetsLabel.text!, forKey: "PetQuantity")
            defaults.set(morePetsSwitch.isOn, forKey: "WantsMorePets")
            
            print("Defaults saved.")
            
            print(introduction)
            
            //Show introduction alert
            let introductionAlertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
            let action = UIAlertAction(title: "Nice to meet you, \(firstNameTextField.text!)", style: .default, handler: nil)
            introductionAlertController.addAction(action)
            present(introductionAlertController, animated: true, completion: nil)
            
        }
        else { // Show error alert if textfields are incomplete
            
            print(errorMessage)
            
            let errorAlertController = UIAlertController(title: "Whoops!", message: errorMessage, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
            
            errorAlertController.addAction(action)
            
            present(errorAlertController, animated: true, completion: nil)
            
        }
        
    }
    
    // Method for changing background color
    @IBAction func backgroundColorButtonPressed(_ sender: UIButton) {
        
        if (view.backgroundColor == UIColor.systemBackground && traitCollection.userInterfaceStyle == .light) {
            view.backgroundColor = UIColor(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1.0)
        }
        else if (view.backgroundColor == UIColor.systemBackground && traitCollection.userInterfaceStyle == .dark) {
            view.backgroundColor = UIColor(red: 17/250.0, green: 17/250.0, blue: 17/250.0, alpha: 1.0)
        }
        else {
            view.backgroundColor = UIColor.systemBackground
        }
        
        print("Background color changed.")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Load saved data/defaults if they exist
        firstNameTextField.text = defaults.object(forKey: "FirstName") as? String
        lastNameTextField.text = defaults.object(forKey: "LastName") as? String
        schoolNameTextField.text = defaults.object(forKey: "SchoolName") as? String
        majorTextField.text = defaults.object(forKey: "Major") as? String
        yearSegmentedControl.selectedSegmentIndex = defaults.integer(forKey: "YearIndex")
        morePetsStepper.value = defaults.double(forKey: "PetQuantity")
        numPetsLabel.text = "\(Int(morePetsStepper.value))"
        morePetsSwitch.isOn = defaults.bool(forKey: "WantsMorePets")
        
        print("Defaults loaded.")
        
    }

}
