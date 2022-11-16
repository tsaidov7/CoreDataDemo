//
//  Models.swift
//  CoreDataDemo
//
//  Created by Саидов Тимур on 15.11.2022.
//

import UIKit

struct Manufacturer {
    let name: String
    let devices: [Device]
}

struct Device {
    let id: UUID
    let memory: Int
    let model: String
    let image: UIImage?
}

class Mock {
    
    static let shared = Mock()
    
    let data: [String: [Device]] = [
        "Apple": [
            Device(id: UUID(), memory: 128, model: "iPhone 14", image: nil),
            Device(id: UUID(), memory: 512, model: "iPhone 13 Pro Max", image: nil),
            Device(id: UUID(), memory: 256, model: "iPhone 13 Pro", image: nil),
            Device(id: UUID(), memory: 128, model: "iPhone 13 mini", image: nil),
            Device(id: UUID(), memory: 256, model: "iPhone 12 Pro Max", image: nil)
        ],
        "Samsung": [
            Device(id: UUID(), memory: 128, model: "Galaxy Z Flip4", image: nil),
            Device(id: UUID(), memory: 256, model: "Galaxy S22 Ultra", image: nil)
        ],
        "Huawei": [
            Device(id: UUID(), memory: 128, model: "P50 Pro", image: nil),
        ]
    ]
    
    private init() {}
}
