Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033043;
	b=SYCcnLqYr8kGKipYjlu79mD0D5z1jz4TqmEnKjF9wQd3X4P1iUqiK06t7/wOIKaspuVJ
	 esLYUSTJ/BoNI40Ler2FcZYq9vfq9WquMMTplLvXjKY4xVN/rb3iD/tw7j5qKPWZD97ZA
	 urDftSv5SpNR5kxs+vlaZnpnfTsLeO4oRKxdcF8Uyk4Q9++ThPHPt0Ack4rARPLrQ1b9k
	 y+bmwkaHVyVjFP/N8/IuMKS+/N9ilHlWcdDTFaWOKMTRn9qtMd3T5A1EVJQhzbYC/esHf
	 IjQ5/r0axYrzGkTmwJR6MfUD7EfRNmZRWmwh/zrqnjK+FQCV1NVCQTO6CTh+X/bzkFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033043;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=8AdPA9gxID1hQdLOamRY7ghdbrNONzZzD+CRe5Bxv3c=;
	b=JLHF5nUhVmfmXFb61p+KdkLcaJgrUdnFP9VCyQWRc24LUfb28gB5AHBBCmkhul0GQG6n
	 s55dSkaEgAjMbyI+K/kdaiYFLJxJPtKx5LvHKCP+5ihowf4Oj80Nt/tTVB1p96sRuwgAm
	 3GQoK1Gai02bGyVRtIkez2DHv3r1SNraxAu4vVIiFO8SC81TD3VSshKz8xC4A4DQTXzq+
	 eoo6eSsZTta0JdTe3GXhgPb6KHSonS31v2LO7xDRqPKyggAiI4S7N1kN5VFWAC320z7X5
	 3mHsS127P8FuVQfxaYFx+3J+ZWlATO2FbWXDUcwWEODHUAUDX+eseNIzSBJrQS7QWdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XXGuYYhe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.44
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0CE606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D0CE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XXGuYYhe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KugP/B2fUXbeCTKPEVe8rRk/fTEluV9r5dzpBUxeghlJAHdkdnlRAn4SQ+VFjsfQoBrG4CgRi4+5gq4u3CXzKEn91Xm2FCy9/CCnBMerBHPm2/kdisIuN2mwdfcXTkkxlSVcomAheJrgBp1jXjroYq5bDkv0IwM54o7FKxT4ilOOvJM/6Lk9E8hUwnNG9d39PEQiJ6shh5hj/reO/6d0C8TZ34DnPpmU4lmngPa5TMFAkgkTBdA/5duAgrwdJQ/w7RlNVjWuadA3cl99rJn0gToXORlH8PEMb2AFd9QZti5HtYgzm6uXjpv5Rn6wTQf9CpIUSHiHveWkPm2B6257YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AdPA9gxID1hQdLOamRY7ghdbrNONzZzD+CRe5Bxv3c=;
 b=u46peo5MaHrIfP37omaFYBrF7pAMKcYUh6NVW7DkPFTavIIpInrhSVmkne/GBm9gVj1Hzq5KRadHDYsCOQSitMsBzH6Vfcw4yGuheq6K+q4R/4VmQ9ch0PoZV7Uk/4JknFHH9ywSYA2f32QD/c0Z084udOZtx4+TyfeMy24ou5H2S+dWubVBfafhDlkkJHpTLD54eFE2pIeBmoWHcPQq96bQVMrwXHSYAVfc+cFCuP0+AxQIh5NrFJ4mtkJzfHT6KYf09zCElbf0UT+9bcJnz7ATi83iW8er9il1olFl9wmgHQw05QBGGXLMpK+yHVIGquJcd3KLcfZWgQt/GGtr3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AdPA9gxID1hQdLOamRY7ghdbrNONzZzD+CRe5Bxv3c=;
 b=XXGuYYhepioeZHZDwKZrEaXGQebH2zPdyJ2xnU8k4TGLsJ/f11M1IS2KSmXvJ8+8RoBd7zCX/I5fgdPcmlaXLxGBmJ9jevVs8MhZqiJjLmcvO9ePoqDli2o5VNaLa7cEY37dHJsX5rcsoOW/58AIJl5KxPZY4KvZE0nGfad0Xa8=
Received: from CH0PR03CA0392.namprd03.prod.outlook.com (2603:10b6:610:11b::31)
 by CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:17:18 +0000
