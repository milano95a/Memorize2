//
//  Array+Identifiable.swift
//  Memorize2
//
//  Created by Abdurakhmon Jamoliddinov on 10/22/20.
//  Copyright © 2020 Abdurakhmon Jamoliddinov. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil // TODO: bogus!
    }

}
