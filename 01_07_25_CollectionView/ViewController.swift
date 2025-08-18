//
//  ViewController.swift
//  01_07_25_CollectionView
//
//  Created by Vishal Jagtap on 18/08/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var productCollectionView: UICollectionView!
    private var reuseIdentifier = "ProductCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeCollectionView()
        registerCellForCollectionView()
    }
    
    func initializeCollectionView(){
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
    }
    
    func registerCellForCollectionView(){
        let uiNib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        self.productCollectionView.register(uiNib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
    }
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCollectionViewCell = self.productCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        productCollectionViewCell.imageView1.image = UIImage(named: "test_image_2")
        return productCollectionViewCell
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
