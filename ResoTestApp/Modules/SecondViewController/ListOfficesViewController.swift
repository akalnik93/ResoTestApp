import UIKit

class ListOfficesViewController: UIViewController {
    
    var listOfficesView: ListOfficesView {
        return self.view as! ListOfficesView
    }
    
    private var listOffices: [Office] = []
    
    override func loadView() {
        self.view = ListOfficesView(tableDataSource: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Офисы РЕСО-Гарантия"
        self.setupBackBarButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.listOfficesView.tableView.reloadData()
    }
    
    func setupBackBarButtonItem() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func setListOffices(offices: [Office]) {
        self.listOffices = offices
    }
    
}

extension ListOfficesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOffices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.listOfficesView.tableView.dequeueReusableCell(withIdentifier: OfficeCell.cellId, for: indexPath) as? OfficeCell else {
            return UITableViewCell()
        }
        let office = self.listOffices[indexPath.row]
        cell.configureOfficeCell(officeName: office.officeName, officeAddress: office.officeAddress)
        cell.selectionStyle = .none
        return cell
    }
    
}
