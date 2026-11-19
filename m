Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795094294;
	b=O6F4CftmZj/GQiaE4KRhSVvqBaKEICMOFWAr3TjVNZK6Ja+igUAg4C/BzbUBK63Y/tuu
	 oZWS6Htv3RG/3GIQaFDUKWH1TWjMUmm75ofls42GeWTFT0wgMQxHAsNEKSCIVFZXhlBvH
	 bmxR6z8rxZfRL6LaoOwq7WoiiQRZTbWXV8+uZJym8Mf/RZBTq5vDoslVdACzgjHI2ti54
	 y6n0twupIPIfHV9yq1GHYGU1US5zSf5rTiI3y+I+61hHi8IbnWUvUbPl4t4CamwC8o4q4
	 zSYX1zqMp+Pu7gueRm1ErUESVb4awamm69l/l7kt5mIa90yPBLEPSr2O69a+QA8bINw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094294;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Fjiil8ZBPWSYIvaASS9MOgH5zQGHhb0si4uDAcvR9oI=;
	b=jHSTuL8GGasscoUhDO3+qlyeezLikYsHPkZQH1SKacQuqF4RHoOYUWlCP8fMrIGkpQoX
	 WOO4BLKAXa6uDgdF0hZAK0y78CHQGnrLAm9zZGhGbqLiJ9A4RTAlTV5oC1JclV28rEWgg
	 u3naNY2mAvTkdidit4MOPbEP+9h4dnvvcfb6h6cEAdrlzmd4WGDy57r7LJwNX0oUWDgcD
	 OaBOWeXm02Brm4yQZNRIkOqJnrYYPu1LjPfty/yBT+xlw6kUDd1cyY9oIW8bDFWaPcEqQ
	 vzMqmSmv77fRyBbOZe4R+fKoFOBPEk+SjaLPWStedhWSgkQ1Op80a8vfIPqtjOk62ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FrAbelM2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.41
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06250606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06250606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FrAbelM2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atM8U8eiiD7yO/aRxjxGxBjvcOfB3YHCj3vOFXWLYW+axqQ8mF1sAOYy0c9Buac/3MWEjjc5n2UD9x+DmG6IiFkizDb1+U1bGmJwYZlPYSq52B/xkQ4Nvrbw9WcEc+bQcDoNrUYjFs6ck6OM6ChR3E8IU7tvHRRUCdhHOiQeXJFJopwVcN4Mr01eVHXk2GLnTJ9n0B9Rawj5p7BcaY0ruphw6QzCDDsOm4e70q/hbsYBgvqyNEkVvnhP+vW8C2PVlotOlFmhX59Ataxq3iXHzPpy6iJMXKovM68Pe1Z6YLO2urjObXj0mPK0kBmnFDtl6fAaW/0KeZB06tVpauwVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fjiil8ZBPWSYIvaASS9MOgH5zQGHhb0si4uDAcvR9oI=;
 b=U37tAvzZb4U9kvVolm3nQ/Mr/JNgbQ+c0A2OKeefnNZdehH1ovXxKk5V8+jaMxOI+SHHshKaJyN0dqqxTMNNiBXxs1qJd2uSO2K0T4TPmX4z6ugRQ984fw2uH1cGOz9lLWZAZ5OLYP0MEu5puLXLp2wAgSAsjA+hYa/pmgnnRT9xW44uiEa+nCovEEJ7QP8DZOYU/W7rmkkSdwWwm1DEtbd0InQ1GsJOyk/3rjnz3AvCfIdb8JuKJzCC5zHyKX8wRsrztP0pV3SMFvRoCvJNskBh/nApxsMvT0Ov8addqUlERhCV60FOkQB5E65AhArgykMnMdnvPZpzvVz5Tdmj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fjiil8ZBPWSYIvaASS9MOgH5zQGHhb0si4uDAcvR9oI=;
 b=FrAbelM2WNZ9MwKur+dRHB3y+2pHP4M1a+ge2H2ED9DwS+WrZl98yEfRPMwTEVsGyAOy1LVdeBaULUYIkoPNTm38AMIyXVYbXLvNtp7pFUgQOVQC+OL7C8Y3CBJ8jiM9P793MxYrHnGdwXPBiI/wo5EC8TMfHGrYCRn5MVW/dkA=
Received: from CH2PR12CA0021.namprd12.prod.outlook.com (2603:10b6:610:57::31)
 by BN7PPF862C85B20.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 13:18:10 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::95) by CH2PR12CA0021.outlook.office365.com
 (2603:10b6:610:57::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 19
 Nov 2026 13:18:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 13:18:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:18:05 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 07:18:05 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, Jolly Shah
	<jollys@xilinx.com>, Rajan Vaja <rajanv@xilinx.com>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 6/6] firmware: xilinx: Bound debugfs clock name formatting
