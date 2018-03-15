//
//  Roulette.swift
//  SILab1
//
//  Created by Jakub Nadolny on 02.03.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

class Roulette{
    
    var chambers = [RouleteChamber]()
    var probabilityArray = [RouleteChamber]()
    
    func append(_ element:RouleteChamber){
        chambers.append(element)
        let repeats = repeatElement(element, count: element.weight)
        probabilityArray.append(contentsOf: repeats)
    }
    
    func countTotalSize() -> Int{
        return probabilityArray.count
    }
    
    func getRandomChromosome() -> Chromosome{
        let random = Int(arc4random_uniform(UInt32(countTotalSize())))
        return probabilityArray[random].chromosome
    }
}

