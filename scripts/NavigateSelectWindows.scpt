FasdUAS 1.101.10   ��   ��    k             p         ������ 0 	front_app  ��      	  l     ��������  ��  ��   	  
  
 l     ��  ��    &   --------- MAIN ----------------     �   @   - - - - - - - - -   M A I N   - - - - - - - - - - - - - - - -      i         I     �� ��
�� .aevtoappnull  �   � ****  o      ���� 0 argv  ��    k    R       l     ��  ��    ( " Find the main current application     �   D   F i n d   t h e   m a i n   c u r r e n t   a p p l i c a t i o n      O         r        6     !   n    
 " # " 1    
��
�� 
pnam # 4   �� $
�� 
prcs $ m    ����  ! =    % & % n     ' ( ' 1    ��
�� 
pisf (  g     & m    ��
�� boovtrue  o      ���� $0 frontmostprocess frontmostProcess  m      ) )�                                                                                  sevs  alis    �  Macintosh HD               ӳ��H+   �pSystem Events.app                                               �ms����        ����  	                CoreServices    Ӵ=2      ��#(     �p �p �p  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��     * + * r     , - , o    ���� $0 frontmostprocess frontmostProcess - o      ���� 0 	front_app   +  . / . l   ��������  ��  ��   /  0 1 0 l   �� 2 3��   2 &  set front_app to "Google Chrome"    3 � 4 4 @ s e t   f r o n t _ a p p   t o   " G o o g l e   C h r o m e " 1  5 6 5 l   �� 7 8��   7  set argv to {"right"}    8 � 9 9 * s e t   a r g v   t o   { " r i g h t " } 6  : ; : l   �� < =��   < %  Pick which dimension to check.    = � > > >   P i c k   w h i c h   d i m e n s i o n   t o   c h e c k . ;  ? @ ? Z    8 A B�� C A G    , D E D =   ! F G F n     H I H 4    �� J
�� 
cobj J m    ����  I o    ���� 0 argv   G m      K K � L L 
 r i g h t E =  $ * M N M n   $ ( O P O 4   % (�� Q
�� 
cobj Q m   & '����  P o   $ %���� 0 argv   N m   ( ) R R � S S  l e f t B r   / 2 T U T m   / 0����  U o      ���� 0 	dimension  ��   C r   5 8 V W V m   5 6����  W o      ���� 0 	dimension   @  X Y X l  9 9��������  ��  ��   Y  Z [ Z l  9 9�� \ ]��   \ d ^ Now get the positions of all the windows (System Events returns only windows in this desktop)    ] � ^ ^ �   N o w   g e t   t h e   p o s i t i o n s   o f   a l l   t h e   w i n d o w s   ( S y s t e m   E v e n t s   r e t u r n s   o n l y   w i n d o w s   i n   t h i s   d e s k t o p ) [  _ ` _ l  9 9�� a b��   a D > Note: Only System Events's window objects have positions. -_-    b � c c |   N o t e :   O n l y   S y s t e m   E v e n t s ' s   w i n d o w   o b j e c t s   h a v e   p o s i t i o n s .   - _ - `  d e d O  9 � f g f O   = � h i h k   D � j j  k l k r   D Q m n m l  D O o���� o e   D O p p n   D O q r q 4   K N�� s
�� 
cobj s o   L M���� 0 	dimension   r l  D K t���� t e   D K u u l  D K v���� v n   D K w x w 1   H J��
�� 
posn x l  D H y���� y 4  D H�� z
�� 
cwin z m   F G���� ��  ��  ��  ��  ��  ��  ��  ��   n o      ���� 0 current_window_pos_dim   l  { | { r   R X } ~ } J   R T����   ~ o      ���� 40 sorteddimpositionstowins sortedDimPositionstoWins |   �  l  Y Y�� � ���   � d ^ Sadly, O(n*m) checks, where n="num windows in this desktop", and m="all application windows".    � � � � �   S a d l y ,   O ( n * m )   c h e c k s ,   w h e r e   n = " n u m   w i n d o w s   i n   t h i s   d e s k t o p " ,   a n d   m = " a l l   a p p l i c a t i o n   w i n d o w s " . �  ��� � X   Y � ��� � � O   m � � � � k   q � � �  � � � l  q q�� � ���   � , & Now check if the window is minimized.    � � � � L   N o w   c h e c k   i f   t h e   w i n d o w   i s   m i n i m i z e d . �  � � � l  q q�� � ���   � Z T Note: Only the actual application's window objects can tell if window is minimized.    � � � � �   N o t e :   O n l y   t h e   a c t u a l   a p p l i c a t i o n ' s   w i n d o w   o b j e c t s   c a n   t e l l   i f   w i n d o w   i s   m i n i m i z e d . �  � � � l  q q�� � ���   � \ V Note: application's windows list *all* windows: minimized or not and in all desktops.    � � � � �   N o t e :   a p p l i c a t i o n ' s   w i n d o w s   l i s t   * a l l *   w i n d o w s :   m i n i m i z e d   o r   n o t   a n d   i n   a l l   d e s k t o p s . �  � � � O   q � � � � k   z � � �  � � � r   z � � � � l  z � ����� � 6  z � � � � 4  z ~�� �
�� 
cwin � m   | }����  � =   � � � � 1   � ���
�� 
pnam � n   � � � � � 1   � ���
�� 
pnam � o   � ����� 0 win  ��  ��   � o      ���� 0 app_win   �  � � � l  � ��� � ���   � " set app_wins to every window    � � � � 8 s e t   a p p _ w i n s   t o   e v e r y   w i n d o w �  � � � l  � ��� � ���   �  tell me    � � � �  t e l l   m e �  � � � l  � ��� � ���   � U O   # This binary search doesn't work, since you want to find the *first* match.    � � � � �       #   T h i s   b i n a r y   s e a r c h   d o e s n ' t   w o r k ,   s i n c e   y o u   w a n t   t o   f i n d   t h e   * f i r s t *   m a t c h . �  � � � l  � ��� � ���   � Q K	set app_win to item binarySearchByName(name of win, app_wins) of app_wins	    � � � � � 	 s e t   a p p _ w i n   t o   i t e m   b i n a r y S e a r c h B y N a m e ( n a m e   o f   w i n ,   a p p _ w i n s )   o f   a p p _ w i n s 	 �  ��� � l  � ��� � ���   �  end tell    � � � �  e n d   t e l l��   � 4   q w�� �
�� 
capp � o   u v���� 0 	front_app   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � g a Good news!: I *believe* System Event's windows objects put all the minimized windows at the end!    � � � � �   G o o d   n e w s ! :   I   * b e l i e v e *   S y s t e m   E v e n t ' s   w i n d o w s   o b j e c t s   p u t   a l l   t h e   m i n i m i z e d   w i n d o w s   a t   t h e   e n d ! �  � � � l  � ��� � ���   � B < So we can break after the first minimized window we see. :)    � � � � x   S o   w e   c a n   b r e a k   a f t e r   t h e   f i r s t   m i n i m i z e d   w i n d o w   w e   s e e .   : ) �  ��� � Z   � � � ��� � � I   � ��� ����� 0 is_minimized   �  ��� � o   � ����� 0 app_win  ��  ��   �  S   � ���   � r   � � � � � I   � ��� ����� @0 binaryorderedinsertuniquebykey binaryOrderedInsertUniqueByKey �  � � � o   � ����� 40 sorteddimpositionstowins sortedDimPositionstoWins �  ��� � J   � � � �  � � � e   � � � � n   � � � � � 4   � ��� �
�� 
cobj � o   � ����� 0 	dimension   � l  � � ����� � e   � � � � n   � � � � � 1   � ���
�� 
posn � o   � ����� 0 win  ��  ��   �  ��� � o   � ����� 0 win  ��  ��  ��   � o      ���� 40 sorteddimpositionstowins sortedDimPositionstoWins��   �  f   m n�� 0 win   � 2   \ _��
�� 
cwin��   i 4   = A�� �
�� 
pcap � o   ? @���� 0 	front_app   g m   9 : � ��                                                                                  sevs  alis    �  Macintosh HD               ӳ��H+   �pSystem Events.app                                               �ms����        ����  	                CoreServices    Ӵ=2      ��#(     �p �p �p  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   e  � � � l  � ���������  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � Z   �1 � � ��� � =  � � � � � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� 0 argv   � m   � � � � � � � 
 r i g h t � r   � � � � � I   � ��� ����� 0 get_next_in_list   �  � � � o   � ����� 40 sorteddimpositionstowins sortedDimPositionstoWins �  � � � o   � ����� 0 current_window_pos_dim   �  ��  m   � ����� ��  ��   � o      ���� 0 next_window_pos   �  =  � � n   � � 4   � ���
