//
//  mainViewController.h
//  customSectionHeaders&FootersOnUITableView
//
//  Created by maliy on 11/27/10.
//  Copyright 2010 interMobile. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface mainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
	UITableView *tv;
	
	UIView *headerView;
	UIView *footerView;
}

@end
