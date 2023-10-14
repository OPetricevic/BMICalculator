//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Omar Petričević on 26.02.2023..
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    
    @IBOutlet weak var valueHeightLabel: UILabel!
    @IBOutlet weak var valueWeightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var uiValue: Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        uiValue = round(sender.value * 100)
        valueHeightLabel.text = String(uiValue/100) + String("m")
        // ili
        // let height = String(format: "%.2f", sender.value)
        // heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        uiValue = round(sender.value * 10)
        valueWeightLabel.text = String(uiValue/10) + String("kg")
        // let weight = String(format: "%.0f", sender.value)
        //weightLabel.text = "\(weight)Kg"
    
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinatonVC = segue.destination as! ResultViewController // as omogucava da se utiče na bmiValue, ovo se zove downcasting, ! forsira tu radnju
            destinatonVC.bmiValue = calculatorBrain.getBMIValue()
            destinatonVC.advice = calculatorBrain.getAdvice()
            destinatonVC.color = calculatorBrain.getColor()
            
        }
    }
    
}

