//
//  ViewController.swift
//  AKStoryView
//
//  Created by PIYUSH  GHOGHARI on 09/04/21.
//


import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - All IBOutlet's for this UIViewController
    @IBOutlet weak var statusCollectionView: UICollectionView!
    // Variables
    var userStoryListArray: [UserStoryListModel] = []
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userStoryListArray = getStausData()
        self.statusCollectionView.reloadData()
        // Do any additional setup after loading the view.
    }
}

// MARK: - UICollectionView DataSource & Delegate Method's
extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userStoryListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = statusCollectionView.dequeueReusableCell(withReuseIdentifier: "StatusCollectionViewCell", for: indexPath) as? StatusCollectionViewCell
        self.configurationStoryCollectionViewCell(cell: cell, indexPathForCell: indexPath)
        return cell ?? UICollectionViewCell()
    }
    
    func configurationStoryCollectionViewCell(cell: StatusCollectionViewCell?, indexPathForCell: IndexPath) {
        if indexPathForCell.row == 0 {
            cell?.addStatusSignView.isHidden = false
            cell?.borderView.isHidden = true
        } else {
            cell?.addStatusSignView.isHidden = true
            cell?.borderView.isHidden = false
            cell?.borderView.layer.borderWidth = 1.5
            cell?.borderView.layer.borderColor = UIColor.blue.cgColor
        }
        cell?.userProfileImage.image = userStoryListArray[indexPathForCell.row].userProfile
        cell?.userNameLabel.text = userStoryListArray[indexPathForCell.row].userName
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100.0, height: 140.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if self.userStoryListArray[indexPath.row].statusImage?.count ?? 0 > 0 {
                let objUserStoryVC = R.storyboard.main.storyViewController()
                objUserStoryVC?.modalPresentationStyle = .fullScreen
                objUserStoryVC?.rowIndex = indexPath.row
                objUserStoryVC?.userStoryListArray = self.userStoryListArray
                self.present(objUserStoryVC!, animated: true, completion: nil)
            } else {
                // Select Status Image into Image Gallery
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.sourceType = .photoLibrary
                    imagePicker.allowsEditing = true
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }
        } else {
            let objUserStoryVC = R.storyboard.main.storyViewController()
            objUserStoryVC?.modalPresentationStyle = .fullScreen
            objUserStoryVC?.rowIndex = indexPath.row
            objUserStoryVC?.userStoryListArray = self.userStoryListArray
            self.present(objUserStoryVC!, animated: true, completion: nil)
        }
    }
    
}

// MARK: - UIImagePicker Delegate Method's

extension HomeViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let assetPath = info[UIImagePickerController.InfoKey.referenceURL] as! NSURL
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if (assetPath.absoluteString?.hasSuffix("PNG"))!{
                userStoryListArray[0] =  UserStoryListModel(userProfile: UIImage(named: "ic_User5"), userName: "Your Story", statusImage: [pickedImage])
            } else {
                userStoryListArray[0] =  UserStoryListModel(userProfile: UIImage(named: "ic_User5"), userName: "Your Story", statusImage: [pickedImage])
            }
        }
        self.statusCollectionView.reloadData()
        picker.dismiss(animated: true, completion: nil)
    }
    
}
