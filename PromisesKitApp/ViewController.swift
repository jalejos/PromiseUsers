//
//  ViewController.swift
//  PromisesKitApp
//
//  Created by Alejos on 4/24/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserService.getUsers().then { users in
            self.assign(users: users)
        }.recover { _ in
            self.recover()
        }.catch { error in
            print(error)
        }
    }
    
    func assign(users: [User]) {
        self.users = users
        self.tableView.reloadData()
    }
    
    func recover() {
        UserService.getUsersSecure().then { users in
            self.assign(users: users)
        }.catch { error in
            print(error)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserTableViewCell
        cell.configure(user: users[indexPath.row])
        return cell
    }
}
