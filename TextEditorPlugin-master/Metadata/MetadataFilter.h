#pragma once
#import <Foundation/Foundation.h>
#import "PluginFilter.h"
#import "MainWindow.h"
#import "browserController.h"

@interface MetadataFilter : PluginFilter
{
    MainWindow * mainWindow;
    NSButton * saveLocalButton;
    NSButton * convertToDicomButton;
    IBOutlet NSWindow * errorWindow;
    IBOutlet NSWindow * errorAlertWindow;
    IBOutlet NSString * rezultatPath;
    IBOutlet NSString * concluziiPath;
}

-(void)createButton:(NSButton *)button createButtonFont:(NSString *)buttonFont createButtonTitle:(NSString *)buttonTitle;


-(IBAction)saveLocal:(id)sender;

-(NSString*)base64forData:(NSData*)theData;

- (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error;


-(IBAction)savej:(id)sender;

-(void)metaDataTag:(NSString *)dicomTag extractTag:(NSString **)val;

-(NSString *)serialNumber;

-(long) filterImage:(NSString*) menuName;

-(void)showSimpleCriticalAlert:(NSString *)errorMessage;

-(void)showSimpleInformationalAlert;

@end
