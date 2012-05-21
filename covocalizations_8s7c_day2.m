% Vectorizing bouts of pair interaction, subsets of bouts that included
% covocalizations.  Date: 10/10/2011 (whole day).  Bird singing: arena8.
% Bird calling: arena7.  Second day recorded together.  Complete asymmetry
% (arena8 never calls while arena7 is singing).  On the previous day (their
% first in the soundbox together, i.e., their first in physical proximity
% with any bird), arena8 called during 2 bouts of arena7's, early on in the
% encounter, and arena7 called during 2 bouts of arena8's.

clear all; close all

structure = importdata('covocalizations_8s7c_day2_forvectors.xls');
onoff = structure.data.Sheet1;
onoff(isnan(onoff)) = 0;

arena8motifs = zeros(155,4000);

% % long (ADE) vs. short (DE) motifs coded differently
% for b = 1:155; % b = bout number
%     m1 = onoff(b,2):onoff(b,3); % m1 = 1st motif
%     arena8motifs(b,m1) = 1; % 1 for each millesecond in motif type 1 (ADE)
%     if onoff(b,4)>0
%         t1 = onoff(b,3)+1:onoff(b,4)-1; % t1 = transition between 1st and 2nd motifs
%         m2 = onoff(b,4):onoff(b,5); % m2 = 2nd motif
%         if onoff(b,4)-onoff(b,3) <= 200
%             arena8motifs(b,t1) = 0; % zero for each millisecond of silence (brief pause between motifs)
%             arena8motifs(b,m2) = 2; % 2 for each millisecond in motif type two (DE)
%         else
%             arena8motifs(b,t1) = 3; % 3 for each millisecond of joining calls between motifs
%             arena8motifs(b,m2) = 1;
%         end
%         if onoff(b,6)>0
%             t2 = onoff(b,5)+1:onoff(b,6)-1; % t2 = transition between 2nd and 3rd motifs
%             m3 = onoff(b,6):onoff(b,7); % m3 = 3rd motif
%             if onoff(b,6)-onoff(b,5) <= 200
%                 arena8motifs(b,t2) = 0;
%                 arena8motifs(b,m3) = 2;
%             else
%                 arena8motifs(b,t2) = 3;
%                 arena8motifs(b,m3) = 1;
%             end
%             if onoff(b,8)>0
%                 t3 = onoff(b,7)+1:onoff(b,8)-1; % t3 = transition between 3rd and 4th motifs
%                 m4 = onoff(b,8):onoff(b,9); % m4 = 4th motif
%                 if onoff(b,8)-onoff(b,7) <= 200
%                     arena8motifs(b,t3) = 0;
%                     arena8motifs(b,m4) = 2;
%                 else arena8motifs(b,t3) = 3;
%                     arena8motifs(b,m4) = 1;
%                 end
%                 if onoff(b,10)>0
%                     t4 = onoff(b,9)+1:onoff(b,10)-1; % t4 = transition between 4th and 5th motifs
%                     m5 = onoff(b,10):onoff(b,11); % m5 = 5th motif
%                     if onoff(b,10)-onoff(b,9) <= 200
%                         arena8motifs(b,t4) = 0;
%                         arena8motifs(b,m5) = 2;
%                     else
%                         arena8motifs(b,t4) = 3;
%                         arena8motifs(b,m5) = 1;
%                     end
%                     if onoff(b,12)>0
%                         t5 = onoff(b,11)+1:onoff(b,12)-1; % t5 = transition between 5th and 6th motifs
%                         m6 = onoff(b,12):onoff(b,13); % m6 = 6th motif
%                         if onoff(b,12)-onoff(b,11) <= 200
%                             arena8motifs(b,t5) = 0;
%                             arena8motifs(b,m6) = 2;
%                         else
%                             arena8motifs(b,t5) = 3;
%                             arena8motifs(b,m6) = 1;
%                         end
%                         if onoff(b,14)>0
%                             t6 = onoff(b,13)+1:onoff(b,14)-1; % t6 = transition between 6th and 7th motifs
%                             m7 = onoff(b,14):onoff(b,15); % m7 = 7th motif
%                             if onoff(b,14)-onoff(b,13) <= 200
%                                 arena8motifs(b,t6) = 0;
%                                 arena8motifs(b,m7) = 2;
%                             else
%                                 arena8motifs(b,t6) = 3;
%                                 arena8motifs(b,m7) = 1;
%                             end
%                         end
%                     end
%                 end
%             end
%         end
%     end
% end

