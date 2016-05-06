//
//  DynamicUITableViewController.swift
//  QBabble
//
//  Created by Keith Black on 3/16/16.
//

import UIKit

class DynamicUITableViewController: UITableViewController  {

    // MARK: Init functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: Override methods that allow hiding rows/sections
    
    // To control which sections/rows in your static TableViewController are hidden 
    // you will need override one or both of these methods in your subclass.
    // NOTE: If you are hiding an entire section you do not have to implement shouldHideRow(),
    // it only needs to be implemented if you wish to hide specific rows within a section
    // without hiding the entire section.
    func shouldHideSection(section: Int) -> Bool {
        return false
    }

    func shouldHideRow(section: Int, row: Int) -> Bool {
        return false
    }
    // ----------------------------------------------------------
    
    
    // MARK: Overrides that hide or show sections and rows.
    
    //  These methods do the hiding based on the return value of
    //  shouldHideSection() and shouldHideRow() above.
    //  You don't need to override these methods in your code unless you
    //  wish to do additional special handling with row/section height.
    
    // Hide section headers
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return shouldHideSection(section) ? 0.01 : super.tableView(tableView, heightForHeaderInSection: section)
    }
    
    // Hide section footers
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return shouldHideSection(section) ? 0.01 : super.tableView(tableView, heightForFooterInSection: section)
    }
    
    // Hide rows
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if shouldHideSection(indexPath.section) {
            return 0
        }
        if shouldHideRow(indexPath.section, row: indexPath.row) {
            return 0
        }
        return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    // Hide header text by making it clear.
    // This seems unnecessary since the header will be hidden, however, if you don't do this 
    // then pull the list down to reviel the space just above the top of the first section
    // you wil see all the header text drawn over top of itself. (xCode 7.3 & iOS 9.x)
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if shouldHideSection(section) {
            let headerView = view as! UITableViewHeaderFooterView
            headerView.textLabel!.textColor = UIColor.clearColor()
        } else {
            let headerView = view as! UITableViewHeaderFooterView
            headerView.textLabel!.textColor = UIColor.darkGrayColor()
        }
    }
    
    // Hide footer text by making clear
    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if shouldHideSection(section) {
            let footerView = view as! UITableViewHeaderFooterView
            footerView.textLabel!.textColor = UIColor.clearColor()
        } else {
            let headerView = view as! UITableViewHeaderFooterView
            headerView.textLabel!.textColor = UIColor.darkGrayColor()
        }
    }
}
