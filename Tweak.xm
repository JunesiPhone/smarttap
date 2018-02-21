static bool isUpsideDown;

%hook SBTapToWakeController
- (void)tapToWakeDidRecognize:(id)arg1{
	if(!isUpsideDown){
		%orig;
	}
}
%end

%hook SBIdleTimerGlobalCoordinator //11.1.2
- (void)pocketStateMonitor:(id)arg1 pocketStateDidChangeFrom:(long long)arg2 to:(long long)arg3{
	if(arg3 == 2){
		isUpsideDown = YES;
	}
	if(arg3 == 0){
		isUpsideDown = NO;
	}
	%orig;
}
%end
