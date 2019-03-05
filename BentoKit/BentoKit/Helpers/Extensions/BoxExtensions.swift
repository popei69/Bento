import Bento

extension Box {
    public func tableViewHeightBoundTo(width: CGFloat, inheritedMargins: UIEdgeInsets) -> CGFloat {
        return sections.reduce(into: 0) { height, section in
            height += section.tableViewHeightBoundTo(width: width, inheritedMargins: inheritedMargins)
        }
    }
}

extension Section {
    public func tableViewHeightBoundTo(width: CGFloat, inheritedMargins: UIEdgeInsets) -> CGFloat {
        return footerHeightBoundTo(width: width, inheritedMargins: inheritedMargins)
            + headerHeightBoundTo(width: width, inheritedMargins: inheritedMargins)
            + items.reduce(0) { height, row in
                height + row.heightBoundTo(width: width, inheritedMargins: inheritedMargins)
        }
    }

    fileprivate func footerHeightBoundTo(width: CGFloat, inheritedMargins: UIEdgeInsets) -> CGFloat {
        return componentSize(of: .footer, fittingWidth: width, inheritedMargins: inheritedMargins)?.height ?? 0
    }

    fileprivate func headerHeightBoundTo(width: CGFloat, inheritedMargins: UIEdgeInsets) -> CGFloat {
        return componentSize(of: .header, fittingWidth: width, inheritedMargins: inheritedMargins)?.height ?? 0
    }
}

extension Node {
    fileprivate func heightBoundTo(width: CGFloat, inheritedMargins: UIEdgeInsets) -> CGFloat {
        return sizeBoundTo(width: width).height
    }
}
