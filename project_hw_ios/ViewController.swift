//
//  ViewController.swift
//  project_hw_ios
//
//  Created by Арсений Беглов on 09.10.2023.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        let url: URL = URL(string: "https://api.thedogapi.com/v1/breeds")!
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data,
                  error == nil
            else{
                return
            }
            let decoder = JSONDecoder()
  
            let model = try! decoder.decode([DogDTO].self, from: data)
            print(model)
        }).resume()
    }
    
}

struct DogDTO: Decodable {
    let id: Int
    let name: String
    let bredFor: String?
    let breedGroup: String?
    let referenceImageId: String
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case bredFor = "bred_for"
        case breedGroup = "breed_group"
        case referenceImageId = "reference_image_id"
    }
}



