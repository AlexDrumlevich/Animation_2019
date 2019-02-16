//
//  ViewController.swift
//  Animation_2019
//
//  Created by Друмлевич on 12.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var bottomButtonConstraint: NSLayoutConstraint!
    var animator: UIViewPropertyAnimator?
    
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        textField.delegate = self
        super.viewDidLoad()
        startPosition()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animationTextField()
    }
    
    func animationTextField() {
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: .calculationModeLinear, animations:
            {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                    self.textField.backgroundColor = .yellow
                    self.view.backgroundColor = .black
                    self.textField.placeholder = "Enter your text"
                    self.textField.tintColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                    
                    self.textField.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
                
                
                
        }
        )
        
    }
    
    func startPosition() {
        
        button.center.y = view.frame.height
        button.center.x = view.center.x
        button.isHidden = true
        button.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        button.tintColor = .red
        textField.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        label.isHidden = true
        againButton.isHidden = true
 
        
        
    }
    func animateLabel() {
        
        self.label.isHidden = false
        self.againButton.isHidden = false
        
    }
    
    
    func animateButtonTapped(){
        textField.isHidden = true
        button.isHidden = true
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2) {
                self.view.backgroundColor = .red
            }
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2) {
                self.view.backgroundColor = .white
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.2) {
                self.view.backgroundColor = .blue
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.view.backgroundColor = .orange
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2) {
                self.view.backgroundColor = .black
            }
            
        }, completion: { (bool) in
            self.animateLabel()
        }
        )
        
        
        
        
    }
    
    func animationButton() {
        button.isHidden = false
        
        UIView.animateKeyframes(withDuration: 10, delay: 0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.button.center.x = self.view.center.x
                self.button.center.y  = self.view.frame.height / 5
                
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.25) {
                self.button.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.25) {
                self.button.layer.cornerRadius = self.button.frame.width / 2
                self.button.clipsToBounds = true
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.25) {
                self.button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                self.button.tintColor = .yellow
                self.bottomButtonConstraint.constant = self.view.frame.height * 4 / -5
                //self.bottomButtonConstraint.constant = self.button.bounds.minY
            }
            
        }
        )
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        label.text = textField.text ?? "🎃"
        textField.resignFirstResponder()
        
        if label.text!.isEmpty {
            label.text = "🎃"
        }
        
        animateButtonTapped()
        
    }
    @IBAction func againButton(_ sender: UIButton) {
        startPosition()
        textField.text = ""
        textField.isHidden = false
        
        animationTextField()
    }
    
}


extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animationButton()
        //animatorButton?.startAnimation()
        
    }
    
}
