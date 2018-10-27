//
//  CalculatorViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    // BEGIN-UOC-7.1
    @IBOutlet weak var initialAmountLabel: UILabel!    
    @IBOutlet weak var initialAmountSlider: UISlider!
    @IBOutlet weak var interestRateLabel: UILabel!
    @IBOutlet weak var interestRateStepper: UIStepper!
    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var yearsStepper: UIStepper!
    @IBOutlet weak var finalAmountLabel: UILabel!
    // END-UOC-7.1
    
    
    // BEGIN-UOC-7.2
    @IBAction func fetchAndUpdateCurrentData(_ sender: Any) {
        updateData(initialAmount: initialAmountSlider.value, interestRate: interestRateStepper.value, years: yearsStepper.value)
    }
    // END-UOC-7.2
    
    
    // BEGIN-UOC-7.3
    override func viewDidLoad() {
        initializeData()
    }
    
    func initializeData() {
        initialAmountSlider.value = 100
        interestRateStepper.value = 1
        yearsStepper.value = 1
        updateData(initialAmount: initialAmountSlider.value, interestRate: interestRateStepper.value, years: yearsStepper.value)
    }
    
    func updateData(initialAmount : Float, interestRate : Double, years : Double) {
        let calculatedAmount = Services.calculateFinalAmount(ForAmount: initialAmount, WithInterest: interestRate, AndYears: years)
        
        initialAmountLabel.text = "Initial amount: \(String(format: "%.0f", initialAmount)) €"
        interestRateLabel.text = "Interest rate: \(String(format: "%.2f", interestRate)) %"
        yearsLabel.text = "Years: \(String(format: "%.0f", years))"
        finalAmountLabel.text = "Final amount: \(String(format: "%.2f", calculatedAmount)) €"
    }
    
    func getCurrentSliderValue() -> String{
        let currentSliderValue = initialAmountSlider.value
        return "\(currentSliderValue)"
    }
    // END-UOC-7.3
}
