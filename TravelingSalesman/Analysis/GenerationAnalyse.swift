//
//  RunAnalyser.swift
//  TravelingSalesman
//
//  Created by Jakub Nadolny on 15.03.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

class GenerationAnalyse{
    var data = [AnalyseData]()
    
    func append(row:AnalyseData){
        data.append(row)
    }
    
    func append(min:Int, avg:Int, max:Int){
        let row = AnalyseData(worst: min, average: avg, best: max)
        data.append(row)
    }
}
