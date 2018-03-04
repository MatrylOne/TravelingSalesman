//
//  main.swift
//  SILab1
//
//  Created by Jakub Nadolny on 23.02.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

MatrixFacade.calculationData = try MatrixImporter.load(from: "had12.dat")

let manager = ChromosomeManager(population: 500)
for _ in 0...1000{
    manager.generateNewGeneration()
    print(manager.best.cost)
}
print(manager.best.cost)
//let chromosome = Chromosome(fromData: [1,1,1,4,5,6,7,8,9,10,11,12])
//chromosome.prepareAfterMix()
//print(chromosome.data)


