//
//  ChannelsViewController.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import UIKit

class ChannelsViewController: ViewController {

    // MARK: - Views
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBlue
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Properties
    var presenter: ChannelsPresenterProtocol?

    private var items: [ChannelModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
        ChannelsAssembly.shared.setup(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.fetchData()
    }

}


// MARK: - Setup
private extension ChannelsViewController {
    func setup() {
        tableView.dataSource = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - Fetch data
private extension ChannelsViewController {
    func fetchData() {
        presenter?.getChannels()
    }
}

// MARK: - ChannelsViewControllerProtocol
extension ChannelsViewController: ChannelsViewControllerProtocol {
    func showChannels(channels: [ChannelModel]) {
        items = channels
    }
}

// MARK: -
extension ChannelsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! UITableViewCell
        cell.textLabel?.text = items[indexPath.row].CallSign
        return cell
    }
}
