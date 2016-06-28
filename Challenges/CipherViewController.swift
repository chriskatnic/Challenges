//
//  CipherViewController.swift
//  Challenges
//
//  Created by Christopher Katnic on 7/20/15.
//  Copyright (c) 2015 Christopher Katnic. All rights reserved.
//

//TODO:
//  When text field covered by keyboard, bring up
//  When 

import UIKit
import Foundation

//this extension allows for bitwise conversion
extension Character{
    func utf8() -> UInt8 {
        let utf8 = String(self).utf8
        return utf8[utf8.startIndex]
    }
}

class CipherViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var encrypt_text_field: UITextField!
    @IBOutlet weak var key_text_field: UITextField!
    @IBOutlet weak var decrypt_text_field: UITextField!
    
    
    
    @IBAction func encrypt_clicked(sender: AnyObject) {
        
        //check to make sure that there is enough stuff in the text fields
        
        
        //apply key on information in encrypt section
        //write to decrypt section
        decrypt_text_field.text = encrypt(encrypt_text_field.text, key: key_text_field.text)
        
    }
    
    @IBAction func decrypt_clicked(sender: AnyObject) {
        
        //check to make sure that there is enough stuff in the text fields
        
        
        //apply key on information in decrypt section
        //write to encrypt section
        encrypt_text_field.text = encrypt(decrypt_text_field.text, key: key_text_field.text)
    }
    
    func textFieldShouldReturn(textField: UITextField)-> Bool{
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.decrypt_text_field.delegate = self
        self.encrypt_text_field.delegate = self
        self.key_text_field.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func encrypt(message:String, key:String) -> String{
        
        var encrypted_message = [UInt8]()
        let m1 = [UInt8](message.utf8)
        let k1 = [UInt8](key.utf8)
        
        for var i = 0; i < m1.count; i++
        {
            encrypted_message.append(m1[i] ^ k1[i % k1.count])
        }
        
        return String(bytes:encrypted_message, encoding: NSUTF8StringEncoding)!
        
        
    }
    
    
}