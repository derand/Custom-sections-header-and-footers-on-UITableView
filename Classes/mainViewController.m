//
//  mainViewController.h
//  customSectionHeaders&FootersOnUITableView
//
//  Created by maliy on 11/27/10.
//  Copyright 2010 interMobile. All rights reserved.
//

#import "mainViewController.h"

@interface mainViewController ()
@property (nonatomic, retain) UITableView *tv;
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIView *footerView;
@end



@implementation mainViewController
@synthesize tv;
@synthesize headerView, footerView;

#pragma mark lifeCycle

- (id) init
{
	if (self = [super init])
	{
	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}


#pragma mark tableView delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	UITableViewCell *rv = nil;
	
	static NSString *cellID = @"test_ID";
	rv = [tableView dequeueReusableCellWithIdentifier:cellID];
	if (rv == nil)
	{
		rv = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
	}
	rv.selectionStyle = UITableViewCellSelectionStyleBlue;
	rv.textLabel.text = NSLocalizedString(@"cell", @"");
	rv.textLabel.textAlignment = UITextAlignmentCenter;
	
	return rv;
}

- (void) deselect
{
	[tv deselectRowAtIndexPath:[tv indexPathForSelectedRow] animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self performSelector:@selector(deselect) withObject:nil afterDelay:.5];
	
}

- (UIView *) tableView:(UITableView *) tableView viewForHeaderInSection:(NSInteger) section
{
	return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return headerView.frame.size.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
	return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
	return footerView.frame.size.height;
}


#pragma mark -

- (void) viewDidAppear:(BOOL) animated
{
}

- (void) viewDidDisappear:(BOOL) animated
{
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation
{
	return YES;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
	[super loadView];
	
	self.navigationItem.title = NSLocalizedString(@"Header/Footer test", @"");
	
	CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	
	UIView *contentView = [[UIView alloc] initWithFrame:screenRect];
	contentView.autoresizesSubviews = YES;
	contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	contentView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
	
	self.view = contentView;
	[contentView release];

	CGRect rct;
	headerView = [[UIView alloc] initWithFrame:CGRectZero];
	headerView.backgroundColor = [UIColor clearColor];
	UIImage *img = [UIImage imageNamed:@"apple.png"];
	UIImageView *tmpImgView = [[UIImageView alloc] initWithImage:img];
	rct = CGRectMake(screenRect.size.width*.05, 0.0, img.size.width, img.size.height);
	tmpImgView.frame = rct;
	[headerView addSubview:tmpImgView];
	rct.origin.x = 0.0;
	rct.size = CGSizeMake(screenRect.size.width, rct.size.height);
	headerView.frame = rct;
	[tmpImgView release];

	footerView = [[UIView alloc] initWithFrame:CGRectZero];
	footerView.backgroundColor = [UIColor clearColor];
	img = [UIImage imageNamed:@"eve.png"];
	tmpImgView = [[UIImageView alloc] initWithImage:img];
	rct = CGRectMake(screenRect.size.width-screenRect.size.width*.05-img.size.height, 0.0, img.size.width, img.size.height);
	tmpImgView.frame = rct;
	[footerView addSubview:tmpImgView];
	rct.origin.x = 0.0;
	rct.size = CGSizeMake(screenRect.size.width, rct.size.height);
	footerView.frame = rct;
	[tmpImgView release];
	
	
	tv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
	tv.delegate = self;
	tv.dataSource = self;
	tv.autoresizesSubviews = YES;
	tv.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:tv];
	
	
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	
	self.headerView = nil;
	self.footerView = nil;
	self.tv = nil;
	
}



@end
