//
//  ViewController.swift
//  Imc
//
//  Created by unicred on 06/12/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
	@IBOutlet weak var calcularButton: UIButton!
	
	@IBOutlet weak var pesoTF: UITextField!
	@IBOutlet weak var alturaTF: UITextField!
	
	@IBOutlet weak var imcLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		pesoTF.delegate = self
		alturaTF.delegate = self
		
		updateButton()
	}

	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		let allowedChars = ".1234567890"
		let allowedCharsSet = CharacterSet(charactersIn: allowedChars)
		let typeCharSet = CharacterSet(charactersIn: string)
		
		return allowedCharsSet.isSuperset(of: typeCharSet)
	}
	
	@IBAction func alturaChange(_ sender: Any) {
		updateButton()
	}
	
	@IBAction func pesoChange(_ sender: Any) {
		updateButton()
	}
	
	func updateButton() {
		let peso = pesoTF.text ?? ""
		let altura = alturaTF.text ?? ""
		
		if peso == "" || altura == "" {
			calcularButton.tintColor = UIColor.gray
			calcularButton.isUserInteractionEnabled = false
			
			return
		}
		
		calcularButton.tintColor = UIColor.tintColor
		calcularButton.isUserInteractionEnabled = true
	}
	
	@IBAction func calcular(_ sender: Any) {
		let peso = Double(pesoTF.text!)!
		let altura = Double(alturaTF.text!)! / 100
		
		imcLabel.text = "Seu IMC e \(peso / (altura * altura))"
	}
}

