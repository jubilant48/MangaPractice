//
//  FilterSectionModel.swift
//  EMSwiftUI
//
//  Created by macbook on 05.02.2024.
//

import SwiftUI

enum FilterSectionModel: CaseIterable {
    case contantRaiting
    case publicationStatus
    case magazineDemographic
    case format
    case genre
    case theme
    
    var asTitle: String {
        switch self {
        case .contantRaiting:
            return "Contant Raiting"
        case .publicationStatus:
            return "Publication Status"
        case .magazineDemographic:
            return "Magazine Demographic"
        case .format:
            return "Format"
        case .genre:
            return "Genre"
        case .theme:
            return "Theme"
        }
    }
    
    var tags: [String: Bool] {
        switch self {
        case .contantRaiting:
            return [
                "Safe": false,
                "Suggestive": false,
                "Erotica": false
            ]
        case .publicationStatus:
            return [
                "Ongoing": false,
                "Completed": false,
                "Hiatus": false,
                "Cancelled": false
            ]
        case .magazineDemographic:
            return [
                "Shounen": false,
                "Shoujo":  false,
                "Seinen": false,
                "Josei": false,
                "None": false
            ]
        case .format:
            return [
                "Award Winning": false,
                "Doujinshi": false,
                "Fan Colored": false,
                "4-Koma": false,
                "Adaptation": false,
                "Anthology": false,
                "Oneshot": false,
                "Full Color": false,
                "Long Strip": false,
                "Offical Colored": false,
                "User Created": false,
                "Web Comic": false
            ]
        case .genre:
            return [
                "Action": false,
                "Adventure": false,
                "Boy's Love": false,
                "Crime": false,
                "Comedy": false,
                "Drama": false,
                "Fantasy": false,
                "Girl's Love": false,
                "Historical": false,
                "Horror": false,
                "Isekai": false,
                "Mecha": false,
                "Magical Girls": false,
                "Medical": false,
                "Mystery": false,
                "Sci-Fi": false,
                "Philosophical": false,
                "Romance": false,
                "Slice of Life": false,
                "Sports": false,
                "Superhero": false,
                "Thriller": false,
                "Wuxia": false
            ]
        case .theme:
            return [
                "Aliens": false,
                "Animals": false,
                "Cooking": false,
                "Crossdressing": false,
                "Delinquents": false,
                "Demons": false,
                "Ganderswap": false,
                "Ghosts": false,
                "Gyaru": false,
                "Harem": false,
                "Loli": false,
                "Mafia": false,
                "Magic": false,
                "Martial Arts": false,
                "Military": false,
                "Monsters": false,
                "Music": false,
                "Ninja": false,
                "Police": false,
                "Reincarnation": false
            ]
        }
    }
}
