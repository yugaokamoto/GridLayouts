//
//  ViewController.swift
//  GridLayouts
//
//  Created by 岡本　優河 on 2018/07/08.
//  Copyright © 2018年 岡本　優河. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
   
    var gridLayout: GridLayout!
    var datasource:Datasorce!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cars"
        
        datasource = Datasorce()
        collectionView.dataSource = datasource
        
        gridLayout = GridLayout(numberOfColumns: 2)
        collectionView.collectionViewLayout = gridLayout
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if  let selectedCar = datasource.itemsAt(indexPath) as? Car{
             performSegue(withIdentifier: "selectCar", sender: selectedCar)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let item = datasource.itemsAt(indexPath)
            if item is Banner{
                return gridLayout.itemSizeFor(1, with: bannerCollectionViewCell.cellHeight())
            }else if item is CarGroups {
            return gridLayout.itemSizeFor(1, with: CarGroupCollectionViewCell.cellHeight())
            }else{
            return gridLayout.itemSizeFor(2)
        }
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectCar"{
            if let selectedCar = sender as? Car , let destinationViewController = segue.destination as? DetailViewController{
                destinationViewController.selectedCar = selectedCar
            }
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
}
