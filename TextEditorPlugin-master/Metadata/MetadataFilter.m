#import "MetadataFilter.h"
#import "DCMObject.h"
#import "DCMAttribute.h"
#import "DCMAttributeTag.h"


@implementation MetadataFilter

- (void) initPlugin
{
    
}

-(void)metaDataTag:(NSString *)dicomTag extractTag:(NSString **)val
{
    NSArray * pixList = [viewerController pixList: 0];
    long curSlice = [[viewerController imageView] curImage];
    DCMPix * curPix = [pixList objectAtIndex: curSlice];
    NSString * file_path = [curPix sourceFile];
    DCMObject * dcmObj = [DCMObject objectWithContentsOfFile:file_path decodingPixelData:NO];
    DCMAttributeTag * tag = [DCMAttributeTag tagWithName:dicomTag];
    

    if (!tag)
        tag = [DCMAttributeTag tagWithTagString:dicomTag];
    
    
    DCMAttribute * attr;
    if (tag && tag.group && tag.element)
    {
        attr = [dcmObj attributeForTag:tag];
        
        *val = [[attr value] description];
    }
}

- (IBAction)saveLocal:(id)sender
{
    NSString * val2;
    [self metaDataTag:@"0020,000d" extractTag:&val2];
    
    NSArray *paths4 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory4 = [paths4 objectAtIndex:0];
    NSString * str11 = [documentsDirectory4 stringByAppendingString:@"/OsirixFiles/"];
    NSString * str3 = [str11 stringByAppendingString:val2];
    NSString * str4 = [str3 stringByAppendingString:@"1"];
    rezultatPath = [str4 stringByAppendingString:@".html"];
            
    NSArray *paths5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory5 = [paths5 objectAtIndex:0];
    NSString * str12 = [documentsDirectory5 stringByAppendingString:@"/OsirixFiles/"];
    NSString * str6 = [str12 stringByAppendingString:val2];
    NSString * str7 = [str6 stringByAppendingString:@"2"];
    concluziiPath = [str7 stringByAppendingString:@".html"];
    
    NSTextView * rezultatLabel = [mainWindow getResultTextView];
    NSMutableAttributedString *s = [rezultatLabel.attributedString mutableCopy];
    NSDictionary *documentAttributes = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSData *htmlData = [s dataFromRange:NSMakeRange(0, s.length) documentAttributes:documentAttributes error:NULL];
    NSString *htmlString = [[NSString alloc] initWithData:htmlData encoding:NSUTF8StringEncoding];
    [htmlString writeToFile:rezultatPath atomically:YES encoding:NSASCIIStringEncoding error:nil];
    
    NSTextView * concluziiLabel = [mainWindow getConclusionTextView];
    NSMutableAttributedString *s1 = [concluziiLabel.attributedString mutableCopy];
    NSDictionary *documentAttributes1 = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSData *htmlData1 = [s dataFromRange:NSMakeRange(0, s1.length) documentAttributes:documentAttributes1 error:NULL];
    NSString *htmlString1 = [[NSString alloc] initWithData:htmlData1 encoding:NSUTF8StringEncoding];
    [htmlString1 writeToFile:concluziiPath atomically:YES encoding:NSASCIIStringEncoding error:nil];
}

- (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error
{
    
    NSError __block *err = NULL;
    NSData __block *data;
    BOOL __block reqProcessed = false;
    NSURLResponse __block *resp;
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable _data, NSURLResponse * _Nullable _response, NSError * _Nullable _error) {
        resp = _response;
        err = _error;
        data = _data;
        reqProcessed = true;
    }] resume];
    
    *response = resp;
    *error = err;
    return data;
}



