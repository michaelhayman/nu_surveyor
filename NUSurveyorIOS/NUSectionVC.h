//
//  NUSectionVC.h
//  NUSurveyorIOS
//
//  Created by Mark Yoon on 9/26/2011.
//  Copyright 2011 NUBIC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageViewController.h"
#import "NUResponseSet.h"

@interface NUSectionVC : PageViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate, UITableViewDelegate, UITextFieldDelegate, UITextViewDelegate> {
    
}

@property (nonatomic, retain) IBOutlet UINavigationItem *bar;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) id detailItem;
@property (nonatomic, retain) NUResponseSet *responseSet;
@property (nonatomic, retain) NSMutableArray *visibleSections;
@property (nonatomic, retain) NSMutableArray *allSections;
@property (nonatomic, retain) NSMutableArray *visibleHeaders;

- (void)createHeader;
- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)anIndexPath;
+ (Class) classForQuestion:(NSDictionary *)questionOrGroup answer:(NSDictionary *)answer;

- (NSArray *) responsesForIndexPath:(NSIndexPath *)i;
- (NSManagedObject *) newResponseForIndexPath:(NSIndexPath *)i;
- (NSManagedObject *) newResponseForIndexPath:(NSIndexPath *)i Value:(NSString *)value;
- (void) deleteResponseForIndexPath:(NSIndexPath *)i;
- (void) showAndHideDependenciesTriggeredBy:(NSIndexPath *)i;

- (UIView *)tableView:(UITableView *)aTableView viewForHeaderInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView *)aTableView heightForHeaderInSection:(NSInteger)section;
@end
