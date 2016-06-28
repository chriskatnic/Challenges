//
//  WordScrambleViewController.swift
//  Challenges
//
//  Created by Christopher Katnic on 7/20/15.
//  Copyright (c) 2015 Christopher Katnic. All rights reserved.
//

import UIKit

class WordScrambleViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var text_field: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func scramble(sender: AnyObject) {
    
        var input_string: String = text_field.text!
        
        label.text = sort_string(input_string)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //helper function to sort character array
    func helper(c1: Character, c2: Character) -> Bool{
        return c1<c2
    }
    
    func sort_string(s1: String) -> String{
        
        //create a 'template' from string coming in
        var template = create_template(s1)
        
        //extract letters from string, put into sorted array (lowercase string, so uppercase letters
        //don't get sorted at higher priority
        var s2 = strip_special_characters(s1).lowercaseString
        var sorted_letters_only = sorted(s2, helper)
        
        //apply template onto character array
        var buffer = apply_template(sorted_letters_only, template: template)
        var sorted_string: String = ""
        
        
        //create string from char array
        for letter in buffer{
            sorted_string.append(letter)
        }
        
        return sorted_string
    }
    
    //create template from original input
    func create_template(s1: String) -> [Character]{
        var template: [Character] = []
        
        
        for c in s1
        {

            switch(c)
            {
                //common punctuation
            case ".":
                template.append(".")
                break;
            case ",":
                template.append(",")
                break;
            case "-":
                template.append("-")
                break;
            case " ":
                template.append(" ")
                break;
            case "!":
                template.append("!")
                break;
            case "?":
                template.append("?")
                break;
                
                //anything else is a lower or upper letter
            default:
                if(is_upper(c)){
                    template.append("u")
                }
                else{
                    template.append("l")
                }
                break;
            }
        }
        
        return template
        
    }
    
    //apply template to sorted letters, return sorted string against template
    func apply_template(s1: [Character], template:[Character]) -> [Character]{
        var end_result: [Character] = []
        var counter: Int = 0
        for cell in template{
            switch(cell){
            case ".":
                end_result.append(".")
                break;
            case ",":
                end_result.append(",")
                break;
            case "-":
                end_result.append("-")
                break;
            case " ":
                end_result.append(" ")
                break;
            case "!":
                end_result.append("!")
                break;
            case "?":
                end_result.append("?")
                break;
            case "u":
                var c1 = String(s1[counter]).uppercaseString
                end_result.append(Character(c1))
                counter++
                break;
            case "l":
                var c1 = String(s1[counter]).lowercaseString
                end_result.append(Character(c1))
                counter++
                break;
            default:
                break;
            }
        }
        return end_result
    }
    
    
    func is_upper(c1: Character) -> Bool{
        
        let s = String(c1)
        let uppercase = s.uppercaseString
        
        return (s == uppercase)
    }
    
    func strip_special_characters(s1: String) -> String{
        
        var s2: String = s1.stringByReplacingOccurrencesOfString(",", withString: "", options: nil, range: nil)
        s2 = s2.stringByReplacingOccurrencesOfString(".", withString: "", options: nil, range: nil)
        s2 = s2.stringByReplacingOccurrencesOfString(" ", withString: "", options: nil, range: nil)
        s2 = s2.stringByReplacingOccurrencesOfString("-", withString: "", options: nil, range: nil)
        s2 = s2.stringByReplacingOccurrencesOfString("!", withString: "", options: nil, range: nil)
        s2 = s2.stringByReplacingOccurrencesOfString("?", withString: "", options: nil, range: nil)
        
        return s2
    }
    
    
    
}