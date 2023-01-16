import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTapApiButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ApiViewController") as? ApiViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
