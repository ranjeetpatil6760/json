//
//  RegistrationViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 09/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit
import Alamofire
class RegistrationViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var myview: UIView!
    @IBOutlet weak var mycoverbutton: UIButton!
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
       
        print("sign up")
         textfiled_validation()
        img()
        // myImageUploadRequest()
        
    }
    
    func img(){
        let image = UIImage(named: "3.jpg")
        let params: Parameters = ["fname": "abcd", "gender": "Male"]
        Alamofire.upload(multipartFormData:
            {
                (multipartFormData) in
                multipartFormData.append(UIImageJPEGRepresentation(image!, 0.1)!, withName: "iOSimage.jpeg", fileName: "file.jpeg", mimeType: "image/jpeg")
                for (key, value) in params
                {
                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
        }, to:url_string,headers:nil)
        { (result) in
            switch result {
            case .success(let upload,_,_ ):
                upload.uploadProgress(closure: { (progress) in
                    //Print progress
                })
                upload.responseJSON
                    { response in
                        //print response.result
                        if response.result.value != nil
                        {
                            let dict :NSDictionary = response.result.value! as! NSDictionary
                            let status = dict.value(forKey: "status")as! String
                            if status=="1"
                            {
                                print("DATA UPLOAD SUCCESSFULLY")
                            }
                        }
                }                
            case .failure( _):
                break
            }   
        }
        
        
    }
    
    
    
        func myImageUploadRequest()
        {
            
            
            let dateformatter = DateFormatter()
            
            dateformatter.dateStyle = DateFormatter.Style.short
            
            dateformatter.timeStyle = DateFormatter.Style.short
            
            let now = dateformatter.string(from: NSDate() as Date)
            
            
            let para = [           "fname":firstname.text!,
                                               "lname":lastname.text!,
                                               "email":email.text!,
                                               "pass":password.text!,
                                               "mobile":mobile.text!,
                                               "rdate":now ]

            
            
            let myUrl = NSURL(string: "http://kolhapurtourism.co.in/ClassifiedApp/registration.php");
            
            let request = NSMutableURLRequest(url:myUrl! as URL) as NSMutableURLRequest
            
            request.httpMethod = "POST";
            
            let boundary = generateBoundaryString()
            
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            
            let imageData = UIImageJPEGRepresentation(myimageview.image!, 1)
           // let imageStr = imageData?.base64EncodedString()

            if(imageData==nil)  { return }
            
            //        request.HTTPBody = createBodyWithParameters(parameters: para, filePathKey: "file", imageDataKey: imageData! as NSData, boundary: boundary)
            
            request.httpBody = createBodyWithParameters(parameters: para, filePathKey: "myiosimages", imageDataKey: imageData! as NSData, boundary: boundary) as Data
            
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print("error=\(String(describing: error))")
                    return
                }
                
                print(response!)
                
                // Print out reponse body
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("****** response data = \(responseString!)")
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary
                    
                    print("  json  \(String(describing: json))")
                    
                    
                }catch
                {
                    print(error)
                }
                
            }
            
            task.resume()
        }
        
        
        func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
            let body = NSMutableData();
            
            if parameters != nil {
                for (key, value) in parameters! {
                    body.appendString(string: "--\(boundary)\r\n")
                    body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                    body.appendString(string: "\(value)\r\n")
                }
            }
            
            let filename = "appleimages"
            let mimetype = "image/jpg"
            
            body.appendString(string: "--\(boundary)\r\n")
            body.appendString(string: "Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
            body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
            body.append(imageDataKey as Data)
            body.appendString(string: "\r\n")
            
            
            
            body.appendString(string: "--\(boundary)--\r\n")
            
            return body
        }
        
        
        
        func generateBoundaryString() -> String {
            return "Boundary-\(NSUUID().uuidString)"
           
        }
        
        
    
    
    
    
    func textfiled_validation(){
        
        if (self.firstname.text == "" && self.lastname.text == "" && self.mobile.text == "" && self.password.text == "" && self.email.text == "" && myimageview.image == nil)  {
        
            
            let controller = UIAlertController(title: "Registration", message: "All fields are empty", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            
            controller.addAction(action)
            self.present(controller, animated: true, completion: nil)
            
            
            print("all fields are empty")
            
        }else if self.firstname.text == "" {
            
            let controller = UIAlertController(title: "First name", message: "First name field is empty", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            
            controller.addAction(action)
            self.present(controller, animated: true, completion: nil)
            
            
        }else if self.lastname.text == ""{
            
            
            let controller = UIAlertController(title: "Last name", message: "Last name field is empty", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            
            controller.addAction(action)
            self.present(controller, animated: true, completion: nil)
            
        }else if self.email.text == ""{
            
            let controller = UIAlertController(title: "E-Mail", message: "Email field is empty", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            
            controller.addAction(action)
            self.present(controller, animated: true, completion: nil)
            
            
        }else if self.password.text == ""{
            
            
            let controller = UIAlertController(title: "Password", message: "Password field is empty", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            
            controller.addAction(action)
            self.present(controller, animated: true, completion: nil)
            
        }else if self.mobile.text == ""{
            
            
            let controller = UIAlertController(title: "Mobile", message: "Mobile number is empty", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            
            controller.addAction(action)
            self.present(controller, animated: true, completion: nil)
            
            
        }else if self.myimageview.image == nil{
            
            
            
            let controller = UIAlertController(title: "Image Error", message: "Please select image", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            
            controller.addAction(action)
            self.present(controller, animated: true, completion: nil)
            
            
            
            
            
        }
        
        print("all fields are field")
    
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
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            
            
            self.imageviewcontroller.delegate = self
            self.imageviewcontroller.allowsEditing = true
            self.imageviewcontroller.sourceType = .photoLibrary
            self.present(self.imageviewcontroller, animated: true, completion: nil)
            
            }
            }
           
    
        let camera = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default) { (action ) in
     
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
                
            self.imageviewcontroller.delegate = self
            self.imageviewcontroller.allowsEditing = true
            self.imageviewcontroller.sourceType = .camera
            self.present(self.imageviewcontroller, animated: true, completion: nil)
            }
        
                else {
                
                print("source not available")
                let a = UIAlertController(title: "Camera", message: "Camera Not Working", preferredStyle: UIAlertControllerStyle.alert)
                let d = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
               
                
                a.addAction(d)
                
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
        
        let scroll:CGPoint = CGPoint(x: 0, y: textField.frame.origin.y - 110)
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



extension RegistrationViewController{
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        myimageview.image = chosenImage
        myimageview.contentMode = .scaleAspectFill
        
        self.mycoverbutton.imageView?.isHidden = true
        
        mysmallimageview.image = chosenImage
        mysmallimageview.contentMode = .scaleAspectFill
        
        mysmallimageview.layer.cornerRadius = 25
        mysmallimageview.clipsToBounds = true
        mysmallimageview.layer.masksToBounds = true
        mysmallimageview.layer.borderWidth = 0.90
        mysmallimageview.layer.borderColor = UIColor.white.cgColor
        
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.mycoverbutton.imageView?.isHidden = true

        
        dismiss(animated: true, completion: nil)
    }

    
}



extension NSMutableData {
    
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}




