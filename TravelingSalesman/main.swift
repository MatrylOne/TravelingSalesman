//
//  main.swift
//  SILab1
//
//  Created by Jakub Nadolny on 23.02.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

MatrixFacade.calculationData = try MatrixImporter.load(from: "had20.dat")

var tour = RandomFactory()
let tourStartTime = DispatchTime.now().uptimeNanoseconds
for _ in 0...GeneticParameters.iterations{
    tour.newGeneration()
    print(tour.best.cost)
}
print(tour.best.cost)
print(tour.best.data)

//let roulette = ChromosomeManager()
//for _ in 0...GeneticParameters.iterations{
//    roulette.generateNewGenerationRoulette()
//    print(roulette.best.cost)
//}
//print(roulette.best.cost)



