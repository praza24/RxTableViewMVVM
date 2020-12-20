import UIKit
import RxSwift
import RxCocoa // MARK: - This is used to bind our Observable to the TableView

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    private var viewModel: RestauarantsListViewModel!
    
    static func instantiate(with viewModel: RestauarantsListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchRestaurants()
    }
    
    func fetchRestaurants() {
        viewModel.fetchRestaurantViewModels() //Suscribe to our ViewModel via the bind operator
            .observe(on: MainScheduler.instance) // MARK: - Observes on the main thread
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
                cell.textLabel?.text = viewModel.displayText
            }
            .disposed(by: disposeBag) // MARK: - Creates a subscription to our Observable
    }
    
    func setupTableView() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
