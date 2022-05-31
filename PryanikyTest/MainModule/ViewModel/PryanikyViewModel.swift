//
//  PryanikyViewModel.swift
//  PryanikyTest
//
//  Created by Andrey Lobanov on 26.05.2022.
//

import UIKit

protocol PryanikyViewModelProtocol {
    var model: [DataArray] { get }
    func getData(completion: @escaping () -> Void)
    func arrayCount() -> Int?
    func didSelectRow(indexPath: IndexPath, navController: UINavigationController, viewController: UIViewController)
}

class PryanikyViewModel: PryanikyViewModelProtocol {
    
    var model: [DataArray] = []
    
    func getData(completion: @escaping () -> Void) {
        NetworkManager.shared.getModel { [weak self] model in
            guard let self = self else { return }
            let newModel = self.dataSort(model: model)
            self.model = newModel
            completion()
        }
    }
   
    func arrayCount() -> Int? {
        print(self.model.count)
        return model.count
    }
    
    func didSelectRow(indexPath: IndexPath, navController: UINavigationController, viewController: UIViewController) {
        let model = model[indexPath.row]
        let detailVC = PryanikyDetailViewController()
        
        if let url = model.data?.url {
            detailVC.imageView.setImage(imageUrl: url)
            navController.pushViewController(detailVC, animated: true)
        } else if let variants = model.data?.variants {
            let alert = self.createAlert(array: variants, navController: navController)
            viewController.present(alert, animated: true)
        } else {
            detailVC.label.text = model.data?.text
            navController.pushViewController(detailVC, animated: true)
        }
    }
    
    private func createAlert(array: [Variant], navController: UINavigationController) -> UIAlertController {
        let varCount = array.count
        let alertController = UIAlertController(title: "Выберете номер", message: nil, preferredStyle: .actionSheet)
        for varNumber in 0...varCount - 1 {
            let id = String(varNumber + 1)
            alertController.addAction(UIAlertAction(title: id, style: .default, handler: { _ in
                let detailVC = PryanikyDetailViewController()
                detailVC.label.text = array[varNumber].text ?? ""
                navController.pushViewController(detailVC, animated: true)
            }))
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        return alertController
    }
    
    private func dataSort(model: PryanikyModel) -> [DataArray] {
        var newData: [DataArray] = []
        for element in model.view {
            for data in model.data {
                if data.name == element {
                    newData.append(data)
                }
            }
        }
        return newData
    }
}
