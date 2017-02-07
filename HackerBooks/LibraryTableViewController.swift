//
//  LibraryTableViewController.swift
//  HackerBooks
//
//  Created by Eugenio Barquín on 4/2/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController {
    
    //MARK: - Properties
    let model : Library
    
    weak var delegate : LibraryTableViewControllerDelegate? = nil
    
    //MARK: - Initialization
    init(model: Library){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tag = getTag(forSection: indexPath.section)
        
        //descubrir que libro
        let book  = model.book(atIndex: indexPath.row, forTag: tag)
        
       //Avisar al delegado
        delegate?.LibraryTableViewController(self, didSelectBook: book!)
    }
    
   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.model.tagsCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.bookCount(forTagName: getTag(forSection: section))
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return getTag(forSection: section).uppercased()
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Definir un id para el tipo de celda
        let cellId = "BookCell"
        //Averiguar el tag
        let tag = getTag(forSection: indexPath.section)
        //Averiguar quien es el personaje
        let book = model.book(atIndex: indexPath.row, forTag: tag)
        //Crear la celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if cell == nil {
            //El opcional está vacio y toca crear la celda desde cero
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        //Configurarla
        let url = book?.image_url
        let data = try? Data(contentsOf: (url)!)
        cell?.imageView?.image = UIImage(data: data!)
        cell?.textLabel?.text = book?.title
        cell?.detailTextLabel?.text = book?.authors.joined(separator: " ")
        
        //Devolverla
        return cell!
        
    }

    //MARK: - Utils
    func getTag(forSection section: Int) -> Tag {
        return model.tags[section]
        
    }
}

//MARK: - LibraryTableViewControllerDelegate
protocol LibraryTableViewControllerDelegate: class {
    
    func LibraryTableViewController(_ LibraryVC: LibraryTableViewController, didSelectBook book: Book)
}
