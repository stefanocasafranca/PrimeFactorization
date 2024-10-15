//
//  ViewController.swift
//  PrimeFactorization
//
//  Created by Stefano Casafranca Laos on 10/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    let largest = 100
    let smallest = 6
    let primesFromLargeToSmall = [2, 3, 5, 7, 11, 13, 17, 19, 21, 23, 29, 31, 37, 41, 43, 47]
    
    var theNumber = 0
    var factorsThusFar = Array<Int>()
    
    @IBOutlet weak var feedbackLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNextSession()
    }
    
    
    func setupNextSession() {
        theNumber = Int.random(in: smallest...largest)
        factorsThusFar = []
        feedbackLabel.text = "Enter a primer number factor."
    }
    
    @IBAction func newSessionButtonPressed(){
        setupNextSession()
    }
    
    @IBAction func processFactor(_ sender: UITextField) {
        
        guard let theNumberAsText = sender.text, let potentialPrime = Int(theNumberAsText) else { return}
        print("Thu number entered is \(potentialPrime).")
        
        guard primesFromLargeToSmall.contains(potentialPrime...potentialPrime) else{
            feedbackLabel.text = "You DID NOT ENTERED a prime"
            return
        }
        
        if theNumber % potentialPrime == 0 {
            //Success you found a prime
            theNumber = theNumber / potentialPrime
            factorsThusFar.append(potentialPrime)
            if theNumber == 1 {
                feedbackLabel.text = "Prime factors for the number: \(factorsThusFar)"
                setupNextSession()
            }else {
                feedbackLabel.text = "You guessed a prime: \(potentialPrime)"
            }
        } else {
            feedbackLabel.text = "You DID NOT SELECT a prime"
        }
    }
}
    




 


