//
//  Time.swift
//  SleepTimer2
//
//  Created by Mark on 5/13/19.
//  Copyright © 2019 Mark. All rights reserved.
//

import Foundation
struct Time: Codable{
    var time: String
    static func loadTime() ->[Time]{
        let stime = [Time(time: "00:00:00")]
        return stime
    }
    static func saveToFile(stime: [Time]){
        // this is to save the time to the phone
        let propertyListEncoder = PropertyListEncoder()
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("SleepTime").appendingPathExtension("plist")
        let encodeNotes = try? propertyListEncoder.encode(stime)
        try?encodeNotes?.write(to: archiveURL, options: .noFileProtection)
    }
    static func loadFromFile() -> [Time]?{
        // this is to load the time to the phone
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("SleepTime").appendingPathExtension("plist")
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedNotesData = try? Data(contentsOf: archiveURL), let decodedNotes = try?
            propertyListDecoder.decode(Array<Time>.self, from: retrievedNotesData){
            print(decodedNotes)
            return decodedNotes
        }else{
            return nil
        }
    }
}
