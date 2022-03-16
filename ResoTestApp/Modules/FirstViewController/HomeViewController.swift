import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView {
        return self.view as! HomeView
    }
    
    var listOffices: [Office] = []
    
    var networkService: NetworkServiceProtcol?
    
    override func loadView() {
        self.view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.networkService = NetworkService.shared
        self.homeView.getListOfficeButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func didTapButton() {
        self.networkService?.fetchListOffices(completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let offices):
                strongSelf.listOffices = offices
                DispatchQueue.main.async {
                    strongSelf.moveToSecondViewController()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    strongSelf.showErrorAlert(error: error)
                }
            }
        })
    }
    
    private func moveToSecondViewController() {
        let nextVC = NavigationService.shared.getViewController(.list) as! ListOfficesViewController
        nextVC.setListOffices(offices: self.listOffices)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

    func showErrorAlert(error: RTError) {
        let alertController = RTErrorAlertService.shared.getAlertWithError(error)
        self.present(alertController, animated: true)
    }

}
