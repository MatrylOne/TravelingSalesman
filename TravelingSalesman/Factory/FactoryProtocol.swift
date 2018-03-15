//
//  FactoryProtocol.swift
//  TravelingSalesman
//
//  Created by Jakub Nadolny on 15.03.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

protocol FactoryProtocol{
    
    var population:[Chromosome] {get set}
    
    var best:Chromosome {get set}
    
    func setup()
    
    mutating func newGeneration()
    
    func selectPairs() -> [(Chromosome, Chromosome)]
    
    func mixChromosomes(from leftParent:Chromosome, and rightParent:Chromosome) -> (Chromosome, Chromosome)
    
    func countTotalCost()->Int
    
    func getBest() -> Chromosome
}

extension  FactoryProtocol{
    
    mutating func newGeneration() {
        var sortedPopulation = selectPairs()
        var newPopulation = [Chromosome]()
        
        for i in 0..<sortedPopulation.count{
            let (leftParent, rightParent) = sortedPopulation[i]
            let (leftChild, rightChild) = mixChromosomes(from: leftParent, and: rightParent)
            newPopulation.append(leftChild)
            newPopulation.append(rightChild)
        }
        population = newPopulation
        let _ = population.removeLast()
        population.append(best)
        best = getBest()
    }
    
    func mixChromosomes(from leftParent: Chromosome, and rightParent: Chromosome) -> (Chromosome, Chromosome) {
        let n = MatrixFacade.calculationData!.n
        //let division = Int(arc4random_uniform(UInt32(n - 1))) + 1
        let division = Int(GeneticParameters.crossIndex * Double(n))
        let leftChildData = Array(leftParent.data[..<division] + rightParent.data[division...])
        let rightChildData = Array(leftParent.data[division...] + rightParent.data[..<division])
        let leftChild = Chromosome(fromData: leftChildData)
        let rightChild = Chromosome(fromData: rightChildData)
        
        leftChild.prepareAfterMix()
        rightChild.prepareAfterMix()
        
        return (leftChild, rightChild)
    }
    
    func countTotalCost() -> Int {
        return self.population.map{$0.cost}.reduce(0, +)
    }
    
    func getBest() -> Chromosome {
        var minIndex = 0
        var minScore = population[0].cost
        for i in 0..<GeneticParameters.population{
            if population[i].cost < minScore{
                minScore = population[i].cost
                minIndex = i
            }
        }
        return population[minIndex]
    }
    
    func analyse() -> AnalyseData{
        var costSum = 0
        var minScore = population[0].cost
        var maxScore = population[0].cost
        
//        var minIndex = 0
//        var maxIndex = 0
        
        for i in 0..<GeneticParameters.population{
            if population[i].cost < minScore{
                minScore = population[i].cost
//                minIndex = i
            }
            
            if population[i].cost > maxScore{
                maxScore = population[i].cost
//                maxIndex = i
            }
            costSum += population[i].cost
        }
        return AnalyseData(worst: maxScore, average: costSum/GeneticParameters.population, best: minScore)
    }
}
