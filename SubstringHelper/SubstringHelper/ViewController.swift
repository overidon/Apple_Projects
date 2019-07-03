//
//  ViewController.swift
//  SubstringHelper
//
//  Created by Tyler Stansfield Jaggers on 6/27/19.
//  Copyright © 2019 Tyler Stansfield Jaggers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // OUTLET AREA...
    @IBOutlet weak var minimum_field: UITextField!
    @IBOutlet weak var maximum_field: UITextField!
    @IBOutlet weak var word_field: UITextField!
    @IBOutlet weak var instructions_label: UILabel!
    @IBOutlet weak var substring_label: UILabel!
    
    var minimum_index = -1
    var maximum_index = -1
    
    var target_word = ""

    
    // viewDidLoad is the first thing that happens
    // it loads the view controller and it also connects
    // that view controller to the appDelegate which makes the files
    // and storyboards able to share variables and information
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print ("Welcome to the Substring Helper Program !" )
        
        minimum_field.keyboardType = UIKeyboardType.numberPad
        maximum_field.keyboardType = UIKeyboardType.numberPad
        
    // end of the viewDidLoad method
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print ("\n\n...attempt to end editing...\n")
        self.view.endEditing(true)
        
       
        
        

        
        if ( minimum_field.text?.count ?? 0 > 0) {
            print ("There is information in the minimum text field area...")
            
            minimum_index = Int( minimum_field.text!)!

            
            print ("The value of the minimum index is now...: \(minimum_index) \n\n")
            
        } else {
            print ("There isn't anything in the minimum_field area...")
            minimum_index = -1
        }
        
        
        if ( maximum_field.text?.count ?? 0 > 0) {
            print ("There is information in the maximum text field area...")
            
            maximum_index = Int( maximum_field.text!)!
            
            
            print ("The value of the maximum index is now...: \(maximum_index) \n\n")
            
        } else {
            print ("There isn't anything in the maximum area...")
            maximum_index = -1
        }
        
        // they cleaned out the data...
        if ( minimum_index == -1 && maximum_index == -1){ setInstructions(code: 100)
        }
        
        
        if ( word_field.text?.count ?? 0 > 0){
            print ("There is information in the word_field area...")
            
            let word_rough = word_field.text!
            
            print ("The inputted word is: \(word_rough)")
            
    
            if verifyValidIndices(target: word_rough, start: minimum_index, stop: maximum_index) {
                
                print ("The indices seem valid for this word...")
                
                debugMinMax()
                
                setInstructions(code: 100)
                
                
                let data = getSubstring(phrase: word_rough, start: minimum_index, stop: maximum_index)
                
                print ("Your substring is: \(data)")
                
                
                substring_label.text = data
                
            } else {
                print ("The indices do not seem to be valid..")
                // TODO -> make the label say invalid indices etc..
                setInstructions(code: 500);
            }
                
           
            
        // end of the check for letters
        }
        
    // end of the touchesBegan..
    }
    
    
  
    
    
    func getSubstring( phrase: String,  start: Int, stop: Int) -> String {
        
        if ( 0 > start || 0 > stop) {
            return phrase
        }
        
        let front = phrase.index( phrase.startIndex, offsetBy: start)
        let back = phrase.index ( phrase.startIndex, offsetBy: stop )
        
        let substring1 = phrase[front..<back]
        
        print ( substring1)
        
        // cast as a String before returning...
        return String ( substring1 )
    //
    }
    
    func debugMinMax () {
        print ("The value of the minimum index is: \(minimum_index)")
        print ("The value of the maximum index is: \(maximum_index) \n\n")
    }
    
    func setInstructions( code: Int) {
        
        if code == 500 {
            
            instructions_label.text = "ERROR -> Invalid Indices..."
            
            substring_label.text = ""
        }
        
        else if code == 100 {
            
            instructions_label.text = "Your Substring will generate below"
            
        }
        
    // end of setInstructions function
    }
    
    func verifyValidIndices( target: String, start: Int, stop: Int) -> Bool {
        print ("The start is:  \(start) ")
        print ("The stop  is:  \(stop) ")
        
        if start < 0 { return false}
        if stop < 1 {return false}
            
        if stop <= start { return false }
        if start >= target.count { return false}
        if stop > target.count { return false}
        
        return true;
    // end of verifyvalidIndices function
    }

// end of the ViewController
}

