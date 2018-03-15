//
//  TourFactory.swift
//  TravelingSalesman
//
//  Created by Jakub Nadolny on 15.03.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

class TourFactory: FactoryProtocol {
    
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
    
    func selectPairs() -> [(Chromosome, Chromosome)] {
        var pairs =  [(Chromosome, Chromosome)]()
        
        for _ in 0..<GeneticParameters.population{
            pairs.append((tour(), tour()))
        }
        
        return pairs
    }
    
    func tour()->Chromosome{
        let populationSize = population.count
        var tourArea = [Chromosome]()
        tourArea.reserveCapacity(GeneticParameters.tourSize)
        
        for _ in 0..<GeneticParameters.tourSize{
            let selectorIndex = Int(arc4random_uniform(UInt32(populationSize)))
            tourArea.append(population[selectorIndex])
        }
        
        return tourArea.min{ a, b in a.cost < b.cost }!
    }
    
}
