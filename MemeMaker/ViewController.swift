import UIKit

class ViewController: UIViewController {
    
    // セグメントコントロール
    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    
    // キャプション用ラベル
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    let topChoices = [
        CaptionOption(emoji: "🕶", caption: "You know what's cool?"),
        CaptionOption(emoji: "💥", caption: "You know what makes me mad?"),
        CaptionOption(emoji: "💕", caption: "You know what I love?")
    ]
    
    let bottomChoices = [
        CaptionOption(emoji: "🐱", caption: "Cats wearing hats"),
        CaptionOption(emoji: "🐕", caption: "Dogs carrying logs"),
        CaptionOption(emoji: "🐒", caption: "Monkeys being funky")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 上部セグメントコントロールを初期化 */
        topCaptionSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji,
                                                     at: topChoices.count,
                                                     animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        
        /* 下部セグメントコントロールを初期化 */
        bottomCaptionSegmentedControl.removeAllSegments()
        for bottomChoice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: bottomChoice.emoji,
                                                        at: bottomChoices.count,
                                                        animated: false)
        }
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        
        updateLabels()
    }
    
    // 選択値を変更したら
    @IBAction func didChangeSelectedValue(_ sender: AnyObject) {
        updateLabels()
    }
    
    // ラベル表示を更新する
    func updateLabels() {
        // 選択済みセグメントのインデックスを取得
        let topSelectedIndex = topCaptionSegmentedControl.selectedSegmentIndex
        let bottomSelectedIndex = bottomCaptionSegmentedControl.selectedSegmentIndex
        
        // 取得したインデックスを指定してキャプション配列から内容を取得
        topCaptionLabel.text = topChoices[topSelectedIndex].caption
        bottomCaptionLabel.text = bottomChoices[bottomSelectedIndex].caption
    }
}
