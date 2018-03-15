//
//  main.swift
//  SILab1
//
//  Created by Jakub Nadolny on 23.02.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

MatrixFacade.calculationData = try MatrixImporter.load(from: "had18.dat")

let runAnalyzer = AlgorythmAnalyser()
var population = TourFactory()

for _ in 0..<GeneticParameters.algorythmRuns{
    let geneticAnalyzer = GenerationAnalyse()
    for i in 0..<GeneticParameters.generations{
        print("populacja numer : \(i)")
        population.newGeneration()
        geneticAnalyzer.append(row: population.analyse())
    }
    runAnalyzer.append(row: geneticAnalyzer)
}

print(runAnalyzer.getAverage().getCSV())
