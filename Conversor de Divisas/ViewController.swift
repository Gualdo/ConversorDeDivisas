//
//  ViewController.swift
//  Conversor de Divisas
//
//  Created by Eduardo D De La Cruz Marr on 18/1/17.
//  Copyright © 2017 Eduardo D De La Cruz Marrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    let poundToEuro : Double = 1.15185192
    let poundToDolar : Double = 1.23027
    let poundToYen : Double = 139.56036
    let euroToDolar : Double = 1.07
    let euroToYen : Double = 121.21
    let dolarToYen : Double = 113.51
    
    @IBOutlet var textPound : UITextField!
    @IBOutlet var textEuro : UITextField!
    @IBOutlet var textDolar : UITextField!
    @IBOutlet var textYen : UITextField!
    @IBOutlet var buttonReset : UIButton!
    @IBOutlet var buttonCalc : UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buttonReset.alpha = 0
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        //**************************************** No rellena nunguno ****************************************//
        
        if textPound.text == "" && textEuro.text == "" && textYen.text == "" && textDolar.text == ""
        {
            let alert : UIAlertController = UIAlertController(title: "Que pena!!! Revisa!!!", message : "Debe ingresar una cantidad en alguno de los cuadros para calcular", preferredStyle: .alert)
            let okAction : UIAlertAction = UIAlertAction(title: "Entendido", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated : true, completion : nil)
        }
        
        //**************************************** Rellena Libra ****************************************//
            
        else if textPound.text != "" && textEuro.text == "" && textYen.text == "" && textDolar.text == ""
        {
            textEuro.text = String (format : "%.2f" , Double (textPound.text!)! * poundToEuro)
            textDolar.text = String (format : "%.2f" , Double (textPound.text!)! * poundToDolar)
            textYen.text = String (format : "%.2f" , Double (textPound.text!)! * poundToYen)
            
            buttonCalc.alpha = 0
            buttonReset.alpha = 1
            textPound.isUserInteractionEnabled = false
            textYen.isUserInteractionEnabled = false
            textDolar.isUserInteractionEnabled = false
            textEuro.isUserInteractionEnabled = false
        }
            
        //**************************************** Rellena Euro ****************************************//
            
        else if textPound.text == "" && textEuro.text != "" && textYen.text == "" && textDolar.text == ""
        {
            textPound.text = String (format : "%.2f" , Double (textEuro.text!)! / poundToEuro)
            textDolar.text = String (format : "%.2f" , Double (textEuro.text!)! * euroToDolar)
            textYen.text = String (format : "%.2f" , Double (textEuro.text!)! * euroToYen)
            
            buttonCalc.alpha = 0
            buttonReset.alpha = 1
            textPound.isUserInteractionEnabled = false
            textYen.isUserInteractionEnabled = false
            textDolar.isUserInteractionEnabled = false
            textEuro.isUserInteractionEnabled = false
        }
            
        //**************************************** Rellena Dolar ****************************************//
            
        else if textPound.text == "" && textEuro.text == "" && textYen.text == "" && textDolar.text != ""
        {
            textPound.text = String (format : "%.2f" , Double (textDolar.text!)! / poundToDolar)
            textEuro.text = String (format : "%.2f" , Double (textDolar.text!)! / euroToDolar)
            textYen.text = String (format : "%.2f" , Double (textDolar.text!)! * dolarToYen)
            
            buttonCalc.alpha = 0
            buttonReset.alpha = 1
            textPound.isUserInteractionEnabled = false
            textYen.isUserInteractionEnabled = false
            textDolar.isUserInteractionEnabled = false
            textEuro.isUserInteractionEnabled = false
        }
            
        //**************************************** Rellena Yen ****************************************//
            
        else if textPound.text == "" && textEuro.text == "" && textYen.text != "" && textDolar.text == ""
        {
            textPound.text = String (format : "%.2f" , Double (textYen.text!)! / poundToYen)
            textEuro.text = String (format : "%.2f" , Double (textYen.text!)! / euroToYen)
            textDolar.text = String (format : "%.2f" , Double (textYen.text!)! / dolarToYen)
            
            buttonCalc.alpha = 0
            buttonReset.alpha = 1
            textPound.isUserInteractionEnabled = false
            textYen.isUserInteractionEnabled = false
            textDolar.isUserInteractionEnabled = false
            textEuro.isUserInteractionEnabled = false
        }
            
        //**************************************** Rellena mas de uno ****************************************//
            
        else
        {
            let alert : UIAlertController = UIAlertController(title: "Que pena!!! Revisa!!!", message : "Debe estar relleno solo uno de los cuadros", preferredStyle: .alert)
            let okAction : UIAlertAction = UIAlertAction(title: "Entendido", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated : true, completion : nil)
        }
    }
    
    @IBAction func buttonResetPressed(_ sender: UIButton)
    {
        textEuro.text = ""
        textDolar.text = ""
        textYen.text = ""
        textPound.text = ""
        textPound.isUserInteractionEnabled = true
        textYen.isUserInteractionEnabled = true
        textDolar.isUserInteractionEnabled = true
        textEuro.isUserInteractionEnabled = true
        
        buttonCalc.alpha = 1
        buttonReset.alpha = 0
    }
}
