//
//  GeneticParameters.swift
//  TravelingSalesman
//
//  Created by Jakub Nadolny on 10.03.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

class GeneticParameters{
    static var population = 100
    static var generations = 100
    static var mutation = 20
    static var tourSize = 10
    static var rouleteMultiplier = 1000
    static var crossIndex = 0.5
    static var algorythmRuns = 10
    
    static func reset(){
        population = 100
        generations = 100
        mutation = 20
        tourSize = 10
        rouleteMultiplier = 1000
        crossIndex = 0.5
        algorythmRuns = 10
    }
    
    static func zad1(){
        population = 100
        generations = 100
        mutation = 20
        tourSize = 10
        rouleteMultiplier = 1000
        crossIndex = 0.5
        algorythmRuns = 10
    }
    
    static func zad2(){
        population = 200
        generations = 100
        mutation = 0
        tourSize = 10
        rouleteMultiplier = 1000
        crossIndex = 0.5
        algorythmRuns = 10
    }
    
    static func zad3(){
        population = 200
        generations = 100
        mutation = 30
        tourSize = 30
        rouleteMultiplier = 1000
        crossIndex = 0.5
        algorythmRuns = 10
    }
    
    static func zad4(){
        population = 200
        generations = 100
        mutation = 30
        tourSize = 30
        rouleteMultiplier = 1000
        crossIndex = 0.5
        algorythmRuns = 10
    }
    
    static func zad5(){
        population = 80
        generations = 100
        mutation = 30
        tourSize = 30
        rouleteMultiplier = 1000
        crossIndex = 0.5
        algorythmRuns = 10
    }
    
    static func zad6(){
        population = 100
        generations = 200
        mutation = 30
        tourSize = 30
        rouleteMultiplier = 1000
        crossIndex = 0.5
        algorythmRuns = 10
    }
}

/*
 Pierwsze wykresy
 Turywy
 Pop_size = 100
 Gen = 100
 Px = 0.5
 Pm = 0.2
 */