- (NSString*)base64forData:(NSData*)theData {
    
    const uint8_t* input = (const uint8_t*)[theData bytes];
    NSInteger length = [theData length];
    
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    
    NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t* output = (uint8_t*)data.mutableBytes;
    
    NSInteger i;
    for (i=0; i < length; i += 3) {
        NSInteger value = 0;
        NSInteger j;
        
        for (j = i; j < (i + 3); j++) {
            value <<= 8;
            
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
        
        NSInteger theIndex = (i / 3) * 4;
        output[theIndex + 0] = table[(value >> 18) & 0x3F];
        output[theIndex + 1] = table[(value >> 12) & 0x3F];
        output[theIndex + 2] = (i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
        output[theIndex + 3] = (i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
    }
    
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
}



- (IBAction)savej:(id)sender
{
    
  
    NSTextView * concluziiLabel = [mainWindow getResultTextView];
    NSTextView * rezultatLabel = [mainWindow getConclusionTextView];
    
    NSString * val1, *val2, *val3, *val4, *val5, *val6, *val7, *val8, *val9, * val10, *val11, *val12, *val13, *val14, *val15, *val16, *val17, *val18, *val19, *val20, *val21, *val22, *val23, *val24, *val25,*val26, *val27;
    val1=val2=val3=val4=val5=val6=val7=val8=val9=val10=val11=val12=val13=val14=val15=val16=val17=val18=val19=val20=val21=val22=val23=val24=val25=val26=val27=@"";
    [self metaDataTag:@"0010,0020" extractTag:&val1];
    [self metaDataTag:@"0010,0010" extractTag:&val2];
    [self metaDataTag:@"0010,0030" extractTag:&val3];
    [self metaDataTag:@"0010,0040" extractTag:&val4];
    [self metaDataTag:@"0010,2160" extractTag:&val5];
    [self metaDataTag:@"0010,4000" extractTag:&val6];
    [self metaDataTag:@"0020,000d" extractTag:&val7];
    [self metaDataTag:@"0020,0010" extractTag:&val8];
    [self metaDataTag:@"0008,0020" extractTag:&val9];
    [self metaDataTag:@"0008,0030" extractTag:&val10];
    [self metaDataTag:@"0008,0050" extractTag:&val11];
    [self metaDataTag:@"0008,1030" extractTag:&val12];
    [self metaDataTag:@"0010,0010" extractTag:&val13];
    [self metaDataTag:@"0010,1020" extractTag:&val14];
    [self metaDataTag:@"0010,1030" extractTag:&val15];
    [self metaDataTag:@"0010,2180" extractTag:&val16];
    [self metaDataTag:@"0008,1060" extractTag:&val17];
    [self metaDataTag:@"0008,1080" extractTag:&val18];
    [self metaDataTag:@"0010,21b0" extractTag:&val19];
    [self metaDataTag:@"4008,010c" extractTag:&val20];
    [self metaDataTag:@"0008,0090" extractTag:&val21];
    [self metaDataTag:@"0020,0010" extractTag:&val22];
    [self metaDataTag:@"0008,0056" extractTag:&val23];
    [self metaDataTag:@"0020,000e" extractTag:&val24];
    
    if([val1 length]==0)
        val1 = @"";
    if([val2 length]==0)
        val2 = @"";
    if([val3 length]==0)
        val3 = @"";
    if([val4 length]==0)
        val4 = @"";
    if([val5 length]==0)
        val5 = @"";
    if([val6 length]==0)
        val6 = @"";
    if([val7 length]==0)
        val7 = @"";
    if([val8 length]==0)
        val8 = @"";
    if([val9 length]==0)
        val9 = @"";
    if([val10 length]==0)
        val10 = @"";
    if([val11 length]==0)
        val11 = @"";
    if([val12 length]==0)
        val12 = @"";
    if([val13 length]==0)
        val13 = @"";
    if([val14 length]==0)
        val14 = @"";
    if([val15 length]==0)
        val15 = @"";
    if([val16 length]==0)
        val16 = @"";
    if([val17 length]==0)
        val17 = @"";
    if([val18 length]==0)
        val18 = @"";
    if([val19 length]==0)
        val19 = @"";
    if([val20 length]==0)
        val20 = @"";
    if([val21 length]==0)
        val21 = @"";
    if([val22 length]==0)
        val22 = @"";
    if([val23 length]==0)
        val23 = @"";
    if([val24 length]==0)
        val24 = @"";
    
    
    NSAttributedString *labels = [rezultatLabel.attributedString mutableCopy];
    NSDictionary *documentAttributesLabels = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSData *htmlDataLabels = [labels dataFromRange:NSMakeRange(0, labels.length) documentAttributes:documentAttributesLabels error:NULL];
    NSString *htmlStringLabels = [[NSString alloc] initWithData:htmlDataLabels encoding:NSUTF8StringEncoding];
    
    NSAttributedString *conclusions = [concluziiLabel.attributedString mutableCopy];
    NSDictionary *documentAttributesConclusions = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSData *htmlDataConclusions = [conclusions dataFromRange:NSMakeRange(0, conclusions.length) documentAttributes:documentAttributesConclusions error:NULL];
    NSString *htmlStringConclusions = [[NSString alloc] initWithData:htmlDataConclusions encoding:NSUTF8StringEncoding];
    
    NSString * identificatorOsirix = [self serialNumber];//@"B022B274-DD16-E811-80C9-009C02B37B9A";// [self serialNumber];
    NSMutableDictionary *jsonDictionary = [[NSMutableDictionary alloc]init];
    [jsonDictionary setValue:[NSArray arrayWithObjects:val1,val2,val3,val4,val5,val6,val7,val8,val9,val10,val11,val12,val13,val14,val15,val16,val17,val18,val19,val20,val21,val22,val23,val24,val25,val26,val27,nil] forKey:@"Tags"];
    [jsonDictionary setValue:htmlStringLabels forKey:@"Rezultat"];
    [jsonDictionary setValue:htmlStringConclusions forKey:@"Concluzii"];
    [jsonDictionary setValue:identificatorOsirix forKey:@"IdentificatorOsirix"];
    
    
    NSError * error = nil;
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary options:NSJSONReadingMutableContainers error:&error];

    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths4 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory4 = [paths4 objectAtIndex:0];
    NSString * str11 = [documentsDirectory4 stringByAppendingString:@"/OsirixFiles/"];
    NSString * str3 = [str11 stringByAppendingString:@"FisierStudiu.json"];
    if ([fileManager fileExistsAtPath:str3])
    {
        [jsonData writeToFile:str3 options:NSDataWritingAtomic error:nil];
    }
    else
    {
        [[NSFileManager defaultManager] createFileAtPath:str3
                                                contents:jsonData
                                              attributes:nil];
    }
    
    //NSString * adressa =@"https://www.medicalimaging.ro/cloud/services/webapi/osirix/encapsulatepdf";
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.245:8091/webapi/Osirix/EncapsulatePDF"];
    //NSURL *url = [NSURL URLWithString:adressa];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    //[self writeInLog:adressa];
    
    if ([jsonData length]>0)
    {
        [urlRequest setHTTPMethod:@"POST"];
        [urlRequest setValue:@"octet/stream" forHTTPHeaderField:@"Accept"];
        [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [urlRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
        [urlRequest setHTTPBody: jsonData];
    }
    __block int ok =0 ;
    __block NSMutableString * errorM=[[NSMutableString alloc] initWithString:@""];
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          
          NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
          NSDictionary *forJSONObject = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:kNilOptions
                                                                          error:nil];
        
          
          if(httpResponse.statusCode == 200)
          {
              NSMutableString *errorMessage = [forJSONObject[@"ErrorMessage"] mutableCopy];
              
              if([errorMessage isEqualToString:@""])
              {
                  
                  NSData *byteArrayFrom64 = [[NSData alloc] initWithBase64EncodedString:forJSONObject[@"SuccessData"] options:1];
                  NSArray *paths5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                  NSString *documentsDirectory5 = [paths5 objectAtIndex:0];
                  NSString * str12 = [documentsDirectory5 stringByAppendingString:@"/Horos Data/INCOMING.noindex/"];
                  
                  NSString * str4 = [str12 stringByAppendingString:val2];
                  
                  NSString * str5 = [str4 stringByAppendingString:@" "];
                  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                  [formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
                  
                  NSDate *currentDate = [NSDate date];
                  NSString *dateString = [formatter stringFromDate:currentDate];
                  
                  NSString * str13 = [str5 stringByAppendingString:dateString];
                  NSString * dicomName = [str13 stringByAppendingString:@".dcm"];
                  
                  
                  
                  if ([fileManager fileExistsAtPath:str4])
                  {
                      [byteArrayFrom64 writeToFile:dicomName options:NSDataWritingAtomic error:nil];
                  }
                  else
                  {
                      [[NSFileManager defaultManager] createFileAtPath:dicomName
                                                              contents:byteArrayFrom64
                                                            attributes:nil];
                  }
                  
                  ok = 1;
              }
              
              
              else
              {
                  errorM = errorMessage;
              }
              
          }
          
          
          dispatch_semaphore_signal(sema);
          
      }]  resume];
    

    
    while(dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER));
   
    
    if(ok == 1)
    {
        [self showSimpleInformationalAlert];
    }
    
    else
    {
        [self showSimpleCriticalAlert:errorM];
    }
    
    
  

}

