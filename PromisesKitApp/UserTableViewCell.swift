//
//  UserTableViewCell.swift
//  PromisesKitApp
//
//  Created by Alejos on 4/26/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    func configure(user: User) {
        nameLabel.text = user.name
        usernameLabel.text = user.username
        emailLabel.text = user.email
        phoneLabel.text = user.phone
        websiteLabel.text = user.website
    }
}
