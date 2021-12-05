#pragma once
#define MainWindow_h

@interface MainWindow : NSObject
{
    IBOutlet NSWindow * mainWindow;
    IBOutlet NSTextView * resultTextView;
    IBOutlet NSTextField * resultHeader;
    IBOutlet NSTextView * conclusionsTextView;
    IBOutlet NSTextField * conclusionsHeader;
    IBOutlet NSScrollView * resultScrollView;
    IBOutlet NSScrollView * conclusionsScrollView;
}

-(instancetype)initWithName:(NSWindow *)_mainWindow;

-(NSTextView *)getResultTextView;

-(NSTextView *)getConclusionTextView;

-(void)createTextFieldHeader:(NSTextField *)textFieldHeader;

-(void)createScrollView:(NSScrollView *)scrollView createTextView:(NSTextView *)textView;

-(NSWindow *)getWindow;

-(void)main;

@end