Date: Thu, 19 Nov 2026 14:17:30 +0100
Message-ID: <c2dcbb74fa6ad3c716daa747c024fb73e5f5109b.1795094242.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795094242.git.michal.simek@amd.com>
References: <cover.1795094242.git.michal.simek@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546; i=michal.simek@amd.com; h=from:subject:message-id; bh=M1a22fgz/bdtA5DcyUDVrD3dJcQxkVae0cdsBDV8pb4=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9+/b55fv/388KW/kF5/Y3nRFn+fAgJZGH6duyn4Ip5 ouTGLY3d5SyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBEDpYy/C93eDPvp0HzbdZ+ 0WaBrEvZ6Ql/FmW+SjRS6r184K1YUCUjw7Ymg+lZSw5ff2xycI6xnW194Kk9Fy8aPX55P6XQILL oFQ8A
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|BN7PPF862C85B20:EE_
X-MS-Office365-Filtering-Correlation-Id: bae5dfee-75d1-446c-e0eb-08df463f8ee8
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|56012099006|11063799006|261026140227099003|261026121527099003|261028144727099003|261026135527099003|261022105027099003|261021130227099003|261021135927099003|261021123027099003|261021121427099003|261022075727099003|261022115727099003|261021133027099003|261022113327099003|261026130827099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LN7ly8uUDsEQn2jbl5QOg2RiLr2HY2fDNhdMoFthXMcFBxj/POkSDXt5QSYZW5hZXS2nRXEr+v1jgnceR3i8POAeu7Hb3OVVkWGf738Kqq3fPLmcM3/kPhC2M3B/YEW2phOCaqWCEG/5fMvZ7O9xu4o0YQh107XNWU9IK1Nyv19N8/XoBhYlcRd9sTJqqQLl7NH5xeQBjO+NntnJ/QUsn293WFsXxt9JD7T9Jwa7WSvx4+Ooq8fQ60zBTyx8DbIrF+UQcKVn5GZtgxN/WozkzpY0YGBG3TPgfrLzKLt/GVXoej+PGF3hXS6tkBBZeqJ5PO8kLsLpaNuHpC3SzQu1qD/b6E4yDSOI7JdAy+bCuaLRbef0T8lg/FD/G3efJ+8B8tzXUuOv29Hutf9RJQVJm8IjjDwZYqJqnjI+/PRWe+TIcJo+6MWlgm9PWyZuV241vZWDOI8J6kwizdLrvbxTTP6vWaCj9RO41716GVb7f+E3lZ4f7YdJrAzLcSUQRgcdBO2/xv4qiZ+Dh6/s6j0WDvlMGucJtcZ3MoZlfP+WHzox3jhqvCTfGqaMPxf6F5LCfWUU7HF5jVL8/aVTYMnrBouystJ/2rU2EMfIaOzNc0Ur9oWaijALvyryfRcvdVsGIkUmOx714U+F0yHZ9ju6PfPl345degGASISci4+cMPKVzHLO/WpAZwe6ex6ldUdI137gyXNlb9pype8uo3YJ6A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261026135527099003)(261022105027099003)(261021130227099003)(261021135927099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261021133027099003)(261022113327099003)(261026130827099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RQq+T64FyrneDj1KFR4oA8hYPhJYWJ5gJBXYwxq5oSzLX21AKHxoEIyGkdTVhK5KJRDExym6m8v2R73SCCrNj/YBymqlSDyg3VQQoSd91g2hG3qbRKkL8g3/IVXH3kguorwV1ldrANILmqtRX7r1sEBO8QPirLLmzeFI9bWmpZ0ZlVhij9XKhZvBh4aWXuw5h7tzdaMpZKZa8QwRAcGguhjE+FKh24Cnl3Pr8+FA2X/HC95xRrbLXS/lEVSDXEyBjnkPBqBBNFVpfuzt3Y8ERwlKmo6HsBz/Co9dvqfBkBLaGgg9BkgwNEBL+iOJ+e55qwxktK/Dud8B2oeobHAOIfRnLulT1HbTi98hiWhvNSd7HXMTEnK3FMlTciTiC/75TGbbe32i6QzzMeRTjei17ODYMD7e+HoBHuVRh8P4qgwAL820KgMPd92iLfE8r+Aw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:18:10.2654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae5dfee-75d1-446c-e0eb-08df463f8ee8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF862C85B20

From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

PM_QID_CLOCK_GET_NAME returns up to 16 name bytes with no guaranteed NUL
terminator. Copy the response into a bounded local buffer before formatting
to prevent kernel stack data from leaking via debugfs.

Fixes: e60f02ddb4d2 ("firmware: xilinx: Add debugfs for query data API")
Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/firmware/xilinx/zynqmp-debug.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp-debug.c b/drivers/firmware/xilinx/zynqmp-debug.c
index f7751912d80a..77b35a525b96 100644
--- a/drivers/firmware/xilinx/zynqmp-debug.c
+++ b/drivers/firmware/xilinx/zynqmp-debug.c
@@ -21,6 +21,7 @@
 #include "zynqmp-debug.h"
 
 #define PM_API_NAME_LEN			50
+#define CLK_GET_NAME_RESP_LEN		16
 
 struct pm_api_info {
 	u32 api_id;
@@ -279,10 +280,14 @@ static int process_api_request(u32 pm_id, u64 *pm_api_arg, u32 *pm_api_ret)
 			break;
 
 		switch (qdata.qid) {
-		case PM_QID_CLOCK_GET_NAME:
-			sprintf(debugfs_buf, "Clock name = %s\n",
-				(char *)pm_api_ret);
+		case PM_QID_CLOCK_GET_NAME: {
+			char name[CLK_GET_NAME_RESP_LEN + 1];
+
+			memcpy(name, pm_api_ret, CLK_GET_NAME_RESP_LEN);
+			name[CLK_GET_NAME_RESP_LEN] = '\0';
+			sprintf(debugfs_buf, "Clock name = %s\n", name);
 			break;
+		}
 		case PM_QID_CLOCK_GET_FIXEDFACTOR_PARAMS:
 			sprintf(debugfs_buf, "Multiplier = %d, Divider = %d\n",
 				pm_api_ret[1], pm_api_ret[2]);
-- 
2.43.0

