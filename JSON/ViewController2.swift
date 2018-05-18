//
//  ViewController2.swift
//  JSON
//
//  Created by Umbrella Systems on 07/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
//import SRWebClient
class ViewController2: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uploadImage()
    
    }
    
    @IBAction func uploadButtonTapped(sender: AnyObject) {
        
        print("upload")
       uploadImage()
        
          }
    
    @IBAction func selectPhotoButtonTapped(sender: AnyObject) {
        
        print("select")
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
         myPickerController.allowsEditing = true
        myPickerController.sourceType = .photoLibrary
       
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
        
    {
        myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        myImageView.contentMode = .scaleAspectFill
        self.dismiss(animated: true, completion: nil)
        
    }
    func uploadImage()
    {
        
       
    }
}


    
    

