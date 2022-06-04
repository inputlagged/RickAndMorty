//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Pavel Epaneshnikov on 4/6/22.
//

import UIKit

class CharacterViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.rowHeight = 120
        }
    }
    
    // MARK: - Properties
    private let characterService = CharacterService()
    
    private let cellIdentifier = "CharacterCell"
    private var characters = [Character]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterService.getAllCharacters {
            guard let characters = $0 else { return }
            self.characters = characters
            
        }
    }
}

// MARK: - UITableViewDataSource
extension CharacterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        
        let currentCharacter = characters[indexPath.row]
        cell.setup(character: currentCharacter)
        
        return cell
    }
}



