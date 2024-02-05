//
//  FlowLayout.swift
//  EMSwiftUI
//
//  Created by macbook on 05.02.2024.
//
import SwiftUI

struct FlowLayout<RefreshBinding, Data, ItemView: View>: View {
    // MARK: - Mode

    enum Mode {
        case scrollable
        case vstack
    }
    
    // MARK: - Attributes
    
    let mode: Mode
    @Binding var binding: RefreshBinding
    let items: [Data]
    let itemSpacing: CGFloat
    @ViewBuilder let viewMapping: (Data) -> ItemView
    
    @State private var totalHeight: CGFloat
    
    var body: some View {
        let stack = VStack {
            GeometryReader { geometry in
                self.content(in: geometry)
            }
        }
        
        return Group {
            if mode == .scrollable {
                stack.frame(height: totalHeight)
            } else {
                stack.frame(maxHeight: totalHeight)
            }
        }
    }
    
    // MARK: - Init

    init(mode: Mode,
         binding: Binding<RefreshBinding>,
         items: [Data],
         itemSpacing: CGFloat = 4,
         @ViewBuilder viewMapping: @escaping (Data) -> ItemView)
    {
        self.mode = mode
        _binding = binding
        self.items = items
        self.itemSpacing = itemSpacing
        self.viewMapping = viewMapping
        _totalHeight = State(initialValue: (mode == .scrollable) ? .zero : .infinity)
    }
    
    // MARK: - Methods

    private func content(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var lastHeight = CGFloat.zero
        let itemCount = items.count
        
        return ZStack(alignment: .topLeading) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                viewMapping(item)
                    .padding([.vertical, .horizontal], itemSpacing)
                    .alignmentGuide(.leading, computeValue: { d in
                        
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= lastHeight
                        }
                        
                        lastHeight = d.height
                        
                        let result = width
                        
                        if index == itemCount - 1 {
                            width = 0
                        } else {
                            width -= d.width
                        }
                        
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        
                        if index == itemCount - 1 {
                            height = 0
                        }
                        
                        return result
                    })
            }
        }
        .background(HeightReaderView(binding: $totalHeight))
    }
}

// MARK: - Height Preference Key

private struct HeightPreferenceKey: PreferenceKey {
    static func reduce(value _: inout CGFloat, nextValue _: () -> CGFloat) { }
    static var defaultValue: CGFloat = 0
}

// MARK: - Height Reader View

private struct HeightReaderView: View {
    @Binding var binding: CGFloat
    
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(
                    key: HeightPreferenceKey.self,
                    value: geo.frame(in: .local).size.height
                )
        }
        .onPreferenceChange(HeightPreferenceKey.self) { h in
            binding = h
        }
    }
}

// MARK: - Never?

extension FlowLayout where RefreshBinding == Never? {
    init(mode: Mode,
         items: [Data],
         itemSpacing: CGFloat = 4,
         @ViewBuilder viewMapping: @escaping (Data) -> ItemView) {
        self.init(mode: mode,
                  binding: .constant(nil),
                  items: items,
                  itemSpacing: itemSpacing,
                  viewMapping: viewMapping)
    }
}

