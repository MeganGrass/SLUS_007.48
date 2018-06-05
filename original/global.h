
#pragma pack(push, 1)
typedef struct tagMATRIX {
	signed short int m[3][3];
	signed long int t[3];
} MATRIX;
typedef struct tagVECTOR {
	signed long int vx;
	signed long int vy;
	signed long int vz;
	signed long int pad;
} VECTOR;
typedef struct tagSVECTOR {
	signed short int vx;
	signed short int vy;
	signed short int vz;
	signed short int pad;
} SVECTOR;
typedef struct tagCVECTOR {
	unsigned char r;
	unsigned char g;
	unsigned char b;
	unsigned char cd;
} CVECTOR;
typedef struct tagDVECTOR {
	signed short int vx;
	signed short int vy;
} DVECTOR;
typedef struct tagEVECTOR {
	SVECTOR v;
	VECTOR sxyz;
	DVECTOR sxy;
	CVECTOR rgb;
	signed short int txuv;
	signed short int pad;
	signed long int chx;
	signed long int chy;
} EVECTOR;
typedef struct tagRVECTOR {
	SVECTOR v;
	unsigned char uv[2];
	unsigned short int pad;
	CVECTOR c;
	DVECTOR sxy;
	unsigned long int sz;
} RVECTOR;
typedef struct tagCRVECTOR3 {
	RVECTOR r01;
	RVECTOR r12;
	RVECTOR r20;
	RVECTOR * r0;
	RVECTOR * r1;
	RVECTOR * r2;
	unsigned long int * rtn;
} CRVECTOR3;
typedef struct tagDIVPOLYGON3 {
	unsigned long int ndiv;
	unsigned long int pih;
	unsigned long int piv;
	unsigned short int clut;
	unsigned short int tpage;
	CVECTOR rgbc;
	unsigned long int * ot;
	RVECTOR r0;
	RVECTOR r1;
	RVECTOR r2;
	CRVECTOR3 cr[5];
} DIVPOLYGON3;
typedef struct tagCRVECTOR4 {
	RVECTOR r01;
	RVECTOR r02;
	RVECTOR r31;
	RVECTOR r32;
	RVECTOR rc;
	RVECTOR * r0;
	RVECTOR * r1;
	RVECTOR * r2;
	RVECTOR * r3;
	unsigned long int * rtn;
} CRVECTOR4;
typedef struct tagDIVPOLYGON4 {
	unsigned long int ndiv;
	unsigned long int pih;
	unsigned long int piv;
	unsigned short int clut;
	unsigned short int tpage;
	CVECTOR rgbc;
	unsigned long int * ot;
	RVECTOR r0;
	RVECTOR r1;
	RVECTOR r2;
	RVECTOR r3;
	CRVECTOR4 cr[5];
} DIVPOLYGON4;
typedef struct tagSPOL {
	signed short int xy[3];
	signed short int uv[2];
	signed short int rgb[3];
} SPOL;
typedef struct tagPOL4 {
	signed short int sxy[4][2];
	signed short int sz[4][2];
	signed short int uv[4][2];
	signed short int rgb[4][3];
	signed short int code;
} POL4;
typedef struct tagPOL3 {
	signed short int sxy[3][2];
	signed short int sz[3][2];
	signed short int uv[3][2];
	signed short int rgb[3][3];
	signed short int code;
} POL3;
typedef struct tagTMESH {
	SVECTOR * v;
	SVECTOR * n;
	SVECTOR * u;
	CVECTOR * c;
	unsigned long int len;
} TMESH;
typedef struct tagQMESH {
	SVECTOR * v;
	SVECTOR * n;
	SVECTOR * u;
	CVECTOR * c;
	unsigned long int lenv;
	unsigned long int lenh;
} QMESH;
typedef struct tagRECT16 {
	signed short int x;	// left
	signed short int y;	// top
	signed short int w;	// right
	signed short int h;	// bottom
} RECT16;
typedef struct tagRECT32 {
	signed int x;	// left
	signed int y;	// top
	signed int w;	// right
	signed int h;	// bottom
} RECT32;
typedef struct tagDR_ENV {
	unsigned long int tag;
	unsigned long int code[15];
} DR_ENV;
typedef struct tagDRAWENV {
	RECT16 clip;
	signed short int ofs[2];
	RECT16 tw;
	unsigned short int tpage;
	unsigned char dtd;
	unsigned char dfe;
	unsigned char isbg;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	DR_ENV dr_env;
} DRAWENV;
typedef struct tagDISPENV {
	RECT16 disp;
	RECT16 screen;
	unsigned char isinter;
	unsigned char isrgb24;
	unsigned char pad0;
	unsigned char pad1;
} DISPENV;
typedef struct tagP_TAG {
	unsigned int addr;
	unsigned int len;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
} P_TAG;
typedef struct tagP_CODE {
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
} P_CODE;
typedef struct tagPOLY_F3 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	signed short int x1;
	signed short int y1;
	signed short int x2;
	signed short int y2;
} POLY_F3;
typedef struct tagPOLY_F4 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	signed short int x1;
	signed short int y1;
	signed short int x2;
	signed short int y2;
	signed short int x3;
	signed short int y3;
} POLY_F4;
typedef struct tagPOLY_F4_2 {
	unsigned long int * tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed long int pos[4];
} POLY_F4_2;
typedef struct tagPOLY_FT3 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	unsigned char u0;
	unsigned char v0;
	unsigned short int clut;
	signed short int x1;
	signed short int y1;
	unsigned char u1;
	unsigned char v1;
	unsigned short int tpage;
	signed short int x2;
	signed short int y2;
	unsigned char u2;
	unsigned char v2;
	unsigned short int pad1;
} POLY_FT3;
typedef struct tagPOLY_FT4 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	unsigned char u0;
	unsigned char v0;
	unsigned short int clut;
	signed short int x1;
	signed short int y1;
	unsigned char u1;
	unsigned char v1;
	unsigned short int tpage;
	signed short int x2;
	signed short int y2;
	unsigned char u2;
	unsigned char v2;
	unsigned short int pad1;
	signed short int x3;
	signed short int y3;
	unsigned char u3;
	unsigned char v3;
	unsigned short int pad2;
} POLY_FT4;
typedef struct tagPOLY_G3 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	unsigned char r1;
	unsigned char g1;
	unsigned char b1;
	unsigned char pad1;
	signed short int x1;
	signed short int y1;
	unsigned char r2;
	unsigned char g2;
	unsigned char b2;
	unsigned char pad2;
	signed short int x2;
	signed short int y2;
} POLY_G3;
typedef struct tagPOLY_G4 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	unsigned char r1;
	unsigned char g1;
	unsigned char b1;
	unsigned char pad1;
	signed short int x1;
	signed short int y1;
	unsigned char r2;
	unsigned char g2;
	unsigned char b2;
	unsigned char pad2;
	signed short int x2;
	signed short int y2;
	unsigned char r3;
	unsigned char g3;
	unsigned char b3;
	unsigned char pad3;
	signed short int x3;
	signed short int y3;
} POLY_G4;
typedef struct tagPOLY_GT3 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	unsigned char u0;
	unsigned char v0;
	unsigned short int clut;
	unsigned char r1;
	unsigned char g1;
	unsigned char b1;
	unsigned char p1;
	signed short int x1;
	signed short int y1;
	unsigned char u1;
	unsigned char v1;
	unsigned short int tpage;
	unsigned char r2;
	unsigned char g2;
	unsigned char b2;
	unsigned char p2;
	signed short int x2;
	signed short int y2;
	unsigned char u2;
	unsigned char v2;
	unsigned short int pad2;
} POLY_GT3;
typedef struct tagPOLY_GT4 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	unsigned char u0;
	unsigned char v0;
	unsigned short int clut;
	unsigned char r1;
	unsigned char g1;
	unsigned char b1;
	unsigned char p1;
	signed short int x1;
	signed short int y1;
	unsigned char u1;
	unsigned char v1;
	unsigned short int tpage;
	unsigned char r2;
	unsigned char g2;
	unsigned char b2;
	unsigned char p2;
	signed short int x2;
	signed short int y2;
	unsigned char u2;
	unsigned char v2;
	unsigned short int pad2;
	unsigned char r3;
	unsigned char g3;
	unsigned char b3;
	unsigned char p3;
	signed short int x3;
	signed short int y3;
	unsigned char u3;
	unsigned char v3;
	unsigned short int pad3;
} POLY_GT4;
typedef struct tagLINE_F2 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	signed short int x1;
	signed short int y1;
} LINE_F2;
typedef struct tagLINE_G2 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	unsigned char r1;
	unsigned char g1;
	unsigned char b1;
	unsigned char p1;
	signed short int x1;
	signed short int y1;
} LINE_G2;
typedef struct tagLINE_F3 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	signed short int x1;
	signed short int y1;
	signed short int x2;
	signed short int y2;
	unsigned long int pad;
} LINE_F3;
typedef struct tagLINE_G3 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	unsigned char r1;
	unsigned char g1;
	unsigned char b1;
	unsigned char p1;
	signed short int x1;
	signed short int y1;
	unsigned char r2;
	unsigned char g2;
	unsigned char b2;
	unsigned char p2;
	signed short int x2;
	signed short int y2;
	unsigned long int pad;
} LINE_G3;
typedef struct tagLINE_F4 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	signed short int x1;
	signed short int y1;
	signed short int x2;
	signed short int y2;
	signed short int x3;
	signed short int y3;
	unsigned long int pad;
} LINE_F4;
typedef struct tagLINE_G4 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	unsigned char r1;
	unsigned char g1;
	unsigned char b1;
	unsigned char p1;
	signed short int x1;
	signed short int y1;
	unsigned char r2;
	unsigned char g2;
	unsigned char b2;
	unsigned char p2;
	signed short int x2;
	signed short int y2;
	unsigned char r3;
	unsigned char g3;
	unsigned char b3;
	unsigned char p3;
	signed short int x3;
	signed short int y3;
	unsigned long int pad;
} LINE_G4;
typedef struct tagLINE_2 {
	unsigned long int * tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed long int pos[2];
} LINE_2;
typedef struct tagSPRT {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	unsigned char u0;
	unsigned char v0;
	unsigned short int clut;
	signed short int w;
	signed short int h;
} SPRT;
typedef struct tagSPRT_16 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	unsigned char u0;
	unsigned char v0;
	unsigned short int clut;
} SPRT_16;
typedef struct tagSPRT_8 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	unsigned char u0;
	unsigned char v0;
	unsigned short int clut;
} SPRT_8;
typedef struct tagTILE {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
	signed short int w;
	signed short int h;
} TILE;
typedef struct tagTILE_16 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
} TILE_16;
typedef struct tagTILE_8 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
} TILE_8;
typedef struct tagTILE_1 {
	unsigned long int tag;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char code;
	signed short int x0;
	signed short int y0;
} TILE_1;
typedef struct tagDR_MODE {
	unsigned long int tag;
	unsigned long int code[2];
} DR_MODE;
typedef struct tagDR_TWIN {
	unsigned long int tag;
	unsigned long int code[2];
} DR_TWIN;
typedef struct tagDR_AREA {
	unsigned long int tag;
	unsigned long int code[2];
} DR_AREA;
typedef struct tagDR_OFFSET {
	unsigned long int tag;
	unsigned long int code[2];
} DR_OFFSET;
typedef struct tagDR_MOVE {
	unsigned long int tag;
	unsigned long int code[5];
} DR_MOVE;
typedef struct tagDR_LOAD {
	unsigned long int tag;
	unsigned long int code[3];
	unsigned long int p[13];
} DR_LOAD;
typedef struct tagDR_TPAGE {
	unsigned long int tag;
	unsigned long int code[1];
} DR_TPAGE;
typedef struct tagSPRT2 {
	SPRT Sp[2];
	DR_MODE Dm[2];
} SPRT2;
typedef struct tagTMD_PRIM {
	unsigned long int id;
	unsigned char r0;
	unsigned char g0;
	unsigned char b0;
	unsigned char p0;
	unsigned char r1;
	unsigned char g1;
	unsigned char b1;
	unsigned char p1;
	unsigned char r2;
	unsigned char g2;
	unsigned char b2;
	unsigned char p2;
	unsigned char r3;
	unsigned char g3;
	unsigned char b3;
	unsigned char p3;
	unsigned short int tpage;
	unsigned short int clut;
	unsigned char u0;
	unsigned char v0;
	unsigned char u1;
	unsigned char v1;
	unsigned char u2;
	unsigned char v2;
	unsigned char u3;
	unsigned char v3;
	SVECTOR x0;
	SVECTOR x1;
	SVECTOR x2;
	SVECTOR x3;
	SVECTOR n0;
	SVECTOR n1;
	SVECTOR n2;
	SVECTOR n3;
	SVECTOR * v_ofs;
	SVECTOR * n_ofs;
	unsigned short int vert0;
	unsigned short int vert1;
	unsigned short int vert2;
	unsigned short int vert3;
	unsigned short int norm0;
	unsigned short int norm1;
	unsigned short int norm2;
	unsigned short int norm3;
} TMD_PRIM;
typedef struct tagTMD_MEM {
	unsigned long int * ver_top;
	unsigned long int n_ver;
	unsigned long int * nor_top;
	unsigned long int n_nor;
	unsigned long int * prim_top;
	unsigned long int n_poly;
	unsigned long int scale;
} TMD_MEM;
typedef struct tagTIM_IMAGE {
	unsigned long int mode;
	RECT16 * crect;
	unsigned long int * caddr;
	RECT16 * prect;
	unsigned long int * paddr;
} TIM_IMAGE;
typedef struct tag_TIM4 {
	signed long int id;
	signed long int flag;
	signed long int cbnum;
	signed short int cx;
	signed short int cy;
	signed short int cw;
	signed short int ch;
	unsigned char clut[32];
	signed long int pbnum;
	signed short int px;
	signed short int py;
	signed short int pw;
	signed short int ph;
	unsigned char image[2];
} _TIM4;
typedef struct tagPRIM_F4 {
	DR_MODE mode;
	POLY_F4 prim;
} PRIM_F4;
typedef struct tagAT_TBL {
	signed short int Off_x;
	signed short int Off_y;
	signed short int Off_z;
	unsigned short int R;
	unsigned short int H;
	unsigned short int W;
} AT_TBL;
typedef struct tagAT_WORK {
	signed short int Off_x;
	signed short int Off_y;
	signed short int Off_z;
} AT_WORK;
typedef struct tagBOX {
	signed short int X;
	signed short int Z;
	unsigned short int W;
	unsigned short int D;
} BOX;
typedef struct tagAT_DATA {
	signed long int X;
	signed long int Y;
	signed long int Z;
	unsigned short int W;
	unsigned short int D;
	signed short int Ofs_x;
	signed short int Ofs_z;
	signed short int Ofs_y;
	unsigned short int At_w;
	unsigned short int At_d;
	unsigned short int At_h;
	signed short int Atw_x;
	signed short int Atw_z;
} AT_DATA;
typedef struct tagSCA_DATA {
	SHORT X;
	SHORT Z;
	USHORT W;
	USHORT D;
	union uId {
		USHORT Id;
		struct {
			USHORT shape:4;
			USHORT unk0:4;	// 0x00 = Weapon Collision OFF (Desk, etc)
							// 0x08 = Weapon Collision ON (Wall, etc)
			USHORT unk1:1;	// 0x00 = nFloor Height OFF (Cannot Walk Under)
							// 0x01 = nFloor Height ON (Can Walk Under)
			USHORT unk2:1;	// 0x00 = 
							// 0x01 = 
			USHORT unk3:1;	// 0x00 = Enemy Collision OFF
							// 0x01 = Enemy Collision ON
			USHORT unk4:1;	// 0x00 = 
							// 0x01 = 
			USHORT unk5:1;	// 0x00 = 
							// 0x01 = 
			USHORT unk6:1;	// 0x00 = Bullet Collision OFF
							// 0x01 = Bullet Collision ON
			USHORT unk7:1;	// 0x00 = Object Collision OFF
							// 0x01 = Object Collision ON
			USHORT unk8:1;	// 0x00 = Player Collision OFF
							// 0x01 = Player Collision ON
		} s;
	} Id;
	union uType {
		USHORT Type;
		struct {
			USHORT h:2;		// Width Multiplier X/W (0-3)
			USHORT y:2;		// Depth Multiplier Z/D (0-3)
											// These values seem to determine if the
											// W/D values match or exceed the necessary
											// requirements for actual collision, where
											// the player comes into contact with said
											// collision data.
			USHORT Type:2;	// Stair/Slope/Platform Access
											// 00	Climb/Ascend/Jump down from Z-Axis
											// 01	Climb/Ascend/Jump up from Z-Axis
											// 02	Climb/Ascend/Jump down from X-Axis
											// 03	Climb/Ascend/Jump up from X-Axis
			USHORT tFloor:6;// Height Multiplier (0-9)
											// This value determines both shadow and
											// bullet deflection height (nFloor).
			USHORT Nine:4;	// This value is always 9
											// There's only one exception in the entire
											// game - Retail ROOM104 (Wrecked Motorcycle)
		} s;
	} Type;
	ULONG Floor;
} SCA_DATA;
typedef struct tagSCA_HEAD {
	signed short int Cx;
	signed short int Cz;
	unsigned long int Num;
	signed long int Ceiling;
	unsigned long int Dummy;
} SCA_HEAD;
typedef struct tagITEM_WORK {
	unsigned char Id;
	unsigned char Num;
	unsigned char Size;
	unsigned char dummy;
} ITEM_WORK;
typedef struct tagMODEL_WORK {
	unsigned long int Attribute;
	unsigned long int * pTmd;
	unsigned long int * pPacket;
	unsigned long int * pTmd2;
	unsigned long int * pPacket2;
	signed short int M[3][3];
	signed long int Pos_x;
	signed long int Pos_y;
	signed long int Pos_z;
	signed short int Old_x;
	signed short int Old_y;
	signed short int Old_z;
	signed short int Old_x2;
	signed short int Old_y2;
	signed short int Old_z2;
	unsigned short int dummy00;
	MATRIX Workm;
	signed short int Cdir_x;
	signed short int Cdir_y;
	signed short int Cdir_z;
	unsigned short int dummy01;
	unsigned long int Poly_rgb;
	unsigned long int * pSuper;
} MODEL_WORK;
typedef struct tagKAGE_WORK {
	signed short int Off_x;		// 0x00
	signed short int Off_z;		// 0x02
	signed short int Half_x;	// 0x04
	signed short int Half_z;	// 0x06
	signed short int Pos_x;		// 0x08
	signed short int Pos_y;		// 0x0A
	signed short int Pos_z;		// 0x0C
	unsigned char Be_flg;		// 0x0E
	signed short int Dir_y;		// 0x0F
	VECTOR * pPos;				// 0x11
	POLY_FT4 Prim[2];			// 0x15
} KAGE_WORK;
typedef struct tagKAGE_WORK9 {
	signed short int Off_x;
	signed short int Off_z;
	signed short int Half_x;
	signed short int Half_z;
	signed short int Pos_x;
	signed short int Pos_y;
	signed short int Pos_z;
	unsigned char Be_flg;
	signed short int Dir_y;
	VECTOR * pPos;
	KAGE_WORK * pKw_top;
} KAGE_WORK9;
typedef struct tagWOUND_WORK {
	unsigned char Be_flg;
	unsigned char Timer;
	unsigned char dummy00;
	unsigned char dummy01;
	DR_MOVE Prim;
} WOUND_WORK;
typedef struct tagBOM_WORK {
	unsigned char wk_no;
} BOM_WORK;
typedef struct tagPARTS_W {
	unsigned long int Be_flg;
	unsigned long int Attribute;
	unsigned long int * pTmd;
	unsigned long int * pPacket;
	unsigned long int * pTmd2;
	unsigned long int * pPacket2;
	signed short int M[3][3];
	signed long int Pos_x;
	signed long int Pos_y;
	signed long int Pos_z;
	signed short int Old_x;
	signed short int Old_y;
	signed short int Old_z;
	signed short int Old_x2;
	signed short int Old_y2;
	signed short int Old_z2;
	unsigned short int dummy00;
	MATRIX Workm;
	signed short int Cdir_x;
	signed short int Cdir_y;
	signed short int Cdir_z;
	unsigned short int dummy01;
	unsigned long int Poly_rgb;
	unsigned long int * pSuper;
	unsigned char Parts_no;
	signed char Timer1;
	signed char Timer2;
	unsigned char Sabun_flg;
	signed short int Rot_x;
	signed short int Rot_y;
	signed short int Rot_z;
	signed short int Sabun_cnt0;
	signed short int Timer0;
	signed short int Timer3;
	unsigned long int * pSa_dat_head;
	signed short int Size_x;
	signed short int Size_y;
	signed short int Size_z;
	signed short int dummy03;
	unsigned long int * pOya_parts;
	signed short int Free[10];
} PARTS_W;
typedef struct tagPARTS_BOMB_FREE_WORK {
	signed short int V0_x;
	signed short int V0_y;
	signed short int V0_z;
	signed short int G;
	unsigned short int Cnt0;
	signed short int Offset_y;
	signed short int Gxz;
} PARTS_BOMB_FREE_WORK;
typedef struct tagPARTS_NECK_FREE_WORK {
	signed short int N_rot_y;
	signed short int N_rot_z;
	signed short int Add_dir_y;
	signed short int Add_dir_z;
	signed short int L_rot_y;
	signed short int L_rot_z;
	unsigned char Sce_add_dir_y;
	unsigned char Sce_add_dir_z;
} PARTS_NECK_FREE_WORK;
typedef struct tagPARTS_COLOR_CH_FREE_WORK {
	unsigned long int Color1;
	unsigned long int Color2;
} PARTS_COLOR_CH_FREE_WORK;
typedef struct tagPARTS_RYU_FREE_WORK {
	signed short int Gt3_y;
	signed short int Gt4_y;
	signed char Gt3_gy;
	signed char Gt4_gy;
	signed short int R_timer;
	unsigned char Down_flg;
} PARTS_RYU_FREE_WORK;
typedef struct tagOM_PARTS_WORK {
	unsigned long int be_flg;
	unsigned long int Attribute;
	unsigned long int * pTmd;
	unsigned long int * pPacket;
	unsigned long int * pTmd2;
	unsigned long int * pPacket2;
	signed short int M[3][3];
	signed long int Pos_x;
	signed long int Pos_y;
	signed long int Pos_z;
	signed short int Old_x;
	signed short int Old_y;
	signed short int Old_z;
	signed short int Old_x2;
	signed short int Old_y2;
	signed short int Old_z2;
	unsigned short int dummy00;
	MATRIX Workm;
	signed short int Cdir_x;
	signed short int Cdir_y;
	signed short int Cdir_z;
	unsigned short int dummy01;
	unsigned long int Poly_rgb;
	unsigned long int * pSuper;
	unsigned char parts_no;
	signed char timer;
	signed short int dummy03;
} OM_PARTS_WORK;
typedef struct tagOBJ_MODEL_WORK {
	unsigned long int Be_flg;
	unsigned char Routine_0;
	unsigned char Routine_1;
	unsigned char Routine_2;
	unsigned char Routine_3;
	unsigned char Id;
	unsigned char Sc_id;
	unsigned char At_obj_no;
	unsigned char At_sce_no;
	unsigned char Work_no;
	unsigned char At_em_no;
	unsigned short int At_em_flg;
	unsigned long int Attribute;
	unsigned long int * pTmd;
	unsigned long int * pPacket;
	unsigned long int * pTmd2;
	unsigned long int * pPacket2;
	signed short int M[3][3];
	signed long int Pos_x;
	signed long int Pos_y;
	signed long int Pos_z;
	signed short int Old_x;
	signed short int Old_y;
	signed short int Old_z;
	signed short int Old_x2;
	signed short int Old_y2;
	signed short int Old_z2;
	unsigned short int dummy00;
	MATRIX Workm;
	signed short int Cdir_x;
	signed short int Cdir_y;
	signed short int Cdir_z;
	unsigned short int dummy01;
	unsigned long int Poly_rgb;
	unsigned long int * pSuper;
	AT_DATA Atd[4];
	unsigned char Tpage;
	unsigned char Clut;
	unsigned char nFloor;
	unsigned char Parts_num;
	unsigned long int * pKan_t_ptr;
	signed short int Water;
	unsigned short int Type;
	unsigned long int Sca_info;
	SCA_DATA * pSca_hit_data;
	signed short int Sca_old_x;
	signed short int Sca_old_z;
	MATRIX Super_matrix;
	SVECTOR Super_vector;
	unsigned char Push_cnt;
	unsigned char Free0;
	OM_PARTS_WORK * pSin_parts_ptr;
	PARTS_W Parts;
} OBJ_MODEL_WORK;
typedef struct tagPLAYER_WORK {
	unsigned long int Be_flg;
	unsigned char Routine_0;
	unsigned char Routine_1;
	unsigned char Routine_2;
	unsigned char Routine_3;
	unsigned char Id;
	unsigned char Sc_id;
	unsigned char At_obj_no;
	unsigned char At_sce_no;
	unsigned char Work_no;
	unsigned char At_em_no;
	unsigned short int At_em_flg;
	unsigned long int Attribute;
	unsigned long int * pTmd;
	unsigned long int * pPacket;
	unsigned long int * pTmd2;
	unsigned long int * pPacket2;
	signed short int M[3][3];
	signed long int Pos_x;
	signed long int Pos_y;
	signed long int Pos_z;
	signed short int Old_x;
	signed short int Old_y;
	signed short int Old_z;
	signed short int Old_x2;
	signed short int Old_y2;
	signed short int Old_z2;
	unsigned short int dummy00;
	MATRIX Workm;
	signed short int Cdir_x;
	signed short int Cdir_y;
	signed short int Cdir_z;
	unsigned short int dummy01;
	unsigned long int Poly_rgb;
	unsigned long int * pSuper;
	AT_DATA Atd[4];
	unsigned char Tpage;
	unsigned char Clut;
	unsigned char nFloor;
	unsigned char Parts_num;
	unsigned long int * pKan_t_ptr;
	signed short int Water;
	unsigned short int Type;
	unsigned long int Sca_info;
	SCA_DATA * pSca_hit_data;
	signed short int Sca_old_x;
	signed short int Sca_old_z;
	MATRIX Super_matrix;
	SVECTOR Super_vector;
	signed short int Spd_x;
	signed short int Spd_y;
	signed short int Spd_z;
	unsigned char In_screen;
	unsigned char Model_Tex_type;
	unsigned char Move_no;
	unsigned char Move_cnt;
	unsigned char Hokan_flg;
	unsigned char Mplay_flg;
	unsigned char Root_ck_cnt;
	signed char D_life_u;
	signed char D_life_c;
	signed char D_life_d;
	unsigned short int Status_flg;
	signed short int Life;
	signed short int Timer0;
	signed short int Timer1;
	signed short int Fpos_x;
	signed short int Fpos_y;
	signed short int Fpos_z;
	signed short int Max_life;
	signed short int Base_pos_x;
	signed short int Base_pos_y;
	signed short int Base_pos_z;
	signed char Timer2;
	signed char Timer3;
	unsigned long int * pKage_work;
	signed short int Neck_point_x;
	signed short int Neck_point_y;
	signed short int Neck_point_z;
	signed short int Size;
	unsigned long int * pNow_seq;
	unsigned long int * pSeq_t_ptr;
	unsigned long int * pSub0_kan_t_ptr;
	unsigned long int * pSub0_seq_t_ptr;
	unsigned long int * pSub1_kan_t_ptr;
	unsigned long int * pSub1_seq_t_ptr;
	unsigned long int * pRoom_kan_t_ptr;
	unsigned long int * pRoom_seq_t_ptr;
	PARTS_W * pSin_parts_ptr;
	unsigned long int * pParts_tmd;
	unsigned long int * pParts_packet;
	unsigned long int * pM_char_ptr;
	unsigned long int * pM_option_tmd;
	unsigned long int * pM_option_packet;
	unsigned long int * pM_Kage_work;
	unsigned long int * pEnemy_ptr;
	unsigned long int * pEnemy_neck;
	unsigned long int * pSa_dat;
	unsigned char Neck_flg;
	unsigned char Neck_no;
	signed short int Ground;
	signed short int Dest_x;
	signed short int Dest_z;
	unsigned short int Down_cnt;
	unsigned char At_hit_flg;
	unsigned char Set_flg_no;
	unsigned short int Sce_flg;
	unsigned char Em_set_flg;
	unsigned char Model_type;
	unsigned short int Damage_flg;
	unsigned char Damage_no;
	unsigned char Damage_cnt;
	signed short int Sce_free0;
	signed short int Sce_free1;
	signed short int Sce_free2;
	signed short int Sce_free3;
	signed short int Spl_flg;
	signed short int Parts0_pos_y;
	SCA_DATA * pT_xz;
	OBJ_MODEL_WORK * pOn_om;
	unsigned long int nOba;
	unsigned char Attw_timer;
	unsigned char Attw_seq_no;
	signed short int Eff_at_r;
	unsigned long int L_pl;
	unsigned long int L_spl;
	signed short int Dir_spl;
	signed char Se_type;
	unsigned char Area_no;
	unsigned long int Tmp_routine;
	unsigned long int * pDamage_work;
	void * pTbefore_func;
	void * pTafter_func;
	signed short int Spd_base_x;
	signed short int Spd_base_y;
	signed short int Spd_base_z;
	signed short int Kage_ofs;
	unsigned short int Poison_timer;
	unsigned char Poison_down;
} PLAYER_WORK;
typedef struct tagSUBPLAY_WORK {
	unsigned long int Be_flg;
	unsigned char Routine_0;
	unsigned char Routine_1;
	unsigned char Routine_2;
	unsigned char Routine_3;
	unsigned char Id;
	unsigned char Sc_id;
	unsigned char At_obj_no;
	unsigned char At_sce_no;
	unsigned char Work_no;
	unsigned char At_em_no;
	unsigned short int At_em_flg;
	unsigned long int Attribute;
	unsigned long int * pTmd;
	unsigned long int * pPacket;
	unsigned long int * pTmd2;
	unsigned long int * pPacket2;
	signed short int M[3][3];
	signed long int Pos_x;
	signed long int Pos_y;
	signed long int Pos_z;
	signed short int Old_x;
	signed short int Old_y;
	signed short int Old_z;
	signed short int Old_x2;
	signed short int Old_y2;
	signed short int Old_z2;
	unsigned short int dummy00;
	MATRIX Workm;
	signed short int Cdir_x;
	signed short int Cdir_y;
	signed short int Cdir_z;
	unsigned short int dummy01;
	unsigned long int Poly_rgb;
	unsigned long int * pSuper;
	AT_DATA Atd[4];
	unsigned char Tpage;
	unsigned char Clut;
	unsigned char nFloor;
	unsigned char Parts_num;
	unsigned long int * pKan_t_ptr;
	signed short int Water;
	unsigned short int Type;
	unsigned long int Sca_info;
	SCA_DATA * pSca_hit_data;
	signed short int Sca_old_x;
	signed short int Sca_old_z;
	MATRIX Super_matrix;
	SVECTOR Super_vector;
	signed short int Spd_x;
	signed short int Spd_y;
	signed short int Spd_z;
	unsigned char In_screen;
	unsigned char Model_Tex_type;
	unsigned char Move_no;
	unsigned char Move_cnt;
	unsigned char Hokan_flg;
	unsigned char Mplay_flg;
	unsigned char Root_ck_cnt;
	signed char D_life_u;
	signed char D_life_c;
	signed char D_life_d;
	unsigned short int Status_flg;
	signed short int Life;
	signed short int Timer0;
	signed short int Timer1;
	signed short int Fpos_x;
	signed short int Fpos_y;
	signed short int Fpos_z;
	signed short int Max_life;
	signed short int Base_pos_x;
	signed short int Base_pos_y;
	signed short int Base_pos_z;
	signed char Timer2;
	signed char Timer3;
	unsigned long int * pKage_work;
	signed short int Neck_point_x;
	signed short int Neck_point_y;
	signed short int Neck_point_z;
	signed short int Size;
	unsigned long int * pNow_seq;
	unsigned long int * pSeq_t_ptr;
	unsigned long int * pSub0_kan_t_ptr;
	unsigned long int * pSub0_seq_t_ptr;
	unsigned long int * pSub1_kan_t_ptr;
	unsigned long int * pSub1_seq_t_ptr;
	unsigned long int * pRoom_kan_t_ptr;
	unsigned long int * pRoom_seq_t_ptr;
	PARTS_W * pSin_parts_ptr;
	unsigned long int * pParts_tmd;
	unsigned long int * pParts_packet;
	unsigned long int * pM_char_ptr;
	unsigned long int * pM_option_tmd;
	unsigned long int * pM_option_packet;
	unsigned long int * pM_Kage_work;
	unsigned long int * pEnemy_ptr;
	unsigned long int * pEnemy_neck;
	unsigned long int * pSa_dat;
	unsigned char Neck_flg;
	unsigned char Neck_no;
	signed short int Ground;
	signed short int Dest_x;
	signed short int Dest_z;
	unsigned short int Down_cnt;
	unsigned char At_hit_flg;
	unsigned char Set_flg_no;
	unsigned short int Sce_flg;
	unsigned char Em_set_flg;
	unsigned char Model_type;
	unsigned short int Damage_flg;
	unsigned char Damage_no;
	unsigned char Damage_cnt;
	signed short int Sce_free0;
	signed short int Sce_free1;
	signed short int Sce_free2;
	signed short int Sce_free3;
	signed short int Spl_flg;
	signed short int Parts0_pos_y;
	SCA_DATA * pT_xz;
	OBJ_MODEL_WORK * pOn_om;
	unsigned long int nOba;
	unsigned char Attw_timer;
	unsigned char Attw_seq_no;
	signed short int Eff_at_r;
	unsigned long int L_pl;
	unsigned long int L_spl;
	signed short int Dir_spl;
	signed char Se_type;
	unsigned char Area_no;
	unsigned long int Tmp_routine;
	unsigned long int * pDamage_work;
	void * pTbefore_func;
	void * pTafter_func;
	signed short int Spd_base_x;
	signed short int Spd_base_y;
	signed short int Spd_base_z;
	signed short int Kage_ofs;
} SUBPLAY_WORK;
typedef struct tagENEMY_WORK {
	unsigned long int Be_flg;
	unsigned char Routine_0;
	unsigned char Routine_1;
	unsigned char Routine_2;
	unsigned char Routine_3;
	unsigned char Id;
	unsigned char Sc_id;
	unsigned char At_obj_no;
	unsigned char At_sce_no;
	unsigned char Work_no;
	unsigned char At_em_no;
	unsigned short int At_em_flg;
	unsigned long int Attribute;
	unsigned long int * pTmd;
	unsigned long int * pPacket;
	unsigned long int * pTmd2;
	unsigned long int * pPacket2;
	signed short int M[3][3];
	signed long int Pos_x;
	signed long int Pos_y;
	signed long int Pos_z;
	signed short int Old_x;
	signed short int Old_y;
	signed short int Old_z;
	signed short int Old_x2;
	signed short int Old_y2;
	signed short int Old_z2;
	unsigned short int dummy00;
	MATRIX Workm;
	signed short int Cdir_x;
	signed short int Cdir_y;
	signed short int Cdir_z;
	unsigned short int dummy01;
	unsigned long int Poly_rgb;
	unsigned long int * pSuper;
	AT_DATA Atd[4];
	unsigned char Tpage;
	unsigned char Clut;
	unsigned char nFloor;
	unsigned char Parts_num;
	unsigned long int * pKan_t_ptr;
	signed short int Water;
	unsigned short int Type;
	unsigned long int Sca_info;
	SCA_DATA * pSca_hit_data;
	signed short int Sca_old_x;
	signed short int Sca_old_z;
	MATRIX Super_matrix;
	SVECTOR Super_vector;
	signed short int Spd_x;
	signed short int Spd_y;
	signed short int Spd_z;
	unsigned char In_screen;
	unsigned char Model_Tex_type;
	unsigned char Move_no;
	unsigned char Move_cnt;
	unsigned char Hokan_flg;
	unsigned char Mplay_flg;
	unsigned char Root_ck_cnt;
	signed char D_life_u;
	signed char D_life_c;
	signed char D_life_d;
	unsigned short int Status_flg;
	signed short int Life;
	signed short int Timer0;
	signed short int Timer1;
	signed short int Fpos_x;
	signed short int Fpos_y;
	signed short int Fpos_z;
	signed short int Max_life;
	signed short int Base_pos_x;
	signed short int Base_pos_y;
	signed short int Base_pos_z;
	signed char Timer2;
	signed char Timer3;
	unsigned long int * pKage_work;
	signed short int Neck_point_x;
	signed short int Neck_point_y;
	signed short int Neck_point_z;
	signed short int Size;
	unsigned long int * pNow_seq;
	unsigned long int * pSeq_t_ptr;
	unsigned long int * pSub0_kan_t_ptr;
	unsigned long int * pSub0_seq_t_ptr;
	unsigned long int * pSub1_kan_t_ptr;
	unsigned long int * pSub1_seq_t_ptr;
	unsigned long int * pRoom_kan_t_ptr;
	unsigned long int * pRoom_seq_t_ptr;
	PARTS_W * pSin_parts_ptr;
	unsigned long int * pParts_tmd;
	unsigned long int * pParts_packet;
	unsigned long int * pM_char_ptr;
	unsigned long int * pM_option_tmd;
	unsigned long int * pM_option_packet;
	unsigned long int * pM_Kage_work;
	unsigned long int * pEnemy_ptr;
	unsigned long int * pEnemy_neck;
	unsigned long int * pSa_dat;
	unsigned char Neck_flg;
	unsigned char Neck_no;
	signed short int Ground;
	signed short int Dest_x;
	signed short int Dest_z;
	unsigned short int Down_cnt;
	unsigned char At_hit_flg;
	unsigned char Set_flg_no;
	unsigned short int Sce_flg;
	unsigned char Em_set_flg;
	unsigned char Model_type;
	unsigned short int Damage_flg;
	unsigned char Damage_no;
	unsigned char Damage_cnt;
	signed short int Sce_free0;
	signed short int Sce_free1;
	signed short int Sce_free2;
	signed short int Sce_free3;
	signed short int Spl_flg;
	signed short int Parts0_pos_y;
	SCA_DATA * pT_xz;
	OBJ_MODEL_WORK * pOn_om;
	unsigned long int nOba;
	unsigned char Attw_timer;
	unsigned char Attw_seq_no;
	signed short int Eff_at_r;
	unsigned long int L_pl;
	unsigned long int L_spl;
	signed short int Dir_spl;
	signed char Se_type;
	unsigned char Area_no;
	unsigned long int Tmp_routine;
	unsigned long int * pDamage_work;
	void * pTbefore_func;
	void * pTafter_func;
	signed short int Spd_base_x;
	signed short int Spd_base_y;
	signed short int Spd_base_z;
	signed short int Kage_ofs;
	unsigned long int Free[12];
} ENEMY_WORK;
typedef struct tagVCUT {
	unsigned char Be_flg;
	unsigned char nFloor;
	unsigned char Fcut;
	unsigned char Tcut;
	signed short int Xz[4][2];
} VCUT;
typedef struct tagRCUT {
	unsigned short int end_flg;
	unsigned short int ViewR;
	signed long int View_p[3];
	signed long int View_r[3];
	signed long int pSp;
} RCUT;
typedef struct tagLIGHT_CUT_DATA {
	unsigned char Mag;
	unsigned char Mode[3];
	unsigned char Col[3][3];
	unsigned char Ambient[3];
	signed short int Pos[3][3];
	unsigned short int L[3];
} LIGHT_CUT_DATA;
typedef struct tagMODEL_LINK_INFO {
	signed long int Tim_adr;
	signed long int Tmd_adr;
} MODEL_LINK_INFO;
typedef struct tagROOM_HEAD {
	unsigned char nSprite;
	unsigned char nCut;
	unsigned char nOmodel;
	unsigned char nItem;
	unsigned char nDoor;
	unsigned char nRoom_at;
	unsigned char Reverb_lv;
	unsigned char nSprite_max;
	unsigned long int * pEdt0;
	unsigned long int * pVh0;
	unsigned long int * pVb0;
	unsigned long int padd0;
	unsigned long int padd1;
	unsigned long int * pRbj_end;
	unsigned long int * pSca;
	RCUT * pRcut;
	VCUT * pVcut;
	LIGHT_CUT_DATA * pLight;
	MODEL_LINK_INFO * pOmodel;
	signed short int * pFloor;
	signed short int * pBlock;
	unsigned char * pMessage;
	unsigned char * pMessage_sub;
	unsigned long int * pScrl;
	signed short int * pScdx;
	signed short int * pScd;
	unsigned long int * pEsp_hed;
	unsigned long int * pEsp_end;
	unsigned long int * pEsp_tim;
	unsigned long int * pEsp_tim_end;
	unsigned long int * pRbj;
} ROOM_HEAD;
typedef struct tagROOM_WORK {
	unsigned char nSprite;
	unsigned char nCut;
	unsigned char nOmodel;
	unsigned char nItem;
	unsigned char nDoor;
	unsigned char nRoom_at;
	unsigned char Reverb_lv;
	unsigned char nSprite_max;
	unsigned long int * pEdt0;
	unsigned long int * pVh0;
	unsigned long int * pVb0;
	unsigned long int padd0;
	unsigned long int padd1;
	unsigned long int * pRbj_end;
	unsigned long int * pSca;
	RCUT * pRcut;
	VCUT * pVcut;
	LIGHT_CUT_DATA * pLight;
	MODEL_LINK_INFO * pOmodel;
	signed short int * pFloor;
	signed short int * pBlock;
	unsigned char * pMessage;
	unsigned char * pMessage_sub;
	unsigned long int * pScrl;
	signed short int * pScdx;
	signed short int * pScd;
	unsigned long int * pEsp_hed;
	unsigned long int * pEsp_end;
	unsigned long int * pEsp_tim;
	unsigned long int * pEsp_tim_end;
	unsigned long int * pRbj;
	RCUT Cut[1];
} ROOM_WORK;
typedef struct tagDVIEW {
	signed long int X;
	signed long int Y;
	signed long int Z;
} DVIEW;
typedef struct tagSCE_AOT {
	unsigned char Id;
	unsigned char Type;
	unsigned char nFloor;
	unsigned char Super;
	signed short int X;
	signed short int Z;
	unsigned short int W;
	unsigned short int D;
//	unsigned short int Data[0];
} SCE_AOT;
typedef struct tagSCE_AOT2 {
	unsigned char Id;
	unsigned char Type;
	unsigned char nFloor;
	unsigned char Super;
	signed short int Xz[4][2];
//	unsigned short int Data[0];
} SCE_AOT2;
typedef struct tagSCE_AT_DATA {
	signed short int Data0;
	signed short int Data1;
	signed short int Data2;
} SCE_AT_DATA;
typedef struct tagSCE_ITEM_DATA {
	signed short int Data0;
	signed short int Data1;
	signed short int Data2;
	unsigned char Om_no;
	unsigned char Free;
} SCE_ITEM_DATA;
typedef struct tagSEARCH_AOT {
	unsigned char Id;
	unsigned char Type;
	unsigned short int Dummy_data;
	signed short int X;
	signed short int Z;
	unsigned short int W;
	unsigned short int D;
	unsigned short int Data0;
	unsigned short int Data1;
	unsigned short int Data2;
	unsigned short int Data3;
} SEARCH_AOT;
typedef struct tagIN_DOOR_WORK {
	signed short int Next_pos_x;
	signed short int Next_pos_y;
	signed short int Next_pos_z;
	signed short int Next_cdir_y;
	unsigned char Next_stage;
	unsigned char Next_room;
	unsigned char Next_cut;
	unsigned char Next_nfloor;
	unsigned char Dtex_type;
	unsigned char Door_type;
	unsigned char Knock_type;
	unsigned char Key_id;
	unsigned char Key_type;
	unsigned char Free;
} IN_DOOR_WORK;
typedef struct tagIN_DOOR_WORK2 {
	unsigned char Id;
	unsigned char Type;
	unsigned char nFloor;
	unsigned char Super;
	signed short int X;
	signed short int Z;
	unsigned short int W;
	unsigned short int D;
	IN_DOOR_WORK in_door;
} IN_DOOR_WORK2;
typedef struct tagDATA_POS {
	unsigned long int Offset;
	unsigned long int Size;
} DATA_POS;
typedef struct tagCORPSE_SAVE_WORK {
	unsigned char Id;
	unsigned char Size;
	unsigned char Ksize_x;
	unsigned char Ksize_z;
	unsigned char Cdir_y;
	signed char Pos_x;
	signed char Pos_y;
	signed char Pos_z;
} CORPSE_SAVE_WORK;
typedef struct tagCORPSE_WORK {
	unsigned long int Attribute;
	unsigned long int * pTmd;
	unsigned long int * pPacket;
	unsigned long int * pTmd2;
	unsigned long int * pPacket2;
	signed short int M[3][3];
	signed long int Pos_x;
	signed long int Pos_y;
	signed long int Pos_z;
	signed short int Old_x;
	signed short int Old_y;
	signed short int Old_z;
	signed short int Old_x2;
	signed short int Old_y2;
	signed short int Old_z2;
	unsigned short int dummy00;
	MATRIX Workm;
	signed short int Cdir_x;
	signed short int Cdir_y;
	signed short int Cdir_z;
	unsigned short int dummy01;
	unsigned long int Poly_rgb;
	unsigned long int * pSuper;
	unsigned long int Size;
} CORPSE_WORK;
typedef struct tag_CARD {
	unsigned char magic[2];
	unsigned char type;
	unsigned char blockEntry;
	unsigned char title[64];
	unsigned char reserve[28];
	unsigned char clut[32];
	unsigned char icon[3][128];
} _CARD;
typedef struct tagAF_MOVE_TBL {
	void * pFunc;
	ENEMY_WORK * pEwork;
} AF_MOVE_TBL;
typedef struct tagEM_BIN_INFO {
	unsigned short int Id;
	unsigned short int Use;
} EM_BIN_INFO;
typedef struct tagSAVE_DATA {
	_CARD Card_head;
//	unsigned long int Save_data_head[0];		// SYM Error
	unsigned long int Game_play_time;
	unsigned long int Front_play_time;
	unsigned char Max_item_num;
	unsigned char Stereo;
	unsigned char Pl_id;
	unsigned char Save_area;
	unsigned char Vol_Se;
	unsigned char Vol_Bgm;
	unsigned char Key_idx;
	unsigned char Pl_poison_down;
	unsigned short int Pl_poison_timer;
	unsigned short int Dummy16;
	unsigned long int Status_bak;
	unsigned char Equip_id;
	unsigned char Equip_no;
	signed short int Pl_life;
	unsigned short int Zonbi_cnt;
	unsigned short int Cure_cnt;
	unsigned short int Save_cnt;
	signed short int Pl_pos_x;
	signed short int Pl_pos_y;
	signed short int Pl_pos_z;
	unsigned long int Weapon_mugen;
	unsigned short int Bgm_tbl[142];
	signed short int F_atari;				// 0
	signed short int U_atari;				// 1
	signed short int Use_id;				// 2
	signed short int Get_id;				// 3
	signed short int Sce_work[8];			// 4, 5, 6, 7, 8, 9, 10, 11
	signed short int DSce_work[4];			// 12, 13, 14, 15
	signed short int Sce_tmp_work[8];		// 16, 17, 18, 19, 20, 21, 22, 23
	signed short int Stage_no;				// 24
	signed short int Room_no;				// 25
	signed short int Cut_no;				// 26
	signed short int Room_no_old;			// 27
	signed short int Cut_no_old;			// 28
	signed short int Sce_random;
	signed short int Player_life;
	signed short int Sce_timer;
	signed short int Change_player;
	signed short int Def_em_set;
	signed short int Def_aot_set;
	signed short int Count_down_timer;
	unsigned long int Scenario_flg[8];
	unsigned long int Common_flg[8];
	unsigned long int Room_flg[2];
	unsigned long int Enemy_flg[8];
	unsigned long int Enemy_flg2[8];
	unsigned long int Item_flg[8];
	unsigned long int Item_flg2[4];
	unsigned long int Item_c_flg[7];
	unsigned long int Map_o_flg;
	unsigned long int Map_flg[4];
	unsigned long int Map_c_flg[2];
	unsigned long int Map_i_flg;
	unsigned long int Pri_be_flg[16][4];
	unsigned long int File_flg;
	unsigned long int Zapping_flg[2];
	unsigned long int Key_flg[2];
	ITEM_WORK Item_work[11];
	ITEM_WORK Item_boxwork[64];
	unsigned char File_tag_bk[24];
	unsigned short int Dummy[8];
//	unsigned long int Zero_clr_end[0];			// SYM Error
	unsigned char Pad[12];
//	unsigned long int Global_end[0];			// SYM Error
} SAVE_DATA;
typedef struct tagGLOBAL {
	unsigned long int Ot0[2][8];				// 800BEB60	// 00000000
	unsigned long int * pOt0;					// 00000000	// 00000040
	unsigned long int Ot1[2][1024];				// 00000000	// 00000044
	unsigned long int * pOt1;					// 00000000	// 00002044
	unsigned long int Ot2[2][16];				// 00000000	// 00002048
	unsigned long int * pOt2;					// 00000000	// 000020C8
	unsigned char Padd_data[2][36];				// 00000000	// 000020CC
	unsigned long int Padd;						// 00000000	// 00002114
	unsigned long int Padd_trg;					// 00000000	// 00002118
	unsigned short int Padd1;					// 00000000	// 0000211C
	unsigned short int Padd1_trg;				// 00000000	// 0000211E
	unsigned short int Padd2;					// 00000000	// 00002120
	unsigned short int Padd2_trg;				// 00000000	// 00002122
	unsigned long int Key;						// 00000000	// 00002124
	unsigned long int Key_trg;					// 00000000	// 00002128
	unsigned long int Key_old;					// 00000000	// 0000212C
	unsigned long int Random;					// 00000000	// 00002130
	unsigned long int * pPl_emd_top;			// 00000000	// 00002134
	unsigned long int * pPl_pac_top;			// 00000000	// 00002138
	ROOM_WORK * pRoom;							// 800C0C9C	// 0000213C	// Pointer to RDT
	unsigned char * pFree_work_head;			// 00000000	// 00002140
	unsigned char * pFree_work;					// 00000000	// 00002144
	ENEMY_WORK * pEm;							// 00000000	// 00002148
	ENEMY_WORK ** ppEnemy_end;					// 00000000	// 0000214C
	VCUT * Cccut;								// 00000000	// 00002150
	VCUT * Cccut_next;							// 00000000	// 00002154
	void * pPldamage_Em[64];					// 00000000	// 00002158
	void * pPldie_Em[64];						// 00000000	// 00002258
//	unsigned char * pBs_check_sum[16];			// SYM Error
	unsigned long int * pBs_check_sum;			// 00000000	// 00002358
	unsigned short int * pXa_sector;			// 00000000	// 0000235C
	unsigned long int * pOld_tim;				// 00000000	// 00002360
	unsigned long int * pOld_tmd;				// 00000000	// 00002364
	IN_DOOR_WORK * pSce_aot_on;					// 00000000	// 00002368
	unsigned long int * Sp_bak;					// 00000000	// 0000236C
	SCE_AOT * Sce_aot[32];						// 00000000	// 00002370
	SCE_AOT * pAot_data;						// 00000000	// 000023F0
	unsigned long int Game_time_offset;			// 00000000	// 000023F4
	unsigned char Cbuf_id;						// 00000000	// 000023F8
	unsigned char Sound_mode;					// 00000000	// 000023F9
	unsigned char Bk_equip_no;					// 00000000	// 000023FA
	unsigned char Bk_item_num;					// 00000000	// 000023FB
	ITEM_WORK Bk_item_work[10];					// 00000000	// 000023FC
	KAGE_WORK9 Kage9[5];						// 00000000	// 00002424
	KAGE_WORK Kage[50];							// 00000000	// 000024B0
//	unsigned short int * pBs_size[16];			// SYM Error
	unsigned long int * pBs_size;				// 800C2460	// 00003900
	void * pFree;								// 800C2464	// 00003904
	SCA_DATA * pSca_hit_data[32];				// 800C2468	// 00003908	// Pointer to current, active collision
	unsigned long int Rbj_set_flg;				// 800C24E8	// 00003988
	unsigned long int System_flg;				// 800C24EC	// 0000398C
	unsigned char Window_no;					// 800C24F0	// 00003990
	unsigned char Mirror_flg;					// 800C24F1	// 00003991
	signed short int Mirror_pos;				// 800C24F2	// 00003992
	signed short int Mirror_max;				// 800C24F4	// 00003994
	signed short int Mirror_min;				// 800C24F6	// 00003996
	unsigned char Save_cursor;					// 800C24F8	// 00003998
	unsigned char Dummy8[3];					// 800C24F9	// 00003999
	VECTOR Wep_hit_pos;							// 800C24FC	// 0000399C
//	unsigned long int Zero_clr_head[0];			// SYM Error
	unsigned long int Status_flg;				// 800C250C	// 000039AC
	unsigned long int Stop_flg;					// 800C2510	// 000039B0
	unsigned long int Use_flg[4];				// 800C2514	// 000039B4
	unsigned char Ctpage;						// 800C2524	// 000039C4
	unsigned char Cclut;						// 800C2525	// 000039C5
	unsigned char Next_cut_no;					// 800C2526	// 000039C6 // Current Cut Id
	unsigned char Enemy_num;					// 800C2527	// 000039C7	// Amount of enemies in room
	unsigned short int Room_enemy_flg;			// 800C2528	// 000039C8
	unsigned short int Room_player_flg;			// 800C252A	// 000039CA
	PLAYER_WORK Player;							// 800C252C	// 000039CC
	ENEMY_WORK * pEnemy[34];					// 800C2744	// 00003BE4
	void * Em_move_tbl[96];						// 800C27CC	// 00003C6C
	void * Em_ov_mtbl[2][96];					// 800C294C	// 00003DEC
	EM_BIN_INFO Em_bin_info[2];					// 800C2C4C	// 000040EC
	OBJ_MODEL_WORK Ob_model[32];				// 800C2C54	// 000040F4
	OBJ_MODEL_WORK * pObj_work_end;				// 800C6B54	// 00007FF4
	signed short int Root_rot;					// 800C6B58	// 00007FF8
	signed short int Root_area_no;				// 800C6B5A	// 00007FFA
	signed short int Root_dest_x;				// 800C6B5C	// 00007FFC
	signed short int Root_dest_z;				// 800C6B5E	// 00007FFE
	unsigned char nSce_aot;						// 800C6B60	// 00008000 // Amount of AOT type opcodes (active)
	unsigned char Get_item_id;					// 800C6B61	// 00008001
	unsigned short int Pdemo_cnt;				// 800C6B62	// 00008002
	unsigned char Up_event_no;					// 800C6B64	// 00008004
	unsigned char Up_eve_rtn;					// 800C6B65	// 00008005
	unsigned char Up_key_rtn;					// 800C6B66	// 00008006
	unsigned char Up_wnd_rtn;					// 800C6B67	// 00008007
	unsigned short int Movie_Isrgb24;			// 800C6B68	// 00008008
	unsigned char Movie_id;						// 800C6B6A	// 0000800A
	unsigned char Ibox_Futa_no;					// 800C6B6B	// 0000800B
	signed short int Light3_pos_x;				// 800C6B6C	// 0000800C
	signed short int Light3_pos_y;				// 800C6B6E	// 0000800E
	signed short int Light3_pos_z;				// 800C6B70	// 00008010
	unsigned short int Light3_L;				// 800C6B72	// 00008012
	unsigned char Light3_col[4];				// 800C6B74	// 00008014
	unsigned char Memcard_rtn;					// 800C6B78	// 00008018
	unsigned char Front_func_rtn;				// 800C6B79	// 00008019
	unsigned char Back_func_rtn;				// 800C6B7A	// 0000801A
	unsigned char Em_se_set_no;					// 800C6B7B	// 0000801B
	unsigned long int Em_default;				// 800C6B7C	// 0000801C
	signed short int Scrl_y;					// 800C6B80	// 00008020
	signed short int Scrl_flg;					// 800C6B82	// 00008022
	void * Front_func;							// 800C6B84	// 00008024
	void * Back_func;							// 800C6B88	// 00008028
	unsigned char Font_type;					// 800C6B8C	// 0000802C
	unsigned char Dummy8_3[3];					// 800C6B8D	// 0000802D
	SAVE_DATA SaveData;							// 800C6B90	// 00008030
} GLOBAL;
typedef struct tagFADE {
	signed short int Kido;
	signed short int Add;
	unsigned char Hrate;
	unsigned char Mask_r;
	unsigned char Mask_g;
	unsigned char Mask_b;
	unsigned char Pri;
	TILE T[2];
	DR_MODE Dr_mode[2];
} FADE;
typedef struct tagDBUF {
	DRAWENV Draw;
	DISPENV Disp;
	DR_MODE Curtain_Dm;
	DR_MODE Pause_Dm;
	TILE Bg_clr;
} DBUF;
typedef struct tagMAIN {
	DBUF Db[2];
	DBUF * pDb;
	unsigned long int Pad_rmask;
	unsigned char Pad_wait_time;
	unsigned char Pad_repeat_time;
	unsigned char Vloop;
	unsigned char Bg_chg_flg;
	FADE Fade[4];
	RECT16 Rect;
	unsigned char Bg_mode;
	unsigned char Curtain_kido;
	unsigned char Key_idx;
	unsigned char Scrl_type;
	unsigned char Padoff_stop_flg;
	unsigned char Pollhost_flg;
} MAIN;
typedef struct tagGAME {
	unsigned char Doordemo_flg;
	unsigned char Plight_flg;
	unsigned char Plight_cnt;
	unsigned char Plight_col[3];
	unsigned long int Plight_bak[10];
	VECTOR Plight_pos;
	unsigned char Move_flg;
	unsigned char Rookie_cnt;
	unsigned long int Stop_bak;
} GAME;
typedef struct tagFLAG_DISP_TBL {
	unsigned short int X;
	unsigned char Y;
	unsigned char Num;
	unsigned long int * Adr;
} FLAG_DISP_TBL;
typedef struct tagTITLE_WORK {
	unsigned char Main_rtn;
	unsigned char Sub_rtn0;
	unsigned char Sub_rtn1;
	unsigned char Sub_rtn2;
	unsigned char Stereo_bak;
	unsigned char Sel_mode;
	unsigned char Cur;
	unsigned char Disp_cnt;
	unsigned char Disp_add;
	unsigned char Moji_move_cnt;
	unsigned char Moji_kido;
	unsigned char Moji_kido2;
	unsigned char Rookie_cnt;
	unsigned char Rookie_flg;
	unsigned short int Timer;
	signed short int Kido;
	signed short int Add;
	SPRT2 Moji[22];
} TITLE_WORK;
typedef struct tagT_MOJI_TBL {
	unsigned short int x;
	unsigned short int y;
	unsigned short int w;
	unsigned short int h;
	unsigned char u;
	unsigned char v;
	unsigned char flg;
	unsigned char rate;
} T_MOJI_TBL;
typedef struct tagMOJIDISP {
	DR_MODE Moji_mode[2][16];
	SPRT Prim_sprt[2][256];
	SPRT_8 Prim_sprt_8[2][128];
	SPRT * pSprt_keep;
	SPRT_8 * pSprt_8_keep;
	unsigned char Moji_buff[512];
	unsigned char * pBuff_ptr;
	unsigned char Mess_flg;
	unsigned char Mess_r_no0;
	unsigned char Mess_type;
	unsigned char Mess_item;
	unsigned char Mess_wait;
	signed char Mess_time;
	unsigned char Mcol_init;
	unsigned char Mcol_next;
	unsigned char * Mess_top;
	unsigned char * Mess_end;
	unsigned char * Mess_svp;
	unsigned short int Mess_pos_x;
	unsigned short int Mess_pos_y;
	unsigned short int Pos_x_def;
	unsigned short int Pos_y_def;
	unsigned short int Mess_attr;
	signed char Timer;
	unsigned char dummy0;
	unsigned long int Stop_keep;
	unsigned long int Stop_data;
} MOJIDISP;
typedef struct tagVIEW_ENV {
	DR_MODE Tex_mode;
	SPRT Sprt;
	TILE View_mask[6];
	LINE_F4 Waku4[4];
	LINE_F2 Waku2[19];
	TILE Cedit_tile[9];
	TILE Cedit_col[256];
	POLY_G4 Cedit_bar[3];
	LINE_F2 Cedit_line2[34];
	LINE_F2 Cedit_waku[6];
	LINE_F2 Cedit_cur2[2];
	LINE_F4 Cedit_cur4[2];
	LINE_F2 Net_line2[48];
	DR_MOVE Clut_move;
} VIEW_ENV;
typedef struct tagVIEW_WORK {
	unsigned char r_no_0;
	unsigned char r_no_1;
	unsigned char r_no_2;
	unsigned char r_no_3;
	signed char Col_mode;
	unsigned char Net_mode;
	unsigned char Tpage;
	unsigned char Pos_y;
	unsigned short int Clt_x;
	unsigned short int Clt_y;
	unsigned char Clut_no;
	unsigned char Bar_no;
	unsigned short int dummy;
	unsigned short int Clut_wk[256];
	RECT16 Clut_get;
} VIEW_WORK;
typedef struct tagVRAMVIEW {
	VIEW_ENV View_env[2];
	VIEW_WORK View_work;
	unsigned char mode;
} VRAMVIEW;
typedef struct tagROOM_POS {
	unsigned short int Be_flg;
	signed short int X;
	signed short int Z;
	unsigned short int nFloor;
	unsigned char Name[0x12];
} ROOM_POS;
typedef struct tagDB_WORK {
	unsigned char Menu_flg;								// 00000000
	unsigned char Menu_no;								// 00000001
	unsigned char J_stage;								// 00000002
	unsigned char Xa_no;								// 00000003
	unsigned char Xa_cnt_no;							// 00000004
	unsigned char Disp_at_flg;							// 00000005
	unsigned char Disp_shori_flg;						// 00000006
	unsigned char Disp_monosashi_flg;					// 00000007
	unsigned char Est_test_flg;							// 00000008
	unsigned char Est_test_num;							// 00000009
	unsigned short int Xa_cnt[8];						// 0000000A
	unsigned char J_room[7];							// 0000001A
	unsigned short int Wnd_col;							// 00000022
	unsigned short int Wnd_x;							// 00000024
	unsigned short int Wnd_y;							// 00000026
	unsigned short int Wnd_w;							// 00000028
	unsigned short int Wnd_h;							// 0000002A
	TILE Fade[2];										// 0000002C
	DR_MODE Dm[2];										// 0000004C
	unsigned long int Mem[16];							// 00000064
	unsigned short int S_cnt[16];						// 000000A4
	unsigned char R_no;									// 000000C4
} DB_WORK;
typedef struct tagEvCB {
	unsigned long int desc;
	signed long int status;
	signed long int spec;
	signed long int mode;
	signed long int * FHandler;
	signed long int system[2];
} EvCB;
typedef struct tagEXEC {
	unsigned long int pc0;
	unsigned long int gp0;
	unsigned long int t_addr;
	unsigned long int t_size;
	unsigned long int d_addr;
	unsigned long int d_size;
	unsigned long int b_addr;
	unsigned long int b_size;
	unsigned long int saddr;
	unsigned long int ssize;
	unsigned long int sp;
	unsigned long int fp;
	unsigned long int gp;
	unsigned long int ret;
	unsigned long int base;
} EXEC;
typedef struct tagXF_HDR {
	unsigned char key[8];
	unsigned long int text;
	unsigned long int data;
	EXEC exec;
	unsigned char title[60];
} XF_HDR;
typedef struct tagDIRENTRY {
	unsigned char name[20];
	signed long int attr;
	signed long int size;
	tagDIRENTRY * next;
	signed long int head;
	unsigned char system[4];
} DIRENTRY;
typedef struct tagToT {
	unsigned long int * head;
	signed long int size;
} ToT;
typedef struct tagTCB {
	signed long int status;
	signed long int mode;
	unsigned long int reg[40];
	signed long int system[6];
} TCB;
typedef struct tagTCBH {
	TCB * entry;
	signed long int flag;
} TCBH;
typedef struct tagTCB2 {
	signed long int Status;
	signed long int Mode;
	signed long int Zero;
	signed long int At;
	signed long int V0;
	signed long int V1;
	signed long int A0;
	signed long int A1;
	signed long int A2;
	signed long int A3;
	signed long int T0;
	signed long int T1;
	signed long int T2;
	signed long int T3;
	signed long int T4;
	signed long int T5;
	signed long int T6;
	signed long int T7;
	signed long int S0;
	signed long int S1;
	signed long int S2;
	signed long int S3;
	signed long int S4;
	signed long int S5;
	signed long int S6;
	signed long int S7;
	signed long int T8;
	signed long int T9;
	signed long int K0;
	signed long int K1;
	signed long int GP;
	signed long int SP;
	signed long int FP;
	signed long int RA;
	signed long int EPC;
	signed long int MDHI;
	signed long int MDLO;
	signed long int SR;
	signed long int CAUSE;
	signed long int Dummy0;
	signed long int Dummy1;
	signed long int Dummy2;
	signed long int System[6];
} TCB2;
typedef struct tagTASK {
	unsigned short int Tcb_status;
	signed short int Tcb_sleep_ctr;
	signed long int * pTcb_pc;
	unsigned long int Tcb_th;
	TCB * pTcb;
	unsigned long int Tcb_init_sp;
	EXEC Tcb_exec;
	unsigned long int * pPc;
	unsigned short int R_no[6];
	signed short int Ctr[8];
	unsigned char Free[16];
} TASK;
typedef struct tagMONITOR {
	unsigned long int Gp;
	TASK Task[3];
	TASK * pCtcb;
} MONITOR;
typedef struct tagDslLOC {
	unsigned char minute;
	unsigned char second;
	unsigned char sector;
	unsigned char track;
} DslLOC;
typedef struct tagDslFILTER {
	unsigned char file;
	unsigned char chan;
	unsigned short int pad;
} DslFILTER;
typedef struct tagDslATV {
	unsigned char val0;
	unsigned char val1;
	unsigned char val2;
	unsigned char val3;
} DslATV;
typedef struct tagDslFILE {
	DslLOC pos;
	unsigned long int size;
	unsigned char name[16];
} DslFILE;
typedef struct tagStHEADER {
	unsigned short int id;
	unsigned short int type;
	unsigned short int secCount;
	unsigned short int nSectors;
	unsigned long int frameCount;
	unsigned long int frameSize;
	unsigned short int width;
	unsigned short int height;
	unsigned long int dummy1;
	unsigned long int dummy2;
	DslLOC loc;
} StHEADER;
typedef struct tagfpos {
	unsigned long int size;
	unsigned short int sector;
	unsigned char sec_high;
	unsigned char sum;
} fpos;
typedef struct tagECG_POINT {
	unsigned char Y;
	unsigned char H;
} ECG_POINT;
typedef struct tagITEM_MIX_DATA {
	unsigned char Object_item_id;
	unsigned char Mix_type;
	unsigned char Result_item;
	signed char Mixed_pix_no;
} ITEM_MIX_DATA;
typedef struct tagITEM_DATA {
	unsigned char Item_max;
	unsigned char Item_attribute;
	unsigned char Item_num_col;
	unsigned char Item_mix_num;
	ITEM_MIX_DATA * Item_mix_data;
} ITEM_DATA;
typedef struct tagFILE_DATA {
	unsigned char Page_max;
	unsigned char Back_h;
} FILE_DATA;
typedef struct tagMAP_DATA {
	unsigned char U;
	unsigned char V;
	unsigned char W;
	unsigned char H;
	signed short int C_pos_x;
	signed short int C_pos_y;
	signed short int B_pos_x;
	signed short int B_pos_y;
	unsigned char Map_flg;
	unsigned char Change_flag;
	unsigned char Pl0_flg;
	unsigned char Pl1_flg;
} MAP_DATA;
typedef struct tagMAP_STAGE_INFO {
	MAP_DATA * pMap_data;
	unsigned char Room_num;
	unsigned char Map;
	unsigned short int File_no;
} MAP_STAGE_INFO;
typedef struct tagSTATUS {								// 00000000
	unsigned char Main_rtn;								// 00000000
	unsigned char Sub_rtn0;								// 00000000
	unsigned char Sub_rtn1;								// 00000000
	unsigned char Sub_rtn2;								// 00000000
	unsigned char Sub_rtn3;								// 00000000
	unsigned char Sub_rtn4;								// 00000000
	unsigned char Sub_rtn5;								// 00000000
	unsigned char Sub_rtn6;								// 00000000
	unsigned char Equip_item_no;						// 00000000
	unsigned char Equip_item_no_old;					// 00000000
	unsigned char Equip_item_id;						// 00000000
	unsigned char Equip_item_id_old;					// 00000000
	unsigned char Icursol_main;							// 00000000
	unsigned char Icursol_sub;							// 00000000
	unsigned char Mcursol0;								// 00000000
	unsigned char Mcursol1;								// 00000000
	unsigned char St_type;								// 00000000
	signed char F_sel_book;								// 00000000
	signed char F_sel_file;								// 00000000
	unsigned char F_page_no;							// 00000000
	unsigned char Itembox_tpage;						// 00000000
	unsigned char Fread_char;							// 00000000
	unsigned char Exit_flg;								// 00000000
	unsigned char Same_id_work_no;						// 00000000
	unsigned char Using_item_no;						// 00000000
	unsigned char File_flg;								// 00000000
	unsigned char Map_no;								// 00000000
	unsigned char Pl_chenge_flg;						// 00000000
	signed char Add_cp_x0;								// 00000000
	signed char Add_cp_y0;								// 00000000
	signed char X0;										// 00000000
	signed char Y0;										// 00000000
	signed char Add_cp_x1;								// 00000000
	signed char Add_cp_y1;								// 00000000
	signed char X1;										// 00000000
	signed char Y1;										// 00000000
	unsigned char Ibox_sel;								// 00000000
	signed char Ibox_moxe;								// 00000000
	unsigned char Mixed_id;								// 00000000
	unsigned char Mixed_pix_no;							// 00000000
	unsigned char blink_timer0;							// 00000000
	unsigned char blink_sw0;							// 00000000
	unsigned char blink_timer1;							// 00000000
	unsigned char blink_sw1;							// 00000000
	signed short int Machinegun_trg;					// 00000000
	signed short int Goffset_add;						// 00000000
	signed short int F_move_x;							// 00000000
	signed short int F_move_y;							// 00000000
	signed short int Itemlist_pos_x;					// 00000000
	signed short int Itemlist_pos_y;					// 00000000
	signed short int Message_pos_x;						// 00000000
	signed short int Message_pos_y;						// 00000000
	signed short int Status_pos_x;						// 00000000
	signed short int Status_pos_y;						// 00000000
	signed short int Sub_pos_x;							// 00000000
	signed short int Sub_pos_y;							// 00000000
	signed short int Menu0_pos_x;						// 00000000
	signed short int Menu0_pos_y;						// 00000000
	signed short int Menu1_pos_x;						// 00000000
	signed short int Menu1_pos_y;						// 00000000
	signed short int Frame_pos_x;						// 00000000
	signed short int Frame_pos_y;						// 00000000
	signed short int Ibox_pos_x;						// 00000000
	signed short int Ibox_pos_y;						// 00000000
	signed short int Map_pos_x;							// 00000000
	signed short int Map_pos_y;							// 00000000
	signed short int Map_offset_x;						// 00000000
	signed short int Map_offset_y;						// 00000000
	signed short int File_pos_x;						// 00000000
	signed short int File_pos_y;						// 00000000
	signed short int Ecg_x;								// 00000000
	signed char Recover_type;							// 00000000
	signed char Ecg_rtn;								// 00000000
	signed short int Heal_x;							// 00000000
	signed short int Cure_y;							// 00000066
	MODEL_WORK Fmodel[30];								// 00000068
	unsigned short int Add_life;
	unsigned short int dm00;
	unsigned short int Clut[22];
	DR_MODE Dmode[24][2];
} STATUS;
typedef struct tagMOVIE_TBL {
	unsigned long int Filecode;
	unsigned short int N_frame;
	unsigned short int Caption_id;
	unsigned short int Cancel;
	unsigned short int Disp_w;
	unsigned short int Isrgb24;
	unsigned long int Pos;
	unsigned short int Work_top;
	unsigned short int Rl_size;
	unsigned short int Attribute;
	unsigned short int Volume;
	unsigned short int Free;
} MOVIE_TBL;
typedef struct tagVM_WORK {
	unsigned long int * Rl_buff[2];
	unsigned long int * pImage_buff;
	unsigned short int End_frame;
	unsigned short int Movie_volume;
	unsigned char Rno;
	unsigned char Cbuf_id;
	unsigned short int Movie_w;
	unsigned char Movie_sync;
	unsigned char Status;
	unsigned char Eom;
	unsigned char Free0;
	unsigned short int Frame;
	unsigned short int Volume;
	unsigned long int Start_sector;
} VM_WORK;
typedef struct tagVM_DISP {
	RECT16 Rect;
	TILE Cinesco[2][2];
	unsigned long int Cine_switch;
	unsigned short int Pos_x;
	unsigned short int Cur_pos_x;
	unsigned short int Pos_y;
	unsigned short int Width;
	unsigned short int Size;
	unsigned short int Count;
	unsigned short int Loop;
	unsigned short int Attribute;
} VM_DISP;
typedef	struct tagVM_FRAME {
	unsigned short int No;
	unsigned short int Old_no;
	unsigned short int Pic_h;
	unsigned short int Dummy;
} VM_FRAME;
typedef struct tagCAPTION_TBL {
	unsigned short int Start_frame;
	unsigned short int Disp_count;
	unsigned short int No;
	unsigned short int Height;
	unsigned short int Pos_x;
	unsigned short int Pos_y;
} CAPTION_TBL;
typedef struct tagCAPTION_ID {
	CAPTION_TBL * pTbl_ptr;
	unsigned long int Filecode;
	unsigned long int CaptionBuffId;
} CAPTION_ID;
typedef struct tagCAPTION {
	CAPTION_TBL * pTbl_ptr;
	unsigned char * pBuff;
	unsigned char * pSuper_buff;
	unsigned long int * pAdr;
	unsigned short int End_of_jimaku;
	unsigned short int Decomp_end;
	unsigned long int Decomp_size;
} CAPTION;
typedef struct tagLINE_SCR {
	unsigned char r_no_0;
	unsigned char r_no_1;
	unsigned char Line_ctr0;
	unsigned char Quake_ctr0;
	unsigned long int Keep_tag0;
	unsigned long int * pPrim_keep0;
	unsigned long int * pOt;
	DR_MOVE Line_move[2][240];
	unsigned long int Null_prim[2];
} LINE_SCR;
typedef struct tagUTILS {
	unsigned char Menu_flg;
	unsigned char R_no;
	unsigned char Menu_no;
	unsigned char Dummy;
	TILE Fade[2];
	DR_MODE Dm[2];
} UTILS;
typedef struct tagSP_WORK {
	unsigned short int Pos_x;
	unsigned short int Pos_y;
	unsigned short int W;
	unsigned short int H;
	unsigned char U;
	unsigned char V;
	unsigned short int Clut;
	unsigned char Pri;
	unsigned char Semi;
	unsigned char Col;
	unsigned char Be_flg;
} SP_WORK;
typedef struct tagCOM_WORK {
	unsigned char Cx;
	unsigned char Cy;
	signed char Kx;
	signed char Ky;
	unsigned char Con_buf[12][30];
	unsigned char Con_col_buf[12][30];
	unsigned char Disp_wait;
	unsigned char Cursor_disp;
	unsigned char Wait;
	unsigned char Ccol;
	unsigned char nMoji;
	unsigned char Moji_code;
	unsigned char Kcursor_disp;
	signed char Kcursor_add;
	unsigned char Key_timer;
	unsigned char Cut_no_old;
	unsigned char Key_input_flg;
	unsigned char Keta;
	unsigned long int Num;
	unsigned char In_buf[17];
	unsigned char * pMess_start;
	unsigned char * pMess;
	SP_WORK Sp_work[364];
	DR_MODE Dr_mode[2][8];
	SPRT Packet[2][364];
	LINE_F2 Line_work[2][4];
} COM_WORK;
typedef struct tagSCE_TASK {
	unsigned char Routine0;
	unsigned char Status;
	signed char Sub_ctr;
	unsigned char Task_level;
	signed char Ifel_ctr[4];
	signed char Loop_ctr[4];
	signed char Loop_if_class[4][4];
	unsigned char * Data;
	unsigned char * Lstack[4][4];
	unsigned char * Lbreak[4][4];
	signed short int Lcnt[4][4];
	unsigned long int Stack[4][8];
	unsigned long int * pS_SP;
	unsigned char * Ret_addr[4];
	ENEMY_WORK * pWork;
	signed short int Spd_x;
	signed short int Spd_y;
	signed short int Spd_z;
	signed short int Dspd_x;
	signed short int Dspd_y;
	signed short int Dspd_z;
	signed short int Aspd_x;
	signed short int Aspd_y;
	signed short int Aspd_z;
	signed short int Adspd_x;
	signed short int Adspd_y;
	signed short int Adspd_z;
	unsigned long int R_no_bak;
} SCE_TASK;
typedef struct tagSCENARIO {
	SCE_TASK Sce_task[14];
	unsigned long int Random_base;
	unsigned char * pCScd;
	ENEMY_WORK * pC_em;
	POLY_GT4 * pMizu_div;
	unsigned char Type;
	unsigned char Cut_old;
	unsigned char C_id;
	unsigned char C_model_type;
	unsigned char C_kind;
	unsigned char Mizu_div_max;
	unsigned char Mizu_div_ctr;
	unsigned char Rbj_reset_flg;
	unsigned char Se_tmp0;
	unsigned char Se_tmp1;
	unsigned char Se_vol;
} SCENARIO;
typedef struct tagSCE_EM_SET_WORK {
	unsigned char Com;
	unsigned char Nop;
	signed char Em_no;
	unsigned char Id;
	unsigned short int Type;
	unsigned char nFloor;
	unsigned char Sound_flg;
	unsigned char Model_type;
	unsigned char Em_set_flg;
	signed short int Pos_x;
	signed short int Pos_y;
	signed short int Pos_z;
	signed short int Cdir_y;
	signed short int Motion;
	signed short int Ctr_flg;
} SCE_EM_SET_WORK;
typedef struct tagSPL_FREE_WORK {
	signed short int Dest_x;
	signed short int Dest_z;
	unsigned short int Move_flg;
	unsigned char Spl_dummy000;
	unsigned char Spl_dummy001;
	unsigned long int ll;
	unsigned long int em_ll;
	unsigned long int Spl_dummy00;
	unsigned long int Spl_dummy01;
	unsigned long int Spl_dummy02;
	unsigned long int Spl_dummy03;
} SPL_FREE_WORK;
typedef struct tagEM_TBL {
	unsigned char Be_flg;
	unsigned char Id;
	unsigned short int Type;
	unsigned char nFloor;
	unsigned char Sound_flg;
	unsigned char Model_type;
	unsigned char Em_set_flg;
	signed short int Pos_x;
	signed short int Pos_y;
	signed short int Pos_z;
	signed short int Cdir_y;
} EM_TBL;
typedef struct tagT_EM_SET {
	unsigned char R_no_0;
	unsigned char R_no_1;
	unsigned char R_no_2;
	unsigned char R_no_3;
	signed char C_em_no;
	unsigned char R1_bak;
	unsigned char List_no;
	unsigned char Trans_be;
	signed short int Menu_x;
	signed short int Menu_y;
	signed short int Menu_w;
	signed short int Menu_h;
	signed short int Gx;
	signed short int Gy;
	signed long int View_y;
	EM_TBL * CEm_tbl;
	EM_TBL Em_tbl[34];
	EM_TBL Test_em_tbl[34];
	SCE_EM_SET_WORK * pTest_esd_tbl[16];
	unsigned char Test_esd_num[16];
	DR_MODE Dr_mode[2];
	POLY_G3 Em_prim[2][34];
	LINE_F2 Em_line_prim[2][34][3];
	TILE Menu_prim[2];
} T_EM_SET;
typedef struct tagSIGHT_TBL {
	signed short int Pos_x;
	signed short int Pos_y;
	signed short int Size;
} SIGHT_TBL;
typedef struct tagSIGHT_WORK {
	signed long int Sight_num;
	SIGHT_TBL Sight_tbl[20];
	LINE_F2 Sight_line[2][20][4];
} SIGHT_WORK;
typedef struct tagDOOR {
	unsigned long int * pPrepacket;
	unsigned long int * pTmd_adr;
	POLY_GT3 * pPackettop;
	DIVPOLYGON3 Divp;
	unsigned long int * pEdh_offset;
	unsigned long int * pVb_offset;
	unsigned short int Ctr1;
	unsigned short int Ctr2;
	SVECTOR V0;
	SVECTOR V1;
	SVECTOR V2;
	unsigned short int Sound_flg;
	unsigned short int Div_max;
} DOOR;
typedef struct tagDOOR_INFO {
	unsigned short int Sound_size;
	unsigned short int Data_size;
	unsigned long int Sector_offset;
	unsigned char Sound_sum;
	unsigned char Data_sum;
	unsigned short int Free;
} DOOR_INFO;
typedef struct tagDOOR_WORK {
	unsigned long int Be_flg;
	unsigned char Routine_0;
	unsigned char Routine_1;
	unsigned char Routine_2;
	unsigned char Routine_3;
	unsigned char Id;
	unsigned char Sc_id;
	unsigned char At_obj_no;
	unsigned char At_sce_no;
	unsigned char Work_no;
	unsigned char At_em_no;
	unsigned short int At_em_flg;
	unsigned long int Attribute;
	unsigned long int * pTmd;
	unsigned long int * pPacket;
	unsigned long int * pTmd2;
	unsigned long int * pPacket2;
	signed short int M[3][3];
	signed long int Pos_x;
	signed long int Pos_y;
	signed long int Pos_z;
	signed short int Old_x;
	signed short int Old_y;
	signed short int Old_z;
	signed short int Old_x2;
	signed short int Old_y2;
	signed short int Old_z2;
	unsigned short int dummy00;
	MATRIX Workm;
	signed short int Cdir_x;
	signed short int Cdir_y;
	signed short int Cdir_z;
	unsigned short int dummy01;
	unsigned long int Poly_rgb;
	unsigned long int * pSuper;
	AT_DATA Atd[4];
	unsigned char Tpage;
	unsigned char Clut;
	unsigned char nFloor;
	unsigned char Parts_num;
	unsigned long int * pKan_t_ptr;
	signed short int Water;
	unsigned short int Type;
	unsigned long int Sca_info;
	SCA_DATA * pSca_hit_data;
	signed short int Sca_old_x;
	signed short int Sca_old_z;
	MATRIX Super_matrix;
	SVECTOR Super_vector;
	unsigned short int Attribute2;
	unsigned short int Model_no;
	unsigned short int Free;
	unsigned short int Free2;
} DOOR_WORK;
typedef struct tagCC_PARTS_WORK {
	unsigned char Cc_ctr;
	unsigned char Cc_cnt;
	unsigned char Cc_wait;
	unsigned char Cc_num;
	unsigned short int Cc_pos_x;
	unsigned short int Cc_pos_y;
	DR_MOVE Cc_dr_move[2];
	RECT16 Cc_dr_rect[2];
	OBJ_MODEL_WORK * pOm;
} CC_PARTS_WORK;
typedef struct tagCC_WORK {
	CC_PARTS_WORK Cc_parts[30];
	unsigned short int Ccol_old;
	unsigned char Ccol_no;
	unsigned char Ctex_old;
} CC_WORK;
typedef struct tagVIEW_CTR {
	unsigned char R_no;
	signed char Mode;
	unsigned char Mode_change;
	unsigned char Lock_on;
	unsigned char Col_chg_on;
	unsigned char Col_chg_mode;
	ENEMY_WORK * pE;
	RCUT Rcut_wk;
} VIEW_CTR;
typedef struct tagFLG_VIEW {
	unsigned char CLine;
	unsigned char R_no;
	signed char Pos_x;
	signed char Pos_y;
	signed char Flg_no;
	unsigned char Wait_ctr;
	unsigned char Repeat_ctr;
} FLG_VIEW;
typedef struct tagEDT_TABLE_WORK {
	unsigned char id_check;
	unsigned char pan_prog;
	unsigned char tone_pri;
	unsigned char monopoly;
} EDT_TABLE_WORK;
typedef struct tagSoundVolume {
	unsigned short int left;
	unsigned short int right;
} SoundVolume;
typedef struct tagSEQCTR {
	unsigned char Flg;
	unsigned char Ctrl;
	signed char Seq_no;
	signed char Vab_id;
	SoundVolume Vol;
} SEQCTR;
typedef struct tagBGMCTR {
	unsigned char Main;
	unsigned char Sub;
} BGMCTR;
typedef struct tagSEENTRY {
	unsigned char Pri;
	unsigned char Vch;
} SEENTRY;
typedef struct tagREQUEST {
	unsigned short int Be_flg;
	unsigned short int SENo;
	signed short int Vid;
	signed short int Pno;
	signed short int Tno;
	signed short int Not;
	signed short int Fin;
	signed short int Vol;
	signed short int Vor;
	signed short int flg_3D;
	signed long int Pos_x;
	signed long int Pos_y;
	signed long int Pos_z;
} REQUEST;
typedef struct tagV_STR {
	unsigned long int * Read_buff[2];
	unsigned long int Start_frame;
	unsigned long int End_frame;
	signed long int * Func1;
	signed long int * Func2;
	StHEADER Read_header[2];
	unsigned long int Read_id;
	signed long int Fd;
	unsigned long int Is_interleave;
	unsigned long int Subheader[8];
	unsigned long int Eof_flg;
} V_STR;
typedef struct tagCFILE_INFO {
	unsigned char title[15][22];
	unsigned char num;
	unsigned long int total_size;
	unsigned long int size[15];
} CFILE_INFO;
typedef struct tagCFILE_INFO_S {
	unsigned char Pl;
	unsigned char Save_area;
	unsigned short int Save_cnt;
} CFILE_INFO_S;
typedef struct tagCARD_SAVE_DATA {
	_CARD Head;
	SAVE_DATA Save_data;
	unsigned char Dummy[276];
} CARD_SAVE_DATA;
typedef struct tagMWORK {
	unsigned char Port;
	unsigned char Cdisp;
	unsigned char Input_wait;
	signed char Cursor_x;
	unsigned char F_num[16];
	unsigned char Wait_cnt;
	unsigned char Scrl_ofs;
	unsigned char Scrl_disp;
	unsigned char Pad_stop;
	signed short int Bg_kido;
	signed short int Scrl_cnt;
	unsigned long int Total_size;
	unsigned long int Cursor_old;
	RECT16 Bg_rect;
	CFILE_INFO File_info;
	CFILE_INFO_S File_info_s[15];
	CARD_SAVE_DATA Card;
	DR_MOVE Scrl_mask[2][2];
	unsigned char Save_info[15][128];
} MWORK;
typedef struct tagKO_TBL {	// 4 0x0004
	USHORT ko_num;		// $00000000
	USHORT ko_t_off;		// $00000002
} KO_TBL;
typedef struct tagJOINT_P {	// 48 0x0030
	UCHAR Move_no;		// $00000000
	UCHAR Move_cnt;		// $00000001
	UCHAR Hokan_flg;		// $00000002
	UCHAR P0_parts_no;		// $00000003
	ULONG On_parts_flg;		// $00000004
	MATRIX P0_m;		// $00000008
	SVECTOR P0_sv;		// $00000028
} JOINT_P;
typedef struct tagSNDEFF {	// 12 0x000C
	USHORT flg;		// $00000000
	USHORT gyo;		// $00000002
	UCHAR ID;		// $00000004
	UCHAR NUM;		// $00000005
	UCHAR PRI;		// $00000006
	UCHAR CH;		// $00000007
	SHORT RVOL;		// $00000008
	SHORT LVOL;		// $0000000a
} SNDEFF;
typedef struct tagAOT_DATA {	// 180 0x00B4
	UCHAR Be_flg;		// $00000000
	UCHAR Ck_bit;		// $00000001
	UCHAR Stage_bak;		// $00000002
	UCHAR Room_bak;		// $00000003
	ULONG Data[44];		// $00000004
} AOT_DATA, *PAOT_DATA;
typedef struct tagATE {	// 100136 0x18728
	UCHAR Main_rtn;		// $00000000
	UCHAR Sub_rtn0;		// $00000001
	UCHAR Sub_rtn1;		// $00000002
	UCHAR Sub_rtn2;		// $00000003
	UCHAR Sub_rtn3;		// $00000004
	UCHAR Sub_rtn4;		// $00000005
	UCHAR Sub_rtn5;		// $00000006
	CHAR At_no;		// $00000007
	UCHAR Base_pos_no;		// $00000008
	UCHAR View_mode;		// $00000009
	UCHAR View_rtn;		// $0000000a
	UCHAR Bit_no;		// $0000000b
	UCHAR List_no;		// $0000000c
	UCHAR Win_rtn;		// $0000000d
	UCHAR Padd1;		// $0000000e
	UCHAR Padd2;		// $0000000f
	SHORT Menu_x;		// $00000010
	SHORT Menu_y;		// $00000012
	SHORT Menu_w;		// $00000014
	SHORT Menu_h;		// $00000016
	SHORT Y_h;		// $00000018
	SHORT Pos[4][2];		// $0000001a
	LONG Viewx;		// $0000002c
	LONG Viewy;		// $00000030
	LONG Viewz;		// $00000034
	LONG Gx;		// $00000038
	LONG Gy;		// $0000003c
	UCHAR Stage_no_old;		// $00000040
	UCHAR Room_no_old;		// $00000041
	UCHAR Cut_no_old;		// $00000042
	UCHAR nFloor_old;		// $00000043
	SHORT Pos_x_old;		// $00000044
	SHORT Pos_y_old;		// $00000046
	SHORT Pos_z_old;		// $00000048
	SHORT Cdir_y_old;		// $0000004a
	POLY_F4 Tview[32][2];		// $0000004c
	POLY_F4 Point[2];		// $0000064c
	POLY_F4 Bottom[2];		// $0000067c
	POLY_F4 Top[2];		// $000006ac
	LINE_F2 Waku[2][2][4];		// $000006dc
	LINE_F2 Point2[2][4];		// $000007dc
	DR_MODE Draw_mode[2];		// $0000085c
	TILE Menu_prim[2];		// $00000874
	UCHAR Aot_data_be[16];		// $00000894
	AOT_DATA Aot_data[16][32];		// $000008a4
	AOT_DATA CAot_data[32];		// $000170a4
	AOT_DATA * pCAot;		// $00018724
} ATE, *PATE;
typedef struct tagMACRO_TBL {	// 8 0x0008
	ULONG Offset;		// $00000000
	USHORT Length;		// $00000004
	USHORT Num;		// $00000006
} MACRO_TBL, *PMACRO_TBL;
typedef struct tagMACRO_WORK {	// 68 0x0044
	USHORT nAt_id;		// $00000000
	USHORT nFlg;		// $00000002
	USHORT nEvt;		// $00000004
	USHORT nIid;		// $00000006
	USHORT nMap;		// $00000008
	USHORT nFile;		// $0000000a
	USHORT nImax;		// $0000000c
	USHORT nIflg;		// $0000000e
	USHORT nDtex;		// $00000010
	USHORT nDtype;		// $00000012
	MACRO_TBL * pAt_id;		// $00000014
	MACRO_TBL * pFlg;		// $00000018
	MACRO_TBL * pEvt;		// $0000001c
	MACRO_TBL * pIid;		// $00000020
	MACRO_TBL * pMap;		// $00000024
	MACRO_TBL * pFile;		// $00000028
	MACRO_TBL * pImax;		// $0000002c
	MACRO_TBL * pIflg;		// $00000030
	MACRO_TBL * pDtex;		// $00000034
	MACRO_TBL * pDtype;		// $00000038
	MACRO_TBL * pMtbl;		// $0000003c
	UCHAR * pBuff;		// $00000040
} MACRO_WORK, *PMACRO_WORK;
typedef struct tagSSEQUENCE {	// 8 0x0008
	UCHAR pGp;		// $00000000
	UCHAR nSpr;		// $00000001
	UCHAR Time;		// $00000002
	UCHAR Twh;		// $00000003
	SHORT Hotx;		// $00000004
	SHORT Hoty;		// $00000006
} SSEQUENCE, *PSSEQUENCE;
typedef struct tagSPRITEGp {	// 4 0x0004
	UCHAR U;		// $00000000
	UCHAR V;		// $00000001
	CHAR Ofsx;		// $00000002
	CHAR Ofsy;		// $00000003
} SPRITEGp, *PSPRITEGp;
typedef struct tagMSEQUENCE {	// 24 0x0018
	UCHAR Routine0;		// $00000000
	UCHAR Routine1;		// $00000001
	UCHAR Free0;		// $00000002
	UCHAR Free1;		// $00000003
	USHORT Transx;		// $00000004
	USHORT Transy;		// $00000006
	CHAR Add_x;		// $00000008
	CHAR Add_y;		// $00000009
	CHAR Add_z;		// $0000000a
	UCHAR Free2;		// $0000000b
	SHORT Speed_x;		// $0000000c
	SHORT Speed_y;		// $0000000e
	SHORT Speed_z;		// $00000010
	USHORT Free3;		// $00000012
	USHORT Free4;		// $00000014
	USHORT Free5;		// $00000016
} MSEQUENCE, *PMSEQUENCE;
typedef struct tagESPECT_BASE {	// 100 0x0064
	USHORT Be_flg;		// $00000000
	UCHAR Wk_no;		// $00000002
	CHAR Padd0;		// $00000003
	UCHAR Id;		// $00000004
	UCHAR Id2;		// $00000005
	UCHAR Type;		// $00000006
	UCHAR Mov_cnt;		// $00000007
	UCHAR Anm_time;		// $00000008
	UCHAR Anm_cnt;		// $00000009
	SHORT DirY;		// $0000000a
	SHORT Mov_x;		// $0000000c
	SHORT Mov_y;		// $0000000e
	SHORT Mov_z;		// $00000010
	USHORT Tpage;		// $00000012
	SHORT Hot_x;		// $00000014
	SHORT Hot_y;		// $00000016
	SHORT Hot_z;		// $00000018
	USHORT Clut;		// $0000001a
	SHORT Pos_x;		// $0000001c
	SHORT Pos_y;		// $0000001e
	SHORT Pos_z;		// $00000020
	USHORT Mag;		// $00000022
	SHORT Old_x;		// $00000024
	SHORT Old_y;		// $00000026
	SHORT Old_z;		// $00000028
	SHORT Padd1;		// $0000002a
	SHORT Cdir_x;		// $0000002c
	SHORT Cdir_y;		// $0000002e
	SHORT Cdir_z;		// $00000030
	SHORT Padd2;		// $00000032
	SHORT m[3][3];		// $00000034
	SHORT Padd3;		// $00000046
	LONG t[3];		// $00000048
	MATRIX * pMat;		// $00000054
	SSEQUENCE * pAnmseq;		// $00000058
	SPRITEGp * pSprg;		// $0000005c
	MSEQUENCE * pMoveseq;		// $00000060
} ESPECT_BASE, *PESPECT_BASE;
typedef struct tagESP_WORK {	// 124 0x007C
	UCHAR Routine0;		// $00000000
	UCHAR Routine1;		// $00000001
	UCHAR Free0;		// $00000002
	UCHAR Free1;		// $00000003
	USHORT Transx;		// $00000004
	USHORT Transy;		// $00000006
	CHAR Add_x;		// $00000008
	CHAR Add_y;		// $00000009
	CHAR Add_z;		// $0000000a
	UCHAR Free2;		// $0000000b
	SHORT Speed_x;		// $0000000c
	SHORT Speed_y;		// $0000000e
	SHORT Speed_z;		// $00000010
	USHORT Free3;		// $00000012
	USHORT Free4;		// $00000014
	USHORT Free5;		// $00000016
	USHORT Be_flg;		// $00000018
	UCHAR Wk_no;		// $0000001a
	CHAR Padd0;		// $0000001b
	UCHAR Id;		// $0000001c
	UCHAR Id2;		// $0000001d
	UCHAR Type;		// $0000001e
	UCHAR Mov_cnt;		// $0000001f
	UCHAR Anm_time;		// $00000020
	UCHAR Anm_cnt;		// $00000021
	SHORT DirY;		// $00000022
	SHORT Mov_x;		// $00000024
	SHORT Mov_y;		// $00000026
	SHORT Mov_z;		// $00000028
	USHORT Tpage;		// $0000002a
	SHORT Hot_x;		// $0000002c
	SHORT Hot_y;		// $0000002e
	SHORT Hot_z;		// $00000030
	USHORT Clut;		// $00000032
	SHORT Pos_x;		// $00000034
	SHORT Pos_y;		// $00000036
	SHORT Pos_z;		// $00000038
	USHORT Mag;		// $0000003a
	SHORT Old_x;		// $0000003c
	SHORT Old_y;		// $0000003e
	SHORT Old_z;		// $00000040
	SHORT Padd1;		// $00000042
	SHORT Cdir_x;		// $00000044
	SHORT Cdir_y;		// $00000046
	SHORT Cdir_z;		// $00000048
	SHORT Padd2;		// $0000004a
	SHORT m[3][3];		// $0000004c
	SHORT Padd3;		// $0000005e
	LONG t[3];		// $00000060
	MATRIX * pMat;		// $0000006c
	SSEQUENCE * pAnmseq;		// $00000070
	SPRITEGp * pSprg;		// $00000074
	MSEQUENCE * pMoveseq;		// $00000078
} ESP_WORK, *PESP_WORK;
typedef struct tagSAB {	// 12 0x000C
	SHORT org_vx;		// $00000000
	SHORT org_vy;		// $00000002
	SHORT org_vz;		// $00000004
	SHORT sa_vx;		// $00000006
	SHORT sa_vy;		// $00000008
	SHORT sa_vz;		// $0000000a
} SAB, *PSAB;
typedef struct tagMEMORY_MANAGE {	// 8 0x0008
	VOID * pAddress;		// $00000000
	ULONG Size;		// $00000004
} MEMORY_MANAGE, *PMEMORY_MANAGE;
typedef struct tagMODEL {	// 9936 0x26D0
	UCHAR Be_flg;		// $00000000
	UCHAR Free0;		// $00000001
	SHORT speed;		// $00000002
	SHORT speedy;		// $00000004
	SHORT cdir_y;		// $00000006
	SHORT m[3][3];		// $00000008
	LONG Pos_x;		// $0000001c
	LONG Pos_y;		// $00000020
	LONG Pos_z;		// $00000024
	SHORT Old_x;		// $00000028
	SHORT Old_y;		// $0000002a
	SHORT Old_z;		// $0000002c
	MATRIX workm;		// $00000030
	LINE_F2 prim[2][308];		// $00000050
} MODEL, *PMODEL;
typedef struct tagPSP {	// 4 0x0004
	UCHAR be_flg;		// $00000000
	UCHAR id;		// $00000001
	SHORT otz;		// $00000002
} PSP, *PPSP;
typedef struct tagTSPRT {	// 32 0x0020
	DR_MODE mode;		// $00000000
	SPRT sprt;		// $0000000c
} TSPRT, *PTSPRT;
typedef struct tagPSP_DATA {	// 8 0x0008
	USHORT nPrim;		// $00000000
	USHORT Padd0;		// $00000002
	ULONG pData_adr;		// $00000004
} PSP_DATA, *PPSP_DATA;
typedef struct tagPXPY {	// 4 0x0004
	USHORT x;		// $00000000
	USHORT y;		// $00000002
} PXPY, *PPXPY;
typedef struct tagGROUPWK {	// 8 0x0008
	USHORT Nsprite;		// $00000000
	USHORT Cba;		// $00000002
	USHORT Hot_x;		// $00000004
	USHORT Hot_y;		// $00000006
} GROUPWK, *PGROUPWK;
typedef struct tagPARTSWK {	// 12 0x000C
	UCHAR U;		// $00000000
	UCHAR V;		// $00000001
	UCHAR Ofs_x;		// $00000002
	UCHAR Ofs_y;		// $00000003
	USHORT Z;		// $00000004
	USHORT Flag;		// $00000006
	USHORT W;		// $00000008
	USHORT H;		// $0000000a
} PARTSWK, *PPARTSWK;
typedef struct tagPARTSST {	// 44 0x002C
	ULONG Be_flg;		// $00000000
	USHORT Id;		// $00000004
	USHORT No;		// $00000006
	SHORT Tbl_x;		// $00000008
	SHORT Tbl_y;		// $0000000a
	USHORT Super;		// $0000000c
	USHORT mennseki;		// $0000000e
	USHORT Hot_x_old;		// $00000010
	USHORT Hot_y_old;		// $00000012
	UCHAR Mag_x;		// $00000014
	UCHAR Mag_y;		// $00000015
	UCHAR Size_x;		// $00000016
	UCHAR Size_y;		// $00000017
	USHORT Nsprite;		// $00000018
	USHORT Cba;		// $0000001a
	USHORT Hot_x;		// $0000001c
	USHORT Hot_y;		// $0000001e
	UCHAR U;		// $00000020
	UCHAR V;		// $00000021
	UCHAR Ofs_x;		// $00000022
	UCHAR Ofs_y;		// $00000023
	USHORT Z;		// $00000024
	USHORT Flag;		// $00000026
	USHORT W;		// $00000028
	USHORT H;		// $0000002a
} PARTSST, *PPARTSST;
typedef struct tagBOXLINE {	// 48 0x0030
	LINE_F3 Line0;		// $00000000
	LINE_F3 Line1;		// $00000018
} BOXLINE, *PBOXLINE;
typedef struct tagDISP_POLY {	// 300 0x012C
	SHORT Xmax;		// $00000000
	SHORT Ymax;		// $00000002
	SHORT Xmin;		// $00000004
	SHORT Ymin;		// $00000006
	UCHAR Atari;		// $00000008
	UCHAR Area;		// $00000009
	USHORT Id;		// $0000000a
	UCHAR High;		// $0000000c
	UCHAR Shape;		// $0000000d
	USHORT Dummy16;		// $0000000e
	ULONG Floor;		// $00000010
	POLY_G3 Poly[10];		// $00000014
} DISP_POLY, *PDISP_POLY;
typedef struct tagSC_UTIL {	// 288 0x0120
	LONG Max;		// $00000000
	CHAR Rno_0;		// $00000004
	CHAR Rno_1;		// $00000005
	CHAR Rno_2;		// $00000006
	CHAR Rno_3;		// $00000007
	CHAR Rno_4;		// $00000008
	CHAR Rno_5;		// $00000009
	CHAR Rno_6;		// $0000000a
	CHAR Rno_7;		// $0000000b
	LONG Viewx;		// $0000000c
	LONG Viewy;		// $00000010
	LONG Viewz;		// $00000014
	LONG Gx;		// $00000018
	LONG Gy;		// $0000001c
	LONG Dxmax;		// $00000020
	LONG Dxmin;		// $00000024
	LONG Dymax;		// $00000028
	LONG Dymin;		// $0000002c
	LONG Bg_bak;		// $00000030
	SHORT No;		// $00000034
	SHORT Sort_flr;		// $00000036
	SHORT Aspd;		// $00000038
	CHAR Timer;		// $0000003a
	CHAR Comp_sw;		// $0000003b
	SHORT Cent_X;		// $0000003c
	SHORT Cent_Y;		// $0000003e
	SHORT Num[4];		// $00000040
	SHORT StoreXmax;		// $00000048
	SHORT StoreYmax;		// $0000004a
	SHORT StoreXmin;		// $0000004c
	SHORT StoreYmin;		// $0000004e
	LINE_F2 Line[4][3];		// $00000050
	UCHAR LineDispFlg[4];		// $00000110
	UCHAR Ldisp_flg;		// $00000114
	UCHAR Bk_ldisp_flg;		// $00000115
	UCHAR Ddisp_flg;		// $00000116
	UCHAR Adisp_flg;		// $00000117
	CHAR Ceil_M10;		// $00000118
	CHAR Ceil_M1;		// $00000119
	CHAR Ceil_CM10;		// $0000011a
	CHAR Ceil_CM1;		// $0000011b
	LONG Ceil_height;		// $0000011c
} SC_UTIL, *PSC_UTIL;
typedef struct tagSPL_FREE {	// 16 0x0010
	SHORT Dest_x;		// $00000000
	SHORT Dest_z;		// $00000002
	USHORT Move_flg;		// $00000004
	USHORT Dest_ll;		// $00000006
	SHORT Sake_dir;		// $00000008
	UCHAR Em_pos_flg;		// $0000000a
	SHORT Sake_timer;		// $0000000c
	SHORT Back_spd;		// $0000000e
} SPL_FREE, *PSPL_FREE;
typedef struct tagbyte_lh {	// 2 0x0002
	UCHAR low;		// $00000000
	UCHAR h;		// $00000001
} byte_lh, *Pbyte_lh;
typedef struct tagTEX_MOVE_SEQ {	// 2 0x0002
	UCHAR Tbl_no;		// $00000000
	UCHAR Timer;		// $00000001
} TEX_MOVE_SEQ, *PTEX_MOVE_SEQ;
typedef struct tagTEX_MOVE_DATA {	// 8 0x0008
	UCHAR Mo_u;		// $00000000
	UCHAR Mo_v;		// $00000001
	UCHAR Mo_w;		// $00000002
	UCHAR Mo_h;		// $00000003
	UCHAR Moto_tpage;		// $00000004
	UCHAR Saki_tpage;		// $00000005
	UCHAR Sa_u;		// $00000006
	UCHAR Sa_v;		// $00000007
} TEX_MOVE_DATA, *PTEX_MOVE_DATA;
typedef struct tagJH_TBL {	// 4 0x0004
	USHORT Point;		// $00000000
	USHORT Per;		// $00000002
} JH_TBL, *PJH_TBL;
typedef struct tagJH_HEAD {	// 56 0x0038
	UCHAR Parts0_no;		// $00000000
	UCHAR Parts1_no;		// $00000001
	USHORT Vn_num;		// $00000002
	SVECTOR * p0Vec;		// $00000004
	SVECTOR * p0Nor;		// $00000008
	SVECTOR * p0Ovec;		// $0000000c
	SVECTOR * p0Onor;		// $00000010
	SVECTOR Parts0_off;		// $00000014
	SVECTOR * p1Vec;		// $0000001c
	SVECTOR * p1Nor;		// $00000020
	SVECTOR * p1Ovec;		// $00000024
	SVECTOR * p1Onor;		// $00000028
	SVECTOR Parts1_off;		// $0000002c
	JH_TBL * pJh;		// $00000034
} JH_HEAD, *PJH_HEAD;
typedef struct tagKI {	// 80 0x0050
	SVECTOR v0;		// $00000000
	SVECTOR v1;		// $00000008
	SVECTOR v2;		// $00000010
	SVECTOR v3;		// $00000018
	POLY_F4 prim[2];		// $00000020
} KI, *PKI;
typedef struct tagKI2 {	// 256 0x0100
	PRIM_F4 prim[2];		// $00000000
	PRIM_F4 prim1[2];		// $00000048
	MATRIX wm0;		// $00000090
	MATRIX wm1;		// $000000b0
	MATRIX wm2;		// $000000d0
	SVECTOR off0;		// $000000f0
	SVECTOR off1;		// $000000f8
} KI2, *PKI2;
typedef struct tagPOLY_EFF {	// 128 0x0080
	SVECTOR * pSv4;		// $00000000
	SHORT Cdir_x;		// $00000004
	SHORT Cdir_y;		// $00000006
	SHORT Cdir_z;		// $00000008
	CHAR Be_flg;		// $0000000a
	CHAR R0;		// $0000000b
	SHORT Pos_x;		// $0000000c
	SHORT Pos_y;		// $0000000e
	SHORT Pos_z;		// $00000010
	CHAR R1;		// $00000012
	CHAR R2;		// $00000013
	ULONG Rgb;		// $00000014
	POLY_GT4 Prim[2];		// $00000018
} POLY_EFF, *PPOLY_EFF;
typedef struct tagPOLY_EFF2 {	// 296 0x0128
	SVECTOR Sv0;		// $00000000
	SVECTOR Sv1;		// $00000008
	SVECTOR Sv2;		// $00000010
	SVECTOR Sv3;		// $00000018
	SVECTOR Sv4;		// $00000020
	SVECTOR Sv5;		// $00000028
	POLY_GT4 Prim0[2];		// $00000030
	POLY_GT4 Prim1[2];		// $00000098
	SHORT Cdir_x;		// $00000100
	SHORT Cdir_y;		// $00000102
	SHORT Cdir_z;		// $00000104
	UCHAR Be_flg;		// $00000106
	CHAR dummy00;		// $00000107
	SHORT Pos_x;		// $00000108
	SHORT Pos_y;		// $0000010a
	SHORT Pos_z;		// $0000010c
	SHORT dummy01;		// $0000010e
	ULONG Rgb0;		// $00000110
	ULONG Rgb1;		// $00000114
	ULONG Rgb2;		// $00000118
	ULONG Rgb3;		// $0000011c
	ULONG Rgb4;		// $00000120
	ULONG Rgb5;		// $00000124
} POLY_EFF2, *PPOLY_EFF2;
typedef struct tagPOLY_EFF2_WORK {	// 12 0x000C
	CHAR Be_flg;		// $00000000
	CHAR Id;		// $00000001
	CHAR R0;		// $00000002
	CHAR R1;		// $00000003
	CHAR Timer1;		// $00000004
	CHAR R2;		// $00000005
	SHORT Timer0;		// $00000006
	UCHAR Pe_top_no;		// $00000008
	UCHAR Use_Pe_num;		// $00000009
	USHORT dummy00;		// $0000000a
} POLY_EFF2_WORK, *PPOLY_EFF2_WORK;

