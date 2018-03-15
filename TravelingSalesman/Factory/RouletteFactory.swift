//
//  RouletteFactory.swift
//  TravelingSalesman
//
//  Created by Jakub Nadolny on 15.03.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

class RouletteFactory: FactoryProtocol {
    
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
        let roulette = Roulette()
        
        for person in population{
            let score:Int = Int(2*Double(best.cost)/Double(person.cost))
            roulette.append(RouleteChamber(chromosome: person, weight: score))
        }
        
        var pairs =  [(Chromosome, Chromosome)]()
        
        for _ in 0..<roulette.chambers.count/2{
            pairs.append((roulette.getRandomChromosome(), roulette.getRandomChromosome()))
        }
        
        return pairs
    }
    
}
