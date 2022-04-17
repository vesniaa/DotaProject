//
//  Hero.swift
//  DotaProject
//
//  Created by Евгения Аникина on 10.04.2022.
//

import Foundation

struct Hero: Decodable {
    let localized_name: String
    let img: String
}

enum CodingKeys: String, CodingKey {
    case localized_name = "Localized_name"
    case img = "Img"
}

