function r = rock_paper_d_s(player_1, player_2)
% deterministic stationary case 
switch player_1
    case 1 %rock
        switch player_2
            case 1 %rock
                r = 0;
            case 2 %paper
                r = -1;
            case 3 %scissors
                r = 1;
            case 4 %spock
                r = -1;
            case 5 %lizard
                r = 1;
        end

    case 2 %paper
        switch player_2
            case 1 %rock
                r = 1;
            case 2 %paper
                r = 0;
            case 3 %scissors
                r = -1;
            case 4 %spock
                r = 1;
            case 5 %lizard
                r = -1;
        end

    case 3 %scissors
        switch player_2
            case 1 %rock
                r = -1;
            case 2 %paper
                r = 1;
            case 3 %scissors
                r = 0;
            case 4 %spock
                r = -1;
            case 5 %lizard
                r = 1;
        end

    case 4 %spock
        switch player_2
            case 1 %rock
                r = 1;
            case 2 %paper
                r = -1;
            case 3 %scissors
                r = 1;
            case 4 %spock
                r = 0;
            case 5 %lizard
                r = -1;
        end

    case 5 %lizard
        switch player_2
            case 1 %rock
                r = -1;
            case 2 %paper
                r = 1;
            case 3 %scissors
                r = -1;
            case 4 %spock
                r = 1;
            case 5 %lizard
                r = 0;
        end
end