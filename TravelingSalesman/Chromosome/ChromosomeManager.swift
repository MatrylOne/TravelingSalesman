//
//  ChromosomeBuilder.swift
//  SILab1
//
//  Created by Jakub Nadolny on 24.02.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

class ChromosomeManager {

    var population = [Chromosome]()
    lazy var best:Chromosome = getBest()
    
    init(){
        generatePopulation()
    }
    
    func generatePopulation(){
        if (MatrixFacade.calculationData != nil){
            population.removeAll()
            for _ in 0..<GeneticParameters.population{
                self.population.append(Chromosome())
            }
            best = getBest()
        }
    }
    
    func generateNewGenerationRoulette(){
        var sortedPopulation = rouletteChromosome()
        var newPopulation = [Chromosome]()
        
        for i in 0..<sortedPopulation.count{
            let (leftParent, rightParent) = sortedPopulation[i]
            let (leftChild, rightChild) = mixChromosomes(from: leftParent, and: rightParent)
            newPopulation.append(leftChild)
            newPopulation.append(rightChild)
        }
        population = newPopulation
        let _ = population.dropLast()
        population.append(best)
        best = getBest()
    }
    
    func generateNewGenerationTour(){
        let n = GeneticParameters.population
        var newPopulation = [Chromosome]()
        for _ in 0..<n{
            let mother = tour()
            let father = tour()
            let children = mixChromosomes(from: mother, and: father)
            newPopulation.append(children.0)
            newPopulation.append(children.1)
        }
        population = newPopulation
        let _ = population.dropLast()
        population.append(best)
        best = getBest()
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
    
    func mixChromosomes(from leftParent:Chromosome, and rightParent:Chromosome) -> (Chromosome, Chromosome){
        let n = MatrixFacade.calculationData!.n
        let division = Int(arc4random_uniform(UInt32(n - 1))) + 1
        let leftChildData = Array(leftParent.data[..<division] + rightParent.data[division...])
        let rightChildData = Array(leftParent.data[division...] + rightParent.data[..<division])
        let leftChild = Chromosome(fromData: leftChildData)
        let rightChild = Chromosome(fromData: rightChildData)
        
        leftChild.prepareAfterMix()
        rightChild.prepareAfterMix()
        
        return (leftChild, rightChild)
    }
    
    // Funkcje obliczeniowe //
    
    func countTotalCost()->Int{
        return self.population.map{$0.cost}.reduce(0, +)
    }
    
    func getBest() -> Chromosome{
        var minIndex = 0
        var minScore = population[0].cost
        for i in 0..<population.count{
            if population[i].cost < minScore{
                minScore = population[i].cost
                minIndex = i
            }
        }
        return population[minIndex]
    }
    
    func rouletteChromosome() -> [(Chromosome, Chromosome)]{
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
