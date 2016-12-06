//
//  ArticleTableViewCell.swift
//  TableCellAnimation
//
//  Created by Simon Ng on 18/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var postImageView:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
