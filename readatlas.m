function [regions,nregions,A,InvR]=readatlas()
%NO INPUT
%OUPUT: 
%nregions:The number of regions
%regions: regions.name contains the name of each brain regions
%regions.volume contains the number of voxels in each region
%regions.x: contains the x coordinates of each voxel, region by region
%regions.y: contains the y coordinates of each voxel, region by region
%regions.z: contains the y coordinates of each voxel, region by region
%regions.categ %0->not useable, 1-> subcortical, 2-> cortical
%regions.hemi=zeros(1,nregions);%0->left 1-> right 2->not applicable
%A, a 256X256X256 array containing the Desikan atlas

A=niftiread('aparcDKT40+aseg');
count=0;
MM=max(max(max(A)));
R=zeros(1,MM);
InvR=zeros(1,MM);
for j=1:MM
    if isempty(find(A==j,1))==0
        count=count+1;
        R(count)=j;
        InvR(j)=count;
    end
end
R=R(1:count);
nregions=length(R);

regions.name=cell(1,nregions);%contains the name of each brain regions
regions.volume=zeros(1,nregions);%Contains the number of voxels in each region
regions.categ=zeros(1,nregions);%0->not useable, 1-> subcortical, 2-> cortical
regions.hemi=zeros(1,nregions);%0->left 1-> right 2->not applicable

regions.name{1}='left_hemi';
regions.categ(1)=0;
regions.hemi(1)=0;

regions.name{2}='caudate_l';
regions.categ(2)=1;
regions.hemi(2)=0;

regions.name{3}='top_cerebellum?';
regions.categ(3)=0;
regions.hemi(3)=2;

regions.name{4}='middle_cerebellum?';
regions.categ(4)=0;
regions.hemi(4)=2;

regions.name{5}='bottom_cerebellum?';
regions.categ(5)=0;
regions.hemi(5)=2;

regions.name{6}='thalamus_l';
regions.categ(6)=1;
regions.hemi(6)=0;

regions.name{7}='part of caudate';
regions.categ(7)=0;
regions.hemi=0;

regions.name{8}='putamen_l';
regions.categ(8)=1;
regions.hemi(8)=0;

regions.name{9}='pallidus_l';
regions.categ(9)=1;
regions.hemi(9)=0;

regions.name{10}='Hippotalamus center';
regions.categ(10)=0;
regions.hemi(10)=2;

regions.name{11}='front cerebellum?';
regions.categ(11)=0;
regions.hemi(11)=2;

regions.name{12}='brainstem center';
regions.categ(12)=0;
regions.hemi(12)=2;

regions.name{13}='hippocampus_l';
regions.categ(13)=1;
regions.hemi(13)=0;

regions.name{14}='Amygdala_l';
regions.categ(14)=1;
regions.hemi(14)=0;

regions.name{15}='midbrain';
regions.categ(15)=0;
regions.hemi(15)=2;

regions.name{16}='Accumbens_l';
regions.categ(16)=1;
regions.hemi(16)=0;

regions.name{17}='Substantia negra';
regions.categ(17)=0;
regions.hemi(17)=2;

regions.name{18}='Pituary gland';
regions.categ(18)=0;
regions.hemi(18)=2;

regions.name{19}='Useless ventricle';
regions.categ(19)=0;
regions.hemi(19)=2;

regions.name{20}='right hemi';
regions.categ(20)=0;
regions.hemi(20)=1;

regions.name{21}='caudate_r';
regions.categ(21)=1;
regions.hemi(21)=1;

regions.name{22}='??';
regions.categ(22)=0;
regions.hemi(22)=1;

regions.name{23}='cerebellum';
regions.categ(23)=0;
regions.hemi(23)=1;

regions.name{24}='cerebellum_bottom';
regions.categ(24)=0;
regions.hemi(24)=1;

regions.name{25}='thalamus_r';
regions.categ(25)=1;
regions.hemi(25)=1;

regions.name{26}='Amygdala_r';
regions.categ(26)=0;
regions.hemi(26)=1;

regions.name{27}='Putamen_r';
regions.categ(27)=1;
regions.hemi(27)=1;

regions.name{28}='Pallidus_r';
regions.categ(28)=1;
regions.hemi(28)=1;

regions.name{29}='Hippocampus_r';
regions.categ(29)=1;
regions.hemi(29)=1;

regions.name{30}='Amygdala_r';
regions.categ(30)=1;
regions.hemi(30)=1;

