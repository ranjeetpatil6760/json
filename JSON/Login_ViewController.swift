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
                loginfunction()
                
            }
      }
  
    }
    
    
    func loginfunction(){
        print("Start.....")
        Alamofire.request("http://kolhapurtourism.co.in/ClassifiedApp/login.php?uid=\(self.email.text!)&pass=\(self.password.text!)").responseData { (resdata) in
            
            print(resdata.result.value as Any)
            let res = resdata.result.value
           
            let pop = String(data: res!, encoding: String.Encoding.utf8)
             print(pop!)
            if pop == "User#1"{
             
                let controller = UIAlertController(title: "Login", message: "Invalid username & password", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                controller.addAction(action)
                self.present(controller, animated: true, completion: nil)
                
            }else{
                
                let controller = UIAlertController(title: "Login", message: "Valid username & password", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                controller.addAction(action)
                self.present(controller, animated: true, completion: nil)
                self.insertintofcm_did()

                
            }
            
            
        }
  }
  
    
    func insertintofcm_did(){
        
        let mac = UIDevice.current.identifierForVendor?.uuidString
        print(mac!)
        let uuid = NSUUID().uuidString.lowercased()
        
        let params:Parameters = [ "email":self.email.text!,
                                  "token":uuid,
                                  "imei":mac!,
                                  "email_status":"1",
                                  "sound":"1"        ]
        
        
        Alamofire.request("http://kolhapurtourism.co.in/ClassifiedApp/login.php", method: .post, parameters: params, encoding: URLEncoding.httpBody).responseJSON { response in
            
            if let data = response.data {
                let json = String(data: data, encoding: String.Encoding.utf8)
                print("Response: \(json as Any)")
            }
        }
    }
    @IBAction func signup(_ sender: Any) {
        
        
        let image = UIImage(named: "1.jpg")
        let data = UIImageJPEGRepresentation(image!, 1.0)
        let str = String(data: data!, encoding: String.Encoding.utf8)
        let date = DateFormatter()
        date.dateStyle = .medium
        let pa:Parameters = ["fname":"ranjit",
                            "lname":"khapare",
                            "email":"ranjitkhapare45@yahoo.com",
                            "pass":"456123",
                            "mobile":"45454545",
                            "rimg":str as Any,
                            "rdate":date,
                            "dob":"3-6-1994"]
        
        Alamofire.request("http://kolhapurtourism.co.in/ClassifiedApp/registration.php", method: .post, parameters: pa, encoding: URLEncoding.httpBody).responseJSON { response in
            
            if let data = response.result.value {
                let json = String(data: data as! Data, encoding: String.Encoding.utf8)
                print("Response: \(json!)")
            }
        }
        
        print("sign up")
        
        
    }
     override func viewDidLoad() {
        super.viewDidLoad()

        
            //encode()
        // 90426811-9e7e-47e7-a1b8-b0e2690f5bc2
        // 1b8d6629-0929-4a4d-8366-89e6ef366345
        // Do any additional setup after loading the view.
        
        self.myview.layer.cornerRadius = 20
        //textfields
        self.email.layer.cornerRadius = 20
        self.password.layer.cornerRadius = 20
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
        
        
        self.login.layer.cornerRadius = 20
        self.login.layer.borderWidth = 1.0
        self.login.layer.borderColor = UIColor.brown.cgColor
        
        self.signup.layer.cornerRadius = 20
        self.signup.layer.borderWidth = 1.0
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
}



