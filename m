Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794946541;
	b=RXt7wEMke1l3XRZqpKNVy0N//pL+SmyqRpAIETzCe9JG62oumDEvlVDQ9gkuywTFreb2
	 rhKMifyEn4mexZ0jTc19hqelkvtwpOt0jfBUETCLyq04k7kjkXaXXOEZypU2YYRgKLr8e
	 QpljtqVyjotXLcO8BPYyw0NaAeReHVCjgKGIFPH1R7K9m4BuN08ow/M28bvik1h3rpM9C
	 256le6VAiOYJN4+qCeDBPp21NrhNe1j2HwIRgIhvYiN22KQDD4zqvFeQmQa53M+V6q3av
	 GF0XrgdPYQHlC7vQG6Q4pzTBCOfV4hygXde8OAoCCiigg8HspyxOJOKjpYM2pLmEBLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946541;
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
	bh=C/ViolL002C/fTWFCqX51hVkewmzLUOnj0lDkqubQkc=;
	b=gCIqJePS/pKNXx/7Qwlm2yuqxawxdFPea1eCraVoJ0P/2tp/OE/fc9+HFmaXO0o/+8e1
	 MQXw3Fl99F/pq4l0VtEYLqi5oEXSGuMzJzazp/335Xa5fd3yhaX8lEbgDwxhAHe+QC7LI
	 GuiEOUCCKtI7WvzRRHy4NnYFg/o/TN3ZxdS9YFdEldVLD+/mPVzmO1NrIB1MSYWJSv8Zq
	 vQ0ZLSOVRjzqeT+u7HaL8Pk61GanwPmaEWZIbyqQH2wzHymnVGfPdeInzVFIimt/0Si+F
	 RVtl1hkR2kf3Mut/a7PRFF52g6VU4qu7NOmiRiaEAoXs4td9a9wVsMknBNKcFU/8Krw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yE1RvzA5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.32
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013032.outbound.protection.outlook.com [40.107.201.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACDF606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACDF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yE1RvzA5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqqAJrb7B5IZl8PhERXKQDK4WuqQdw2tRmxt9rDD7Imu7HobeW6n5XQy9kskurbl6hnY7mdORG0TzxD9CFNPSxE+1XL1LiZk8kohn6T11A0Rm4iLSaEtWDfuwpXiY7F7AgKUwBkPQhw+uhEGn2AzKzcJhpP6Izhe0IrrmXFgqJpSbyizd089kc21D0hXaCAEXW00z5o2Qtlysq+Q9mCstbvkDhvzbVZtPkEw58f7bGDZ0o4/5GvbN3AgHYqN7VB+CELgI/WtY87r009ACPtvJBwlIRoC6o1QfyIEEc/pUbM5lGkk3Wf1q/Pf+hvznydW1onTb/a22an3C6HmOiNKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/ViolL002C/fTWFCqX51hVkewmzLUOnj0lDkqubQkc=;
 b=EjLYoB2vnnFQgLb+k5zt/p1ahjSLxxjodDRXstbsIKrIxua+RvLWQ2HWKlwvtM00CLECyeEk4xvVvpTHjuLkUlHtAz8JpIwbZSmPaYzt2wQVrS3L64/G6HfMv4OtNGg1LI9hmpo8ZBqUoyU8lodsbZ129m/ysohuvHThfnGG2fX7eBYrWE6K/Fubh8KcitZi2FC5ebYDXjNZ0UYQGLRXsbVLX0O+cUGYPPdQQ0ZIFN96TSkHuCuPScd2JkiZLqD1QCSXr4md6VJx1f0v6B++aTEf5LVBSLtfGRSbYQqtKFKeRA6nW8cJvj1L451KuRKuhgyxrDx2Gwap5jXxMNTHKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/ViolL002C/fTWFCqX51hVkewmzLUOnj0lDkqubQkc=;
 b=yE1RvzA5cgKLC0H2EYDTteKzLAB6vt3yUnIFvdh4Lugm3VDAU/nftXRM51yOwWFhRnBetCn3jl329CfKk296p87q57C0Yyofi08R+ybEKhoKW+6uio/P7pjqoRoCcXlaBrqhBbsFbAehkhiOTZgof0QkMBCO8lLoG0Drce9QoGo=
Received: from BN9PR03CA0357.namprd03.prod.outlook.com (2603:10b6:408:f6::32)
 by IA1PR12MB8287.namprd12.prod.outlook.com (2603:10b6:208:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 20:15:30 +0000
Received: from IA0PEPF00000038.namprd03.prod.outlook.com
 (2603:10b6:408:f6:cafe::33) by BN9PR03CA0357.outlook.office365.com
 (2603:10b6:408:f6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 20:15:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000038.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 20:15:30 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 14:15:26 -0600
From: Babu Moger <babu.moger@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <reinette.chatre@intel.com>
CC: <tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<fustini@kernel.org>, <dapeng1.mi@linux.intel.com>, <peterz@infradead.org>,
	<superm1@kernel.org>, <thomas.lendacky@amd.com>, <kim.phillips@amd.com>,
	<prathyushi.nangia@amd.com>, <acme@redhat.com>, <namhyung@kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] x86,fs/resctrl: Use a consistent log prefix
Date: Tue, 17 Nov 2026 14:15:13 -0600
Message-ID: <b0b288783579ca22af73836276fa2f97bdc85f58.1794946513.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9b55776701b2692772968a681a518ecd8326643e.1794946513.git.babu.moger@amd.com>
References: <9b55776701b2692772968a681a518ecd8326643e.1794946513.git.babu.moger@amd.com>
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000038:EE_|IA1PR12MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 938e202b-1a1b-436f-ac8e-08df44e7873f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|23010399003|18002099003|22082099003|13003099007|11063799006|56012099006|10067099003|261022075727099003|261026121527099003|261021121427099003|261009223027099003|261102123227099003|261021123027099003|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	8xkZ8I4ei+zB3T9+7uKCX3pugqvGbQ5TzOXPDjKd96m/qaSyqS9Izq/nOe0h3I24wsVUj39zEdrqNn/d6brIwRtGuxKvIRdrMSz8y2qSzFtolTFBVc0PtEBf/Nx+HcMIXKdBXiImQAjLEeT6RXVDMdt4ZoVYtuuQGvpdROBhz1mSyxHRAPEtiPfOPdsSxR4P9j/E5K8vIBHDtUBGp067ex3+J/eZfIBrjkHnY7+saqOnvHu9Pi3H7JzlWfVhfc2mhzwpb6PWdwQjNURRa1nnBc+MjREJf3kXn3ZCrsH9yNGPVOdN7pLtKeQv4TZz4+GvR5/yUWbzvKdn7HMNM69RzAwzuuX9JA6RZszEQjjvMRL5cDv73MtsyUEMmAGMXDH07kEZOcznx7FKk+phgpm2VwFhRMcYAJJVX9NLtngXwE0FgyKdk+M7Ja/WfcoXJiP4VtG9iLuQ/zJ2wIsKi6VE5aPQY18ygiSWGXqs1a8XjIyLyPGBep/pR+Wtg8YH9CbOgLrDTVRr/K+wG1SMeWd3z5d7fkc2mGtpuybzoQvMjYox+Cw1550Pl8DFUccputklNkc4tz/Vq5VntcZ2WFlJcwrm8XzHEWniwMDSe4nhLOCDgFUgpIC2R61fzz7my1iV5q6rFK/qjk+9Nfl2ZipIVASWI2Ir2tM4/uF/L0XPb7c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(13003099007)(11063799006)(56012099006)(10067099003)(261022075727099003)(261026121527099003)(261021121427099003)(261009223027099003)(261102123227099003)(261021123027099003)(260925021911599003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D/d/v1PmvQgkb2HU9X61kiWQe8SWZgp/Kg4gmAS6NS8IQJqSekpuji2OgwcFpA1U6eqFYDCe0TYw011EbHc3fsHc8x3AIy/DaSBbXPSHswmJt7CJaXWoRLHjGXs7qMc407HXRHbY2FZJr4QqtUTQxMfxEW6zplYdm/tNF231AbgL4Yj1LbVZJM2ZDrPTcZpSAq9OcenDI6vrxgmdsxoBbH74d4XfCzrNZSIvfwqEUHwwnEBVGbK6cxBGmreqSfHMgzFsfxJFtBqdsU/qCvyGUz0ULhNooqdjqdvNayMVKO5qTGHMCCxB/zyXf8HOH0WDiYO6Gf/puN7wMyHmLEzPsQzyQEbNNcE/zEscT7BDYeSRd34/uBmyj38ur4zCpScAw3UOCCHpNP6jxfXVqfcr6oSx/K6vgshK1H/pjJGrQIfbnBAk5cOCYmJGpSjMMICW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 20:15:30.6686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 938e202b-1a1b-436f-ac8e-08df44e7873f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000038.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8287

resctrl code is split between arch and fs/resctrl/. Some files derive the
printk prefix from KBUILD_MODNAME, while others use "resctrl: ". Since
KBUILD_MODNAME follows the object name, messages use different prefixes
such as "rdtgroup:", "ctrlmondata:", and "pseudo_lock:".

Use "resctrl: " throughout both directories so all resctrl messages have
the same subsystem prefix and match indentation in files that already
use the right prefix.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
v3: Minor changelog update and added Reviewed-by (Reinette and Tony).

v2: New patch. The issue came up during the discussion of PLZA series.
    https://lore.kernel.org/lkml/432f0cbfb811aee3c8c51bbc42faf66174375d8b.1787772750.git.babu.moger@amd.com/

v2: https://lore.kernel.org/lkml/bc637e9a1f0c4624a01b8208f0e53582cbf21886.1790721445.git.babu.moger@amd.com/
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 2 +-
 arch/x86/kernel/cpu/resctrl/intel_aet.c   | 2 +-
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 2 +-
 fs/resctrl/ctrlmondata.c                  | 2 +-
 fs/resctrl/pseudo_lock.c                  | 2 +-
 fs/resctrl/rdtgroup.c                     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 25a5f0c8dc56..77726cd13b3a 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -13,7 +13,7 @@
  * Software Developer Manual June 2016, volume 3, section 17.17.
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cpu.h>
 #include <linux/math.h>
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index 66cd8c2c7a51..2f75cb7e79a7 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -9,7 +9,7 @@
  *    Tony Luck <tony.luck@intel.com>
  */
 
-#define pr_fmt(fmt)   "resctrl: " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/bits.h>
 #include <linux/compiler_types.h>
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index d7caab0409b6..a58f9ba63c71 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -9,7 +9,7 @@
  * Author: Reinette Chatre <reinette.chatre@intel.com>
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cacheflush.h>
 #include <linux/cpu.h>
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 8d0db76bb6f8..c27511db157f 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -10,7 +10,7 @@
  * Software Developer Manual.
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 69123b2a3274..556032e0f0a7 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -13,7 +13,7 @@
  * Software Developer Manual June 2016, volume 3, section 17.17.
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cpu.h>
 #include <linux/kernfs.h>
diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index 56ab63f19bad..656c1f1a3f4e 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -9,7 +9,7 @@
  * Author: Reinette Chatre <reinette.chatre@intel.com>
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cacheinfo.h>
 #include <linux/cpu.h>
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a2047e7c4dba..cab46d6c8c40 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -10,7 +10,7 @@
  * Software Developer Manual.
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
-- 
2.43.0

