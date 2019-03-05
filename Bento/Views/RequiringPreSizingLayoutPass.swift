public protocol RequiringPreSizingLayoutPass {}

extension UIView {
    private var needsPresizingLayoutPass: Bool {
        return self is RequiringPreSizingLayoutPass
            || subviews.contains(where: { $0.needsPresizingLayoutPass })
    }

    func triggerPresizingLayoutPassIfNeeded(forTargetSize size: CGSize) {
        if needsPresizingLayoutPass {
            bounds.size = CGSize(width: size.width,
                                 height: .greatestFiniteMagnitude)
            layoutIfNeeded()
        }
    }
}
