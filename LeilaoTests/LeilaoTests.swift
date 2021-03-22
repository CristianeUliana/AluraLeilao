//
//  LeilaoTests.swift
//  LeilaoTests
//
//  Created by Ândriu Coelho on 27/04/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class LeilaoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDeveReceberUmLance() {
        
        let leilao = Leilao(descricao: "Macbook Pro 15")
        XCTAssertEqual(0, leilao.lances?.count)
        
        let steveJobs = Usuario(nome: "Steve Jobs")
        leilao.propoe(lance: Lance(steveJobs, 2000.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
        
        
    }
    
    
    func testDeveReceberVariosLances() {
        let leilao = Leilao(descricao: "Macbook Pro 15")
        let steveJobs = Usuario(nome: "Steve Jobs")
        leilao.propoe(lance: Lance(steveJobs, 2000.0))
        let billGates = Usuario(nome: "Bill Gates")
        leilao.propoe(lance: Lance(billGates, 1700.0))
        
        XCTAssertEqual(2, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
        XCTAssertEqual(1700.0, leilao.lances?[1].valor)
    }
    
    
    func testDeveIgnorarDoisLancesSeguidosDoMesmoUsuario() {
        
        let leilao = Leilao(descricao: "Macbook Pro 15")
        let steveJobs = Usuario(nome: "Steve Jobs")
        leilao.propoe(lance: Lance(steveJobs, 2000.0))
        leilao.propoe(lance: Lance(steveJobs, 2300.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)

    }
    
    func testDeveIgnorarMaisDoQueCincoLancesDoMesmoUsuario() {
        let leilao = Leilao(descricao: "Macbook Pro 15")
        let steveJobs = Usuario(nome: "Steve Jobs")
        let billGates = Usuario(nome: "Bill Gates")
       
        leilao.propoe(lance: Lance(steveJobs, 1000.0))
        leilao.propoe(lance: Lance(billGates, 1700.0))
        
        leilao.propoe(lance: Lance(steveJobs, 2300.0))
        leilao.propoe(lance: Lance(billGates, 2800.0))
        
        leilao.propoe(lance: Lance(steveJobs, 3500.0))
        leilao.propoe(lance: Lance(billGates, 3900.0))
        
        leilao.propoe(lance: Lance(steveJobs, 4600.0))
        leilao.propoe(lance: Lance(billGates, 4700.0))
        
        leilao.propoe(lance: Lance(steveJobs, 4900.0))
        leilao.propoe(lance: Lance(billGates, 5000.0))
        
        // deve ignorar:
        leilao.propoe(lance: Lance(steveJobs, 6000.0))
        
        
        XCTAssertEqual(10, leilao.lances?.count)
        XCTAssertEqual(5000.0, leilao.lances?.last?.valor)
        
    }
    
}
