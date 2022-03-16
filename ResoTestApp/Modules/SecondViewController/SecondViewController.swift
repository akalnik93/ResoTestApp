import UIKit

class ListOfficesViewController: UIViewController {
    
    var secondView: SecondView {
        return self.view as! SecondView
    }
    
    var listOffice: [Office] = []
    
    var networkService: NetworkServiceProtcol?
    
    override func loadView() {
        self.view = SecondView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Офисы РЕСО-Гарантия"
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.networkService = NetworkService.shared
        self.secondView.tableView.register(OfficeCell.self, forCellReuseIdentifier: OfficeCell.cellId)
        self.secondView.tableView.dataSource = self
        self.secondView.tableView.delegate = self
        self.downloadComplete()
    }
    
    func downloadComplete() {
        guard let networkService = networkService else { return }
        self.listOffice = networkService.getListOffice()
        self.secondView.tableView.reloadData()
    }
    
}

extension ListOfficesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOffice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.secondView.tableView.dequeueReusableCell(withIdentifier: OfficeCell.cellId, for: indexPath) as? OfficeCell else {
            return UITableViewCell()
        }
        let model = self.listOffice[indexPath.row]
        cell.configureOfficeCell(officeName: model.officeName, officeAddress: model.officeAddress)
        return cell
    }
    
}

extension ListOfficesViewController: UITableViewDelegate {
          
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        123
    }

}
