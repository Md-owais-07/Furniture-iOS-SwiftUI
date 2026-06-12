//
//  CategoryService.swift
//  Furniture App
//
//  Created by Owais on 6/12/26.
//

import FirebaseFirestore

final class CategoryService {

    private let db = Firestore.firestore()

    func fetchCategories(
        completion: @escaping(Result<[Category], Error>) -> Void
    ) {

        db.collection("categories")
            .getDocuments { snapshot, error in

                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let documents = snapshot?.documents else {
                    completion(.success([]))
                    return
                }

                let categories = documents.compactMap {
                    try? $0.data(as: Category.self)
                }

                completion(.success(categories))
            }
    }
}
