//
//  LandingViewModel.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/22/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    let title: String
    let image: String
    
    init(
        title: String = "memory",
        image: String = "ic_brain"
    ) {
        self.title = title
        self.image = image
    }
    
    @Published var options: [OptionType] = [
        OptionType.ADD,
        OptionType.MODE(groupLength: 3,  preview: false, numOfGroup: 9, timeLimit: 2, clickLimit: 2),
        OptionType.MODE(groupLength: 2,  preview: false, numOfGroup: 9, timeLimit: 2, clickLimit: 2),
        OptionType.MODE(groupLength: 2,  preview: false, numOfGroup: 10, timeLimit: 2, clickLimit: 2),
        OptionType.MODE(groupLength: 3,  preview: false, numOfGroup: 14, timeLimit: 2, clickLimit: 2),
        OptionType.MODE(groupLength: 4,  preview: false, numOfGroup: 10, timeLimit: 2, clickLimit: 2),
        OptionType.MODE(groupLength: 2,  preview: false, numOfGroup: 15, timeLimit: 2, clickLimit: 2),
        OptionType.MODE(groupLength: 2,  preview: false, numOfGroup: 15, timeLimit: 2, clickLimit: 2),
        OptionType.MODE(groupLength: 4,  preview: false, numOfGroup: 8, timeLimit: 2, clickLimit: 2),
        OptionType.MODE(groupLength: 3,  preview: false, numOfGroup: 7, timeLimit: 2, clickLimit: 2),
        OptionType.MODE(groupLength: 2,  preview: false, numOfGroup: 7, timeLimit: 2, clickLimit: 2),
        OptionType.MODE(groupLength: 2,  preview: true, numOfGroup: 3, timeLimit: 20, clickLimit: 50),
    ]

}
