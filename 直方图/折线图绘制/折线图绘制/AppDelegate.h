//
//  AppDelegate.h
//  折线图绘制
//
//  Created by AG_TigerNong on 17/3/22.
//  Copyright © 2017年 Saftop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

