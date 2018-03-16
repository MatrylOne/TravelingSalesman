//
//  main.swift
//  SILab1
//
//  Created by Jakub Nadolny on 23.02.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//

import Foundation

func sixth() throws{
    let folder = "wykresy/versus/"
    let version = 1
    
    MatrixFacade.calculationData = try MatrixImporter.load(from: "had20.dat")
    GeneticParameters.zad6()
    
    print("######        Tour     ######")
    var population:FactoryProtocol = TourFactory()
    var analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    var data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)tour.csv", text: data)
    
    print("######        Roulette       ######")
    population = RouletteFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)roulette.csv", text: data)
    
}

func fifth() throws {
    let folder = "wykresy/gen/"
    let version = 1
    
    MatrixFacade.calculationData = try MatrixImporter.load(from: "had16.dat")
    GeneticParameters.zad4()
    
    print("######        gen = 5     ######")
    var population = TourFactory()
    var analyser = AlgorythmAnalyser(population: population)
    
    GeneticParameters.generations = 5
    analyser.runAlgorythm()
    var data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)5.csv", text: data)
    
    print("######        gen = 20       ######")
    GeneticParameters.generations = 20
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)20.csv", text: data)
    
    print("######        gen = 50       ######")
    GeneticParameters.generations = 50
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)50.csv", text: data)
    
    print("######        gen = 100       ######")
    GeneticParameters.generations = 100
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)100.csv", text: data)
    
    print("######        gen = 200       ######")
    GeneticParameters.generations = 200
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)200.csv", text: data)
    
}

func fourth() throws{
    let folder = "wykresy/pop/"
    let version = 1
    
    MatrixFacade.calculationData = try MatrixImporter.load(from: "had16.dat")
    GeneticParameters.zad4()
    
    print("######        pop = 50     ######")
    var population = TourFactory()
    var analyser = AlgorythmAnalyser(population: population)
    
    GeneticParameters.population = 10
    GeneticParameters.tourSize = 2
    analyser.runAlgorythm()
    var data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)10.csv", text: data)
    
    print("######        x = 100       ######")
    GeneticParameters.population = 50
    GeneticParameters.tourSize = 12
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)50.csv", text: data)
    
    print("######        x = 100       ######")
    GeneticParameters.population = 100
    GeneticParameters.tourSize = 25
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)100.csv", text: data)
    
    print("######        x = 200       ######")
    GeneticParameters.population = 200
    GeneticParameters.tourSize = 50
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)200.csv", text: data)
}

func third() throws {
    
    let folder = "wykresy/CrossOver/"
    let version = 2
    
    MatrixFacade.calculationData = try MatrixImporter.load(from: "had20.dat")
    GeneticParameters.zad3()
    
    print("######        x = 0.0       ######")
    var population = TourFactory()
    var analyser = AlgorythmAnalyser(population: population)
    
    GeneticParameters.crossIndex = 0.0
    analyser.runAlgorythm()
    var data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)cross000.csv", text: data)
    
    print("######        x = 0.25       ######")
    GeneticParameters.crossIndex = 0.25
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)cross025.csv", text: data)
    
    print("######        x = 0.5       ######")
    GeneticParameters.crossIndex = 0.5
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)cross050.csv", text: data)
    
    print("######        x = 0.75       ######")
    GeneticParameters.crossIndex = 0.75
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)cross075.csv", text: data)
    
    print("######        x = 1.0       ######")
    GeneticParameters.crossIndex = 1.0
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    data = analyser.print()
    MatrixImporter.save(file: "\(folder)\(version)cross100.csv", text: data)
}





