//
//  Array+Only.swift
//  Memorize2
//
//  Created by Abdurakhmon Jamoliddinov on 10/22/20.
//  Copyright © 2020 Abdurakhmon Jamoliddinov. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