% % all motifs (3-syllable and 2-syllable) same code, with joining calls
% for b = 1:155; % b = bout number
%     m1 = onoff(b,2):onoff(b,3); % m1 = 1st motif
%     arena8motifs(b,m1) = 1; % 1 for each millisecond of motif
%     if onoff(b,4)>0
%         t1 = onoff(b,3)+1:onoff(b,4)-1; % t1 = transition between 1st and 2nd motifs
%         m2 = onoff(b,4):onoff(b,5); % m2 = 2nd motif
%         arena8motifs(b,m2) = 1;
%         if onoff(b,4)-onoff(b,3) >= 200
%             arena8motifs(b,t1) = 2; % 2 for each millisecond of joining calls between motifs
%         end
%         if onoff(b,6)>0
%             t2 = onoff(b,5)+1:onoff(b,6)-1; % t2 = transition between 2nd and 3rd motifs
%             m3 = onoff(b,6):onoff(b,7); % m3 = 3rd motif
%             arena8motifs(b,m3) = 1;
%             if onoff(b,6)-onoff(b,5) >= 200
%                 arena8motifs(b,t2) = 2;
%             end
%             if onoff(b,8)>0
%                 t3 = onoff(b,7)+1:onoff(b,8)-1; % t3 = transition between 3rd and 4th motifs
%                 m4 = onoff(b,8):onoff(b,9); % m4 = 4th motif
%                 arena8motifs(b,m4) = 1;
%                 if onoff(b,8)-onoff(b,7) >= 200
%                     arena8motifs(b,t3) = 2;
%                 end
%                 if onoff(b,10)>0
%                     t4 = onoff(b,9)+1:onoff(b,10)-1; % t4 = transition between 4th and 5th motifs
%                     m5 = onoff(b,10):onoff(b,11); % m5 = 5th motif
%                     arena8motifs(b,m4) = 1;
%                     if onoff(b,10)-onoff(b,9) >= 200
%                         arena8motifs(b,t4) = 2;
%                     end
%                     if onoff(b,12)>0
%                         t5 = onoff(b,11)+1:onoff(b,12)-1; % t5 = transition between 5th and 6th motifs
%                         m6 = onoff(b,12):onoff(b,13); % m6 = 6th motif
%                         arena8motifs(b,m6) = 1;
%                         if onoff(b,12)-onoff(b,11) <= 200
%                             arena8motifs(b,t5) = 2;
%                         end
%                         if onoff(b,14)>0
%                             t6 = onoff(b,13)+1:onoff(b,14)-1; % t6 = transition between 6th and 7th motifs
%                             m7 = onoff(b,14):onoff(b,15); % m7 = 7th motif
%                             arena8motifs(b,m7) = 1;
%                             if onoff(b,14)-onoff(b,13) <= 200
%                                 arena8motifs(b,t6) = 2;
%                                 
%                             end
%                         end
%                     end
%                 end
%             end
%         end
%     end
% end

% all motifs (3-syllable and 2-syllable) same code, motifs only (no joining
% calls)
for b = 1:155; % b = bout number
    m1 = onoff(b,2):onoff(b,3); % m1 = 1st motif
    arena8motifs(b,m1) = 1; % 1 for each millisecond of motif
    if onoff(b,4)>0
        m2 = onoff(b,4):onoff(b,5); % m2 = 2nd motif
        arena8motifs(b,m2) = 1;
        if onoff(b,6)>0
            m3 = onoff(b,6):onoff(b,7); % m3 = 3rd motif
            arena8motifs(b,m3) = 1;
            if onoff(b,8)>0
                m4 = onoff(b,8):onoff(b,9); % m4 = 4th motif
                arena8motifs(b,m4) = 1;
                if onoff(b,10)>0
                    m5 = onoff(b,10):onoff(b,11); % m5 = 5th motif
                    arena8motifs(b,m4) = 1;
                    if onoff(b,12)>0
                        m6 = onoff(b,12):onoff(b,13); % m6 = 6th motif
                        arena8motifs(b,m6) = 1;
                        if onoff(b,14)>0
                            m7 = onoff(b,14):onoff(b,15); % m7 = 7th motif
                            arena8motifs(b,m7) = 1;
                        end
                    end
                end
            end
        end
    end
