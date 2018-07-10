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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showImagePicker))
    }
    
    @objc func showImagePicker(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion:  nil)
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


extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
         picker.dismiss(animated: true, completion: nil)
          let  imageUploadManeger = ImageUploadManeger()
            imageUploadManeger.uploadImage(image, progressBlock: { (percentage) in
                print("percentage: \(percentage)")
            }, completionBlock: { [weak self](fileURL,errorMessage) in
                guard  let srongSelf = self else{
                    return
                }
                print("fileURL: \(fileURL)")
                print("errorMessage: \(errorMessage)")
        let carObj = Car(objectID: "nkakgjekjn", name: "Alforo", price: 30000, salePlace: nil, carDescription: nil, image: image)
                carObj.imageURL = fileURL
                print("carObj.imageURL: \(carObj.imageURL)")
              srongSelf.performSegue(withIdentifier: "selectCar", sender: carObj)
            })
            
        }
    }
    
}




