//
//  ViewController.swift
//  MikeKondo-Kadai10
//
//  Created by 近藤米功 on 2022/08/16.
//

import UIKit

enum ColorType: Int {
    case red
    case green
    case blue
}

class ViewController: UIViewController {
    // MARK: - UI Parts
    @IBOutlet weak private var tableView: UITableView!

    private let prefectures = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: PrefectureCell.nibName, bundle: nil), forCellReuseIdentifier: PrefectureCell.identifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prefectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PrefectureCell.identifier, for: indexPath) as! PrefectureCell
        cell.prefectureNameLabel.text = prefectures[indexPath.row]
        cell.prefectureNumberLabel.text = "\(indexPath.row + 1)番目の都道府県です"

        let color = ColorType(rawValue: indexPath.row % 3)
        switch color {
        case .red:
            cell.backgroundColor = .red
        case .green:
            cell.backgroundColor = .green
        case .blue:
            cell.backgroundColor = .blue
        default:
            break
        }
        return cell
    }
}
