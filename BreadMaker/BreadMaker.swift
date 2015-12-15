//
//  BreadMaker.swift
//  BreadMaker
//
//  Created by Svendsen, Runar on 15/12/15.
//  Copyright © 2015 FINN.no. All rights reserved.
//

import Foundation
import Interstellar

enum Result<T> {
    
    case Success(T)
    case Error(NSError)
}


