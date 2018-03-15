//
//  AlgorythmAnalyser.swift
//  TravelingSalesman
//
//  Created by Jakub Nadolny on 15.03.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation


class AlgorythmAnalyser{
    var runs = [GenerationAnalyse]()
    
    func append(row:GenerationAnalyse){
        runs.append(row)
    }
    
    func getAverage() -> GenerationAnalyse{
        let avg = GenerationAnalyse()
        for i in 0..<GeneticParameters.generations{
            
            var bestSum = 0
            var worstSum = 0
            var avgSum = 0
            var counter = 0
            
            for j in 0..<GeneticParameters.algorythmRuns{
                worstSum += runs[j].data[i].worst
                avgSum += runs[j].data[i].average
                bestSum += runs[j].data[i].best
                counter += 1
            }
            avg.append(row: AnalyseData(
                worst: worstSum/counter,
                average: avgSum/counter,
                best: bestSum/counter)
            )
        }
        
        return avg
    }
}