�� 
cobj m   � �����  o   � ����� 0 argv   m   � � �		  l e f t 

 r   � � I   � ������� 0 get_next_in_list    o   � ��� 40 sorteddimpositionstowins sortedDimPositionstoWins  o   � ��~�~ 0 current_window_pos_dim   �} m   � ��|�|  �}  ��   o      �{�{ 0 next_window_pos    =  �  n   � � 4   � ��z
�z 
cobj m   � ��y�y  o   � ��x�x 0 argv   m   � � �  u p  r    I  �w!�v�w 0 get_next_in_list  ! "#" o  �u�u 40 sorteddimpositionstowins sortedDimPositionstoWins# $%$ o  �t�t 0 current_window_pos_dim  % &�s& m  	�r�r  �s  �v    o      �q�q 0 next_window_pos   '(' = )*) n  +,+ 4  �p-
�p 
cobj- m  �o�o , o  �n�n 0 argv  * m  .. �//  d o w n( 0�m0 r  -121 I  )�l3�k�l 0 get_next_in_list  3 454 o   #�j�j 40 sorteddimpositionstowins sortedDimPositionstoWins5 676 o  #$�i�i 0 current_window_pos_dim  7 8�h8 m  $%�g�g �h  �k  2 o      �f�f 0 next_window_pos  �m  ��   � 9:9 l 22�e�d�c�e  �d  �c  : ;<; l 22�b�a�`�b  �a  �`  < =>= O 2P?@? O  6OABA I =N�_C�^
�_ .prcsperfnull���     actTC n  =JDED 4  CJ�]F
�] 
actTF m  FIGG �HH  A X R a i s eE l =CI�\�[I n  =CJKJ 4  @C�ZL
�Z 
cobjL m  AB�Y�Y K o  =@�X�X 0 next_window_pos  �\  �[  �^  B 4  6:�WM
�W 
prcsM o  89�V�V 0 	front_app  @ m  23NN�                                                                                  sevs  alis    �  Macintosh HD               ӳ��H+   �pSystem Events.app                                               �ms����        ����  	                CoreServices    Ӵ=2      ��#(     �p �p �p  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  > O�UO l QQ�T�S�R�T  �S  �R  �U    PQP l     �Q�P�O�Q  �P  �O  Q RSR l     �NTU�N  T A ; -------------------- Subroutines -------------------------   U �VV v   - - - - - - - - - - - - - - - - - - - -   S u b r o u t i n e s   - - - - - - - - - - - - - - - - - - - - - - - - -S WXW i    YZY I      �M[�L�M 0 is_minimized  [ \�K\ o      �J�J 0 win  �K  �L  Z k     H]] ^_^ l     �I`a�I  ` Z T Different windows represent being minimized differently, and some don't at all.. :(   a �bb �   D i f f e r e n t   w i n d o w s   r e p r e s e n t   b e i n g   m i n i m i z e d   d i f f e r e n t l y ,   a n d   s o m e   d o n ' t   a t   a l l . .   : (_ cdc l     �Hef�H  e   tell application front_app   f �gg 4 t e l l   a p p l i c a t i o n   f r o n t _ a p pd h�Gh O    Hiji O    Gklk k    Fmm non r    pqp m    �F
�F boovfalsq o      �E�E 0 win_is_minimized  o rsr Q    Ctuvt r    wxw l   y�D�Cy e    zz n    {|{ 1    �B
�B 
pmnd| o    �A�A 0 win  �D  �C  x o      �@�@ 0 win_is_minimized  u R      �?�>�=
�? .ascrerr ****      � ****�>  �=  v Q     C}~} r   # )��� l  # '��<�;� e   # '�� n   # '��� o   $ &�:�: 0 	minimized  � o   # $�9�9 0 win  �<  �;  � o      �8�8 0 win_is_minimized  ~ R      �7�6�5
�7 .ascrerr ****      � ****�6  �5   Q   1 C���4� r   4 :��� l  4 8��3�2� e   4 8�� n   4 8��� o   5 7�1�1 0 	collapsed  � o   4 5�0�0 0 win  �3  �2  � o      �/�/ 0 win_is_minimized  � R      �.�-�,
�. .ascrerr ****      � ****�-  �,  �4  s ��+� L   D F�� o   D E�*�* 0 win_is_minimized  �+  l 4    �)�
�) 
pcap� o    �(�( 0 	front_app  j m     ���                                                                                  sevs  alis    �  Macintosh HD               ӳ��H+   �pSystem Events.app                                               �ms����        ����  	                CoreServices    Ӵ=2      ��#(     �p �p �p  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �G  X ��� l     �'�&�%�'  �&  �%  � ��� l     �$�#�"�$  �#  �"  � ��� l     �!���!  � / ) beforeOrAfter -- 0 is before, 1 is after   � ��� R   b e f o r e O r A f t e r   - -   0   i s   b e f o r e ,   1   i s   a f t e r� ��� i    ��� I      � ���  0 get_next_in_list  � ��� o      �� 0 sorted_list  � ��� o      �� 0 current_value  � ��� o      �� 0 beforeorafter beforeOrAfter�  �  � k     #�� ��� l     ����  �  �  � ��� l     ����  � � � TODO(nhdaly): Now that I can skip all minimized windows, binary search might actually be slower than just a single linear scan?   � ���    T O D O ( n h d a l y ) :   N o w   t h a t   I   c a n   s k i p   a l l   m i n i m i z e d   w i n d o w s ,   b i n a r y   s e a r c h   m i g h t   a c t u a l l y   b e   s l o w e r   t h a n   j u s t   a   s i n g l e   l i n e a r   s c a n ?� ��� r     	��� I     ���� &0 binarysearchbykey binarySearchByKey� ��� o    �� 0 current_value  � ��� o    �� 0 sorted_list  �  �  � o      �� 0 currentindex currentIndex� ��� l  
 
����  �  �  � ��� l  
 
����  � V P Note, it's okay to go out of bounds here, this is ending the program anyway. :)   � ��� �   N o t e ,   i t ' s   o k a y   t o   g o   o u t   o f   b o u n d s   h e r e ,   t h i s   i s   e n d i n g   t h e   p r o g r a m   a n y w a y .   : )� ��� Z   
 #����� =  
 ��� o   
 �
�
 0 beforeorafter beforeOrAfter� m    �	�	  � l   ���� L    �� n    ��� 4    ��
� 
cobj� l   ���� \    ��� o    �� 0 currentindex currentIndex� m    �� �  �  � o    �� 0 sorted_list  �   Before   � ���    B e f o r e�  � l   #���� L    #�� n    "��� 4    !��
� 
cobj� l    ��� � [     ��� o    ���� 0 currentindex currentIndex� m    ���� �  �   � o    ���� 0 sorted_list  �   After   � ���    A f t e r�  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � H B Binary Search (modified from https://gist.github.com/mk2/9949533)   � ��� �   B i n a r y   S e a r c h   ( m o d i f i e d   f r o m   h t t p s : / / g i s t . g i t h u b . c o m / m k 2 / 9 9 4 9 5 3 3 )� ��� l     ������  � 8 2 Returns -1 if not found, and the index otherwise.   � ��� d   R e t u r n s   - 1   i f   n o t   f o u n d ,   a n d   t h e   i n d e x   o t h e r w i s e .� ��� i    ��� I      ������� &0 binarysearchbykey binarySearchByKey� ��� o      ���� 0 avalue aValue� ���� o      ���� 
0 values  ��  ��  � k     ��� ��� l     ��������  ��  ��  � ��� r     ��� m     ����  � o      ���� 0 res  � ��� l   ��������  ��  ��  � ��� r    ��� I   	�����
�� .corecnte****       ****� o    ���� 
0 values  ��  � o      ���� 0 valueslength valuesLength� ��� l   ��������  ��  ��  � ��� l   �� ��    ( "  item 0 of ??????????????????????    � D     i t e m   0   o f  0�[��L0Y0�0h0�0�0�0k0j0�0n0g00S0S0g0�0�0�0��  Z    +���� =     o    ���� 0 valueslength valuesLength m    ����  k    '		 

 Z    $���� =     o    ���� 0 avalue aValue l   ���� n     4    ��
�� 
cobj m    ����  n     4   ��
�� 
cobj m    ����  o    ���� 
0 values  ��  ��   L      m    ���� ��  ��   �� l  % ' L   % ' m   % &������  
 Not found    �    N o t   f o u n d��  ��  ��    l  , ,��������  ��  ��    !  r   , 1"#" _   , /$%$ o   , -���� 0 valueslength valuesLength% m   - .���� # o      ���� 0 midindex midIndex! &'& r   2 <()( l  2 :*����* e   2 :++ n   2 :,-, 4   6 9��.
�� 
cobj. m   7 8���� - n   2 6/0/ 4   3 6��1
�� 
cobj1 o   4 5���� 0 midindex midIndex0 o   2 3���� 
0 values  ��  ��  ) o      ���� 0 midvalue midValue' 232 l  = =��������  ��  ��  3 454 Z   = �678��6 ?   = @9:9 o   = >���� 0 midvalue midValue: o   > ?���� 0 avalue aValue7 r   C V;<; l  C T=����= n  C T>?> I   D T��@���� &0 binarysearchbykey binarySearchByKey@ ABA o   D E���� 0 avalue aValueB C��C l  E PD����D n   E PEFE 7  F P��GH
�� 
cobjG m   J L���� H o   M O���� 0 midindex midIndexF o   E F���� 
0 values  ��  ��  ��  ��  ?  f   C D��  ��  < o      ���� 0 res  8 IJI A   Y \KLK o   Y Z���� 0 midvalue midValueL o   Z [���� 0 avalue aValueJ MNM k   _ �OO PQP r   _ tRSR l  _ rT����T n  _ rUVU I   ` r��W���� &0 binarysearchbykey binarySearchByKeyW XYX o   ` a���� 0 avalue aValueY Z��Z l  a n[����[ n   a n\]\ 7  b n��^_
�� 
cobj^ l  f j`����` [   f jaba o   g h���� 0 midindex midIndexb m   h i���� ��  ��  _ o   k m���� 0 valueslength valuesLength] o   a b���� 
0 values  ��  ��  ��  ��  V  f   _ `��  ��  S o      ���� 0 childres childResQ cdc Z  u �ef����e A   u xghg o   u v���� 0 childres childResh m   v w����  f L   { }ii o   { |���� 0 childres childRes��  ��  d j��j r   � �klk [   � �mnm l  � �o����o _   � �pqp o   � ����� 0 valueslength valuesLengthq m   � ����� ��  ��  n o   � ����� 0 childres childResl o      ���� 0 res  ��  N rsr =   � �tut o   � ����� 0 midvalue midValueu o   � ����� 0 avalue aValues v��v r   � �wxw o   � ����� 0 midindex midIndexx o      ���� 0 res  ��  ��  5 yzy l  � ���������  ��  ��  z {|{ L   � �}} o   � ����� 0 res  | ~��~ l  � ���������  ��  ��  ��  � � l     ��������  ��  ��  � ��� l     ��~�}�  �~  �}  � ��� l     �|�{�z�|  �{  �z  � ��� l     �y���y  � H B Binary Search (modified from https://gist.github.com/mk2/9949533)   � ��� �   B i n a r y   S e a r c h   ( m o d i f i e d   f r o m   h t t p s : / / g i s t . g i t h u b . c o m / m k 2 / 9 9 4 9 5 3 3 )� ��� l     �x���x  � 8 2 Returns -1 if not found, and the index otherwise.   � ��� d   R e t u r n s   - 1   i f   n o t   f o u n d ,   a n d   t h e   i n d e x   o t h e r w i s e .� ��� i    ��� I      �w��v�w (0 binarysearchbyname binarySearchByName� ��� o      �u�u 0 avalue aValue� ��t� o      �s�s 
0 values  �t  �v  � k     ��� ��� l     �r�q�p�r  �q  �p  � ��� r     ��� m     �o�o  � o      �n�n 0 res  � ��� l   �m�l�k�m  �l  �k  � ��� r    ��� I   	�j��i
�j .corecnte****       ****� o    �h�h 
0 values  �i  � o      �g�g 0 valueslength valuesLength� ��� l   �f�e�d�f  �e  �d  � ��� l   �c���c  � ( "  item 0 of ??????????????????????   � ��� D     i t e m   0   o f  0�[��L0Y0�0h0�0�0�0k0j0�0n0g00S0S0g0�0�0�0�� ��� Z    +���b�a� =    ��� o    �`�` 0 valueslength valuesLength� m    �_�_ � k    '�� ��� Z    $���^�]� =    ��� o    �\�\ 0 avalue aValue� l   ��[�Z� e    �� n    ��� 1    �Y
�Y 
pnam� n    ��� 4   �X�
�X 
cobj� m    �W�W � o    �V�V 
0 values  �[  �Z  � L     �� m    �U�U �^  �]  � ��T� l  % '���� L   % '�� m   % &�S�S���  
 Not found   � ���    N o t   f o u n d�T  �b  �a  � ��� l  , ,�R�Q�P�R  �Q  �P  � ��� r   , 1��� _   , /��� o   , -�O�O 0 valueslength valuesLength� m   - .�N�N � o      �M�M 0 midindex midIndex� ��� r   2 ;��� l  2 9��L�K� e   2 9�� n   2 9��� 1   6 8�J
�J 
pnam� n   2 6��� 4   3 6�I�
�I 
cobj� o   4 5�H�H 0 midindex midIndex� o   2 3�G�G 
0 values  �L  �K  � o      �F�F 0 midvalue midValue� ��� l  < <�E�D�C�E  �D  �C  � ��� Z   < �����B� ?   < ?��� o   < =�A�A 0 midvalue midValue� o   = >�@�@ 0 avalue aValue� r   B U��� l  B S��?�>� n  B S��� I   C S�=��<�= (0 binarysearchbyname binarySearchByName� ��� o   C D�;�; 0 avalue aValue� ��:� l  D O��9�8� n   D O��� 7  E O�7��
�7 
cobj� m   I K�6�6 � o   L N�5�5 0 midindex midIndex� o   D E�4�4 
0 values  �9  �8  �:  �<  �  f   B C�?  �>  � o      �3�3 0 res  � ��� A   X [��� o   X Y�2�2 0 midvalue midValue� o   Y Z�1�1 0 avalue aValue� ��� k   ^ ��� ��� r   ^ s��� l  ^ q��0�/� n  ^ q��� I   _ q�.��-�. (0 binarysearchbyname binarySearchByName�    o   _ `�,�, 0 avalue aValue �+ l  ` m�*�) n   ` m 7  a m�(
�( 
cobj l  e i�'�& [   e i	
	 o   f g�%�% 0 midindex midIndex
 m   g h�$�$ �'  �&   o   j l�#�# 0 valueslength valuesLength o   ` a�"�" 
0 values  �*  �)  �+  �-  �  f   ^ _�0  �/  � o      �!�! 0 childres childRes�  Z  t �� � A   t w o   t u�� 0 childres childRes m   u v��   L   z | o   z {�� 0 childres childRes�   �   � r   � � [   � � l  � ��� _   � � o   � ��� 0 valueslength valuesLength m   � ��� �  �   o   � ��� 0 childres childRes o      �� 0 res  �  �  =   � � o   � ��� 0 midvalue midValue o   � ��� 0 avalue aValue � r   � �  o   � ��� 0 midindex midIndex  o      �� 0 res  �  �B  � !"! l  � �����  �  �  " #$# L   � �%% o   � ��� 0 res  $ &�& l  � ��
�	��
  �	  �  �  � '(' l     ����  �  �  ( )*) l     �+,�  + 1 + BinarySearch Get Insert Position (by key)    , �-- V   B i n a r y S e a r c h   G e t   I n s e r t   P o s i t i o n   ( b y   k e y )  * ./. l     �01�  0 I C  (modified from http://www.macscripter.net/viewtopic.php?id=43598)   1 �22 �     ( m o d i f i e d   f r o m   h t t p : / / w w w . m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? i d = 4 3 5 9 8 )/ 343 i    565 I      �7�� &0 binaryinsposbykey binaryInsPosByKey7 898 o      � �  0 thelist theList9 :��: o      ���� 0 v  ��  �  6 k     `;; <=< l     ��>?��  > 4 . Based on Nigel Garvey's BinaryOrdered Insert,   ? �@@ \   B a s e d   o n   N i g e l   G a r v e y ' s   B i n a r y O r d e r e d   I n s e r t ,= ABA l     ��CD��  C . ( since it delivers a stable positioning.   D �EE P   s i n c e   i t   d e l i v e r s   a   s t a b l e   p o s i t i o n i n g .B FGF h     ��H�� 0 o  H j     ��I�� 0 lst  I o     ���� 0 thelist theListG JKJ l   ��������  ��  ��  K LML l   ��NO��  N   set end of o's lst to v   O �PP 0   s e t   e n d   o f   o ' s   l s t   t o   vM QRQ r    STS l   U����U I   ��V��
�� .corecnte****       ****V o    	���� 0 thelist theList��  ��  ��  T o      ���� 0 len  R WXW l   ��������  ��  ��  X YZY l   ��[\��  [ S M Binary search for a "stable" insertion point (ie. after any similar values).   \ �]] �   B i n a r y   s e a r c h   f o r   a   " s t a b l e "   i n s e r t i o n   p o i n t   ( i e .   a f t e r   a n y   s i m i l a r   v a l u e s ) .Z ^_^ r    `a` m    ���� a o      ���� 0 l  _ bcb r    ded l   f����f [    ghg o    ���� 0 len  h m    ���� ��  ��  e o      ���� 0 here  c iji W    ]klk k   " Xmm non r   " )pqp _   " 'rsr l  " %t����t [   " %uvu o   " #���� 0 l  v o   # $���� 0 here  ��  ��  s m   % &���� q o      ���� 0 m  o wxw l  * *��������  ��  ��  x yzy l  * *��{|��  {   Only insert UNIQUE keys:   | �}} 2   O n l y   i n s e r t   U N I Q U E   k e y s :z ~~ Z  * >������� l  * 5������ =   * 5��� n   * 3��� 4   0 3���
�� 
cobj� m   1 2���� � n   * 0��� 4   - 0���
�� 
cobj� o   . /���� 0 m  � n  * -��� o   + -���� 0 lst  � o   * +���� 0 o  � o   3 4���� 0 v  ��  ��  � L   8 :�� m   8 9��������  ��   ��� l  ? ?��������  ��  ��  � ���� Z   ? X������ l  ? J������ ?   ? J��� n   ? H��� 4   E H���
�� 
cobj� m   F G���� � n   ? E��� 4   B E���
�� 
cobj� o   C D���� 0 m  � n  ? B��� o   @ B���� 0 lst  � o   ? @���� 0 o  � o   H I���� 0 v  ��  ��  � k   M P�� ��� l  M M������  � G A Reduce the right index only if item m's value is GREATER than v.   � ��� �   R e d u c e   t h e   r i g h t   i n d e x   o n l y   i f   i t e m   m ' s   v a l u e   i s   G R E A T E R   t h a n   v .� ���� r   M P��� o   M N���� 0 m  � o      ���� 0 here  ��  ��  � k   S X�� ��� l  S S������  � "  Otherwise advance the left.   � ��� 8   O t h e r w i s e   a d v a n c e   t h e   l e f t .� ���� r   S X��� [   S V��� o   S T���� 0 m  � m   T U���� � o      ���� 0 l  ��  ��  l l   !������ =    !��� o    ���� 0 l  � o     ���� 0 here  ��  ��  j ���� L   ^ `�� o   ^ _���� 0 here  ��  4 ��� l     ��������  ��  ��  � ��� l     ������  � 0 * BinarySearch Insert item if unique by key   � ��� T   B i n a r y S e a r c h   I n s e r t   i t e m   i f   u n i q u e   b y   k e y� ��� l     ������  � I C  (modified from http://www.macscripter.net/viewtopic.php?id=43598)   � ��� �     ( m o d i f i e d   f r o m   h t t p : / / w w w . m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? i d = 4 3 5 9 8 )� ��� i    ��� I      ������� @0 binaryorderedinsertuniquebykey binaryOrderedInsertUniqueByKey� ��� o      ���� 0 thelist theList� ���� o      ���� 0 newitem newItem��  ��  � k     ��� ��� l     ������  � > 8 http://macscripter.net/viewtopic.php?pid=178453#p178453   � ��� p   h t t p : / / m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? p i d = 1 7 8 4 5 3 # p 1 7 8 4 5 3� ��� h     ����� 0 o  � j     ����� 0 lst  � o     ���� 0 thelist theList� ��� l   ��������  ��  ��  � ��� Z    ������� =   ��� o    	���� 0 thelist theList� J   	 ����  � L    �� J    �� ���� o    ���� 0 newitem newItem��  ��  ��  � ��� l   ��������  ��  ��  � ��� r    '��� n   %��� I    %������� &0 binaryinsposbykey binaryInsPosByKey� ��� n   ��� o    ���� 0 lst  � o    ���� 0 o  � ���� l   !������ e    !�� n    !��� 4     ���
�� 
cobj� m    ���� � o    ���� 0 newitem newItem��  ��  ��  ��  �  f    � o      ���� 0 ix  � ��� l  ( (��������  ��  ��  � ��� l  ( (������  �   Only insert UNIQUE keys:   � ��� 2   O n l y   i n s e r t   U N I Q U E   k e y s :� ��� Z  ( 4������� =   ( +� � o   ( )���� 0 ix    m   ) *������� L   . 0 o   . /���� 0 thelist theList��  ��  �  l  5 5��������  ��  ��    Z   5 �	 =  5 8

 o   5 6�� 0 ix   m   6 7�~�~  r   ; D b   ; B J   ; > �} o   ; <�|�| 0 newitem newItem�}   n  > A o   ? A�{�{ 0 lst   o   > ?�z�z 0 o   o      �y�y 0 nl NL  B   G P o   G H�x�x 0 ix   l  H O�w�v I  H O�u�t
�u .corecnte****       **** n  H K o   I K�s�s 0 lst   o   H I�r�r 0 o  �t  �w  �v   �q r   S v b   S t  b   S f!"! n   S b#$# 7  V b�p%&
�p 
cobj% m   Z \�o�o & l  ] a'�n�m' \   ] a()( o   ^ _�l�l 0 ix  ) m   _ `�k�k �n  �m  $ n  S V*+* o   T V�j�j 0 lst  + o   S T�i�i 0 o  " J   b e,, -�h- o   b c�g�g 0 newitem newItem�h    n   f s./. 7  i s�f01
�f 
cobj0 o   m o�e�e 0 ix  1 m   p r�d�d��/ n  f i232 o   g i�c�c 0 lst  3 o   f g�b�b 0 o   o      �a�a 0 nl NL�q  	 r   y �454 b   y �676 n  y |898 o   z |�`�` 0 lst  9 o   y z�_�_ 0 o  7 J   | :: ;�^; o   | }�]�] 0 newitem newItem�^  5 o      �\�\ 0 nl NL <=< l  � ��[�Z�Y�[  �Z  �Y  = >�X> L   � �?? o   � ��W�W 0 nl NL�X  � @�V@ l     �U�T�S�U  �T  �S  �V       �RABCDEFGHII�Q�P�O�N�M�R  A �L�K�J�I�H�G�F�E�D�C�B�A�@�?
�L .aevtoappnull  �   � ****�K 0 is_minimized  �J 0 get_next_in_list  �I &0 binarysearchbykey binarySearchByKey�H (0 binarysearchbyname binarySearchByName�G &0 binaryinsposbykey binaryInsPosByKey�F @0 binaryorderedinsertuniquebykey binaryOrderedInsertUniqueByKey�E $0 frontmostprocess frontmostProcess�D 0 	front_app  �C  �B  �A  �@  �?  B �> �=�<JK�;
�> .aevtoappnull  �   � ****�= 0 argv  �<  J �:�9�: 0 argv  �9 0 win  K   )�8�7L�6�5�4�3 K R�2�1�0�/�.�-�,�+�*�)�(�'�& ��%�$.�#G�"
�8 
prcs
�7 
pnamL  
�6 
pisf�5 $0 frontmostprocess frontmostProcess�4 0 	front_app  
�3 
cobj
�2 
bool�1 0 	dimension  
�0 
pcap
�/ 
cwin
�. 
posn�- 0 current_window_pos_dim  �, 40 sorteddimpositionstowins sortedDimPositionstoWins
�+ 
kocl
�* .corecnte****       ****
�) 
capp�( 0 app_win  �' 0 is_minimized  �& @0 binaryorderedinsertuniquebykey binaryOrderedInsertUniqueByKey�% 0 get_next_in_list  �$ 0 next_window_pos  
�# 
actT
�" .prcsperfnull���     actT�;S� *�k/�,�[�,\Ze81E�UO�E�O��k/� 
 
��k/� �& kE�Y lE�O� �*��/ {*�k/�,E��/EE�OjvE` O c*�-[a �l kh ) H*a �/ *�k/�[�,\Z��,81E` OPUO*_ k+  Y *_ ��,E��/E�lvl+ E` U[OY��UUO��k/a   *_ �km+ E` Y W��k/a   *_ �jm+ E` Y ;��k/a   *_ �jm+ E` Y ��k/a   *_ �km+ E` Y hO� *��/ _ �l/a a /j UUOPC �!Z� �MN��! 0 is_minimized  �  �O� O  �� 0 win  �  M ��� 0 win  � 0 win_is_minimized  N ��������
� 
pcap� 0 	front_app  
� 
pmnd�  �  � 0 	minimized  � 0 	collapsed  � I� E*��/ =fE�O ��,EE�W *X   ��,EE�W X   ��,EE�W X  hO�UUD ����PQ�� 0 get_next_in_list  � �R� R  ���� 0 sorted_list  � 0 current_value  � 0 beforeorafter beforeOrAfter�  P �
�	���
 0 sorted_list  �	 0 current_value  � 0 beforeorafter beforeOrAfter� 0 currentindex currentIndexQ ��� &0 binarysearchbykey binarySearchByKey
� 
cobj� $*��l+  E�O�j  ��k/EY 
��k/EE ����ST�� &0 binarysearchbykey binarySearchByKey� � U�  U  ������ 0 avalue aValue�� 
0 values  �  S ���������������� 0 avalue aValue�� 
0 values  �� 0 res  �� 0 valueslength valuesLength�� 0 midindex midIndex�� 0 midvalue midValue�� 0 childres childResT ������
�� .corecnte****       ****
�� 
cobj�� &0 binarysearchbykey binarySearchByKey� �jE�O�j  E�O�k  ���k/�k/  kY hOiY hO�l"E�O��/�k/EE�O�� )��[�\[Zk\Z�2l+ E�Y B�� /)��[�\[Z�k\Z�2l+ E�O�j �Y hO�l"�E�Y ��  �E�Y hO�OPF �������VW���� (0 binarysearchbyname binarySearchByName�� ��X�� X  ������ 0 avalue aValue�� 
0 values  ��  V ���������������� 0 avalue aValue�� 
0 values  �� 0 res  �� 0 valueslength valuesLength�� 0 midindex midIndex�� 0 midvalue midValue�� 0 childres childResW ��������
�� .corecnte****       ****
�� 
cobj
�� 
pnam�� (0 binarysearchbyname binarySearchByName�� �jE�O�j  E�O�k  ���k/�,E  kY hOiY hO�l"E�O��/�,EE�O�� )��[�\[Zk\Z�2l+ E�Y B�� /)��[�\[Z�k\Z�2l+ E�O�j �Y hO�l"�E�Y ��  �E�Y hO�OPG ��6����YZ���� &0 binaryinsposbykey binaryInsPosByKey�� ��[�� [  ������ 0 thelist theList�� 0 v  ��  Y ���������������� 0 thelist theList�� 0 v  �� 0 o  �� 0 len  �� 0 l  �� 0 here  �� 0 m  Z ��H\�������� 0 o  \ ��]����^_��
�� .ascrinit****      � ****] k     `` H����  ��  ��  ^ ���� 0 lst  _ ���� 0 lst  �� b   �
�� .corecnte****       ****�� 0 lst  
�� 
cobj�� a��K S�O�j E�OkE�O�kE�O Bh�� ��l"E�O��,�/�k/�  iY hO��,�/�k/� �E�Y �kE�[OY��O�H �������ab���� @0 binaryorderedinsertuniquebykey binaryOrderedInsertUniqueByKey�� ��c�� c  ������ 0 thelist theList�� 0 newitem newItem��  a ������������ 0 thelist theList�� 0 newitem newItem�� 0 o  �� 0 ix  �� 0 nl NLb ���d���������� 0 o  d ��e����fg��
�� .ascrinit****      � ****e k     hh �����  ��  ��  f ���� 0 lst  g ���� 0 lst  �� b   ��� 0 lst  
�� 
cobj�� &0 binaryinsposbykey binaryInsPosByKey
�� .corecnte****       ****�� ���K S�O�jv  	�kvY hO)��,��k/El+ E�O�i  �Y hO�k  �kv��,%E�Y =���,j  (��,[�\[Zk\Z�k2�kv%��,[�\[Z�\Zi2%E�Y ��,�kv%E�O�I �ii  S c r i p t   E d i t o r�Q  �P  �O  �N  �M   ascr  ��ޭ