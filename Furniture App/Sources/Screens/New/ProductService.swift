//
//  ProductService.swift
//  Furniture App
//
//  Created by Owais on 6/12/26.
//

import FirebaseFirestore

final class ProductService {
    
    private let db = Firestore.firestore()
    
    func fetchProducts(
        completion: @escaping (Result<[Products], Error>) -> Void
    ) {
        
        db.collection("products")
            .getDocuments { snapshot, error in
                
                if let error {
                    completion(.failure(error))
                    return
                }
                
                let products =
                snapshot?.documents.compactMap {
                    
                    try? $0.data(
                        as: Products.self
                    )
                    
                } ?? []
                
                completion(.success(products))
            }
    }
}
