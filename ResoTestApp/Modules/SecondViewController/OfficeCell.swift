import UIKit

class OfficeCell: UITableViewCell {
    
    static let cellId = "OfficeCell"
    
    let officeName: UILabel = {
        let label = UILabel()
        label.font = Style.Font.regular(17)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let officeAddress: UILabel = {
        let label = UILabel()
        label.font = Style.Font.regular(15)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let officeStatus: UILabel = {
        let label = UILabel()
        label.font = Style.Font.regular(15)
        label.textColor = UIColor(red: 36, green: 128, blue: 64)
        label.text = "Открыт"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.officeNameConstraints()
        self.officeStatusConstraints()
        self.officeAddressConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureOfficeCell(officeName: String, officeAddress: String) {
        self.officeName.text = officeName
        self.officeAddress.text = officeAddress
    }
    
    private func officeNameConstraints() {
        self.contentView.addSubview(self.officeName)
        NSLayoutConstraint.activate([
            officeName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            officeName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            officeName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            ])
    }
 
    private func officeStatusConstraints() {
        self.contentView.addSubview(self.officeStatus)
        NSLayoutConstraint.activate([
            officeStatus.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            officeStatus.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            officeStatus.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            ])
    }
    
    private func officeAddressConstraints() {
        self.contentView.addSubview(self.officeAddress)
        NSLayoutConstraint.activate([
            officeAddress.topAnchor.constraint(equalTo: self.officeName.bottomAnchor, constant: 8),
            officeAddress.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            officeAddress.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            officeAddress.bottomAnchor.constraint(equalTo: self.officeStatus.topAnchor, constant: -8)
            ])
    }

}
