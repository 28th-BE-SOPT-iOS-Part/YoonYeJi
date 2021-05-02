//
//  FifthTabViewController.swift
//  KaKaoTalk
//
//  Created by 윤예지 on 2021/04/15.
//

import UIKit

class MoreTabViewController: UIViewController {

   
    @IBOutlet weak var MoreCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MoreCollectionView.delegate = self
        MoreCollectionView.dataSource = self
        

    }

}

extension MoreTabViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moreList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreCollectionViewCell", for: indexPath) as? MoreCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setData(moreIcon: moreList[indexPath.row].imgIcon, title: moreList[indexPath.row].title)
        
        return cell
    }
    
    
}

extension MoreTabViewController : UICollectionViewDelegate {

}

extension MoreTabViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
        let width = UIScreen.main.bounds.width
           
           let cellwidth = width * (70/375)
           let cellHeight = cellwidth * (70/70)
           
           return CGSize(width: cellwidth, height: cellHeight)
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets.zero
       }
       
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 19
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 3
       }
}