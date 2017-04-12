years = [10,11,12,13,14];

load('all_bad_counties2.mat');

% years = [10];

areas_queried = {'42660','41860','41940','31100','41740','41620','19740','19780','19100','31540','26420'};
bad_counties = {'51515','46102','02158','02270','46113'};

% Generate the population totals for counties.

main_dir = 'C:/Users/Peter/Downloads/census data project';

% years = [10];

do_counties = 0;
do_metro_areas = 1;

clear num_rowses;
if do_counties == 1

clear county_pops;
clear break_counties;
clear county_ids;
shitty_pops = 0;
shitty_counties = 0;
    
break_counties = zeros(length(years),3143);

for year = years(1):years(end)
    year_num = year - years(1) + 1;
    cd([main_dir '/' 'incbymob/county data/pop']);
    tmp = csvimport(['ACS_' num2str(year) '_5YR_B01003_with_ann.csv']);
    
    num_rows = size(tmp,1)-2;
    num_rowses(year_num) = num_rows;
    counter =0;
    for i = 1:num_rows
        population = str2num(tmp{i+2,5});
        if isempty(population)||isnan(population)
            fprintf('oops shitty population');
            shitty_pops = shitty_pops + 1;
        end
        
        county_id = tmp{i+2,2};
        
        if isempty(county_id) || isnan(str2num(county_id))
            fprintf('oops shitty county');
            shitty_counties = shitty_counties + 1;
        end
        
        if isempty(strmatch(county_id,all_bad_counties2))
                    counter = counter + 1;

        county_pops{year_num,counter} = population;
        county_ids{year_num,counter} = county_id;
%         if year_num>1
%         if ~isequal(county_pops{year_num-1,counter}{1},county_id)
%             break_counties(year_num,counter) = 1;
%         end
%         end
        end
    end
    
end

end

% cut last two counties because otherwise doesn't work
county_ids2 = county_ids(:,1:end-2);
clear county_pops2;
clear test;
for i = 1:size(county_pops,1)
    for j= 1:size(county_pops,2)-2
    test{i,j} = county_pops{i,j};
    end
end
county_pops2 = test;



cd(main_dir);

if do_metro_areas
    

    clear list_cities;
    test =0;
    clear problems_aray;
    counter2 =0;
    clear city_pops;
    
for year = years(1):years(end)
    year_num = year - years(1) + 1;
    cd([main_dir '/' 'incbymob/metro stat area/pop']);
    tmp = csvimport(['ACS_' num2str(year) '_5YR_B01003_with_ann.csv']);
    num_rows = length(tmp);
    
    counter =0 ;
    clear all_city_ids;
    clear all_cities;
    clear all_city_pops;
    
    for i = 3:num_rows
        counter =counter +1;
        all_city_ids{counter} = tmp{i,2};
        all_cities{counter} = tmp{i,3};
        all_city_pops{counter} = tmp{i,5};
    end
        
    num_cities = length(areas_queried);
    for city_num = 1:num_cities
        fprintf('ASDFAWERADSFASDF');
        city_id = areas_queried{city_num};
        if year_num> 3 &&isequal(city_id,'31100')
            city_id = '31080';
        end
        test = strmatch(city_id,all_city_ids);
        counter2 = counter2 + 1;
        if ~isempty(test)
              matching_row = test;
%             fprintf('ok')
%             fprintf(all_cities{matching_row});
              fprintf('ok');
              list_cities{year_num,city_num} = all_cities{matching_row};
              city_pops{year_num,city_num} = str2num(all_city_pops{matching_row});
        else
            list_cities{year_num,city_num} = 'asdfasdfa';
        end
        
%         if test == 0
%             fprintf(['problem with city ' city_id 'on year ' num2str(year_num)]);
%             problems = problems + 1;
%             problems_array{year_num,city_num} = 1;
%         else
%             problems_array{year_num,city_num} = 0;
%         end
    end
    
    cd(main_dir)
    
    
end

end
        
%     num_rows = size(tmp,1)-2;
%     num_rowses(year_num) = num_rows;
%     counter =0;
%     for i = 1:num_rows
%         population = str2num(tmp{i+2,5});
%         if isempty(population)||isnan(population)
%             fprintf('oops shitty population');
%             shitty_pops = shitty_pops + 1;
%         end
%         
%         county_id = tmp{i+2,2};
%         
%         if isempty(county_id) || isnan(str2num(county_id))
%             fprintf('oops shitty county');
%             shitty_counties = shitty_counties + 1;
%         end
%         
%         if isempty(strmatch(county_id,bad_counties))
%                     counter = counter + 1;
% 
%         county_pops{year_num,counter} = {county_id,population};
%         if year_num>1
%         if ~isequal(county_pops{year_num-1,counter}{1},county_id)
%             break_counties(year_num,counter) = 1;
%         end
%         end
%         end
%     end
    

% 
% clear metarea_pops;
% clear num_rowses;


% 
% county = true;
% metarea = false;
% 
% for year = years(1):years(end)
%     year_num = year - years(1) + 1;
%     outflow_data{year_num} = csvimport(['countyoutflow' num2str(year) num2str(year+1) '.csv']);
%     inflow_data{year_num} = csvimport(['countyinflow' num2str(year) num2str(year+1) '.csv']);
% end
% 
% 
% clear bad_counties;
% clear outflow_counties;
% clear inflow_counties;
% 
% clear diffstat_inward_pop;
% clear diffstat_inward_income;
% 
% clear sstat_outward_pop;
% clear sstat_outward_income;
% clear nonmig_pop;
% clear nonmig_income;
% clear diffstat_outward_pop;
% clear diffstat_outward_income;
% 
% 
% for year = years(1):years(end)
%     year_num = year - years(1) + 1;
%     IRS_data_driver_outflow2;
%     IRS_data_driver_inflow2;
% end
% 
% 
% if size(bad_counties,1) ~= ticker
%     bad_counties(ticker) = 0;
% end





% temp = bad_counties;
% 
% if length(years) > 1
% for i = 2:length(years)
%     temp = cat(1,temp,bad_counties);
% end
% end
% 
% bad_counties = temp;
% 
% 
% diffstat_inward_popcl = diffstat_inward_pop(find(diffstat_inward_pop.*~bad_counties));
% diffstat_inward_incomecl = diffstat_inward_income(find(diffstat_inward_income.*~bad_counties));
% 
% % sstat_outward_pop = (sstat_outward_pop>=0).*(sstat_outward_pop);
% % sstat_outward_income = (sstat_outward_income>=0).*sstat_outward_income;
% 
% 
% sstat_outward_popcl = sstat_outward_pop(find(sstat_outward_pop.*~bad_counties));
% sstat_outward_incomecl = sstat_outward_income(find(sstat_outward_income.*~bad_counties));
% 
% 
% diffstat_outward_popcl = diffstat_outward_pop(find(diffstat_outward_pop.*~bad_counties));
% diffstat_outward_incomecl = diffstat_outward_income(find(diffstat_outward_income.*~bad_counties));
% 
% 
% nonmig_popcl = nonmig_pop(find(nonmig_pop.*~bad_counties));
% nonmig_incomecl = nonmig_income(find(nonmig_income.*~bad_counties));
% 
% 
% 
% avg_income_nonmig = mean(nonmig_incomecl./nonmig_popcl);
% avg_income_mig = mean(diffstat_outward_incomecl./diffstat_outward_popcl);
% avg_income_sstat_mg = mean(sstat_outward_incomecl./sstat_outward_popcl);
% 
% avg_income_sstatmig = mean(sstat_outward_incomecl./sstat_outward_popcl);