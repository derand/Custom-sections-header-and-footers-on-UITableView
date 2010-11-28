//
//  customSectionHeaders_FootersOnUITableViewAppDelegate.h
//  customSectionHeaders&FootersOnUITableView
//
//  Created by maliy on 11/27/10.
//  Copyright 2010 interMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customSectionHeaders_FootersOnUITableViewAppDelegate : NSObject <UIApplicationDelegate> {
    
	UIWindow *window;
	UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

