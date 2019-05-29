//
//  TimerViewController.swift
//  SleepTimer2
//
//  Created by Mark on 5/8/19.
//  Copyright © 2019 Mark. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    var timer : Timer?
    var isPlaying = false
    var counter  = 0
    var seconds = 0
    var times = [Time]()
    
    
    ///https://www.ioscreator.com/tutorials/stopwatch-tutorial
    @IBOutlet weak var clock: UILabel!
    
    @IBAction func Stop(_ sender: Any) {
        timer?.invalidate()
        isPlaying = false
        let sleepTime = [clock.text]
        var stime = Time.loadFromFile()
        if let newTime = clock.text{
            stime?.append(Time(time: newTime))
        }
        print(sleepTime)
    }
    
    @IBAction func Start(_ sender: Any) {
        if(isPlaying){
            
            return
            
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
        
    }
    
    @objc func updateTimer() {
        
        seconds += 1
        clock.text = timeString(time: TimeInterval(seconds))


    }
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clock.text = String(counter)
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SleepSegue"{
            let viewController = segue.destination as! Sleep11TableViewController
            let sleepTime = clock.text!
            let newTime = Time(time: "\(sleepTime)")
  
            viewController.t = newTime
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
