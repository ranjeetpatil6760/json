//
//  CameraVCViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 07/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
class CameraVCViewController: UIViewController,UICollectionViewDataSource,UINavigationControllerDelegate,UICollectionViewDelegate,PinterestLayoutDelegate {

    
    var image = UIImage()
    var imagedata = Data()
    var urlstring = "http://kolhapurtourism.co.in/ClassifiedApp/registration.php"
    @IBOutlet var myview: UIView!
    @IBOutlet weak var collection: UICollectionView!
   var imagestr = ["1.jpg","2.jpg","3.jpg","4.jpg","4.png","5.jpg","6.jpg","7.jpg","8.jpg","1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg"]
    
    override func viewDidLoad() {
   
        super.viewDidLoad()
       
        login()
        
        collection.delegate = self
        collection.dataSource = self
        
        if let layout = collection.collectionViewLayout as? PinterestLayout{
     
            layout.delegate = self
            
        }
        
        // Do any additional setup after loading the view.
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         print(imagestr.count)
        return imagestr.count
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! CollectionViewCell
        cell.myimageview.image = UIImage(named: imagestr[indexPath.row])
        //cell.mylabel.text = self.imagestr[indexPath.row]
        cell.layer.cornerRadius = 15
        //cell.myimageview.contentMode = .scaleAspectFill
        return cell
        
        
    }
    
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat{
        
        
        let image = UIImage(named: "\(imagestr[indexPath.row]).jpg")
        
        if let height = image?.size.height {
            
            return height / 4
        }
        return 0.0
    }

    
    
    
    func login(){
        
           }
    
    
}
    


