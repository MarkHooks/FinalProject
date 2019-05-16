//
//  TimeCellTableViewCell.swift
//  SleepTimer2
//
//  Created by Mark on 5/16/19.
//  Copyright © 2019 Mark. All rights reserved.
//

import UIKit

class TimeCellTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update(with times: Time){
        nameLabel.text = times.time
    }

}
