public protocol ScreenLifecycleObserving {
    func send(_ event: ScreenLifecycleEvent)
}

public struct ScreenLifecycleEvent {
    public let status: Status
    public let isBeingPresentedInitially: Bool
    public let isBeingRemovedIndefinitely: Bool

    public init(status: Status,
                isBeingPresentedInitially: Bool,
                isBeingRemovedIndefinitely: Bool) {
        self.status = status
        self.isBeingPresentedInitially = isBeingPresentedInitially
        self.isBeingRemovedIndefinitely = isBeingRemovedIndefinitely
    }

    public enum Status {
        /// The screen is about to be added to a view hierarchy.
        case willAppear

        /// The screen has been added to a view hierarchy. This need not
        /// happen at the exact moment the addition had happened — it could be
        /// triggered at the end of an animated transition, for example.
        case didAppear

        /// The screen is about to be added to a view hierarchy.
        case willDisappear

        /// The screen has been removed from a view hierarchy. This need not
        /// happen at the exact moment the removal had happened — it could be
        /// triggered at the end of an animated transition, for example.
        case didDisappear
    }
}
