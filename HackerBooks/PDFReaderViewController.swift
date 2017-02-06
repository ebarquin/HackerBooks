//
//  PDFReaderViewController.swift
//  HackerBooks
//
//  Created by Eugenio Barquín on 6/2/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit

class PDFReaderViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet var pdfReader: UIWebView!
    @IBOutlet var PDFActivityIndicator: UIActivityIndicatorView!
    
    let model : Book
    
    //MARK: - Initialization
    init(model: Book) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Sync model -> view
    func syncViewWithModel() {
        //Creamos un URLRequest
        let req = URLRequest(url: model.pdf_url)
        //Lo cargamos en el browser
        pdfReader.loadRequest(req)
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        syncViewWithModel()
        pdfReader.delegate = self
    }

}

//MARK: - UIWebViewDelegate
extension PDFReaderViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        PDFActivityIndicator.isHidden = false
        PDFActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        PDFActivityIndicator.isHidden = true
        PDFActivityIndicator.stopAnimating()
        
    }
}
