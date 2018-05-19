//
//  Login_ViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 08/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit
import Alamofire
class Login_ViewController: UIViewController,UITextFieldDelegate {

   
    @IBOutlet weak var myview: UIView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var myimageview: UIImageView!
    @IBOutlet weak var myscrollview: UIScrollView!

    
    @IBAction func login(_ sender: Any) {
        
    
         if self.email.text == "" && self.password.text == "" {
            
        let alert1 = UIAlertController(title: "Login", message: "Both fields is empty..!", preferredStyle: UIAlertControllerStyle.alert)
            let ema = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert1.addAction(ema)
             present(alert1, animated: true, completion: nil)
            
        }else if self.password.text == "" {
             let alert2 = UIAlertController(title: "Login", message: "Password field is empty...!", preferredStyle: UIAlertControllerStyle.alert)
         let pass = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert2.addAction(pass)
             present(alert2, animated: true, completion: nil)
        }else {
             let alert3 = UIAlertController(title: "Login", message: "E-mail field is empty", preferredStyle: UIAlertControllerStyle.alert)
            if self.email.text == "" {
         
            let both = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alert3.addAction(both)
                 present(alert3, animated: true, completion: nil)
            } else if self.email.text != nil && self.password.text != nil{
                
                
                print("check")
                
               
            }
            }
        
}
    
    
    
    
    
    
    
    
    @IBAction func signup(_ sender: Any) {
        
               
        print("sign up")
        
    }
    

    



    override func viewDidLoad() {
        super.viewDidLoad()

      
        
        // Do any additional setup after loading the view.
        
        self.myview.layer.cornerRadius = 20
        //textfields
        self.email.layer.cornerRadius = 15
        self.password.layer.cornerRadius = 15
        self.password.textColor = UIColor.white
        self.login.layer.borderWidth = 1.25
        self.signup.layer.borderWidth = 1.25
        self.signup.layer.borderColor = UIColor.white.cgColor
        self.login.layer.borderColor = UIColor.white.cgColor
        self.myimageview.alpha = 0
        self.myview.alpha = 0
        self.email.alpha = 0
        self.password.alpha = 0
        self.login.alpha = 0
        self.signup.alpha = 0

        self.email.resignFirstResponder()
        self.password.resignFirstResponder()
        self.email.delegate = self
        self.password.delegate = self
        
        
        self.login.layer.cornerRadius = 15
        self.login.layer.borderWidth = 1.25
        self.login.layer.borderColor = UIColor.brown.cgColor
        
        self.signup.layer.cornerRadius = 15
        self.signup.layer.borderWidth = 1.25
        self.signup.layer.borderColor = UIColor.brown.cgColor
      
        custom_animation()
    }
    
    
    func custom_animation(){
        self.myimageview.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -200, 0, 0)
        UIView.animate(withDuration: 0.50, animations: {
            self.myimageview.alpha = 1
            self.myimageview.layer.transform = CATransform3DIdentity
            
            
        }) { (true) in
            
            self.myview.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -200, 0, 0)
            UIView.animate(withDuration: 0.30, animations: {
                self.myview.alpha = 1
                self.myview.layer.transform  = CATransform3DIdentity
            }) { (true) in
                self.email.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 400, 0, 0)
                UIView.animate(withDuration: 0.30, animations: {
                    self.email.alpha = 1
                    self.email.layer.transform = CATransform3DIdentity
                    
                }) { (true) in
                    
                    self.password.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 400, 0, 0)
                    UIView.animate(withDuration: 0.30, animations: {
                        self.password.alpha = 1
                        self.password.layer.transform = CATransform3DIdentity
                    }, completion: { (true) in
                        self.login.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, 250, 0)
                        UIView.animate(withDuration: 0.30, animations: {
                            self.login.alpha = 1
                            self.login.layer.transform = CATransform3DIdentity
                        }, completion: { (true) in
                            self.signup.layer.transform  = CATransform3DTranslate(CATransform3DIdentity, 0, 250, 0)
                            UIView.animate(withDuration: 0.30, animations: {
                                self.signup.alpha  = 1
                                self.signup.layer.transform = CATransform3DIdentity
                            })
                        })
                    })
                                 }
            }
        }

        
    }
       func textFieldDidBeginEditing(_ textField: UITextField) {
    
        let scroll:CGPoint = CGPoint(x: 0, y: textField.frame.origin.y)
        self.myscrollview.setContentOffset(scroll, animated: true)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let zero = CGPoint.init(x: 0, y: -20)
        self.myscrollview.setContentOffset(zero, animated: true)
    
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



