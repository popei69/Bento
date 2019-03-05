import UIKit
import Bento
import StyleSheets

extension Component {
    public final class EmptySpace: Renderable {
        private let height: CGFloat
        private let styleSheet: ViewStyleSheet<UIView>

        public init(height: CGFloat, styleSheet: ViewStyleSheet<UIView> = .init()) {
            self.height = height
            self.styleSheet = styleSheet
        }

        public func render(in view: BaseView) {
            styleSheet.apply(to: view)
        }
    }
}
