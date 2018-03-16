//
//  CalculationData.swift
//  SILab1
//
//  Created by Jakub Nadolny on 24.02.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

class CalculationData{
    let n:Int
    let flowMatrix:[[Int]]
    let distanceMatrix:[[Int]]
    
    init(n:Int, flowMatrix:[[Int]], distanceMatrix:[[Int]]){
        self.n = n
        self.flowMatrix = flowMatrix
        self.distanceMatrix = distanceMatrix
    }
    deinit {
    }
}
