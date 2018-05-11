//
//  RegistrationViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 09/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit
import Alamofire
class RegistrationViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var myview: UIView!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var signbtn: UIButton!
    @IBOutlet weak var myimageview: UIImageView!
    @IBOutlet weak var myscrollview: UIScrollView!
    @IBOutlet weak var mysmallimageview: UIImageView!
    
    
    
    
    let url_string = "http://kolhapurtourism.co.in/ClassifiedApp/registration.php"
   
    let imageviewcontroller = UIImagePickerController()
    
    @IBAction func signup(_ sender: UIButton) {
       
        

            
        
//         let Parameters_code:Parameters = [ "fname":firstname.text!,
//                                        "lname":lastname.text!,
//                                        "email":email.text!,
//                                        "pass":password.text!,
//                                        "mobile":mobile.text!,
//                                        "rdate":"10-5-555",
//                                        "img":myimageview.image!,
//                                        "filename":"Filename"
//                                        
//                            
//                                                            ]
//        
//        
//        Alamofire.request(url_string, method: .post, parameters: Parameters_code).responseJSON
//            {
//                response in
//                //printing response
//                print(response)
//                
//                //getting the json value from the server
//                if let result = response.result.value {
//                    
//                    //converting it as NSDictionary
//                    let jsonData = result as! NSDictionary
//                    
//                    //displaying the message in label
//                    let mess = jsonData.value(forKey: "message") as! String?
//                    print(mess!)
//                }
//        }
//        
//        
        
    
        }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        
    dismiss(animated: true, completion: nil)
        print("cancel")
    }
    
    
    @IBAction func camera_btn(_ sender: UIButton) {
        
       
      
        customalertviews()
        print("photo")
        
    }
    
        func customalertviews(){
        
        
        let controller = UIAlertController(title: "CHOOSE", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let Gallery = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default) { (action) in
            
            self.imageviewcontroller.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            self.imageviewcontroller.allowsEditing = true
            self.imageviewcontroller.sourceType = .photoLibrary
            self.present(self.imageviewcontroller, animated: true, completion: nil)
            
            
        }
        
  
    
        let camera = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default) { (action ) in
            
            if self.imageviewcontroller.sourceType == UIImagePickerControllerSourceType.camera{
            
                
            self.imageviewcontroller.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
            self.imageviewcontroller.allowsEditing = true
            self.imageviewcontroller.sourceType = .camera
            self.present(self.imageviewcontroller, animated: true, completion: nil)
            }else {
                
                print("source not available")
                let a = UIAlertController(title: "Camera", message: "No Source Available", preferredStyle: UIAlertControllerStyle.alert)
                let d = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                let can = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
                
                a.addAction(d)
                a.addAction(can)
                
                self.present(a, animated: true, completion: nil)
        
            }
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        
        
       
        controller.addAction(Gallery)
        controller.addAction(camera)
        controller.addAction(cancel)
        
        present(controller, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        
        // Do any additional setup after loading the view.
        self.myview.layer.cornerRadius = 20
        self.myview.layer.borderColor = UIColor.white.cgColor
        self.myview.layer.borderWidth = 1.0
        self.firstname.layer.cornerRadius = 15
        self.lastname.layer.cornerRadius = 15
        self.mobile.layer.cornerRadius = 15
        self.password.layer.cornerRadius = 15
        self.email.layer.cornerRadius = 15
        self.signbtn.layer.cornerRadius = 15
        self.signbtn.layer.borderWidth = 1.25
        self.signbtn.layer.borderColor = UIColor.brown.cgColor
        self.cancel.layer.borderColor = UIColor.brown.cgColor
        self.cancel.layer.borderWidth = 1.25
        self.cancel.layer.cornerRadius = 15

        
        self.myimageview.layer.cornerRadius = self.myimageview.frame.size.width / 2
        self.myimageview.clipsToBounds = true
        self.myimageview.layer.masksToBounds = true
        
        self.myimageview.alpha = 0
        self.myview.alpha = 0
        self.firstname.alpha = 0
        self.lastname.alpha = 0
        self.mobile.alpha = 0
        self.password.alpha = 0
        self.signbtn.alpha = 0
        self.cancel.alpha = 0
        self.email.alpha = 0
        
        
   
    animation()
    }
    
    func animation()
    {
        self.myimageview.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -200, 0, 0)
        UIView.animate(withDuration: 0.40, animations: {
            self.myimageview.alpha = 1
            self.myimageview.layer.transform = CATransform3DIdentity
            self.myimageview.layer.borderWidth = 0.70
            self.myimageview.layer.borderColor = UIColor.white.cgColor
        }, completion:{  (true) in
            self.myview.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -200, 0, 0)
            UIView.animate(withDuration: 0.40, animations: {
                self.myview.alpha = 1
                self.myview.layer.transform  = CATransform3DIdentity
            }, completion: { (true) in
                self.firstname.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 400, 0, 0)
                UIView.animate(withDuration: 0.40, animations: {
                    self.firstname.alpha = 1
                    self.firstname.layer.transform = CATransform3DIdentity
                }, completion: { (true) in
                    
                    self.lastname.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 400, 0, 0)
                    UIView.animate(withDuration: 0.40, animations: {
                        self.lastname.alpha = 1
                        self.lastname.layer.transform = CATransform3DIdentity
                    }, completion: { (true) in
                        
                        self.email.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 400, 0, 0)
                        UIView.animate(withDuration: 0.40, animations: {
                            self.email.alpha = 1
                            self.email.layer.transform = CATransform3DIdentity
                        }, completion: { (true) in
                            self.password.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 400, 0, 0)
                            UIView.animate(withDuration: 0.40, animations: {
                                
                                self.password.alpha = 1
                                self.password.layer.transform = CATransform3DIdentity
                            }, completion: { (true) in
                                
                                
                                self.mobile.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, 400, 0)
                                UIView.animate(withDuration: 0.40, animations: {
                                    self.mobile.alpha = 1
                                    self.mobile.layer.transform = CATransform3DIdentity
                                }, completion: { (true) in
                                    
                                    self.signbtn.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, 250, 0)
                                    UIView.animate(withDuration: 0.40, animations: {
                                        self.signbtn.alpha = 1
                                        self.signbtn.layer.transform = CATransform3DIdentity
                                        
                                    }, completion: { (true) in
                                        self.cancel.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, 250, 0)
                                        UIView.animate(withDuration: 0.40, animations: {
                                            self.cancel.alpha = 1
                                            self.cancel.layer.transform = CATransform3DIdentity
                                        })
                                        
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })

        
        
    }

       
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        let scroll:CGPoint = CGPoint(x: 0, y: textField.frame.origin.y)
        self.myscrollview.setContentOffset(scroll, animated: true)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let zero = CGPoint.init(x: 0, y: -3)
        self.myscrollview.setContentOffset(zero, animated: true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    }



extension RegistrationViewController:UIImagePickerControllerDelegate{
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        myimageview.image = chosenImage
        myimageview.contentMode = .scaleAspectFill
        
        
        mysmallimageview.image = chosenImage
        mysmallimageview.contentMode = .scaleAspectFill
        
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    

    
    
}









