//
//  MatrixImporter.swift
//  SILab1
//
//  Created by Jakub Nadolny on 24.02.2018.
//  Copyright © 2018 Jakub Nadolny. All rights reserved.
//
import Foundation

class MatrixImporter{
    class func load(from filename:String) throws -> CalculationData{
        
        // Zmienne do zwrócenia
        var n:Int?
        var distanceMatrix:[[Int]]?
        var flowMatrix:[[Int]]?
        
        let url = try! FileManager.default.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(filename)
        var file:String?
        
        do{
            file = try String(contentsOf: url, encoding: .utf8)
        }catch{
            throw FileError.RuntimeError("Nie udało się otworzyć pliku.")
        }
        
        // Jeżeli plik się udało otworzyć
        if let data = file {
            let converted = data.components(separatedBy: .newlines).map{$0.trimmingCharacters(in: .whitespaces)}
            n = Int(converted.first!)
            
            // Jeżeli struktura pliku jest dobra
            if let n = n{
                flowMatrix = converted[2..<n+2]
                    // Dzielenie każdej linii na poszczególne stringi po znaku spacji
                    .map{$0.components(separatedBy: .whitespaces)
                        // Usuwanie pustych wierszy (niektóre wiersze mają jedną spację a inne dwie)
                        .filter{$0 != ""}
                        // Konwertowanie Stringów na Int'y
                        .map{($0 as NSString).integerValue}}
                
                distanceMatrix = converted[n+3..<2*n+3]
                    // Dzielenie każdej linii na poszczególne stringi po znaku spacji
                    .map{$0.components(separatedBy: .whitespaces)
                        // Usuwanie pustych wierszy (niektóre wiersze mają jedną spację a inne dwie)
                        .filter{$0 != ""}
                        // Konwertowanie Stringów na Int'y
                        .map{($0 as NSString).integerValue}}
            }else{
                throw FileError.RuntimeError("Otwarty plik ma błędną strukturę.")
            }
        }
        
        if let n = n, let distanceMatrix = distanceMatrix, let flowMatrix = flowMatrix{
            return CalculationData(n: n, flowMatrix: flowMatrix, distanceMatrix: distanceMatrix)
        }else{
            throw FileError.RuntimeError("Nie udało się stworzyć struktury danych.")
        }
    }
    
    class func save(file:String, text:String){
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            //writing
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    }
}
