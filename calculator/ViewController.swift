//
//  ViewController.swift
//  calculator
//
//  Created by Ana Paula Marcal Franzoi on 28/06/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstNumTxt: UITextField!
    @IBOutlet var secondNumTxt: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // _ = Chamada anonima. sender = Objeto que disparou a acao. Any = Recebe qualquer tipo como parametro
    @IBAction func addBtn(_ sender: Any) {
        guard let (n1, n2) = getNumeros() else { return }
        result.text = String(add(num1: n1, num2: n2))
    }
    
    @IBAction func minusBtn(_ sender: Any) {
        guard let (n1, n2) = getNumeros() else { return }
        result.text = String(subtract(num1: n1, num2: n2))
    }
    
    @IBAction func multiplierBtn(_ sender: Any) {
        guard let (n1, n2) = getNumeros() else { return }
        result.text = String(multiply(num1: n1, num2: n2))
    }
    
    @IBAction func divisorBtn(_ sender: Any) {
        guard let (n1, n2) = getNumeros() else { return }
        result.text = String(divide(num1: n1, num2: n2))
    }
    
    func add(num1: Double, num2: Double) -> Double{
        return num1 + num2
    }
    
    func subtract(num1: Double, num2: Double) -> Double{
        return num1 - num2
    }
    func multiply(num1: Double, num2: Double) -> Double{
        return num1 * num2
    }
    func divide(num1: Double, num2: Double) -> Double{
        return num1 / num2
    }
    
    func getNumeros() -> (Double, Double)? {
        // Guard serve para tratar optionals
        guard
            let txt1 = firstNumTxt.text,
            let txt2 = secondNumTxt.text,
            let num1 = Double(txt1),
            let num2 = Double(txt2)
        else {
            result.text = "Error: Invalid Number"
            return nil
        }
        return (num1, num2)
    }

}

