import UIKit

class ViewController: UIViewController {

    let imageView = UIImageView(frame: CGRect(x: -150, y: -150, width: 300, height: 300))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        simple3DRotation()
    }
    
    private func simple3DRotation() {
        imageView.image = UIImage(named: "mycat")
        imageView.contentMode = .scaleAspectFit

        let transformLayer = CATransformLayer()
        var perspective = CATransform3DIdentity
        perspective.m34 = -1 / 700
        transformLayer.transform = perspective
        transformLayer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        transformLayer.addSublayer(imageView.layer)
        view.layer.addSublayer(transformLayer)
        
        imageView.layer.transform = CATransform3DMakeRotation(0, 0, 1, 0)
        
        let anim = CABasicAnimation(keyPath: "transform.rotation.y")
        anim.fromValue = 0
        anim.byValue = CGFloat.pi * 2
        
        anim.duration = 3
        anim.repeatCount = 10
        imageView.layer.add(anim, forKey: nil)
    }
}
