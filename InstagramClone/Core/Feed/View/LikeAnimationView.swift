//
//  LikeAnimationView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 14.03.2025.
//

import SwiftUI

struct LikeAnimationView: View, Identifiable {
    
    let id = UUID()
    
    let duration: Double
    
    private let heartSize = 80.0
    
    
    var body: some View {
        GeometryReader { proxy in
            HeartImageView(size: heartSize)
                .keyframeAnimator(
                    initialValue: AnimationsValue()
                ) { content, value in
                    
                    content
                        .opacity(value.opacity)
                        .scaleEffect(value.scale)
                        .rotationEffect(value.angle)
                        .offset(x: value.horizontalOffset , y: value.verticalOffset)
                    
                } keyframes: { _ in
                    KeyframeTrack(\.opacity) {
                        LinearKeyframe(1.0, duration: duration * 0.4, timingCurve: .easeIn)
                    }
                    
                    // add keyframe for the angle
                    KeyframeTrack(\.angle) {
                        
                        let angle = Double.random(in: -45..<45)
                        
                        CubicKeyframe(.degrees(angle), duration: duration * 0.2)
                        CubicKeyframe(.degrees(-angle), duration: duration * 0.3)
                        LinearKeyframe(.degrees(.zero), duration: duration * 0.2)
                    }
                    
                    // add keyframe for the scale
                    KeyframeTrack(\.scale) {
                        CubicKeyframe(1.2, duration: duration * 0.5)
                        LinearKeyframe(1.0, duration: duration * 0.2, timingCurve: .easeOut)
                        
                        LinearKeyframe(1.0, duration: duration * 0.3)
                        LinearKeyframe(0.0, duration: 0.01, timingCurve: .circularEaseIn)
                    }
                    
                    // add keyframe for the verticalOffset
                    KeyframeTrack(\.verticalOffset) {
                        let yOffset = proxy.frame(in: .global).midY + heartSize / 2
                        LinearKeyframe(0.0, duration: duration * 0.7)
                        LinearKeyframe(-yOffset, duration: duration * 0.3, timingCurve: .easeIn)
                    }
                    
                    KeyframeTrack(\.horizontalOffset) {
                        let offset = Double.random(in: -40...40)
                        LinearKeyframe(0.0, duration: duration * 0.85)
                        LinearKeyframe(offset, duration: duration * 0.15)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

private struct AnimationsValue {
    var opacity = 0.0
    var scale = 0.0
    var angle = Angle.zero
    var verticalOffset = 0.0
    var horizontalOffset = 0.0
}

struct HeartImageView: View {
    
    let size: CGFloat
    
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: size))
            .foregroundStyle(
                .linearGradient(
                    colors: [Color(.pink), Color(.red), Color(.orange)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
    }
}