Received: from CH2PEPF000166BF.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::7f) by CH0PR03CA0392.outlook.office365.com
 (2603:10b6:610:11b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 20:17:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000166BF.mail.protection.outlook.com (10.167.252.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 20:17:18 +0000
Received: from alysaliu-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 14:17:17 -0600
From: William Palacek <William.Palacek@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, Sanjay Yadav
	<sanjay.kumar.yadav@intel.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	<linux-kernel@vger.kernel.org>, William Palacek <William.Palacek@amd.com>
Subject: [PATCH v4 2/3] gpu/buddy: drop subtree_max_free_order
Date: Wed, 18 Nov 2026 15:17:00 -0500
Message-ID: <ae3be752ad88e467bb05e5576af3e5ee4394041e.1795032989.git.William.Palacek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795032989.git.William.Palacek@amd.com>
References: <cover.1795032989.git.William.Palacek@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BF:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 845492a3-c4a3-4fbc-2279-08df45b0f202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|22082099003|18002099003|5023799004|261026121527099003|56012099006|11063799006|261026140227099003|261028144727099003|261009223027099003|261102130727099003|10067099003|261102123227099003|261021123027099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	zvGGMH+oWPac0pxzAqDmdLmygnogUmyHYlViEQjERypbA9ccnGuqP0qs9XFHO61c2fyrkfJy40JP+Yoan1S+EDfehGbeHkUWd2wA16TQ4KclKW2TqcNaR4M9LPZlVL/q1XFNA7L0CX6Elx0tHwDz8/IPbEXi+RYOU3msiXifVUHr3ifo8QaZkXKBR/fta8o7TGqmyeQsYiRuAKA99mTEr8PvFgLAYFhrUDECs7sI6+d7XZSanA4LwNOLFg2chpq4SUmIsr2yuYetsW7vG8KMLHBQVuSpT0xCXPStIo4SXkLH9ThmegJRM4RltcVCIAfHU6ccH+6zkcSmXPGdZRXJx+FyMnsvX+hPVU/8+SLAkXzhE/T+OwqzbNzxXjuMvsrEyllUZeT+Jr5dcb9EIJsMgiS06NHSdR2ahc/LY7hmMAopgyi7ZFMEu0jY3iR8T7epdSn/dYZ4pcIzRrnDXh4e9fX+nXMS2oIJYgZVHS0hIdAwo/CEmxwU4Rq6TxfKnaxqS5W+YorX13RAYRCQ8jtSBjbJq8wAKdj5HYAZmEtSNu6ly3/DqT8FtHagyCepwYyoNbbOBtb74lH0hwiBfSY2LxFiAeKy5hgawy+qLvWUPDcGUQHxKIy/G7jbt2tNXuBWI2l3fLu+hMTsMmzZ7ocKB8HQvcRBYMuMH84Xky0xJ/SFAhc4LVstsqbBNzC6Y96StUXpU9Kzn3s6zLztQyacZQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(5023799004)(261026121527099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261009223027099003)(261102130727099003)(10067099003)(261102123227099003)(261021123027099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BlJaqeNf2e5Nv03GDpg5TrUvWtRq0jcOKDNiKleL75LJ0B/5nSrUtFs4WmOswHVdPoSXMZBEqmh3j4+r9jSuxQf/zJM4Hla+5Zs17G5cZpm1fB7ESXKZPjfxu4aJapNxsFxGNbCbt/WOyQ+7TiO2iG1f/04TtyLt3pVQhdb/R20zVr0/9TlBaaIPs4ZtzsBFpESkR1SE6epHKaz2u1xQdOPVZfmdYCeZhoUDe55vLIp4tZFgegkFOQYRZFdgYVAzJxXDxD7bXFMUjtEJ7X0PKTNfHuxcmgdb6xCNTushz1P1jzS80ZpDwlYKsPSzTUNkLW/453NJGxSoPsyQrJbAJV0AtsOsDI0Ihv32wQ3gcCyOtm5ottS2wpiaHN8nTrlT4FYm6yxjcQZWR5NobEu+imyOdHt/PaCJD7sRieQUfUOdmIDfeZ1CEA4LAHkwmDMi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:17:18.6148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 845492a3-c4a3-4fbc-2279-08df45b0f202
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166BF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071

__alloc_range_bias() no longer walks the buddy tree, so nothing reads
subtree_max_free_order. Stop maintaining it on every allocation and
free, and restore the original order in gpu_buddy_block_trim(), where
the block was detached early only to keep that field consistent.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Signed-off-by: William Palacek <William.Palacek@amd.com>
---

Notes:
    v4:
    - new patch

 drivers/gpu/buddy.c       | 39 ++++-----------------------------------
 include/linux/gpu_buddy.h |  7 -------
 2 files changed, 4 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 26af5428ff76..95f98830b787 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -602,7 +602,6 @@ static struct gpu_buddy_block *gpu_block_alloc(struct gpu_buddy *mm,
 	block->header = offset;
 	block->header |= order;
 	block->parent = parent;
-	block->subtree_max_free_order = GPU_BUDDY_NO_FREE_ORDER;
 
 	RB_CLEAR_NODE(&block->rb);
 
@@ -783,27 +782,6 @@ static void rbtree_remove(struct gpu_buddy *mm,
 	RB_CLEAR_NODE(&block->rb);
 }
 
-static void update_subtree_max_free_order(struct gpu_buddy_block *block)
-{
-	while (block) {
-		s8 max_free;
-
-		if (gpu_buddy_block_is_free(block))
-			max_free = gpu_buddy_block_order(block);
-		else if (gpu_buddy_block_is_split(block))
-			max_free = max(block->left->subtree_max_free_order,
-				       block->right->subtree_max_free_order);
-		else
-			max_free = GPU_BUDDY_NO_FREE_ORDER;
-
-		if (block->subtree_max_free_order == max_free)
-			break;
-
-		block->subtree_max_free_order = max_free;
-		block = block->parent;
-	}
-}
-
 static void mark_allocated(struct gpu_buddy *mm,
 			   struct gpu_buddy_block *block)
 {
@@ -816,7 +794,6 @@ static void mark_allocated(struct gpu_buddy *mm,
 	mm->used_scoreboard[gpu_buddy_block_order(block)]++;
 
 	rbtree_remove(mm, block);
-	update_subtree_max_free_order(block);
 }
 
 static void __mark_free(struct gpu_buddy *mm,
@@ -838,7 +815,6 @@ static void __mark_free(struct gpu_buddy *mm,
 	mm->free_scoreboard[gpu_buddy_block_order(block)]++;
 
 	rbtree_insert(mm, block);
-	update_subtree_max_free_order(block);
 }
 
 static void mark_free(struct gpu_buddy *mm,
@@ -958,8 +934,6 @@ int gpu_buddy_init(struct gpu_buddy *mm, u64 size, u64 chunk_size)
 
 	size = round_down(size, chunk_size);
 
-	BUILD_BUG_ON(GPU_BUDDY_MAX_ORDER > S8_MAX);
-
 	mm->size = size;
 	mm->avail = size;
 	mm->chunk_size = chunk_size;
@@ -2025,17 +1999,13 @@ int gpu_buddy_block_trim(struct gpu_buddy *mm,
 					     gpu_buddy_block_offset(block),
 					     gpu_buddy_block_size(mm, block));
 
-	/*
-	 * Detach the block to prevent recursively freeing this node, and to
-	 * keep free-order updates from propagating above it until the trim
-	 * is done.
-	 */
-	parent = block->parent;
-	block->parent = NULL;
-
 	__mark_free(mm, block, was_clear ? GPU_BLOCK_CLEAR : GPU_BLOCK_DIRTY);
 	mm->avail += gpu_buddy_block_size(mm, block);
 
+	/* Prevent recursively freeing this node */
+	parent = block->parent;
+	block->parent = NULL;
+
 	list_add(&block->tmp_link, &dfs);
 	err =  __alloc_range(mm, &dfs, new_start, new_size,
 			     was_clear ? GPU_BUDDY_CLEAR_ALLOCATION : 0,
@@ -2054,7 +2024,6 @@ int gpu_buddy_block_trim(struct gpu_buddy *mm,
 	}
 
 	block->parent = parent;
-	update_subtree_max_free_order(parent);
 	return err;
 }
 EXPORT_SYMBOL(gpu_buddy_block_trim);
diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
index 8037f5a0feb1..ddc4eca84175 100644
--- a/include/linux/gpu_buddy.h
+++ b/include/linux/gpu_buddy.h
@@ -141,15 +141,8 @@ struct gpu_buddy_block {
 	unsigned int subtree_max_alignment;
 	struct list_head tmp_link;
 	bool has_clear;
-	/*
-	 * Largest order of any FREE block in this block's buddy subtree, or
-	 * GPU_BUDDY_NO_FREE_ORDER if none. Protected by the driver lock.
-	 */
-	s8 subtree_max_free_order;
 };
 
-#define GPU_BUDDY_NO_FREE_ORDER (-1)
-
 /* Order-zero must be at least SZ_4K */
 #define GPU_BUDDY_MAX_ORDER (63 - 12)
 
-- 
2.43.0

