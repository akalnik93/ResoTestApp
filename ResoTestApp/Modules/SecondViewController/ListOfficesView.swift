import UIKit

class ListOfficesView: UIView {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.separatorInset = .zero
        table.register(OfficeCell.self, forCellReuseIdentifier: OfficeCell.cellId)
        table.rowHeight = UITableView.automaticDimension
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init(tableDataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.tableViewConstraints()
        self.tableView.dataSource = tableDataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tableViewConstraints() {
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }

}
