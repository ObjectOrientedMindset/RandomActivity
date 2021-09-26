//
//  ActivityData.swift
//  Activity
//
//  Created by Mithat Uçar on 22.09.2021.
//

import Foundation


struct Data : Codable {
    var activity:String = ""
    var accessibility:Double = 0
    var type:String = ""
    var participants:Int = 0
    var price:Double = 0
    var link:String = ""
    var key:String = ""
}
