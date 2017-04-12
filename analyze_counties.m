num_years = size(county_pops2,1);
num_counties = size(county_pops2,2);

clear shouse_incomes2;
clear scounty_incomes2;
clear diffcounty_incomes2;
clear diffstate_incomes2;
clear county_pops3;

shouse_incomes2 = cell2mat(shouse_incomes);
scounty_incomes2 = cell2mat(scounty_incomes);
diffcounty_incomes2 = cell2mat(diffcounty_incomes);
diffstate_incomes2 = cell2mat(diffstate_incomes);
county_pops3 = cell2mat(county_pops2);

stationary_incomes2 = (shouse_incomes2 + scounty_incomes2)/2;

clear county_pop_change;
for i = 1:num_years-1
    county_pop_change(i,:) = county_pops3(i+1,:) - county_pops3(i,:);
end

avg_stationary_incomes = mean(stationary_incomes2,1);
avg_diffcounty_incomes = mean(diffcounty_incomes2,1);
avg_diffstate_incomes = mean(diffstate_incomes2,1);

avg_scounty_incomes = mean(scounty_incomes2,1);

% these averages make sense on their own terms, county by county.
total_county_pop_change = sum(county_pop_change,1);


figure;
plotid1 = scatter(1:num_counties,sort(avg_stationary_incomes),'b');
hold on;
plotid2 = scatter(1:num_counties,sort(avg_diffcounty_incomes),'o');
plotid3 = scatter(1:num_counties,sort(avg_diffstate_incomes),'r');

title('Rank order income by county by move state. Blue: stationary. Red: moved from different state.\rOrange: moved from different county.');

plotid1.SizeData = 1;
plotid2.SizeData = 1;
plotid3.SizeData = 1;


% title('Rank order income by county by move state. Blue: stationary. Red: different county in state.\rOrange: moved from different state.');
% 
%
% 
% 
% % Make second figure where dots are connected to one another sorted on
% % average stationary incomes.
% 
% [a,I] = sort(avg_stationary_incomes);
% 
% figure;
% plotid1 = scatter(1:num_counties,avg_stationary_incomes(I),'b');
% hold on;
% plotid2 = scatter(1:num_counties,avg_diffcounty_incomes(I),'r');
% plotid3 = scatter(1:num_counties,avg_diffstate_incomes(I),'o');
% 
% 
% title('Income by city by move state. Blue: stationary. Red: different county in state.\rOrange: moved from different state.');
% 
% plotid1.SizeData = 1;
% plotid2.SizeData = 1;
% plotid3.SizeData = 1;
