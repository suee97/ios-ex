import UIKit
import Foundation

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

struct ErrorMessage: Codable {
    let message: String
}

class ApiViewController: UIViewController {
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTapRequest(_ sender: Any) {
        getTodo()
    }
    
    private func configureView(todo: Todo) {
        self.userIdLabel.text = "\(todo.userId)"
        self.idLabel.text = "\(todo.id)"
        self.titleLabel.text = "\(todo.title)"
        self.completedLabel.text = "\(todo.completed)"
    }
    
    private func getTodo() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else { return }
        let session = URLSession(configuration: .default) // 기본 세션이 되도록 설정
        session.dataTask(with: url) { [weak self] data, response, error in // 서버로 데이터 요청, 요청 성공시 error은 nil을 반환. [weak self] : 순환참조 해결
            let successRange = (200..<305)
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
                guard let todo = try? decoder.decode(Todo.self, from: data) else { return } // decode 실패 시 에러 반환
                // 네트워크 작업은 별도의 스레드에서 진행되고 응답이 온다고 해도 자동으로 메인스레드로 돌아오지 않기때문에 completion handler closer에서 ui작업을 한다면 메인스레드에서 작업을 할 수 있도록 만들어 줘야 함
                DispatchQueue.main.async {
                    self?.configureView(todo: todo)
                }
            } else {
                guard let errorMessage = try? decoder.decode(ErrorMessage.self, from: data) else { return }
                // 에러메세지 처리
            }
        }.resume() // 작업 실행
    }
}