regions.name{31}='Accumbens_r';
regions.categ(31)=1;
regions.hemi(31)=1;

regions.name{32}='?';
regions.categ(32)=0;
regions.hemi(32)=2;

regions.name{33}='??';
regions.categ(33)=0;
regions.hemi(33)=2;

regions.name{34}='?';
regions.categ(34)=0;
regions.hemi(34)=2;

regions.name{35}='Ventral DC';
regions.categ(35)=0;
regions.hemi(35)=2;

regions.name{36}='pituary gland?';
regions.categ(36)=0;
regions.hemi(36)=2;

regions.name{37}='Accumbens fissure cetrale';
regions.categ(37)=0;
regions.hemi(37)=2;

regions.name{38}='Fissure centrale';
regions.categ(38)=0;
regions.hemi(38)=2;

regions.name{39}='Fissure centrale avant';
regions.categ(39)=0;
regions.hemi(39)=2;

regions.name{40}='Fissure centrale';
regions.categ(40)=0;
regions.hemi(40)=2;

regions.name{41}='Fissure centrale';
regions.categ(41)=0;
regions.hemi(41)=2;

regions.name{42}='Corpus callosum_r';
regions.categ(42)=0;
regions.hemi(42)=2;

regions.name{43}='Caudal anterior cingulate_r';
regions.categ(43)=2;
regions.hemi(43)=1;

regions.name{44}='Caudal middle frontal_r';
regions.categ(44)=2;
regions.hemi(44)=1;

regions.name{45}='Cuneus_r';
regions.categ(45)=2;
regions.hemi(45)=1;

regions.name{46}='Enthorinal_r';
regions.categ(46)=2;
regions.hemi(46)=1;

regions.name{47}='Fusiform_r';
regions.categ(47)=2;
regions.hemi(47)=1;

regions.name{48}='Inferior parietal_r';
regions.categ(48)=2;
regions.hemi(48)=1;

regions.name{49}='Inferiror temporal_r';
regions.categ(49)=2;
regions.hemi(49)=1;

regions.name{50}='Isthmus cingulate_r';
regions.categ(50)=2;
regions.hemi(50)=1;

regions.name{51}='lateral occipital_r';
regions.categ(51)=2;
regions.hemi(51)=1;

regions.name{52}='lateral orbital frontal_r';
regions.categ(52)=2;
regions.hemi(52)=1;

regions.name{53}='Lingual_r';
regions.categ(53)=2;
regions.hemi(53)=1;

regions.name{54}='Medial orbital frontal_r';
regions.categ(54)=2;
regions.hemi(54)=1;

regions.name{55}='Middle temporal_r';
regions.categ(55)=2;
regions.hemi(55)=1;

regions.name{56}='parahippocampal_r';
regions.categ(56)=2;
regions.hemi(56)=1;

regions.name{57}='paracentral_r';
regions.categ(57)=2;
regions.hemi(57)=1;

regions.name{58}='pars opercularis_r';
regions.categ(58)=2;
regions.hemi(58)=1;

regions.name{59}='pars orbitalis_r';
regions.categ(59)=2;
regions.hemi(59)=1;

regions.name{60}='pars triangularis_r';
regions.categ(60)=2;
regions.hemi(60)=1;

regions.name{61}='Pericalcarine_r';
regions.categ(61)=2;
regions.hemi(61)=1;

regions.name{62}='Postcentral_r';
regions.categ(62)=2;
regions.hemi(62)=1;

regions.name{63}='posterior cingulte_r';
regions.categ(63)=2;
regions.hemi(63)=1;

regions.name{64}='precentral_r';
regions.categ(64)=2;
regions.hemi(64)=1;

regions.name{65}='Precuneus_r';
regions.categ(65)=2;
regions.hemi(65)=1;

regions.name{66}='Rostral anterior cingulate_r';
regions.categ(66)=2;
regions.hemi(66)=1;

regions.name{67}='Rostral middle frontal_r';
regions.categ(67)=2;
regions.hemi(67)=1;

regions.name{68}='Superior frontal_r';
regions.categ(68)=2;
regions.hemi(68)=1;

regions.name{69}='Superior parietal_r';
regions.categ(69)=2;
regions.hemi(69)=1;

regions.name{70}='Superior temporal_r';
regions.categ(70)=2;
regions.hemi(70)=1;

regions.name{71}='Supramarginal_r';
regions.categ(71)=2;
regions.hemi(71)=1;

