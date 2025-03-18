//
//  Models.swift
//  RadianceSearch
//
//  Created by admin2 on 09/03/25.
//

import Foundation
import Supabase

// Initialize Supabase Client
let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://gbsijqzmpurzvtonyniv.supabase.co")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imdic2lqcXptcHVyenZ0b255bml2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkzNDk4NjUsImV4cCI6MjA1NDkyNTg2NX0.PSzkvUPJdqYqRhw5x7Crh4lFqYeMQsj87dZYTHfwKpc"
)

struct Ingredient: Codable {
    let id: Int
    let name: String
    let aka: String
    let description: String
    let usage: String
    let healthImpact: String
    let sourceLink: String?
    let riskLevel: String
    let rating: Int
}

func fetchIngredients(completion: @escaping ([Ingredient]?, Error?) -> Void) {
    Task {
        do {
            let ingredients: [Ingredient] = try await supabase
                .from("ingredients")
                .select()
                .execute()
                .value
            
            DispatchQueue.main.async {
                completion(ingredients, nil)
            }
        } catch {
            DispatchQueue.main.async {
                completion(nil, error)
            }
        }
    }
}


struct Product: Codable {
    let id: Int
    let name: String
}
