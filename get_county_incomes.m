years = [10,11,12,13,14];
% years = [10];
bad_counties = {'51515','46102','02158','02270','46113'};

do_county_incomes = 1;
num_bad = 0;

if do_county_incomes
    clear these_county_ids;
    clear new_bad_counties;
    clear shouse_incomes;
    clear scounty_incomes;
    clear diffcounty_incomes;
    clear diffstate_incomes;
    clear income_county_ids;
    bad_counter = 0;
    new_bad_counties = {};
    break_counties = zeros(6,3143);
    
    for year = years(1):years(end)
    counter = 0;
    counter2 = 0;
    year_num = year - years(1) + 1;
    cd([main_dir '/' 'incbymob/county data/mob']);
    tmp = csvimport(['ACS_' num2str(year) '_5YR_B07011_with_ann.csv']);
    num_rows = size(tmp,1)-2;
    
        for i = 1:num_rows-2
            this_bad = 0 ;
            counter = counter + 1;
            these_county_ids{year_num,counter} = tmp{i+2,2};
            county_id = tmp{i+2,2};
        
            shouse_income = str2num(tmp{i+2,7});
            scounty_income = str2num(tmp{i+2,9});
            diffcounty_income = str2num(tmp{i+2,11});
            diffstate_income = str2num(tmp{i+2,13});
            
            if isempty(strmatch(county_id,all_bad_counties2))
            counter2 = counter2 + 1;
            
            shouse_incomes{year_num,counter2} = shouse_income;
            scounty_incomes{year_num,counter2} = scounty_income;
            diffcounty_incomes{year_num,counter2} = diffcounty_income;
            diffstate_incomes{year_num,counter2} = diffstate_income;
            income_county_ids{year_num,counter2} = county_id;
            end
            
%             if isempty(shouse_income)||isempty(scounty_income)||isempty(diffcounty_income)||isempty(diffstate_income)
%                 this_bad = 1;
%             end


%         end
%         
%         
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
%         county_pops{year_num,counter} = population;
%         county_ids{year_num,counter} = county_id;


%         if isempty(county_id)
%             bad_counter = bad_counter + 1;
%             bad_shit{bad_counter} = {year_num,i};
%             shit
%         end
% 
%          if this_bad == 1
%              break_counties(year_num,counter) = 1;
%              if isempty(strmatch(county_id,new_bad_counties))&& isempty(strmatch(county_id,bad_counties))
%              num_bad = num_bad + 1;
%              new_bad_counties{num_bad} = county_id;
%              end
%          elseif year_num>1
%             if ~isequal(these_county_ids{year_num-1,counter},county_id)
%              break_counties(year_num,counter) = 1;
%              if isempty(strmatch(county_id,new_bad_counties))&& isempty(strmatch(county_id,bad_counties))
%              num_bad = num_bad +1;
%              new_bad_counties{num_bad} = county_id;
%              end
% %          else
% %              ~isequal(county_pops{year_num-1,counter},county_id)
% %              break_counties(year_num,counter) = 1;
%             end
%          end
         
        end
    end
    
cd(main_dir);
    
end