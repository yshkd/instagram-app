//
//  EditProfileViewController.swift
//  instagram
//
//  Created by yushi kida on 2020/09/25.
//  Copyright © 2020 yushi kida. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "戻る",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(didTapCancel))
    }
    
    @objc private func didTapSave() {
        
    }
    
    @objc private func didTapCancel() {
        
    }
    
    @objc private func didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "プロフィール写真",
                                            message: "変更しますか？",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "撮る", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "ライブラリから選ぶ", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: { _ in
            
        }))
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }
}
