FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        p       	 	 ������ 0 	front_app  ��     
  
 l     ��������  ��  ��        l     ��  ��    &   --------- MAIN ----------------     �   @   - - - - - - - - -   M A I N   - - - - - - - - - - - - - - - -      i         I     �� ��
�� .aevtoappnull  �   � ****  o      ���� 0 argv  ��    k    �       l     ��������  ��  ��        l     ��  ��    ( " Find the main current application     �   D   F i n d   t h e   m a i n   c u r r e n t   a p p l i c a t i o n      O        !   k     " "  # $ # l   �� % &��   % ; 5 Find the first application that *isn't* this script.    & � ' ' j   F i n d   t h e   f i r s t   a p p l i c a t i o n   t h a t   * i s n ' t *   t h i s   s c r i p t . $  (�� ( r     ) * ) 6   + , + n    
 - . - 1    
��
�� 
pnam . 4   �� /
�� 
prcs / m    ����  , =    0 1 0 n     2 3 2 1    ��
�� 
pisf 3  g     1 m    ��
�� boovtrue * o      ���� $0 frontmostprocess frontmostProcess��   ! m      4 4�                                                                                  sevs  alis    �  Macintosh HD               ӳ��H+   �pSystem Events.app                                               �ms����        ����  	                CoreServices    Ӵ=2      ��#(     �p �p �p  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��     5 6 5 r     7 8 7 o    ���� $0 frontmostprocess frontmostProcess 8 o      ���� 0 	front_app   6  9 : 9 l   ��������  ��  ��   :  ; < ; l   �� = >��   = &  set front_app to "Google Chrome"    > � ? ? @ s e t   f r o n t _ a p p   t o   " G o o g l e   C h r o m e " <  @ A @ l   �� B C��   B < 6 Find the list of windows, including minimized windows    C � D D l   F i n d   t h e   l i s t   o f   w i n d o w s ,   i n c l u d i n g   m i n i m i z e d   w i n d o w s A  E F E O    W G H G l  " V I J K I k   " V L L  M N M r   " & O P O J   " $����   P o      ���� 0 minimized_names   N  Q�� Q X   ' V R�� S R O   9 Q T U T Z  = P V W���� V I   = C�� X���� 0 is_minimized   X  Y�� Y o   > ?���� 0 win  ��  ��   W r   F L Z [ Z n   F I \ ] \ 1   G I��
�� 
pnam ] o   F G���� 0 win   [ n       ^ _ ^  ;   J K _ o   I J���� 0 minimized_names  ��  ��   U  f   9 :�� 0 win   S 2   * -��
�� 
cwin��   J K E Note, it seems that only the app knows about their minimized windows    K � ` ` �   N o t e ,   i t   s e e m s   t h a t   o n l y   t h e   a p p   k n o w s   a b o u t   t h e i r   m i n i m i z e d   w i n d o w s H 4    �� a
�� 
capp a o    ���� 0 	front_app   F  b c b l  X X��������  ��  ��   c  d e d l  X X�� f g��   f d ^ Now get the positions of all the windows (System Events returns only windows in this desktop)    g � h h �   N o w   g e t   t h e   p o s i t i o n s   o f   a l l   t h e   w i n d o w s   ( S y s t e m   E v e n t s   r e t u r n s   o n l y   w i n d o w s   i n   t h i s   d e s k t o p ) e  i j i l  X X�� k l��   k D > Note, only System Events's window objects have positions. -_-    l � m m |   N o t e ,   o n l y   S y s t e m   E v e n t s ' s   w i n d o w   o b j e c t s   h a v e   p o s i t i o n s .   - _ - j  n o n O  X � p q p O   \ � r s r k   c � t t  u v u r   c m w x w l  c i y���� y n   c i z { z 1   g i��
�� 
posn { l  c g |���� | 4  c g�� }
�� 
cwin } m   e f���� ��  ��  ��  ��   x o      ���� 0 current_window_pos   v  ~  ~ r   n t � � � J   n p����   � o      ���� #0 non_minimized_positions_to_wins     ��� � X   u � ��� � � O   � � � � � k   � � � �  � � � O   � � � � � r   � � � � � l  � � ����� � 6  � � � � � 4  � ��� �
�� 
cwin � m   � �����  � =  � � � � � 1   � ���
�� 
pnam � n   � � � � � 1   � ���
�� 
pnam � o   � ����� 0 win  ��  ��   � o      ���� 0 app_win   � 4   � ��� �
�� 
capp � o   � ����� 0 	front_app   �  ��� � Z  � � � ����� � H   � � � � I   � ��� ����� 0 is_minimized   �  ��� � o   � ����� 0 app_win  ��  ��   � r   � � � � � J   � � � �  � � � n   � � � � � 1   � ���
�� 
posn � o   � ����� 0 win   �  ��� � l  � � ����� � e   � � � � o   � ����� 0 win  ��  ��  ��   � n       � � �  ;   � � � o   � ����� #0 non_minimized_positions_to_wins  ��  ��  ��   �  f   � ��� 0 win   � 2   x {��
�� 
cwin��   s 4   \ `�� �
�� 
pcap � o   ^ _���� 0 	front_app   q m   X Y � ��                                                                                  sevs  alis    �  Macintosh HD               ӳ��H+   �pSystem Events.app                                               �ms����        ����  	                CoreServices    Ӵ=2      ��#(     �p �p �p  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   o  � � � l  � ���������  ��  ��   �  � � � r   � � � � � I   � ��� ����� 0 sort_lists_by_key   �  � � � o   � ����� #0 non_minimized_positions_to_wins   �  ��� � m   � ����� ��  ��   � o      ���� 0 sortedxs sortedXs �  � � � r   � � � � � I   � ��� ����� 0 sort_lists_by_key   �  � � � o   � ����� #0 non_minimized_positions_to_wins   �  ��� � m   � ����� ��  ��   � o      ���� 0 sortedys sortedYs �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �  set argv to {"right"}    � � � � * s e t   a r g v   t o   { " r i g h t " } �  � � � Z   �x � � ��� � =  � � � � � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� 0 argv   � m   � � � � � � � 
 r i g h t � r   � � � � I   ��� ����� 0 get_next_in_list   �  � � � o   � ����� 0 sortedxs sortedXs �  � � � m   � �����  �  � � � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� 0 current_window_pos   �  ��� � m   � ����� ��  ��   � o      ���� 0 next_window_pos   �  � � � =  � � � n   � � � 4  �� �
�� 
cobj � m  ����  � o  ���� 0 argv   � m   � � � � �  l e f t �  � � � r  , � � � I  (� ��~� 0 get_next_in_list   �  � � � o  �}�} 0 sortedxs sortedXs �  � � � m  �|�|  �  � � � n  ! � � � 4  !�{ �
�{ 
cobj � m   �z�z  � o  �y�y 0 current_window_pos   �  ��x � m  !"�w�w  �x  �~   � o      �v�v 0 next_window_pos   �  � � � = /7 � � � n  /3 � � � 4  03�u �
�u 
cobj � m  12�t�t  � o  /0�s�s 0 argv   � m  36 � � � � �  u p �  � � � r  :P   I  :L�r�q�r 0 get_next_in_list    o  ;>�p�p 0 sortedys sortedYs  m  >?�o�o   n  ?E	
	 4  BE�n
�n 
cobj m  CD�m�m 
 o  ?B�l�l 0 current_window_pos   �k m  EF�j�j  �k  �q   o      �i�i 0 next_window_pos   �  = S[ n  SW 4  TW�h
�h 
cobj m  UV�g�g  o  ST�f�f 0 argv   m  WZ �  d o w n �e r  ^t I  ^p�d�c�d 0 get_next_in_list    o  _b�b�b 0 sortedys sortedYs  m  bc�a�a   n  ci !  4  fi�`"
�` 
cobj" m  gh�_�_ ! o  cf�^�^ 0 current_window_pos   #�]# m  ij�\�\ �]  �c   o      �[�[ 0 next_window_pos  �e  ��   � $%$ l yy�Z�Y�X�Z  �Y  �X  % &'& l yy�W�V�U�W  �V  �U  ' ()( O y�*+* O  }�,-, I ���T.�S
�T .prcsperfnull���     actT. n  ��/0/ 4  ���R1
�R 
actT1 m  ��22 �33  A X R a i s e0 l ��4�Q�P4 n  ��565 4  ���O7
�O 
cobj7 m  ���N�N 6 o  ���M�M 0 next_window_pos  �Q  �P  �S  - 4  }��L8
�L 
prcs8 o  ��K�K 0 	front_app  + m  yz99�                                                                                  sevs  alis    �  Macintosh HD               ӳ��H+   �pSystem Events.app                                               �ms����        ����  	                CoreServices    Ӵ=2      ��#(     �p �p �p  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ) :;: l ���J�I�H�J  �I  �H  ; <�G< l ���F�E�D�F  �E  �D  �G    =>= l     �C�B�A�C  �B  �A  > ?@? l     �@AB�@  A A ; -------------------- Subroutines -------------------------   B �CC v   - - - - - - - - - - - - - - - - - - - -   S u b r o u t i n e s   - - - - - - - - - - - - - - - - - - - - - - - - -@ DED l     �?�>�=�?  �>  �=  E FGF i    HIH I      �<J�;�< 	0 match  J KLK o      �:�: 0 aa  L M�9M o      �8�8 0 func  �9  �;  I k     NN OPO h     �7Q�7 0 o  Q k      RR STS j     	�6U�6 0 xx  U n    VWV 1    �5
�5 
pcntW o     �4�4 0 aa  T XYX j   
 �3Z�3 0 yy  Z J   
 �2�2  Y [\[ j    �1]�1 0 f  ] o    �0�0 0 func  \ ^_^ l    0`�/�.` X     0a�-ba k    +cc ded r    fgf n   hih 1    �,
�, 
pcnti o    �+�+ 0 x  g o      �*�* 0 x  e j�)j Z   +kl�(�'k I    �&m�%�& 0 f  m n�$n o    �#�# 0 x  �$  �%  l r   ! 'opo o   ! "�"�" 0 x  p n      qrq  ;   % &r n  " %sts o   # %�!�! 0 yy  t  f   " #�(  �'  �)  �- 0 x  b n   uvu o    � �  0 xx  v  f    �/  �.  _ w�w l  1 8x��x L   1 8yy n  1 7z{z n  2 6|}| 1   4 6�
� 
pcnt} o   2 4�� 0 yy  {  f   1 2�  �  �  P ~�~ O   � I   ���
� .aevtoappnull  �   � ****�  �  � o    	�� 0 o  �  G ��� i    ��� I      ���� 
0 match1  � ��� o      �� 0 aa  � ��� o      �� 0 func  � ��� o      �� 0 arg1  �  �  � k     �� ��� h     ��� 0 o  � k      �� ��� j     	��� 0 xx  � n    ��� 1    �
� 
pcnt� o     �� 0 aa  � ��� j   
 ��� 0 yy  � J   
 �
�
  � ��� j    �	��	 0 f  � o    �� 0 func  � ��� l    5���� X     5���� k    0�� ��� r    ��� n   ��� 1    �
� 
pcnt� o    �� 0 x  � o      �� 0 x  � ��� Z   0��� ��� I    #������� 0 f  � ��� o    ���� 0 x  � ���� o    ���� 0 arg1  ��  ��  � r   & ,��� o   & '���� 0 x  � n      ���  ;   * +� n  ' *��� o   ( *���� 0 yy  �  f   ' (�   ��  �  � 0 x  � n   ��� o    ���� 0 xx  �  f    �  �  � ���� l  6 =������ L   6 =�� n  6 <��� n  7 ;��� 1   9 ;��
�� 
pcnt� o   7 9���� 0 yy  �  f   6 7��  ��  ��  � ���� O   ��� I   ������
�� .aevtoappnull  �   � ****��  ��  � o    	���� 0 o  ��  � ��� i    ��� I      ������� 0 map  � ��� o      ���� 0 aa  � ���� o      ���� 0 func  ��  ��  � k     �� ��� h     ����� 0 o  � k      �� ��� j     	����� 0 xx  � n    ��� 1    ��
�� 
pcnt� o     ���� 0 aa  � ��� j   
 ����� 0 yy  � J   
 ����  � ��� j    ����� 0 f  � o    ���� 0 func  � ��� l    $������ X     $����� r    ��� n   ��� I    ������� 0 f  � ���� n   ��� 1    ��
�� 
pcnt� o    ���� 0 x  ��  ��  �  f    � n      ���  ;    � n   ��� o    ���� 0 yy  �  f    �� 0 x  � n   ��� o    ���� 0 xx  �  f    ��  ��  � ���� l  % ,������ L   % ,�� n  % +��� n  & *��� 1   ( *��
�� 
pcnt� o   & (���� 0 yy  �  f   % &��  ��  ��  � ���� O   ��� I   ������
�� .aevtoappnull  �   � ****��  ��  � o    	���� 0 o  ��  � ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 get_name  � ���� o      ���� 0 win  ��  ��  � L     �� l    ������ n     � � 1    ��
�� 
pnam  o     ���� 0 win  ��  ��  �  i     I      ������ 0 get_position   �� o      ���� 0 win  ��  ��   O     O    	
	 L     l   ���� n     1    ��
�� 
posn o    ���� 0 win  ��  ��  
 4    ��
�� 
pcap o    ���� 0 	front_app   m     �                                                                                  sevs  alis    �  Macintosh HD               ӳ��H+   �pSystem Events.app                                               �ms����        ����  	                CoreServices    Ӵ=2      ��#(     �p �p �p  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��    i     I      ������ 0 name_not_in_list    o      ���� 0 win   �� o      ���� 0 list_of_names  ��  ��   L      H      E      o     ���� 0 list_of_names   n     1    ��
�� 
pnam o    ���� 0 win     l     ��������  ��  ��    !"! i    #$# I      ��%���� 0 is_minimized  % &��& o      ���� 0 win  ��  ��  $ k     H'' ()( l     ��*+��  * Z T Different windows represent being minimized differently, and some don't at all.. :(   + �,, �   D i f f e r e n t   w i n d o w s   r e p r e s e n t   b e i n g   m i n i m i z e d   d i f f e r e n t l y ,   a n d   s o m e   d o n ' t   a t   a l l . .   : () -.- l     ��/0��  /   tell application front_app   0 �11 4 t e l l   a p p l i c a t i o n   f r o n t _ a p p. 2��2 O    H343 O    G565 k    F77 898 r    :;: m    ��
�� boovfals; o      ���� 0 win_is_minimized  9 <=< Q    C>?@> r    ABA l   C����C e    DD n    EFE o    ���� 0 	minimized  F o    ���� 0 win  ��  ��  B o      ���� 0 win_is_minimized  ? R      ������
�� .ascrerr ****      � ****��  ��  @ Q     CGHIG r   # )JKJ l  # 'L����L e   # 'MM n   # 'NON o   $ &���� 0 	collapsed  O o   # $���� 0 win  ��  ��  K o      ���� 0 win_is_minimized  H R      ������
�� .ascrerr ****      � ****��  ��  I Q   1 CPQ��P r   4 :RSR l  4 8T����T e   4 8UU n   4 8VWV 1   5 7��
�� 
pmndW o   4 5���� 0 win  ��  ��  S o      ���� 0 win_is_minimized  Q R      ������
�� .ascrerr ****      � ****��  ��  ��  = X��X L   D FYY o   D E���� 0 win_is_minimized  ��  6 4    ��Z
�� 
pcapZ o    ���� 0 	front_app  4 m     [[�                                                                                  sevs  alis    �  Macintosh HD               ӳ��H+   �pSystem Events.app                                               �ms����        ����  	                CoreServices    Ӵ=2      ��#(     �p �p �p  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  " \]\ l     ��������  ��  ��  ] ^_^ i     #`a` I      ��b���� 0 sort_lists_by_key  b cdc o      ���� 0 my_list  d e�e o      �~�~ 0 comp  �  ��  a k     �ff ghg r     iji J     �}�}  j l     k�|�{k o      �z�z 0 
index_list  �|  �{  h lml r    	non J    �y�y  o l     p�x�wp o      �v�v 0 sorted_list  �x  �w  m qrq U   
 ~sts k    yuu vwv r    xyx J    �u�u  y l     z�t�sz o      �r�r 0 low_item  �t  �s  w {|{ Y    o}�q~�p} Z   * j���o�n� H   * .�� E  * -��� l  * +��m�l� o   * +�k�k 0 
index_list  �m  �l  � o   + ,�j�j 0 i  � k   1 f�� ��� r   1 7��� n   1 5��� 4   2 5�i�
�i 
cobj� o   3 4�h�h 0 i  � o   1 2�g�g 0 my_list  � o      �f�f 0 	this_item  � ��e� Z   8 f����d� =  8 <��� l  8 9��c�b� o   8 9�a�a 0 low_item  �c  �b  � J   9 ;�`�`  � k   ? F�� ��� r   ? B��� o   ? @�_�_ 0 	this_item  � l     ��^�]� o      �\�\ 0 low_item  �^  �]  � ��[� r   C F��� o   C D�Z�Z 0 i  � l     ��Y�X� o      �W�W 0 low_item_index  �Y  �X  �[  � ��� A I X��� n   I P��� 4   M P�V�
�V 
cobj� o   N O�U�U 0 comp  � n   I M��� 4   J M�T�
�T 
cobj� m   K L�S�S � o   I J�R�R 0 	this_item  � n   P W��� 4   T W�Q�
�Q 
cobj� o   U V�P�P 0 comp  � n   P T��� 4   Q T�O�
�O 
cobj� m   R S�N�N � l  P Q��M�L� o   P Q�K�K 0 low_item  �M  �L  � ��J� k   [ b�� ��� r   [ ^��� o   [ \�I�I 0 	this_item  � l     ��H�G� o      �F�F 0 low_item  �H  �G  � ��E� r   _ b��� o   _ `�D�D 0 i  � l     ��C�B� o      �A�A 0 low_item_index  �C  �B  �E  �J  �d  �e  �o  �n  �q 0 i  ~ m    �@�@  l   %��?�>� n    %��� m   " $�=
�= 
nmbr� n   "��� 2    "�<
�< 
cobj� o     �;�; 0 my_list  �?  �>  �p  | ��� r   p t��� l  p q��:�9� o   p q�8�8 0 low_item  �:  �9  � l     ��7�6� n      ���  ;   r s� o   q r�5�5 0 sorted_list  �7  �6  � ��4� r   u y��� l  u v��3�2� o   u v�1�1 0 low_item_index  �3  �2  � l     ��0�/� n      ���  ;   w x� l  v w��.�-� o   v w�,�, 0 
index_list  �.  �-  �0  �/  �4  t l   ��+�*� l   ��)�(� n    ��� m    �'
�' 
nmbr� n   ��� 2   �&
�& 
cobj� o    �%�% 0 my_list  �)  �(  �+  �*  r ��$� L    ��� l   ���#�"� o    ��!�! 0 sorted_list  �#  �"  �$  _ ��� l     � ���   �  �  � ��� l     ����  � / ) beforeOrAfter -- 0 is before, 1 is after   � ��� R   b e f o r e O r A f t e r   - -   0   i s   b e f o r e ,   1   i s   a f t e r� ��� i   $ '��� I      ���� 0 get_next_in_list  � ��� o      �� 0 sorted_list  � ��� o      �� 0 	dimension  � ��� o      �� 0 current_value  � ��� o      �� 0 beforeorafter beforeOrAfter�  �  � k     $�� ��� r     
��� I     ���� >0 binarysearchpointsbydimension binarySearchPointsByDimension� ��� o    �� 0 current_value  � ��� o    �� 0 sorted_list  � ��� o    �� 0 	dimension  �  �  � o      �� 0 currentindex currentIndex� ��� l   ����  �  �  � ��� l   ����  � V P Note, it's okay to go out of bounds here, this is ending the program anyway. :)   � ��� �   N o t e ,   i t ' s   o k a y   t o   g o   o u t   o f   b o u n d s   h e r e ,   t h i s   i s   e n d i n g   t h e   p r o g r a m   a n y w a y .   : )� ��
� Z    $� �	� =    o    �� 0 beforeorafter beforeOrAfter m    ��    l    L     n    	 4    �

