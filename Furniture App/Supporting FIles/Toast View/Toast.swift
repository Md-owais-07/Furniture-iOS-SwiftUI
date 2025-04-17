//
//  Toast.swift
//  Furniture App
//
//  Created by Owais on 4/3/25.
//

import Foundation

struct Toast: Equatable {
  var style: ToastStyle
  var message: String
  var duration: Double = 3
  var width: Double = .infinity
}
