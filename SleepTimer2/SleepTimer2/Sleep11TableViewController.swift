//
//  SleepTableTableViewController.swift
//  SleepTimer2
//
//  Created by Mark on 5/13/19.
//  Copyright © 2019 Mark. All rights reserved.
//

import UIKit

class Sleep11TableViewController: UITableViewController {
    var stime: [Time]!
    var t: Time?
    
    override func viewDidLoad() {
        //this saves the times to the table view controller
        super.viewDidLoad()
        stime = [Time]()
        if let tims = Time.loadFromFile(){
            stime = tims
            stime.append(t!)
        }else{
            stime.append(t!)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stime.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //this prints the times on the cells
        let cell = tableView.dequeueReusableCell(withIdentifier: "SleepCell", for: indexPath)
        let times = stime[indexPath.row]
        cell.textLabel?.text = times.time


        // Configure the cell...

        return cell
    }
    override func viewWillDisappear(_ animated: Bool) {
        Time.saveToFile(stime: stime)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // this makes it so you can delete previous times
        if editingStyle == .delete {
            stime.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        Time.saveToFile(stime: stime)
    }



    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedTime = stime.remove(at: fromIndexPath.row)
        stime.insert(movedTime, at: to.row)
        Time.saveToFile(stime: stime)
        tableView.reloadData()
    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
