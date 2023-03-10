#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��W�cmain.sh �Xmo��_q��d�/s�f�4Fې�&[�u%1�H��ɒ6�7d)�,�z[�[�ͯ	e�S�B�%)�d�݇H^�s�}�s}�TTuɪr�Y�W	�g3`�[K�i�I�[D�A�Ѧjۦ5/Iծ6�bԥV{z.�(15�lt�t�mA�-[�4�I�
k�˩�a^��m�(k�$/W��[@��D�Fb�^c�z$��M4�h'���(J�n�,�й�l6�/�WWR�(�3�d�X6P��"}�l:�^ȥ�|:�w*�.��$lq��@b�xM�U�p�e�t�)�p�樻�o8Y>21��l�ܪAt%�J�aˤ*.;2ՉN�'lF�6;�=�,r�gSV���	h�/�z�P�X3d�]7eU�=�k6�j�3ls5��_Pb� �ZE�1�K�f�-�y�9�^\�=V˦*�7� ���Oޒ�D�u>�k�Pj�y�$�� p}<4ղσ�=(U�Ԡm4(�n�&F�6U�=�e�խm�R�:	-w,�;jI�x�4-o�i8�R�-Z��|m(B�1)�R"�C�}8xs8)�`�A>�D	�ʎ�x�>x�o��#�x JFK��T�D�zm%�T�,�\I�g�]�x�nx�76�x[5�.l�br�Z^+0�`�ތ/�Y�by�N"#l��"�z��b�&*�*�=�7�O�;x�PE�h�L�J�6\2z):zBB)櫪��A,�j�Aݲ�}�{ٳ�++Z��ѼJh�'��;�+S�6�SF(2˹|n�*�:D�(*BU�{��f:>�
W2�3�W�|�ը�W&I�s9�x�w��:# c ׈�+ق�c]��ks&�w�Y�,��3���@𔛔X�XlX��h$�k,�5u�M/�W��/,�.�S�}v"z�:��W�:>�@?)�MR��B�;� �avz�E�H�F��6�P(J
�ZJ�;�
�ep�Ko�|�I� �?�
<?�J��?�6d�-�F�N4�z	Eٍ=X�\�L0�V/:�>,%,�kX�%�6fgo�ZMQR�VĶ\�@�p٩T�mcC�v�+�x�>�0�qxS*�7�op=�7n��#�_�㽻GO>dJ�s�{�~�>nG�
oQ�mU�diZ�5�e�J�11vp`&y6g�"�F�WT[�N̊��r95s{��U��Ԩi�fŹY�e�L39ضd}�OK�j�h�
�I�NK�ۡ� 0��>N� � MX�j
�)e�k]�H3yQ�J�vUX\�(�Jkiy
�?�LN�|�S�c�D~y�a�L2#��7޳6��<�_C�Y�Z�9[�s�~�O�~�[���k�W��/��o;�g�/�8��t�Χ�Y��b�ˬ����َ�J$�p��%�sp�ٯY�>�C�?z��O�C#�*�o*&�.�t�W�}thY�Uö~r�lW�_8�>DW�")�bɹ��;��{�"g�a�񐅟�7�?�˺�5�/ݯ��K�_�?�g�>�9�ߓ^�j�D�v�H\6�]�j�w�]=k�XԌ�e6s�97k-�s��o�i�Zg�̾�l�E�X\�x�ը̽V�P�AE�q�c�S�>�e�S�O�NX�[_a{e�C-}p�>�j>�%�Ԣ�#
z(�`wl�B�;y�`? Z�u  