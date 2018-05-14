//
//  CameraVCViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 07/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit

class CameraVCViewController: UIViewController,UICollectionViewDataSource {

    @IBOutlet var myview: UIView!
    @IBOutlet weak var collection: UICollectionView!
   var imagestr = ["1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg","1.jpg"]
    override func viewDidLoad() {
   
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagestr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! CollectionViewCell
        cell.myimageview.image = UIImage(named: imagestr[indexPath.row])
        
        
        return cell
        
        
    }
    
}

