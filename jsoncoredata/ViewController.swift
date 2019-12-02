//
//  ViewController.swift
//  jsoncoredata
//
//  Created by kprzystalski on 18/11/2019.
//  Copyright © 2019 kprzystalski. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let serverUrl: String = "https://my-json-server.typicode.com/typicode/demo/posts"
    
    var appDelegate: AppDelegate? = nil
    var managedContext: NSManagedObjectContext? = nil
    var postEntity: NSEntityDescription? = nil
    
    static var posts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.managedContext = self.appDelegate?.persistentContainer.viewContext
        self.postEntity = NSEntityDescription.entity(forEntityName: "Posts", in: self.managedContext!)
        
        parseLoadJson()
    }

    func parseLoadJson() {
        let url = URL(string: serverUrl)
        let request = URLRequest(url: url!)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard error == nil else {
                print("Nie działa")
                return
            }
            print(response)
            
            guard data != nil else {
                print("Ni ma danych")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let object = json as? [String:Any] {
                    print(object)
                } else if let object = json as? [Any] {
                    for element in object as! [Dictionary<String,AnyObject>] {
                        let title = element["title"] as! String
                        let id = element["id"] as! Int
                        
                        let post = NSManagedObject(entity: self.postEntity!, insertInto: self.managedContext)
                        post.setValue(title, forKey: "title")
                        post.setValue(id, forKey: "external_id")
                        print("Added \(title) with id: \(id)")
                        ViewController.posts.append(title)
                    }
                    try self.managedContext?.save()
                } else {
                    print("JSON jest wadliwy")
                }
            } catch {
                print("to nie jest JSON albo nie możemy zserializować JSONa")
            }
            
        })
        task.resume()
    }
    

}

