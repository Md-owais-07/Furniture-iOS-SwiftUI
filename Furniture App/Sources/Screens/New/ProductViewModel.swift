//
//  ProductViewModel.swift
//  Furniture App
//
//  Created by Owais on 6/12/26.
//

import SwiftUI

final class ProductViewModel: ObservableObject {

    @Published var products: [Products] = []
    @Published var isLoading = false

    private let service = ProductService()

    func fetchProducts() {
        isLoading = true
        
        service.fetchProducts { [weak self] result in
            self?.isLoading = false
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    print("Products Count:", products.count)
                    self?.products = products

                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