- (NSString *)serialNumber
{
    io_service_t    platformExpert = IOServiceGetMatchingService(kIOMasterPortDefault,
                                                                 
                                                                 IOServiceMatching("IOPlatformExpertDevice"));
    CFStringRef serialNumberAsCFString = NULL;
    
    if (platformExpert) {
        serialNumberAsCFString = IORegistryEntryCreateCFProperty(platformExpert,
                                                                 CFSTR(kIOPlatformSerialNumberKey),
                                                                 kCFAllocatorDefault, 0);
        IOObjectRelease(platformExpert);
    }
    
    NSString *serialNumberAsNSString = nil;
    if (serialNumberAsCFString) {
        serialNumberAsNSString = [NSString stringWithString:(NSString *)serialNumberAsCFString];
        CFRelease(serialNumberAsCFString);
    }
    
    return serialNumberAsNSString;
}

-(void)createButton:(NSButton *)button createButtonFont:(NSString *)buttonFont createButtonTitle:(NSString *)buttonTitle
{
    [button setButtonType:NSButtonTypeMomentaryPushIn];
    [button setBezelStyle:NSBezelStyleRounded];
    [button setTitle:buttonTitle];
    [button setTarget:self];
}

- (long) filterImage:(NSString*) menuName
{
    NSUInteger windowStyle = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable;
    NSRect windowRect = NSMakeRect(700,700,700,740);
    NSWindow * window = [[NSWindow alloc] initWithContentRect: windowRect styleMask:windowStyle backing:NSBackingStoreBuffered defer:NO];
    mainWindow = [[MainWindow alloc] initWithName:window];
    [mainWindow main];
    
    NSFontManager *fontManager = [NSFontManager sharedFontManager];
    NSFont * fontButtons = [fontManager fontWithFamily:@"Avenir" traits:NSBoldFontMask weight:0 size:15];
    
    NSRect frameLocalSave = NSMakeRect(0, 655, 130, 50);
    saveLocalButton = [[NSButton alloc]initWithFrame:frameLocalSave];
    [self createButton:saveLocalButton createButtonFont:@"boldItalic" createButtonTitle:@"Local Save"];
    [saveLocalButton setFont:fontButtons];
    [saveLocalButton setContentTintColor:[NSColor blackColor]];
    [saveLocalButton setAction:@selector(saveLocal:)];
    
    NSRect frameConvertToDicom = NSMakeRect(126, 655, 159, 50);
    convertToDicomButton = [[NSButton alloc]initWithFrame:frameConvertToDicom];
    [self createButton:convertToDicomButton createButtonFont:@"boldItalic" createButtonTitle:@"Convert to DICOM"];
    [convertToDicomButton setFont:fontButtons];
    [convertToDicomButton setContentTintColor:[NSColor blackColor]];
    [convertToDicomButton setAction:@selector(savej:)];
    [convertToDicomButton setToolTip:@"Convert result to DICOM file and attach it to the current study"];
    [saveLocalButton setToolTip:@"Save result to local file system"];


    
    [[window contentView] addSubview:saveLocalButton];
    [[window contentView] addSubview:convertToDicomButton];
    [window makeKeyAndOrderFront:nil];
    
    NSString * val1, *val2, *val3, *val4, *val5, *val6, *val7, *val8, *val9, * val10, *val11, *val12, *val13, *val14, *val15;
    [self metaDataTag:@"0010,0020" extractTag:&val1];
    [self metaDataTag:@"0010,0010" extractTag:&val2];
    [self metaDataTag:@"0010,0030" extractTag:&val3];
    [self metaDataTag:@"0010,0040" extractTag:&val4];
    [self metaDataTag:@"0010,4000" extractTag:&val5];
    [self metaDataTag:@"0020,000d" extractTag:&val6];
    [self metaDataTag:@"0020,0010" extractTag:&val7];
    [self metaDataTag:@"0008,0020" extractTag:&val8];
    [self metaDataTag:@"0008,0030" extractTag:&val9];
    [self metaDataTag:@"0008,0050" extractTag:&val10];
    [self metaDataTag:@"0008,1030" extractTag:&val11];
    [self metaDataTag:@"0010,1020" extractTag:&val12];
    [self metaDataTag:@"0010,0030" extractTag:&val13];
    [self metaDataTag:@"0008,0090" extractTag:&val14];
    [self metaDataTag:@"0020,0010" extractTag:&val15];
    
    NSTextView * concluziiLabel = [mainWindow getConclusionTextView];
    NSTextView * rezultatLabel = [mainWindow getResultTextView];
    
    NSFileManager* fm = [NSFileManager new];
    
    NSArray *paths3 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory3 = [paths3 objectAtIndex:0];
    NSString * str9 = [documentsDirectory3 stringByAppendingString:@"/OsirixFiles"];
    BOOL isDir;
    BOOL exists = [fm fileExistsAtPath:str9 isDirectory:&isDir];
    if (exists)
    {
        /* file exists */
        if (isDir)
        {
            /* file is a directory */
            NSArray *paths4 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory4 = [paths4 objectAtIndex:0];
            NSString * str11 = [documentsDirectory4 stringByAppendingString:@"/OsirixFiles/"];
            NSString * str3 = [str11 stringByAppendingString:val6];
            NSString * str4 = [str3 stringByAppendingString:@"1"];
            rezultatPath = [str4 stringByAppendingString:@".html"];
            
            NSArray *paths5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory5 = [paths5 objectAtIndex:0];
            NSString * str12 = [documentsDirectory5 stringByAppendingString:@"/OsirixFiles/"];
            NSString * str6 = [str12 stringByAppendingString:val6];
            NSString * str7 = [str6 stringByAppendingString:@"2"];
            concluziiPath = [str7 stringByAppendingString:@".html"];
            
            NSFileManager *fileManager = [NSFileManager defaultManager];
            if ([fileManager fileExistsAtPath:rezultatPath])
            {
                NSString *myFile = [[NSString alloc]initWithContentsOfFile:rezultatPath encoding:NSUTF8StringEncoding error:nil];
                //[rezultatLabel setString:myFile];
                NSAttributedString *stringWithHTMLAttributes = [[NSAttributedString alloc] initWithData:[myFile dataUsingEncoding:NSUTF8StringEncoding]
                                                                                                options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                                                          NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                                                                     documentAttributes:nil error:nil];
                
                [rezultatLabel.textStorage setAttributedString:stringWithHTMLAttributes];
                
                
            
            }
            else
            {
                [[NSFileManager defaultManager] createFileAtPath:rezultatPath contents:nil attributes:nil];
            }
            if ([fileManager fileExistsAtPath:concluziiPath])
            {
                NSString *myFile = [[NSString alloc]initWithContentsOfFile:concluziiPath encoding:NSUTF8StringEncoding error:nil];
                //[rezultatLabel setString:myFile];
                NSAttributedString *stringWithHTMLAttributes = [[NSAttributedString alloc] initWithData:[myFile dataUsingEncoding:NSUTF8StringEncoding]
                                                                                                options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                                                          NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                                                                     documentAttributes:nil error:nil];
                
                [concluziiLabel.textStorage setAttributedString:stringWithHTMLAttributes];
                
            }
            
            else
            {
                
                [[NSFileManager defaultManager] createFileAtPath:concluziiPath
                                                        contents:nil
                                                      attributes:nil];
                
                
                
            }
            
        }
    }
    
    else
    {
        NSError* err = nil;
        NSURL* docsurl =
        [fm URLForDirectory:NSDocumentDirectory
                   inDomain:NSUserDomainMask appropriateForURL:nil
                     create:YES error:&err];
        // error checking omitted
        NSURL* myfolder = [docsurl URLByAppendingPathComponent:@"OsirixFiles"];
        [fm createDirectoryAtURL:myfolder
     withIntermediateDirectories:YES attributes:nil error:&err];
        // error-checking omitted
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString * str1 = [documentsDirectory stringByAppendingString:@"/OsirixFiles/"];
        NSString * str3 = [str1 stringByAppendingString:val2];
        NSString * str4 = [str3 stringByAppendingString:@"1"];
        rezultatPath = [str4 stringByAppendingString:@".html"];
        
        NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory1 = [paths1 objectAtIndex:0];
        NSString * str2 = [documentsDirectory1 stringByAppendingString:@"/OsirixFiles/"];
        NSString * str6 = [str2 stringByAppendingString:val2];
        NSString * str7 = [str6 stringByAppendingString:@"2"];
        concluziiPath = [str7 stringByAppendingString:@".html"];
        [[NSFileManager defaultManager] createFileAtPath:rezultatPath
                                                contents:nil
                                              attributes:nil];
        [[NSFileManager defaultManager] createFileAtPath:concluziiPath
                                                contents:nil
                                              attributes:nil];
        
    }
    
    
    return 0;
    
}

