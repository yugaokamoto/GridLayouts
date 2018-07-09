//
//  CarGroupCollectionViewCell.swift
//  GridLayouts
//
//  Created by 岡本　優河 on 2018/07/09.
//  Copyright © 2018年 岡本　優河. All rights reserved.
//

import UIKit

class CarGroupCollectionViewCell: UICollectionViewCell , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControll: UIPageControl!
    
    private var datasource:CarGroupDatasource!
    
    static func cellHeight() -> CGFloat{
        return 180.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pageControll.currentPageIndicatorTintColor = UIColor.rbgcolor(r: 15.0, g: 101.0, b: 180.0, a: 1.0)
        pageControll.pageIndicatorTintColor = UIColor.rbgcolor(r: 255.0, g: 247.0, b: 249.0, a: 1.0)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        collectionView.dataSource = nil
        datasource = nil
        pageControll.numberOfPages = datasource.numberOfCars()
    }
    
    func fillWith(_ group:CarGroups){
        datasource = CarGroupDatasource(carGroup: group)
        collectionView.dataSource = datasource
        collectionView.delegate = self
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let indexOfPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControll.currentPage = indexOfPage
    }
}
