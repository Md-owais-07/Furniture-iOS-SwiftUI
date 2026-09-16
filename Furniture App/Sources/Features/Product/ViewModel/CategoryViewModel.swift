//
//  CategoryViewModel.swift
//  Furniture App
//
//  Created by Owais on 6/12/26.
//

import SwiftUI

final class CategoryViewModel: ObservableObject {

    @Published var categories: [Category] = []

    private let service = CategoryService()

    func fetchCategories() {

        service.fetchCategories { [weak self] result in

            DispatchQueue.main.async {

                switch result {

                case .success(let categories):
                    self?.categories = categories

                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
