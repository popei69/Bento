import Bento

public final class BoxTableViewAdapter<SectionId: Hashable, RowId: Hashable>
    : TableViewAdapterBase<SectionId, RowId>,
      UITableViewDataSource,
      UITableViewDelegate {
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        copyLayoutMargins(from: tableView, to: cell.contentView)
        return cell
    }

    override public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let view = super.tableView(tableView, viewForHeaderInSection: section) {
            let view = unsafeDowncast(view, to: UITableViewHeaderFooterView.self)
            copyLayoutMargins(from: tableView, to: view.contentView)
            return view
        }
        return nil
    }

    override public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let view = super.tableView(tableView, viewForFooterInSection: section) {
            let view = unsafeDowncast(view, to: UITableViewHeaderFooterView.self)
            copyLayoutMargins(from: tableView, to: view.contentView)
            return view
        }
        return nil
    }

    private func copyLayoutMargins(from tableView: UITableView, to view: UIView) {
        view.preservesSuperviewLayoutMargins = false
        view.layoutMargins = UIEdgeInsets(top: 0,
                                          left: tableView.layoutMargins.left,
                                          bottom: 0,
                                          right: tableView.layoutMargins.right)
    }
}

extension UITableView {
    fileprivate var separatorHeight: CGFloat {
        return separatorStyle != .none ? 1.0 / contentScaleFactor : 0.0
    }
}
