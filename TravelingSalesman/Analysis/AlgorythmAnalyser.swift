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
    var population:FactoryProtocol
    
    init(population:FactoryProtocol){
        self.population = population
    }
    
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
    
    func runAlgorythm(){
        for _ in 0..<GeneticParameters.algorythmRuns{
            let geneticAnalyzer = GenerationAnalyse()
            for _ in 0..<GeneticParameters.generations{
                //print("populacja numer : \(i)")
                population.newGeneration()
                geneticAnalyzer.append(row: population.analyse())
            }
            append(row: geneticAnalyzer)
        }
    }
    
    func print() -> String{
        return getAverage().getCSV()
    }
}