enum MEM_CARD00 {
	CMOJI_00,
	CMOJI_01,
	CMOJI_02,
	CMOJI_03,
	CMOJI_04,
	CMOJI_05,
	CMOJI_06,
	CMOJI_07,
	CMOJI_08,
	CMOJI_09,
	CMOJI_10,
	CMOJI_11,
	CMOJI_12,
	CMOJI_13,
	CMOJI_14,
	CMOJI_15,
	CMOJI_16,
	CMOJI_17,
	EMESS_0,
	EMESS_1,
	EMESS_2,
	EMESS_3,
	EMESS_4,
	EMESS_5,
	EMESS_6,
	EMESS_7,
	EMESS_8,
	MESS_LEON,
	MESS_CLAIRE,
	MESS_LEON_R,
	MESS_CLAIRE_R,
	MESS_SPY,
	MESS_SAVE_CNT,
	AREA_0,
	AREA_1,
	AREA_2,
	AREA_3,
	AREA_4,
	AREA_5,
	AREA_6,
	AREA_7,
	AREA_8,
	AREA_9,
	AREA_10,
	AREA_11,
	AREA_12,
	AREA_13,
	AREA_14,
	AREA_15,
	AREA_16,
	AREA_17
};
enum MEM_CARD01 {
	SLOT_CHECK,
	USE_CARD,
	SEL_SLOT,
	ERR_MESS,
	NOW_CHECKING,
	CARD_CHECK,
	FILE_SEL,
	READY,
	SAVE,
	SAVE_DEMO,
	LOAD,
	LOAD2,
	FORMAT_CHECK,
	FORMAT,
	ERR_MESS2,
	OVERWRITE,
	SCRL_UP,
	SCRL_DOWN,
	PAGE_CHANGE
};
enum PC_EVENT00 {
	MES_A00,
	MES_A10,
	MES_A11,
	MES_A20,
	MES_A21,
	MES_CARD00,
	MES_CARD01,
	MES_CARD10,
	MES_CARD20,
	MES_PRESS
};
enum PC_EVENT01 {
	DUMMY0,
	DUMMY1,
	MES_613_0,
	MES_613_1,
	MES_613_2,
	MES_613_3,
	MES_613_4,
	MES_613_5,
	MES_613_6,
	MES_613_7,
	MES_613_8,
	MES_613_9
};
enum PC_EVENT02 {
	E1_INIT,
	E1_A1,
	E1_A3,
	E1_A8,
	E1_A9,
	E1_A10,
	E1_A11,
	E1_A12,
	E1_A13,
	E1_PRESS_KEY,
	E1_PRESS_KEY2,
	E1_EXIT,
	E1_EXIT2,
	E1_EXIT3
};
enum PC_EVENT03 {
	E2_INIT,
	E2_SET_UP,
	E2_SET_UP2,
	E2_SET_UP3,
	E2_INPUT1,
	E2_INPUT2,
	E2_NO_GUEST,
	E2_GUEST,
	E2_ENTRY_END,
	E2_ENTRY_END2,
	E2_ENTRY_END3,
	E2_EXIT,
	E2_EXIT2
};
typedef struct tagCD {
	unsigned char Cd_rtn_no;
	unsigned char Xa_rtn_no;
	unsigned char Check_sum_flg;
	unsigned char Type;
	DslLOC Fpos;
	unsigned long int Fsize;
	unsigned long int Fsize_now;
	unsigned long int Fsize_read;
	unsigned long int Fsector;
	unsigned short int Fsector_num;
	unsigned short int Fsector_read;
	unsigned short int Fno;
	unsigned char Fsum;
	unsigned char Sum;
	unsigned long int Sum_cnt;
	unsigned long int Start_sector;
	unsigned long int Current_sector;
	unsigned long int End_sector;
	unsigned long int * Read_adr;
	unsigned char Use_mode;
	unsigned char Limit_break;
	unsigned char Time_ctr;
	unsigned char Status;
	unsigned char Result[12];
	unsigned char Param[4];
	unsigned char Work_buf[2048];
	DslFILTER Filter;
	DslATV Cdvol;
	unsigned long int Vol;
	unsigned long int * Buff_adr;
	unsigned char Read_ctr;
	unsigned char Write_ctr;
	unsigned char First_flg;
	unsigned char Stereo_flg;
	unsigned char Ring_status[12];
	unsigned short int Ring_size[12];
} CD;
#pragma pack(pop)