regions.name{72}='Tranverse temporal_r';
regions.categ(72)=2;
regions.hemi(72)=1;

regions.name{73}='Insula_r';
regions.categ(73)=2;
regions.hemi(73)=1;

regions.name{74}='Corpus callosum left';
regions.categ(74)=0;
regions.hemi(74)=2;

regions.name{75}='Caudal anterior cingulate_l';
regions.categ(75)=2;
regions.hemi(75)=0;

regions.name{76}='Caudal middle frontal_l';
regions.categ(76)=2;
regions.hemi(76)=0;

regions.name{77}='Cunneus_l';
regions.categ(77)=2;
regions.hemi(77)=0;

regions.name{78}='Enthorinal_l';
regions.categ(78)=2;
regions.hemi(78)=0;

regions.name{79}='Fusiform_l';
regions.categ(79)=2;
regions.hemi(79)=0;

regions.name{80}='Inferior parietal_l';
regions.categ(80)=2;
regions.hemi(80)=0;

regions.name{81}='Inferior temporal_l';
regions.categ(81)=2;
regions.hemi(81)=0;

regions.name{82}='Isthmus cingulate_l';
regions.categ(82)=2;
regions.hemi(82)=0;

regions.name{83}='Lateral occipital_l';
regions.categ(83)=2;
regions.hemi(83)=0;

regions.name{84}='Lateral orbital frontal_l';
regions.categ(84)=2;
regions.hemi(84)=0;

regions.name{85}='Lingual_l';
regions.categ(85)=2;
regions.hemi(85)=0;

regions.name{86}='Medial orbital frontal_l';
regions.categ(86)=2;
regions.hemi(86)=0;

regions.name{87}='Middle temporal_l';
regions.categ(87)=2;
regions.hemi(87)=0;

regions.name{88}='Parahippocampal_l';
regions.categ(88)=2;
regions.hemi(88)=0;

regions.name{89}='Paracentral_l';
regions.categ(89)=2;
regions.hemi(89)=0;

regions.name{90}='Pars opercularis_l';
regions.categ(90)=2;
regions.hemi(90)=0;

regions.name{91}='Pars orbitalis_l';
regions.categ(91)=2;
regions.hemi(91)=0;

regions.name{92}='Pars triangularis_l';
regions.categ(92)=2;
regions.hemi(92)=0;

regions.name{93}='Pericalcirine_l';
regions.categ(93)=2;
regions.hemi(93)=0;

regions.name{94}='Postcentral_l';
regions.categ(94)=2;
regions.hemi(94)=0;

regions.name{95}='Posterior cingular_l';
regions.categ(95)=2;
regions.hemi(95)=0;

regions.name{96}='Precentral_l';
regions.categ(96)=2;
regions.hemi(96)=0;

regions.name{97}='Precuneus_l';
regions.categ(97)=2;
regions.hemi(97)=0;

regions.name{98}='Rostral anterior cingulate_l';
regions.categ(98)=2;
regions.hemi(98)=0;

regions.name{99}='Rostral middle frontal_l';
regions.categ(99)=2;
regions.hemi(99)=0;

regions.name{100}='Superior frontal_l';
regions.categ(100)=2;
regions.hemi(100)=0;

regions.name{101}='Superior parietal_l';
regions.categ(101)=2;
regions.hemi(101)=0;

regions.name{102}='Superior temporal_l';
regions.categ(102)=2;
regions.hemi(102)=0;

regions.name{103}='Supermarginal_l';
regions.categ(103)=2;
regions.hemi(103)=0;

regions.name{104}='Transverse temporal_l';
regions.categ(104)=2;
regions.hemi(104)=0;

regions.name{105}='Insula_l';
regions.categ(105)=2;
regions.hemi(105)=0;

for j=1:nregions
    U=find(A==R(j));
    regions.volume(j)=length(U);
end

regions.x=zeros(nregions,max(regions.volume));%contains the x coordinates of each voxel, region by region
regions.y=zeros(nregions,max(regions.volume));%contains the y coordinates of each voxel, region by region
regions.z=zeros(nregions,max(regions.volume));%contains the z coordinates of each voxel, region by region

for j=1:nregions
    U=find(A==R(j));
    Q=floor(U/(256*256));
    Rem=U-Q*256*256;
    Q2=floor(Rem/256);
    Q3=Rem-256*Q2;
    regions.x(j,1:length(U))=Q;
    regions.y(j,1:length(U))=Q2;
    regions.z(j,1:length(U))=Q3;
end

end