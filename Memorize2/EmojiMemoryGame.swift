//
//  EmojiMemoryGame.swift
//  Memorize2
//
//  Created by Abdurakhmon Jamoliddinov on 10/21/20.
//  Copyright © 2020 Abdurakhmon Jamoliddinov. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let theme = themeFactory()
        return MemoryGame<String>(numberOfPairsOfCards: theme.emojis.count, title: theme.title) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var title: String {
        return model.title
    }
    
    func newGame(){
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    // MARK: - Intent(s)

    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
    
    static func themeFactory() -> Theme {
        var emojiStore: [Theme] = []
        emojiStore.append(Theme(title: "Animals", emojis: ["🐶", "🐱", "🐭", "🦊", "🐼", "🐯", "🦁", "🐮", "🐷"]))
        emojiStore.append(Theme(title: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏓", "🥊", "🥋"]))
        emojiStore.append(Theme(title: "Faces", emojis: ["😎", "🥳", "😡", "😂", "😷", "😳", "🥺", "😍", "🤪"]))
        emojiStore.append(Theme(title: "Sea creatures", emojis: ["🐬", "🐳", "🐋", "🦈", "🐊", "🐢", "🐠", "🐙", "🦑"]))
        emojiStore.append(Theme(title: "Birds", emojis: ["🦉", "🐥", "🦆", "🦅", "🦇", "🐔", "🐧", "🐦", "🐤"]))
        emojiStore.append(Theme(title: "Fruit", emojis: ["🍏", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍒"]))

        emojiStore.shuffle()
        return emojiStore[0]
    }
}

struct Theme {
    let title: String
    let emojis: [String]
}