-(void)showSimpleCriticalAlert:(NSString *)errorMessage
{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:@"Alert"];
    [alert setInformativeText:errorMessage];
    [alert setAlertStyle:NSAlertStyleCritical];
    [alert runModal];
}

-(void)showSimpleInformationalAlert
{
    NSString * val2;
    [self metaDataTag:@"0010,0010" extractTag:&val2];
    
    NSArray *paths5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory5 = [paths5 objectAtIndex:0];
    NSString * str12 = [documentsDirectory5 stringByAppendingString:@"/OsirixFiles/"];
    
    NSString * str4 = [str12 stringByAppendingString:val2];
    
    NSString * str5 = [str4 stringByAppendingString:@" "];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    
    NSDate *currentDate = [NSDate date];
    NSString *dateString = [formatter stringFromDate:currentDate];
    
    NSString * str13 = [str5 stringByAppendingString:dateString];
    NSString * dicomName = [str13 stringByAppendingString:@".dcm"];
    
    NSString * pathToDicom = [@"The result was successfully converted to DICOM \nPath: " stringByAppendingString:dicomName];
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:@"Converted Successfully"];
    [alert setInformativeText:pathToDicom];
    [alert setAlertStyle:NSAlertStyleInformational];
    [alert runModal];
}

@end
