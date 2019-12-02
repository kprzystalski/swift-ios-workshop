//
//  PostsController.swift
//  jsoncoredata
//
//  Created by kprzystalski on 18/11/2019.
//  Copyright © 2019 kprzystalski. All rights reserved.
//

import UIKit

class PostsController: UITableViewController {
    
    var posts: [String] = ViewController.posts
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.posts[indexPath.row]
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}
