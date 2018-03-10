//
//  Chromosome.swift
//  SILab1
//
//  Created by Jakub Nadolny on 24.02.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

class Chromosome{
    
    // Atrybuty klasy //
    var data:[Int]
    lazy var cost = fintessFunction()
    
    // Konstruktory //
    init(){
        data = Array(1...MatrixFacade.calculationData!.n)
        data.shuffle()
    }
    
    init(fromData data:[Int]){
        self.data = data
    }
    
    // Funkcje modyfikujące chromosom //
    func fix(){
        if let n = MatrixFacade.calculationData?.n {
            
            var repairData = Array(repeating: 0, count: n)
            for gen in data{
                repairData[gen - 1] = repairData[gen - 1] + 1
            }
            
            for gen in 1...n{
                if repairData[gen-1] > 1{
                    while repairData[gen-1] != 1{
                        var emptyIndex = -1
                        var index = 0
                        while index < n && emptyIndex < 0{
                            if repairData[index] == 0 {
                                emptyIndex = index
                            }
                            index += 1
                        }
                        
                        let emptyValue = emptyIndex+1
                        let fullIndex = data.index(of: gen)
                        data[fullIndex!] = emptyValue
                        repairData[gen - 1] = repairData[gen - 1] - 1
                        repairData[emptyValue - 1] = repairData[emptyValue - 1] + 1
                    }
                }
            }
        }
    }
    
    func prepareAfterMix(){
        fix()
        tryMutation()
    }
    
    // TODO mutacja na gen a nie chromosom
    func tryMutation(){
        if let n = MatrixFacade.calculationData?.n{
            for i in 0..<n{
                let randomNumber = Int(arc4random_uniform(100)) + 1
                if randomNumber <= GeneticParameters.mutation{
                    let firstIndex = i
                    var secondIndex = i
                    repeat{
                        secondIndex = Int(arc4random_uniform(UInt32(n)))
                    }while firstIndex == secondIndex
                    data.swapAt(firstIndex, secondIndex)
                }
            }
        }
        
        for i in 0..<data.count{
            let randomNumber = Int(arc4random_uniform(100)) + 1
            if randomNumber <= GeneticParameters.mutation{
                let n = UInt32(MatrixFacade.calculationData!.n)
                let firstIndex = i
                var secondIndex = Int(arc4random_uniform(n))
                while firstIndex == secondIndex{
                    secondIndex = Int(arc4random_uniform(n))
                }
                data.swapAt(firstIndex, secondIndex)
            }
        }
    }
    
    // Funkcje kalkulujące //
    func fintessFunction()->Int{
        var cost = 0
        let n = MatrixFacade.calculationData!.n
        for i in 0..<n{
            for j in 0..<n{
                cost += MatrixFacade.calculationData!.flowMatrix[i][j] * MatrixFacade.calculationData!.distanceMatrix[data[i] - 1][data[j] - 1]
            }
        }
        return cost
    }
    
}
