//
//  RandomFactory.swift
//  TravelingSalesman
//
//  Created by Jakub Nadolny on 15.03.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

class RandomFactory: FactoryProtocol {
    var population = [Chromosome]()
    lazy var best: Chromosome = getBest()
    
    init(){
        setup()
    }
    
    func setup() {
        if (MatrixFacade.calculationData != nil){
            population.removeAll()
            for _ in 0..<GeneticParameters.population{
                population.append(Chromosome())
            }
            best = getBest()
        }
    }
    
    func newGeneration() {
        setup()
    }
    
    func selectPairs() -> [(Chromosome, Chromosome)] {
        var pairs = [(Chromosome, Chromosome)]()
        return pairs
    }
    
    func getRandom() -> Chromosome{
        let index = Int(arc4random_uniform(UInt32(GeneticParameters.population)))
        return population[index]
    }
}
