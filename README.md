shiplib-ios-activity
====================

iOS native sharing UIActivity for Sincerely's Ship Framework


```
// intialize the activity
ActivityPostcard *postcardActivity = [[ActivityPostcard alloc] init];

// set the image
NSArray *activityItems = @[postcardImage];

// create the activty controller
UIActivityViewController* activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:@[postcardActivity]];

// present the activty controller
[self presentViewController:activityController animated:YES completion:nil];

// handle outcome
[activityController setCompletionHandler:^(NSString *activityType, BOOL completed) {

}];
```