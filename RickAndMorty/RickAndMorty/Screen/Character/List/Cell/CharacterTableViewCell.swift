//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Pavel Epaneshnikov on 4/6/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    private var avatarLoadTask: URLSessionTask?
    
    func setup(character: Character) {
        self.characterNameLabel.text = character.name
        guard let imageURL = URL(string: character.image) else { return }
        avatarLoadTask = URLSession.shared.dataTask(with: imageURL, completionHandler: { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = image
            }
        })
        avatarLoadTask?.resume()
    }
}
