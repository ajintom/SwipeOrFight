//
//  ViewController.swift
//  SwipeOrFight
//
//  Created by Ajin Tom on 2020-10-18.
//

import UIKit

let cuisineStringArray = ["INDIAN","CHINESE","AMERICAN","JAPANESE","THAI"]
var currNumber = 0

struct cuisine {
    var name : String
    var id : Int
    var selected : Bool = false
    
    init(_ name: String,_ id: Int) {
        self.name = name
        self.id = id
    }
}

var cuisineStructArrayInit : [cuisine] = []
var cuisineStructArray : [cuisine] = []



class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    @IBOutlet weak var cuisineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        
//        Initializing and shuffling cuisine items
        
        
        var ctr = 0;
        for cuisineString in cuisineStringArray
        {
            cuisineStructArrayInit.append(cuisine(cuisineString,ctr))
            ctr = ctr + 1
        }
        cuisineStructArray = cuisineStructArrayInit.shuffled()
        cuisineLabel.text = cuisineStructArray[currNumber].name

    }


    @IBAction func foodButtonClick(_ sender: Any) {
        
        welcomeLabel.text = "testing food button click"
    }

    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
                
                if currNumber < cuisineStructArray.count - 1
                {
                    cuisineStructArray[currNumber].selected = true
                    currNumber = currNumber + 1;
                    cuisineLabel.text = cuisineStructArray[currNumber].name
                }
                else
                {
                    welcomeLabel.text = "END OF MENU"
                    for cuisineString in cuisineStructArray
                    {
                        print(cuisineString)
                    }
                }
                
                
            case .left:
                print("Swiped left")
                
                if currNumber < cuisineStructArray.count - 1
                {
                    currNumber = currNumber + 1;
                    cuisineLabel.text = cuisineStructArray[currNumber].name
                }
                else
                {
                    welcomeLabel.text = "END OF MENU"
                    for cuisineString in cuisineStructArray
                    {
                        print(cuisineString)
                    }
                }
                
            default:
                break
            }
        }
    }

}


