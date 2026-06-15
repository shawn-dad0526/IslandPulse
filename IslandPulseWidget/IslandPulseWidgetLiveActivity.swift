//
//  IslandPulseWidgetLiveActivity.swift
//  IslandPulseWidget
//
//  Created by 朱建鑫 on 2026/6/4.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct IslandPulseWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct IslandPulseWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: IslandPulseWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension IslandPulseWidgetAttributes {
    fileprivate static var preview: IslandPulseWidgetAttributes {
        IslandPulseWidgetAttributes(name: "World")
    }
}

extension IslandPulseWidgetAttributes.ContentState {
    fileprivate static var smiley: IslandPulseWidgetAttributes.ContentState {
        IslandPulseWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: IslandPulseWidgetAttributes.ContentState {
         IslandPulseWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: IslandPulseWidgetAttributes.preview) {
   IslandPulseWidgetLiveActivity()
} contentStates: {
    IslandPulseWidgetAttributes.ContentState.smiley
    IslandPulseWidgetAttributes.ContentState.starEyes
}
