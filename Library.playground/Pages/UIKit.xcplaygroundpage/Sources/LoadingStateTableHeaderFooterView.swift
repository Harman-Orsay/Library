import UIKit

public class LoadingStateTableHeaderFooterView: UITableViewHeaderFooterView {
    
    public enum State {
        case loading(message: String?)
        case completed(message: String?)
        case dormant
    }
    
    //MARK: - API
    
    public var currentState: State = .dormant {
        didSet {
            updateUI(state: currentState)
        }
    }
    
    public let section: Int?
    
    public init(section: Int? = nil) {
        self.section = section
        super.init(reuseIdentifier: nil)
        initSubviews()
    }
    
    //MARK: - Initiliazers
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSubviews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        initConstraints()
    }
    
    private func initConstraints() {
        stackView.pinToSuperview()
    }
    
    //MARK: - Subviews
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [statusLabel, indicator])
        stack.alignment = .center
        stack.axis = .horizontal
        return stack
    }()
    
    //MARK: - UI states
    
    private func updateUI(state: State) {
        switch state {
        case .loading(message: let message): showLoading(message: message)
        case .completed(message: let message): showCompleted(message: message)
        case .dormant: stackView.isHidden = true
        }
    }
    
    private func showLoading(message: String?) {
        if !stackView.arrangedSubviews.contains(indicator) {
            stackView.addArrangedSubview(indicator)
        }
        
        if let message = message, message != "" {
            if !stackView.arrangedSubviews.contains(statusLabel) {
                stackView.addArrangedSubview(statusLabel)
            }
            statusLabel.text = message
        } else {
            if stackView.arrangedSubviews.contains(statusLabel) {
                stackView.removeArrangedSubview(statusLabel)
            }
        }
    
        indicator.startAnimating()
        stackView.isHidden = false
    }
    
    private func showCompleted(message: String?) {
        becomeDormant()
        
        if let message = message, message != "" {
            stackView.addArrangedSubview(statusLabel)
            statusLabel.text = message
        }
        
        stackView.isHidden = false
    }
    
    private func becomeDormant() {
        if indicator.isAnimating {
            indicator.stopAnimating()
        }
        
        if stackView.arrangedSubviews.contains(indicator) {
            stackView.removeArrangedSubview(indicator)
        }
        if stackView.arrangedSubviews.contains(statusLabel) {
            stackView.removeArrangedSubview(statusLabel)
        }
        
        stackView.isHidden = true
    }
}