end

arena7calls = zeros(155,4000);

for b = 1:155; % b = bout number
    c1 = onoff(b,16):onoff(b,17); % c1 = 1st call
    arena7calls(b,c1) = 1;
    if onoff(b,18)>0
        c2 = onoff(b,18):onoff(b,19); % c2 = 2nd call
        arena7calls(b,c2) = 1;
        if onoff(b,20)>0
            c3 = onoff(b,20):onoff(b,21); % c3 = 3rd call
            arena7calls(b,c3) = 1;
            if onoff(b,22)>0
                c4 = onoff(b,22):onoff(b,23); % c4 = 4th call
                arena7calls(b,c4) = 1;
                if onoff(b,24)>0
                    c5 = onoff(b,24):onoff(b,25); % c5 = 5th call
                    arena8motifs(b,c5) = 1;
                    if onoff(b,26)>0
                        c6 = onoff(b,26):onoff(b,27); % c6 = 6th call
                        arena7calls(b,c6) = 1;
                    end
                end
            end
        end
    end
end

figure
imagesc(arena8motifs); xlabel('time within bout (ms)'); ylabel('bout number'); title('a8 motifs')
figure
imagesc(arena7calls); xlabel('time within bout (ms)'); ylabel('bout number'); title('a7 calls')
figure
imagesc(arena8motifs); hold on; contour(arena7calls); xlabel('time within bout (ms)'); ylabel('bout number'); title('covocalizations, a8 singing & a7 calling')

% % numbering the motifs 1-6 (as opposed to ADE vs. DE)
% % WHY DOES IT ASSIGN MOTIFS OUT OF SEQUENCE?
% for b = 1:155; % b = bout number
%     m1 = onoff(b,2):onoff(b,3); % m1 = 1st motif
%     arena8motifs(b,m1) = 1; % 1 for each millesecond of 1st motif
%     if onoff(b,4)>0
%         m2 = onoff(b,4):onoff(b,5); % m2 = 2nd motif
%         arena8motifs(b,m2) = 2; % 2 for each millisecond of 2nd motif
%         if onoff(b,6)>0
%             m3 = onoff(b,6):onoff(b,7); % m3 = 3rd motif
%             arena8motifs(b,m3) = 3; % 3 for each millisecond of 3rd motif
%             if onoff(b,8)>0
%                 m4 = onoff(b,8):onoff(b,9); % m4 = 4th motif
%                 arena8motifs(b,m4) = 4; % 4 for each millisecond of 4th motif
%                 if onoff(b,10)>0
%                     m5 = onoff(b,10):onoff(b,11); % m5 = 5th motif
%                     arena8motifs(b,m5) = 5; % 5 for each millisecond of 5th motif
%                     if onoff(b,12)>0
%                         m6 = onoff(b,12):onoff(b,13); % m6 = 6th motif
%                         arena8motifs(b,m6) = 6;  % 6 for each millisecond of 6th motif
%                         if onoff(b,14)>0
%                             m7 = onoff(b,14):onoff(b,15); % m7 = 7th motif
%                             arena8motifs(b,m7) = 7; % 7 for each millisecond of 7th motif
%                         end
%                     end
%                 end
%             end
%         end
%     end
% end
% 
% figure
% imagesc(arena8motifs)

arena8motifs_hist = zeros(1,4000);
for m = 1:4000
    arena8motifs_hist(m) = sum(arena8motifs(:,m));
end

arena7calls_hist = zeros(1,4000);
for c = 1:4000
    arena7calls_hist(c) = sum(arena7calls(:,c));
end

figure
plot(arena8motifs_hist,'g'); hold on; plot(arena7calls_hist,'k'); xlabel('time within bout (ms)'); ylabel('count, summed over 155 bouts'); legend('a8 singing', 'a7 calling');