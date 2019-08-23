//
//  ViewController.swift
//  CustomUICollectionPart2
//
//  Created by Mohamed on 8/22/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit


struct Image {
    
    var imagesName:String
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var images:[Image] = [Image(imagesName: "burger1"),
                          Image(imagesName: "burger2"),
                          Image(imagesName: "burger3"),
                          Image(imagesName: "burger4"),
                          Image(imagesName: "burger5"),
                          Image(imagesName: "burger6"),
                          Image(imagesName: "burger1"),
                          Image(imagesName: "burger2"),
                          Image(imagesName: "burger3"),
                          Image(imagesName: "burger4"),
                          Image(imagesName: "burger5"),
                          Image(imagesName: "burger6"),
                          Image(imagesName: "burger1"),
                          Image(imagesName: "burger2"),
                          Image(imagesName: "burger3"),
                          Image(imagesName: "burger4"),
                          Image(imagesName: "burger5"),
                          Image(imagesName: "burger6"),
                          Image(imagesName: "burger1"),
                          Image(imagesName: "burger2"),
                          Image(imagesName: "burger3"),
                          Image(imagesName: "burger4"),
                          Image(imagesName: "burger5"),
                          Image(imagesName: "burger6")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigureCollectionView()

    }

    
    private func ConfigureCollectionView(){
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
      
        setUPCollectionViewFlowLayout()
        
    }
    
    private func setUPCollectionViewFlowLayout() {
        
        
        let collectionFlow = UICollectionViewFlowLayout()
        
        let numberOfItemPerRow:CGFloat = 3
        let numberOfSpacePerLinesOfRows:CGFloat = 3
        let numberOfSpacePerItemsInRow:CGFloat = 5
        
        let width = (collectionView.frame.width - (numberOfItemPerRow-1) * numberOfSpacePerItemsInRow) / numberOfItemPerRow
        
        let height = width
        
        
        collectionFlow.itemSize = CGSize(width: width, height: height)
        collectionFlow.scrollDirection = .vertical
        collectionFlow.minimumLineSpacing =  numberOfSpacePerLinesOfRows
        collectionFlow.sectionInset = UIEdgeInsets.zero
        collectionFlow.minimumInteritemSpacing = numberOfSpacePerItemsInRow
        collectionView.setCollectionViewLayout(collectionFlow, animated: true)
        
   
        
    }
  
}


extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        
        cell.img.image = UIImage(named: images[indexPath.row].imagesName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let item = images[indexPath.item]
        
        performSegue(withIdentifier: "segue", sender: item)
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let item = sender as! Image
        
        if segue.identifier == "segue"{
            if let vc = segue.destination as? SecondVC{
                
                vc.imageName = item.imagesName
            }
            
        }
        
    }
        
}
    
  
    