� 
cobj
 l   �� \     o    �� 0 currentindex currentIndex m    �� �  �  	 o    �� 0 sorted_list     Before    �    B e f o r e�	   l   $ L    $ n    # 4    "� 
�  
cobj l   !���� [    ! o    ���� 0 currentindex currentIndex m     ���� ��  ��   o    ���� 0 sorted_list     After    �    A f t e r�
  �  l     ��������  ��  ��    l     ��������  ��  ��    l     �� !��    H B Binary Search (modified from https://gist.github.com/mk2/9949533)   ! �"" �   B i n a r y   S e a r c h   ( m o d i f i e d   f r o m   h t t p s : / / g i s t . g i t h u b . c o m / m k 2 / 9 9 4 9 5 3 3 ) #$# l     ��%&��  % 8 2 Returns -1 if not found, and the index otherwise.   & �'' d   R e t u r n s   - 1   i f   n o t   f o u n d ,   a n d   t h e   i n d e x   o t h e r w i s e .$ ()( i   ( +*+* I      ��,���� >0 binarysearchpointsbydimension binarySearchPointsByDimension, -.- o      ���� 0 avalue aValue. /0/ o      ���� 
0 values  0 1��1 o      ���� 0 	dimension  ��  ��  + k     �22 343 l     ��������  ��  ��  4 565 r     787 m     ����  8 o      ���� 0 res  6 9:9 l   ��������  ��  ��  : ;<; r    =>= I   	��?��
�� .corecnte****       ****? o    ���� 
0 values  ��  > o      ���� 0 valueslength valuesLength< @A@ l   ��������  ��  ��  A BCB l   ��DE��  D ( "  item 0 of ??????????????????????   E �FF D     i t e m   0   o f  0�[��L0Y0�0h0�0�0�0k0j0�0n0g00S0S0g0�0�0�0�C GHG Z    .IJ����I =    KLK o    ���� 0 valueslength valuesLengthL m    ���� J k    *MM NON Z    'PQ����P =    RSR o    ���� 0 avalue aValueS l   T����T n    UVU 4    ��W
�� 
cobjW o    ���� 0 	dimension  V n    XYX 4    ��Z
�� 
cobjZ m    ���� Y n    [\[ 4   ��]
�� 
cobj] m    ���� \ o    ���� 
0 values  ��  ��  Q L   ! #^^ m   ! "���� ��  ��  O _��_ l  ( *`ab` L   ( *cc m   ( )������a  
 Not found   b �dd    N o t   f o u n d��  ��  ��  H efe l  / /��������  ��  ��  f ghg r   / 4iji _   / 2klk o   / 0���� 0 valueslength valuesLengthl m   0 1���� j o      ���� 0 midindex midIndexh mnm r   5 Bopo l  5 @q����q e   5 @rr n   5 @sts 4   < ?��u
�� 
cobju o   = >���� 0 	dimension  t n   5 <vwv 4   9 <��x
�� 
cobjx m   : ;���� w n   5 9yzy 4   6 9��{
�� 
cobj{ o   7 8���� 0 midindex midIndexz o   5 6���� 
0 values  ��  ��  p o      ���� 0 midvalue midValuen |}| l  C C��������  ��  ��  } ~~ Z   C ������� ?   C F��� o   C D���� 0 midvalue midValue� o   D E���� 0 avalue aValue� r   I ]��� l  I [������ n  I [��� I   J [������� >0 binarysearchpointsbydimension binarySearchPointsByDimension� ��� o   J K���� 0 avalue aValue� ��� l  K V������ n   K V��� 7  L V����
�� 
cobj� m   P R���� � o   S U���� 0 midindex midIndex� o   K L���� 
0 values  ��  ��  � ���� o   V W���� 0 	dimension  ��  ��  �  f   I J��  ��  � o      ���� 0 res  � ��� A   ` c��� o   ` a���� 0 midvalue midValue� o   a b���� 0 avalue aValue� ��� k   f ��� ��� r   f |��� l  f z������ n  f z��� I   g z������� >0 binarysearchpointsbydimension binarySearchPointsByDimension� ��� o   g h���� 0 avalue aValue� ��� l  h u������ n   h u��� 7  i u����
�� 
cobj� l  m q������ [   m q��� o   n o���� 0 midindex midIndex� m   o p���� ��  ��  � o   r t���� 0 valueslength valuesLength� o   h i���� 
0 values  ��  ��  � ���� o   u v���� 0 	dimension  ��  ��  �  f   f g��  ��  � o      ���� 0 childres childRes� ��� Z  } �������� A   } ���� o   } ~���� 0 childres childRes� m   ~ ����  � L   � ��� o   � ����� 0 childres childRes��  ��  � ���� r   � ���� [   � ���� l  � ������� _   � ���� o   � ����� 0 valueslength valuesLength� m   � ����� ��  ��  � o   � ����� 0 childres childRes� o      ���� 0 res  ��  � ��� =   � ���� o   � ����� 0 midvalue midValue� o   � ����� 0 avalue aValue� ���� r   � ���� o   � ����� 0 midindex midIndex� o      ���� 0 res  ��  ��   ��� l  � ��������  ��  �  � ��� L   � ��� o   � ��~�~ 0 res  � ��}� l  � ��|�{�z�|  �{  �z  �}  ) ��� l     �y�x�w�y  �x  �w  � ��v� l     �u�t�s�u  �t  �s  �v       �r�������������r  � �q�p�o�n�m�l�k�j�i�h�g
�q .aevtoappnull  �   � ****�p 	0 match  �o 
0 match1  �n 0 map  �m 0 get_name  �l 0 get_position  �k 0 name_not_in_list  �j 0 is_minimized  �i 0 sort_lists_by_key  �h 0 get_next_in_list  �g >0 binarysearchpointsbydimension binarySearchPointsByDimension� �f �e�d���c
�f .aevtoappnull  �   � ****�e 0 argv  �d  � �b�a�b 0 argv  �a 0 win  �   4�`�_��^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�M ��L�K�J � ��I2�H
�` 
prcs
�_ 
pnam�  
�^ 
pisf�] $0 frontmostprocess frontmostProcess�\ 0 	front_app  
�[ 
capp�Z 0 minimized_names  
�Y 
cwin
�X 
kocl
�W 
cobj
�V .corecnte****       ****�U 0 is_minimized  
�T 
pcap
�S 
posn�R 0 current_window_pos  �Q #0 non_minimized_positions_to_wins  �P 0 app_win  �O 0 sort_lists_by_key  �N 0 sortedxs sortedXs�M 0 sortedys sortedYs�L �K 0 get_next_in_list  �J 0 next_window_pos  
�I 
actT
�H .prcsperfnull���     actT�c�� *�k/�,�[�,\Ze81E�UO�E�O*��/ 6jvE�O .*�-[��l kh ) *�k+  ��,�6FY hU[OY��UO� o*��/ g*�k/�,E` OjvE` O R*�-[��l kh ) 9*��/ *�k/�[�,\Z��,81E` UO*_ k+  ��,�lv_ 6FY hU[OY��UUO*_ kl+ E` O*_ ll+ E` O��k/a   *_ k_ �k/ka + E` Y o��k/a   *_ k_ �k/ja + E` Y K��k/a   *_ l_ �l/ja + E` Y '��k/a   *_ l_ �l/ka + E` Y hO� *��/ _ �l/a a /j UUOP� �GI�F�E���D�G 	0 match  �F �C��C �  �B�A�B 0 aa  �A 0 func  �E  � �@�?�>�@ 0 aa  �? 0 func  �> 0 o  � �=Q��<�= 0 o  � �;��:�9���8
�; .ascrinit****      � ****� k     �� S�� X�� [�� ��7� i    ��� I      �6�5�4
�6 .aevtoappnull  �   � ****�5  �4  � k     8�� ^�� w�3�3  �7  �:  �9  � �2�1�0�/�2 0 xx  �1 0 yy  �0 0 f  
�/ .aevtoappnull  �   � ****� �.�-�,�+�
�. 
pcnt�- 0 xx  �, 0 yy  �+ 0 f  � �*��)�(���'
�* .aevtoappnull  �   � ****�)  �(  � �&�& 0 x  � �%�$�#�"�!� ��% 0 xx  
�$ 
kocl
�# 
cobj
�" .corecnte****       ****
�! 
pcnt�  0 f  � 0 yy  �' 9 /)�,[��l kh  ��,E�O*�k+  �)�,6FY h[OY��O)�,�,E�8 b   �,E�Ojv�Ob  �OL 
�< .aevtoappnull  �   � ****�D ��K S�O� *j U� �������� 
0 match1  � ��� �  ���� 0 aa  � 0 func  � 0 arg1  �  � ����� 0 aa  � 0 func  � 0 arg1  � 0 o  � ����� 0 o  � �������
� .ascrinit****      � ****� k     �� ��� ��� ��� ��� i    ��� I      ��
�	
� .aevtoappnull  �   � ****�
  �	  � k     =   � ���  �  �  �  � ����� 0 xx  � 0 yy  � 0 f  
� .aevtoappnull  �   � ****� ���� 
� 
pcnt� 0 xx  � 0 yy  �  0 f   ���������
�� .aevtoappnull  �   � ****��  ��   ���� 0 x   ���������������� 0 xx  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt�� 0 f  �� 0 yy  �� > 4)�,[��l kh  ��,E�O*�b  l+  �)�,6FY h[OY��O)�,�,E� b   �,E�Ojv�Ob  �OL 
� .aevtoappnull  �   � ****� ��K S�O� *j U� ����������� 0 map  �� ����   ������ 0 aa  �� 0 func  ��   �������� 0 aa  �� 0 func  �� 0 o   ������� 0 o   ��	����
��
�� .ascrinit****      � ****	 k      � � � �� i     I      ������
�� .aevtoappnull  �   � ****��  ��   k     , � �����  ��  ��  ��  
 ���������� 0 xx  �� 0 yy  �� 0 f  
�� .aevtoappnull  �   � **** ��������
�� 
pcnt�� 0 xx  �� 0 yy  �� 0 f   ��������
�� .aevtoappnull  �   � ****��  ��   ���� 0 x   ���������������� 0 xx  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt�� 0 f  �� 0 yy  �� - #)�,[��l kh  )��,k+ )�,6F[OY��O)�,�,E�� b   �,E�Ojv�Ob  �OL 
�� .aevtoappnull  �   � ****�� ��K S�O� *j U� ����������� 0 get_name  �� ����   ���� 0 win  ��   ���� 0 win   ��
�� 
pnam�� ��,E� ���������� 0 get_position  �� ����   ���� 0 win  ��   ���� 0 win   ������
�� 
pcap�� 0 	front_app  
�� 
posn�� � *��/ ��,EUU� ���������� 0 name_not_in_list  �� �� ��    ������ 0 win  �� 0 list_of_names  ��   ������ 0 win  �� 0 list_of_names   ��
�� 
pnam�� ���,� ��$����!"���� 0 is_minimized  �� ��#�� #  ���� 0 win  ��  ! ������ 0 win  �� 0 win_is_minimized  " [��������������
�� 
pcap�� 0 	front_app  �� 0 	minimized  ��  ��  �� 0 	collapsed  
�� 
pmnd�� I� E*��/ =fE�O ��,EE�W *X   ��,EE�W X   ��,EE�W X  hO�UU� ��a����$%���� 0 sort_lists_by_key  �� ��&�� &  ������ 0 my_list  �� 0 comp  ��  $ ������������������ 0 my_list  �� 0 comp  �� 0 
index_list  �� 0 sorted_list  �� 0 low_item  �� 0 i  �� 0 	this_item  �� 0 low_item_index  % ����
�� 
cobj
�� 
nmbr�� �jvE�OjvE�O s��-�,EkhjvE�O Sk��-�,Ekh �� :��/E�O�jv  �E�O�E�Y ��k/�/��k/�/ �E�O�E�Y hY h[OY��O��6FO��6F[OY��O�� �������'(���� 0 get_next_in_list  �� ��)�� )  ���������� 0 sorted_list  �� 0 	dimension  �� 0 current_value  �� 0 beforeorafter beforeOrAfter��  ' ������������ 0 sorted_list  �� 0 	dimension  �� 0 current_value  �� 0 beforeorafter beforeOrAfter�� 0 currentindex currentIndex( ����� >0 binarysearchpointsbydimension binarySearchPointsByDimension
� 
cobj�� %*���m+  E�O�j  ��k/EY 
��k/E� �~+�}�|*+�{�~ >0 binarysearchpointsbydimension binarySearchPointsByDimension�} �z,�z ,  �y�x�w�y 0 avalue aValue�x 
0 values  �w 0 	dimension  �|  * �v�u�t�s�r�q�p�o�v 0 avalue aValue�u 
0 values  �t 0 	dimension  �s 0 res  �r 0 valueslength valuesLength�q 0 midindex midIndex�p 0 midvalue midValue�o 0 childres childRes+ �n�m�l
�n .corecnte****       ****
�m 
cobj�l >0 binarysearchpointsbydimension binarySearchPointsByDimension�{ �jE�O�j  E�O�k  ���k/�k/�/  kY hOiY hO�l"E�O��/�k/�/EE�O�� )��[�\[Zk\Z�2�m+ E�Y C�� 0)��[�\[Z�k\Z�2�m+ E�O�j �Y hO�l"�E�Y ��  �E�Y hO�OPascr  ��ޭ