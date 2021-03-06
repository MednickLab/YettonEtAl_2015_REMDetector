function confuseMat = createConfusion4Class(goldStandard,singleResults)

confuseMat = zeros(4,4);
confuseMat(1,1) = sum((goldStandard==0) & (singleResults==0));
confuseMat(1,2) = sum((goldStandard==0) & (singleResults==1));
confuseMat(1,3) = sum((goldStandard==0) & (singleResults==2));
confuseMat(1,4) = sum((goldStandard==0) & (singleResults==3));

confuseMat(2,1) = sum((goldStandard==1) & (singleResults==0));
confuseMat(2,2) = sum((goldStandard==1) & (singleResults==1));
confuseMat(2,3) = sum((goldStandard==1) & (singleResults==2));
confuseMat(2,4) = sum((goldStandard==1) & (singleResults==3));

confuseMat(3,1) = sum((goldStandard==2) & (singleResults==0));
confuseMat(3,2) = sum((goldStandard==2) & (singleResults==1));
confuseMat(3,3) = sum((goldStandard==2) & (singleResults==2));
confuseMat(3,4) = sum((goldStandard==2) & (singleResults==3));

confuseMat(4,1) = sum((goldStandard==3) & (singleResults==0));
confuseMat(4,2) = sum((goldStandard==3) & (singleResults==1));
confuseMat(4,3) = sum((goldStandard==3) & (singleResults==2));
confuseMat(4,4) = sum((goldStandard==3) & (singleResults==3));

end