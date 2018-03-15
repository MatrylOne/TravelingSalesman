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
        for i in 0..<GeneticParameters.algorythmRuns{
            
            var bestSum = 0
            var worstSum = 0
            var avgSum = 0
            var counter = 0
            
            for j in 0..<GeneticParameters.generations{
                worstSum += runs[i].data[j].worst
                avgSum += runs[i].data[j].average
                bestSum += runs[i].data[j].best
                counter += 1
            }
            print(i)
            avg.append(row: AnalyseData(
                worst: worstSum/counter,
                average: avgSum/counter,
                best: bestSum/counter)
            )
        }
        
        return avg
    }
}
