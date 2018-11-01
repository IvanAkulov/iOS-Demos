//
//  ExpandableHeaderView.swift
//  CollapsibleSections
//
//  Created by Alexey Efimov on 29/10/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

protocol ExpandableHeaderViewDelegate: class {
    func toggleSection(header: ExpandableHeaderView, section: Int)
}

class ExpandableHeaderView: UITableViewHeaderFooterView {

    weak var delegate: ExpandableHeaderViewDelegate?
    var section: Int?
    
    func setup(withTitle title: String, section: Int, delegate: ExpandableHeaderViewDelegate) {
        
        self.delegate = delegate
        self.section = section
        self.textLabel?.text = title
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        textLabel?.textColor = .white
        contentView.backgroundColor = .darkGray
    }

    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectHeaderAction(gesterRecognizer: UITapGestureRecognizer) {
        let cell = gesterRecognizer.view as! ExpandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section!)
    }
}
