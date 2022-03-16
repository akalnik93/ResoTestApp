import UIKit

class HomeView: UIView {
    
    let getListOfficeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setBackgroundColor(color: .lightGray, forState: .normal)
        button.setBackgroundColor(color: .lightGray.withAlphaComponent(0.5), forState: .highlighted)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let labelForButton: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Style.Font.regular(20)
        label.textColor = .black
        label.text = "Получить список \n офисов"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.getListOfficeButtonConstraints()
        self.labelForButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getListOfficeButtonConstraints() {
        self.addSubview(getListOfficeButton)
        NSLayoutConstraint.activate([
            getListOfficeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            getListOfficeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            getListOfficeButton.widthAnchor.constraint(equalToConstant: 200),
            getListOfficeButton.heightAnchor.constraint(equalToConstant: 60)
            ])
    }
    
    private func labelForButtonConstraints() {
        self.getListOfficeButton.addSubview(labelForButton)
        NSLayoutConstraint.activate([
            labelForButton.topAnchor.constraint(equalTo: self.getListOfficeButton.topAnchor),
            labelForButton.leadingAnchor.constraint(equalTo: self.getListOfficeButton.leadingAnchor),
            labelForButton.trailingAnchor.constraint(equalTo: self.getListOfficeButton.trailingAnchor),
            labelForButton.bottomAnchor.constraint(equalTo: self.getListOfficeButton.bottomAnchor)
            ])
    }

}
