//
//  AddDataHelper.swift
//  AKStoryView
//
//  Created by PIYUSH  GHOGHARI on 09/04/21.
//


import Foundation
import UIKit

func getStausData() -> [UserStoryListModel] {
    var userStoryListArray: [UserStoryListModel] = []
    
    userStoryListArray.append(UserStoryListModel(userProfile: UIImage(named: "ic_User5"), userName: "Your Story", statusImage: []))
    
    userStoryListArray.append(UserStoryListModel(userProfile: UIImage(named: "ic_User1"), userName: "Jone Down", statusImage: [UIImage(named:"ic_story1")!,
                                                                                                                               UIImage(named:"ic_story2")!,
                                                                                                                               UIImage(named:"ic_story3")!,
                                                                                                                               UIImage(named:"ic_story4")!]))
    
    userStoryListArray.append(UserStoryListModel(userProfile: UIImage(named: "ic_User2"), userName: "David Guetta", statusImage: [UIImage(named:"ic_story3")!,
                                                                                                                                  UIImage(named:"ic_story4")!]))
    
    userStoryListArray.append(UserStoryListModel(userProfile: UIImage(named: "ic_User3"), userName: "Martin Garrix", statusImage: [UIImage(named:"ic_story5")!,
                                                                                                                                   UIImage(named:"ic_story6")!,
                                                                                                                                   UIImage(named:"ic_story7")!]))
    
    userStoryListArray.append(UserStoryListModel(userProfile: UIImage(named: "ic_User4"), userName: "Steve Aoki", statusImage: [UIImage(named:"ic_story1")!,
                                                                                                                                UIImage(named:"ic_story3")!,
                                                                                                                                UIImage(named:"ic_story5")!,
                                                                                                                                UIImage(named:"ic_story7")!]))
    
    userStoryListArray.append(UserStoryListModel(userProfile: UIImage(named: "ic_User6"), userName: "Lady Gaga", statusImage: [UIImage(named:"ic_story8")!]))
    
    userStoryListArray.append(UserStoryListModel(userProfile: UIImage(named: "ic_User7"), userName: "Shakira", statusImage: [UIImage(named:"ic_story2")!,
                                                                                                                             UIImage(named:"ic_story4")!,
                                                                                                                             UIImage(named:"ic_story6")!,
                                                                                                                             UIImage(named:"ic_story8")!,
                                                                                                                             UIImage(named:"ic_story5")!]))
    
    return userStoryListArray
}
