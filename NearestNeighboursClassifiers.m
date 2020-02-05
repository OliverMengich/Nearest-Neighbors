%KNN classifiers. 
% you use the fitcknn function which returns a classification model
load fisheriris
KnnModel = fitcknn(meas,species,'NumNeighbors',3);
KnnModel.ClassNames % to examine the perfomance of the model
% to test the perfomance of the model we fine the resubstitution
% error
Knn3ResubError=resubLoss(KnnModel)
% 4% of the values obtained were missclasified.
% To understand how the errors are distributed we find the confusion Matrix
% We first collect the model prediction for the availabe errors and then
% compute the confusion matrix 
PredictedValue = predict(KnnModel,meas)
ConfusionMat = confusionmat(species,PredictedValue)
% the errors are 7 and refer to the versicolor and virginica species
% confusion matrix allows you to examine the errors and the correct decisions
% made by our classifier are distributed.To estimate errors and perfomance
% of our classifiers we have to use the cross validation
% In cross validation, The available data is used as test set and training
% set. In practice, the sample is divided into groups of equal number
% One group at a time is excluded and process is repeated k times
CVModel = crossval(KnnModel)
% Now we visualise the cross validation loss which is the average loss of
% each validation loss when prediction is excecuted on data that is not
% used for training
KLossModel = kfoldLoss(CVModel)
% As shown the cross validation accuracy is very close to resubstitution
% accuracy. Hence The classification model can misclassify approximately 4%
% of new data. If new Data has about same distribution as the training data
% We choose the optimal value for K to creATE THE BEST CLASSIFication model
% Changing The values of K gives the following. it modifiers the num
% properties of the model 
KnnModel.NumNeighbors = 5;
% The model now becomes newly fitted. To see if there was an improvement in
% performance we compare the resubstitution prediction and crossvalidation
% loss with the new number of neighbors.
Knn5ResubErr = resubLoss(KnnModel);
%Now to run cross validation again and display cross validation loss
CVModel = crossval(KnnModel)
K5LossModel = kfoldLoss(CVModel)
%From the comparison of the results obtained by the two models
%The choice of K = 5 improves the perfomance of the model
% Now we recalculate the confusion  predicted Value
PredictedValue = predict(KnnModel,meas)
ConfMat = confusionmat(species , PredictedValue);
% By modifying The classifier we have reduced the chances of
% misclassification or errors which are now only 5
% Now to improve even more, The fitcknn functiion uses the euclidean
% distance to evaluate the nearest neighbor. now to change the dictance Matrix
% Specify The comma separated pair consisting of distance and a valid
% distant matrix name or function handle
% We modify the model use cosine distance insead of the euclidean
KnnModel12 = fitcknn(meas,species,'NSMethod','exhaustive','Distance','cosine','NumNeighbors',5 )
% Now we find the resubstition error
Knn5resuberror2 = resubLoss(KnnModel12);
% Now we compute The resubstitution error
Knn5resuberror2 = resubLoss(KnnModel12)
% Now collect the model prediction for the availabe data and the compute
% then confusion matrix for the new model 
PreictedValue = predict(KnnModel12,meas)
ConfMat = confusionmat(species,PredictedValue)
% By Modifing the distance Matrix we have reduced the chances of
% misclassification errors which are now only 3 in number

