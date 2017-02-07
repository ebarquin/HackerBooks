//
//  BookDetailViewController.swift
//  HackerBooks
//
//  Created by Eugenio Barquín on 5/2/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    var model : Book
    
    //MARK: - Initialization
    init(model: Book){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        syncViewModel()
    }
    
    
    
    //MARK: - Sync model -> View
    func syncViewModel() {
        
        let url = model.image_url
        let data = try? Data(contentsOf: url)
        photoView.image = UIImage(data: data!)
        title = model.title

    }
    
    //MARK: - Actions
    
    @IBOutlet var photoView: UIImageView!
    
    @IBAction func setFavorite(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func displayPDF(_ sender: UIBarButtonItem) {
        let pdfVC = PDFReaderViewController(model: model)
        navigationController?.pushViewController(pdfVC, animated: true)
        
    }

    
}

//MARK: - Protocols
extension BookDetailViewController: LibraryTableViewControllerDelegate {
    func LibraryTableViewController(_ LibraryVC: LibraryTableViewController, didSelectBook book: Book) {
        
        //Cambiamos el modelo
        model = book
        syncViewModel()
    }
    
}
