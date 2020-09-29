//
//  SettingsViewController.swift
//  instagram
//
//  Created by yushi kida on 2020/09/25.
//  Copyright © 2020 yushi kida. All rights reserved.
//

import UIKit
import SafariServices

struct SettingCellModel {
    let title: String
    let handler: (() -> Void)
}

class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .grouped)
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = [[SettingCellModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        data.append([
            SettingCellModel(title: "プロフィール編集") { [weak self] in
                self?.didTapEditProfile()
            },
            SettingCellModel(title: "友達を招待") { [weak self] in
                self?.didTapInviteFriends()
            },
            SettingCellModel(title: "オリジナルの投稿を保存") { [weak self] in
                self?.didTapSaveOriginalPosts()
            }
        ])
        data.append([
            SettingCellModel(title: "利用規約") { [weak self] in
                self?.openURL(type: .terms)
            },
            SettingCellModel(title: "プライバシーポリシー") { [weak self] in
                self?.openURL(type: .privacy)
            },
            SettingCellModel(title: "ヘルプ / フィードバック") { [weak self] in
                self?.openURL(type: .help)
            }
        ])
        data.append([
            SettingCellModel(title: "ログアウト") { [weak self] in
                self?.didTapLogout()
            }
        ])
    }
    
    enum SettingURLType {
        case terms, privacy, help
    }
    
    private func openURL(type: SettingURLType) {
        let urlString: String
        switch type {
        case .terms: urlString = "https://help.instagram.com/581066165581870"
        case .privacy: urlString = "https://help.instagram.com/519522125107875"
        case .help: urlString = "https://help.instagram.com"
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    private func didTapEditProfile() {
        let vc = EditProfileViewController()
        vc.title = "プロフィール編集"
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
    private func didTapInviteFriends() {
        
    }
    
    private func didTapSaveOriginalPosts() {
        
    }
    
    private func didTapLogout() {
        let actionSheet = UIAlertController(title: "ログアウト",
                                            message: "ログアウトしますか？",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "キャンセル",
                                            style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "ログアウト", style: .destructive, handler: { _ in
            AuthManager.shared.logout(completion: { success in
                DispatchQueue.main.async {
                    if success {
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }
                    else {
                        fatalError("ログアウトできません")
                    }
                }
            })
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        present(actionSheet, animated: true)
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        print("data.count: \(data.count)")
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
}
