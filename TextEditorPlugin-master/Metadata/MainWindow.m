#import <Foundation/Foundation.h>
#import "MainWindow.h"

@implementation MainWindow

-(instancetype)initWithName:(NSWindow *)_mainWindow
{
    self = [super init];
    
    if(self)
    {
        mainWindow = _mainWindow;
    }
    
    return self;
}

-(NSTextView *)getResultTextView
{
    return resultTextView;
}

-(NSTextView *)getConclusionTextView
{
    return conclusionsTextView;
}

-(void)createTextFieldHeader:(NSTextField *)textFieldHeader
{
    [textFieldHeader setBezeled:NO];
    [textFieldHeader setDrawsBackground:NO];
    [textFieldHeader setEditable:NO];
    [textFieldHeader setSelectable:NO];
}

-(void)createScrollView:(NSScrollView *)scrollView createTextView:(NSTextView *)textView
{
    [scrollView setBorderType:NSNoBorder];
    [scrollView setHasVerticalScroller:YES];
    [scrollView setHasHorizontalScroller:NO];
    [scrollView setAutoresizingMask:NSViewWidthSizable];
    
    NSTextContainer *textContainer = textView.textContainer;
    [textContainer setWidthTracksTextView:YES];
    [textView setMaxSize:NSMakeSize(FLT_MAX, FLT_MAX)];
    [textView setVerticallyResizable:YES];
    [textView setHorizontallyResizable:YES];
    [textView setAutoresizingMask:NSViewWidthSizable];
    
    [[textView textContainer]
     setContainerSize:NSMakeSize(305, FLT_MAX)];
    [[textView textContainer] setWidthTracksTextView:YES];
    [scrollView setDocumentView:textView];
}

-(NSWindow *)getWindow
{
    return mainWindow;
}

-(void)main
{
    resultScrollView = [[NSScrollView alloc] initWithFrame:NSMakeRect(12,255,677,380)];
    resultTextView = [[NSTextView alloc] initWithFrame:NSMakeRect(5,240,677,380)];
    resultHeader = [[NSTextField alloc] initWithFrame:NSMakeRect(12,610,100,50)];
    conclusionsScrollView = [[NSScrollView alloc] initWithFrame:NSMakeRect(12,25,677,200)];
    conclusionsTextView = [[NSTextView alloc] initWithFrame:NSMakeRect(12,25,677,200)];
    conclusionsHeader = [[NSTextField alloc] initWithFrame:NSMakeRect(12,200,100,50)];
    
    [self createTextFieldHeader:resultHeader];
    [self createTextFieldHeader:conclusionsHeader];
    [self createScrollView:resultScrollView createTextView:resultTextView];
    [self createScrollView:conclusionsScrollView createTextView:conclusionsTextView];
    
    NSFontManager *fontManager = [NSFontManager sharedFontManager];
    NSFont * textViewsHeaderFont = [fontManager fontWithFamily:@"Avenir" traits:NSBoldFontMask weight:0 size:15];
    [resultHeader setFont:textViewsHeaderFont];
    [resultHeader setStringValue:@"Rezultat"];
    [conclusionsHeader setFont:textViewsHeaderFont];
    [conclusionsHeader setStringValue:@"Concluzii"];
    
    [resultTextView setUsesInspectorBar:TRUE];
    [conclusionsTextView setUsesInspectorBar:TRUE];
    
    [[mainWindow contentView] addSubview:resultScrollView];
    [[mainWindow contentView] addSubview:resultTextView];
    [[mainWindow contentView] addSubview:conclusionsTextView];
    [[mainWindow contentView] addSubview:conclusionsScrollView];
    [[mainWindow contentView] addSubview:resultHeader];
    [[mainWindow contentView] addSubview:conclusionsHeader];
    
    [resultScrollView setDocumentView:resultTextView];
    [conclusionsScrollView setDocumentView:conclusionsTextView];
}
@end
