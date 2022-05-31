//
//  PryanikyViewController.swift
//  PryanikyTest
//
//  Created by Andrey Lobanov on 26.05.2022.
//

import UIKit

class PryanikyViewController: UIViewController {
    
    private var viewModel: PryanikyViewModelProtocol?
    
    private let tableView = UITableView().next {
        $0.register(PryanikyCell.self, forCellReuseIdentifier: "Cell")
        $0.backgroundColor = .clear
    }
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "PryanikyTest"
        setupTableView()
        viewModel = PryanikyViewModel()
        loadData()
    }
    
    func loadData() {
        viewModel?.getData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
}

extension PryanikyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.arrayCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PryanikyCell else { return UITableViewCell()}
        cell.setup = viewModel?.model[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navController = self.navigationController else { return }
        viewModel?.didSelectRow(indexPath: indexPath, navController: navController, viewController: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
