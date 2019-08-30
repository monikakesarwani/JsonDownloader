//
//  modal.swift
//  JsonDataInTabelview
//
//  Created by Anil on 7/17/19.
//  Copyright © 2019 kesarwani. All rights reserved.
//

import Foundation

struct Character: Codable {
    let RelatedTopics: [RelatedTopic]
}


struct RelatedTopic: Codable {
    let Icon: IconOject
    let Text: String
}


struct IconOject: Codable {
    let url: String
}
