//
//  SearchFooter.swift
//  UISearchController
//
//  Created by Alexey Efimov on 19/12/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class SearchFooter: UIView {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    override func draw(_ rect: CGRect) {
        label.frame = bounds
    }
    
    private func configureView() {
        backgroundColor = .gray
        alpha = 0
        
        label.textAlignment = .center
        label.textColor = .white
        addSubview(label)
    }
    
    private func hideFooter() {
        self.alpha = 0
    }
    
    private func showFooter() {
        self.alpha = 1
    }
}

extension SearchFooter {
    
    func setNotFiltering() {
        label.text = ""
        hideFooter()
    }
    
    func setIsFilteringToShow(filteredItemCount: Int, of totalItemCount: Int) {
        switch filteredItemCount {
        case totalItemCount: setNotFiltering()
        case 0:
            label.text = "No item match your query"
            showFooter()
        default:
            label.text = "Filtering \(filteredItemCount) of \(totalItemCount)"
            showFooter()
        }
    }
}
