//
//  TableViewController.swift
//  CollapsibleSections
//
//  Created by Alexey Efimov on 29/10/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, ExpandableHeaderViewDelegate {

    var sections = [
        Section(courseName: "UIKit",
                lessons: ["UIButton и UILable",
                          "UISegmentedControl",
                          "UISlider"],
                expanded: false),
        Section(courseName: "Networking",
                lessons: ["GET Requests",
                          "POST Request",
                          "JSONDecoder"],
                expanded: false),
        Section(courseName: "Notifications",
                lessons: ["Local notifications",
                          "Push-Notification",
                          "Sandbox"],
                expanded: false)
    ]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].lessons.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = sections[indexPath.section].lessons[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section].expanded {
            return 44
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.setup(withTitle: sections[section].courseName, section: section, delegate: self)
        return header
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        tableView.beginUpdates()
        for row in 0..<sections[section].lessons.count {
            tableView.reloadRows(at: [IndexPath(row: row, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }

}
