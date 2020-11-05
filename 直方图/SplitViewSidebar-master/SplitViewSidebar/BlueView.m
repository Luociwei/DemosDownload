#import "BlueView.h"

@implementation BlueView

- (void)drawRect:(NSRect)dirtyRect {
    NSRect bounds = [self bounds] ;
    [[NSColor colorWithCalibratedRed:240 green:240 blue:240 alpha:0.3] set] ;
    [NSBezierPath fillRect: bounds] ;

    [super drawRect:dirtyRect] ;
}

@end
