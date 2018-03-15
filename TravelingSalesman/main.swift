//
//  main.swift
//  SILab1
//
//  Created by Jakub Nadolny on 23.02.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

MatrixFacade.calculationData = try MatrixImporter.load(from: "had12.dat")

var tour = TourFactory()

let generationData = GenerationAnalyse()
for _ in 0..<GeneticParameters.generations{
    tour.newGeneration()
    generationData.append(row : tour.analyse())
}

var i = 0
print("generacja, najgorszy, sredni, najlepszy")
for element in generationData.data{
    print("\(i), \(element.getCSV())")
    i += 1
}



