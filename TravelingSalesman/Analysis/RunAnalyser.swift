//
//  RunAnalyser.swift
//  TravelingSalesman
//
//  Created by Jakub Nadolny on 15.03.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

class RunAnalyser{
    var analyseData = [AnalyseData]()
    
    func append(row:AnalyseData){
        analyseData.append(row)
    }
    
    func appen(min:Int, avg:Int, max:Int){
        let row = AnalyseData(worst: min, average: avg, best: max)
        analyseData.append(row)
    }
}
