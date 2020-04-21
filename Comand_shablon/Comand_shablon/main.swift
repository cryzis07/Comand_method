//
//  main.swift
//  Comand_shablon
//
//  Created by Никита Строков on 22.04.2020.
//  Copyright © 2020 Никита Строков. All rights reserved.
//

final class LightsOutside {
    var intencity: Double = 1.0
    
    func switchOn(){
        print("Lights switched on")
    }
    func switchOff(){
        print("Lights switched off")
    }
}

final class HeatingCooling {
    var temperature: Double = 25
    var mode: String {
        return temperature >= 25 ? "heating" : "cooling"
    }

    func start() {
        print("Start \(mode)")
    }
    func stop() {
        print("Stop \(mode)")
    }
}

protocol Command {
    func execute()
}

final class SwitchOnCommand: Command {
    var light: LightsOutside
    init(light: LightsOutside) {
        self.light = light
    }
    func execute() {
        light.switchOn()
    }
}

final class StartHeatingCommand: Command {
    var heater: HeatingCooling
    init(heater: HeatingCooling) {
        self.heater = heater
    }
    func execute() {
        if heater.temperature < 25 {
            heater.temperature = 25
        }
        heater.start()
    }
}

final class Programm {
    var commands: [Command] = []
    
    func start(){
        commands.forEach { $0.execute() }
    }
}

let light = LightsOutside()
let heater = HeatingCooling()

let lightOnCommand = SwitchOnCommand(light: light)
let heatingCommand = StartHeatingCommand(heater: heater)

let eveningProgram = Programm()
eveningProgram.commands.append(lightOnCommand)
eveningProgram.commands.append(heatingCommand)
eveningProgram.start()