func second() throws {
    MatrixFacade.calculationData = try MatrixImporter.load(from: "had20.dat")
    GeneticParameters.zad2()
    
    print("######        mutation = 0%       ######")
    GeneticParameters.mutation = 0
    var population = TourFactory()
    var analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    print(analyser.print())
    
    
    print("######        mutation = 10%       ######")
    GeneticParameters.mutation = 10
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    print(analyser.print())
    
    print("######        mutation = 30%       ######")
    GeneticParameters.mutation = 30
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    print(analyser.print())
    
    print("######        mutation = 50%       ######")
    GeneticParameters.mutation = 50
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    print(analyser.print())
    
    print("######        mutation = 80%       ######")
    GeneticParameters.mutation = 80
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    print(analyser.print())
    
    
    print("######        mutation = 100%       ######")
    GeneticParameters.mutation = 100
    population = TourFactory()
    analyser = AlgorythmAnalyser(population: population)
    
    analyser.runAlgorythm()
    print(analyser.print())
}




////////////////////////////////////////////////////////////////////////////////////
//// wykonane przykłady
func first() throws {
    GeneticParameters.zad1()
    MatrixFacade.calculationData = try MatrixImporter.load(from: "had14.dat")
    
    var tourPopulation = TourFactory()
    var tourAnalyser = AlgorythmAnalyser(population: tourPopulation)
    
    tourAnalyser.runAlgorythm()
    
    print(tourAnalyser.getAverage().getCSV())
    
    print("#######################")
    print("#######################")
    
    MatrixFacade.calculationData = try MatrixImporter.load(from: "had16.dat")
    
    tourPopulation = TourFactory()
    tourAnalyser = AlgorythmAnalyser(population: tourPopulation)
    //
    for _ in 0..<GeneticParameters.algorythmRuns{
        let geneticAnalyzer = GenerationAnalyse()
        for _ in 0..<GeneticParameters.generations{
            //print("populacja numer : \(i)")
            tourPopulation.newGeneration()
            geneticAnalyzer.append(row: tourPopulation.analyse())
        }
        tourAnalyser.append(row: geneticAnalyzer)
    }
    
    print(tourAnalyser.getAverage().getCSV())
    
    print("#######################")
    print("#######################")
    
    MatrixFacade.calculationData = try MatrixImporter.load(from: "had18.dat")
    
    tourPopulation = TourFactory()
    tourAnalyser = AlgorythmAnalyser(population: tourPopulation)
    //
    for _ in 0..<GeneticParameters.algorythmRuns{
        let geneticAnalyzer = GenerationAnalyse()
        for _ in 0..<GeneticParameters.generations{
            //print("populacja numer : \(i)")
            tourPopulation.newGeneration()
            geneticAnalyzer.append(row: tourPopulation.analyse())
        }
        tourAnalyser.append(row: geneticAnalyzer)
    }
    
    print(tourAnalyser.getAverage().getCSV())
    
    print("#######################")
    print("#######################")
    
    MatrixFacade.calculationData = try MatrixImporter.load(from: "had20.dat")
    
    tourPopulation = TourFactory()
    tourAnalyser = AlgorythmAnalyser(population: tourPopulation)
    //
    for _ in 0..<GeneticParameters.algorythmRuns{
        let geneticAnalyzer = GenerationAnalyse()
        for _ in 0..<GeneticParameters.generations{
            //print("populacja numer : \(i)")
            tourPopulation.newGeneration()
            geneticAnalyzer.append(row: tourPopulation.analyse())
        }
        tourAnalyser.append(row: geneticAnalyzer)
    }
    
    print(tourAnalyser.getAverage().getCSV())
    
    print("#######################")
    print("#######################")
    
    MatrixFacade.calculationData = try MatrixImporter.load(from: "had12.dat")
    
    tourPopulation = TourFactory()
    tourAnalyser = AlgorythmAnalyser(population: tourPopulation)
    //
    for _ in 0..<GeneticParameters.algorythmRuns{
        let geneticAnalyzer = GenerationAnalyse()
        for _ in 0..<GeneticParameters.generations{
            //print("populacja numer : \(i)")
            tourPopulation.newGeneration()
            geneticAnalyzer.append(row: tourPopulation.analyse())
        }
        tourAnalyser.append(row: geneticAnalyzer)
    }
    
    print(tourAnalyser.getAverage().getCSV())
}


/// Uruchamianie

try sixth()


////////////////////

