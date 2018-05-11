//
//  ViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 03/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
     let urlstring="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4a37bfd6329b4380aa8b764031dae81b"
    var articles = [AnyObject]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        
        Alamofire.request(urlstring).responseJSON
            { response in
           
                let result = response.result
                if let dict = result.value as? Dictionary<String,AnyObject> {
                    
                    let art = dict["articles"] as? [AnyObject]!
                    
                  self.articles = art!
                    self.tableview.reloadData()
                    
                }
               
            print(self.articles)
                
               
            
        }
       
        
    
        print("didload")
  
        
        
        self.tabBarController?.tabBar.barTintColor = UIColor.black
        self.tabBarController?.tabBar.tintColor = UIColor.yellow
    }
    
    
    override func awakeFromNib() {
    
        
        self.tabBarController?.tabBar.barTintColor = UIColor.black
        self.tabBarController?.tabBar.tintColor = UIColor.yellow
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell") as! TableViewCell
        
        let titles = self.articles[indexPath.row]["title"] as? String
        let desc = self.articles[indexPath.row]["description"] as? String

        let date = self.articles[indexPath.row]["publishedAt"] as? String

        let author = self.articles[indexPath.row]["author"] as? String

        let imgurl = self.articles[indexPath.row]["urlToImage"] as? String

        
        let data = NSData(contentsOf: URL(string: (imgurl)!)!)
        let image =  UIImage(data: data! as Data)
        
        if data == nil {
            print("error with incoming data")
        }else{
            
          print("not error")
            
        }
        
        
        
        cell.mytitle.text = titles
        cell.mydescription.text = desc
        cell.mydate.text = date
        cell.myauthor.text = author
        cell.myimageview.image = image
        
        cell.myimageview.layer.cornerRadius = 20
        cell.myimageview.clipsToBounds = true
        
        
        return cell
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        print("didappear")
        

    
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        

        cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -200, 0, 0)
        
        UIView.animate(withDuration: 0.30) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
}

