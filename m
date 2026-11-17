Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794946535;
	b=hUI2z3ds6hldbKT2CAjbsSiRqOW2DszuaDCHN7fK8gLikAG6aNq+Udn3J3P8ls+EWncp
	 wSHlJMI8YNAUNToPpvb+2wy6B+Nl7ffRNFf3AS6IYCxL9AEFVoSpsJuRLtgzA/2SDFafx
	 kA7asqh/WGoKeoIqKOZiW8CendkqHzIi7fm5bIkTrdldTGvZ7xtiZG3X1BoAz3Vg+dzkb
	 XZ/JLXrellA2RkMEBM39/gn1OiNQN0HYnBbr8ppyZTOhX0NRPndWLnPaoHJnh/WK+HKA2
	 yM3w3/p++qoOoJTRvlKidrutC5kfaVooD/WWYCQ+qBBv7FG2XQwkbfq6Yr1v3t1yWzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946535;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=aPJ9PhDYDK0EVOt3ilLMMCYMTDpEW1vj8dP7ZhnYBFE=;
	b=araQmjs+Z/+GsHSlS8de9MIxGx1M5C9VtXdhZKJt7hOWFkDfsGPfcgYbdIkczivxJfA+
	 NQuGLVmaDHribpG+Rhkqys8VuSjGB2F6tvwGV4Vf8TyZG2T8/rreGpZjeN+rVahii4Bm7
	 1cQcfixnKCrL5i+Q2lOzpBk8YL25Xemy32qbySUQGga1coWTxdkjj9Wp3b2vHWHJX27ji
	 w8ap1X59CkWlYpaVROizIiIiiKrZbWdt44bw04LjFTlNLmVZ4/yqg/fKFJZHyy+PDSs8v
	 yZEaB3sNS3NcEAveJtib4jqNgIrNmoFiUOMCbLKZux90olWuwfHz54cb1secGzXW79g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RVjLn8PP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.29
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013029.outbound.protection.outlook.com [40.93.201.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E862A606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E862A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RVjLn8PP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMMg9AgGRBJgD32i11q0rqqgJGEAg+JxYzQI5UGldNmI+XxGl0rj28v3pKLtTvcWKv73Jhy+WQa1z6KuScpp0T6FnKif0KZJM+/DGzUWi/D88jNTnEudhUzMVqQS1zuB968adYf63I28ouMVhTc+Z/DfBr1RDa67im9jNGy5ewOvdRoaYOIJ7xqMIAirmXpIGXvG087PHp40KqmrUYZjzcFut+XWyn9oA0z7rv/GYOG+FBSeOTTwK/Vihltp25fecxdYNkwbyrd8CZ62DpKyX++qnXF/DQ7ex/i4vsubraIoAbBsItqccR63RguZwsNx/aeUdk2DELmCuugpij8zKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPJ9PhDYDK0EVOt3ilLMMCYMTDpEW1vj8dP7ZhnYBFE=;
 b=x+XHp0W50715D7I2Gj+kh4fGqLSNPRl5qAsS/ecTHnSl7IvEh9SNn+gmx+NbSD78e35PTn6S93B0E5yDp5vsU806pfGnWCfIduPsKigL2lcb9s7L+heysizfGBXXbeHUHYaJgth+04imCczYSXbMDuOvQ3WbJ26zttRABuaGr8IBW2I+lyBD4AKpX5TLMNwF8YHnRdm4nPXfJZdNH5fCyR4hfu9+T92G+rcNQFVsccx64ERunjLZf/1Ge9pE02/7+xloPbMuZ2cNUoRY6954bjTRl7qT4Swoen83jfc2mVOqm2bveXSx9IqeUxymmZGE4KZyHN9t0WOkvJvj8OgE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPJ9PhDYDK0EVOt3ilLMMCYMTDpEW1vj8dP7ZhnYBFE=;
 b=RVjLn8PPV+RzR5B7KYWmjkfjt6O9rFHh8EFgiUTq/Le2ZrIG79YaHaKr3AfDgi59+6CaOuE84KcSvAMKrWa9l8qM8P8KvR0DgT21JlakeeqgQg0MWjijZgc30h65X47dLpUUZttAu54Xw3TSZBXqsWkk9IXJRm378N3PjkT3zZw=
Received: from BN9PR03CA0346.namprd03.prod.outlook.com (2603:10b6:408:f6::21)
 by SA1PR12MB6918.namprd12.prod.outlook.com (2603:10b6:806:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 20:15:25 +0000
Received: from IA0PEPF00000038.namprd03.prod.outlook.com
 (2603:10b6:408:f6:cafe::95) by BN9PR03CA0346.outlook.office365.com
 (2603:10b6:408:f6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 20:15:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000038.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 20:15:25 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 14:15:19 -0600
From: Babu Moger <babu.moger@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <reinette.chatre@intel.com>
CC: <tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<fustini@kernel.org>, <dapeng1.mi@linux.intel.com>, <peterz@infradead.org>,
	<superm1@kernel.org>, <thomas.lendacky@amd.com>, <kim.phillips@amd.com>,
	<prathyushi.nangia@amd.com>, <acme@redhat.com>, <namhyung@kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2] x86,fs/resctrl: Rename AMD resctrl MSR defines to use MSR_AMD_ prefix
Date: Tue, 17 Nov 2026 14:15:12 -0600
Message-ID: <9b55776701b2692772968a681a518ecd8326643e.1794946513.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: IA0PEPF00000038:EE_|SA1PR12MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: 65968fed-57c4-470a-e24a-08df44e78418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|23010399003|18002099003|6133799003|261009223027099003|11063799006|260925021311599003|260925021911599003|260925022911599003|56012099006|261102123227099003|261026121527099003|261026140227099003|10067099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	AjsqNg8hezolBqBjVRvqh4jTZ2zxJMlx/RK4QehSKhteW9WBIi6Dmq6mP1CG+tS2xEsBc0+dfeghXyd9DjpC3tJBngbI89mhtxPNBe8aItFLBKdaofqWVzU+5I1Qh25UTF02xOcMWLePVhpjzVpjHR4l8esI9GjjHTVCrvITs8oDDxHLu1VT1WYs6AXuWWlM6wsZ6nB6oFZWXN8u1alEY0CtBs0/KKWogD5kO/7t8sLLWgV5TJnxQ/biG9tMEe+uQGyUrx/I48W9DlMWjoN0kWYTd7d8+5/3O0qO/IoQYKOjyMcPT6eUI/HEf4Zwx9LOHBA0J5tPy1gN//SzTnYruPxpBHEOa7FT3L3UZ1ngS0BTpi6MzzJUaYWA76VhKylTLAxnyOztEwFYfGzae69eAiH+y3CI9XrojVWt8TUN3gba7h2oNYmmRiwFv5wVkwTPzlErxSUDTDRb0mHTSuLAjStdS7mGajXcQ1S70Qe26yEi2gBr1qNYrW6Ae4v9nZA7JnL2l7XRgbtqIUFr7ZLjWIpnpWQzZmxFAjpH1MPvJCY5ICAkSfanX2nZNYn9a6NyYc7kT47qYFaWrA1xYtafqWDa78w/VkQbO6qs409VncZLqmPQXGayOQK9vlKkjFbD1UzR55YVIqcUTtNe84C0+pn60x/01dZwa8UJhL8wHOs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(23010399003)(18002099003)(6133799003)(261009223027099003)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(261102123227099003)(261026121527099003)(261026140227099003)(10067099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bk4alIKnxyCpCH8jfsH30y7o0a+Z0wGjdUG8fRtJJ+FQDAIhpCCrzXFVZEHne0iJUMBvsphvaeBjPJaZG6qGOY6yv207gAkGYsPOGUoCGDE8AMAkUdunjsWhiCtG8Kuc14DMgiGLJZcf+2HvejqMz57M53bSOLoMxaVE39P9RqRCo14NPivq5/OrSfOQwnXLCBIzSCKxQQg3t+UMa0gmsdGj4aUKt9Khf7/T/RdO6YWeyNmL5AcOConcsqbdxu989hfBjAZAC7b2fp9/kv2tFoZ+ZuYvu2ivSFwaPQ9jIQrYMa+yc1PUBL1MlsPqmNIXoszX3JRR18Q/TikSviXy1aeFMw1lLszYiTwM0+rUHaSIJxfn69fNbV2I/ohDcFKaQw68iqnuiV4uLt84mI3FUbtjMe4Se2nftTn/VGwIBbvc/o5RTXJBKJ/a09V0woTb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 20:15:25.3814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65968fed-57c4-470a-e24a-08df44e78418
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000038.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6918

resctrl MSRs in the AMD address range (0xc0000xxx) are defined with an
MSR_IA32_ prefix even though they are AMD-specific and unrelated to Intel's
IA32 resctrl MSRs. The MSR_IA32_ prefix is misleading when reading or
grepping the codebase alongside the Intel MSR_IA32_* resctrl definitions
in msr-index.h.

Rename the AMD resctrl MSR definitions, update all call sites, and keep
the tools copy of msr-index.h in sync:

  MSR_IA32_MBA_BW_BASE      -> MSR_AMD_MBA_BW_BASE
  MSR_IA32_SMBA_BW_BASE     -> MSR_AMD_SMBA_BW_BASE
  MSR_IA32_L3_QOS_ABMC_CFG  -> MSR_AMD_L3_QOS_ABMC_CFG
  MSR_IA32_L3_QOS_EXT_CFG   -> MSR_AMD_L3_QOS_EXT_CFG
  MSR_IA32_EVT_CFG_BASE     -> MSR_AMD_EVT_CFG_BASE

No functional changes.

Suggested-by: Borislav Petkov (AMD) <bp@alien8.de>
Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
v3: Added Reviewed-by(Reinette).

v2: Fixed few redundant 'MSR' texts.

v1: https://lore.kernel.org/lkml/96992e30d6c02ebb7bdb58f2d8060bfd61274649.1784739398.git.babu.moger@amd.com/
v2: https://lore.kernel.org/lkml/9ef5ec08d79c9c84f36b11251bd3189af1a38d52.1790721445.git.babu.moger@amd.com/
---
 arch/x86/include/asm/msr-index.h          | 10 +++++-----
 arch/x86/kernel/cpu/resctrl/core.c        |  4 ++--
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 +++---
 arch/x86/kernel/cpu/resctrl/internal.h    |  6 +++---
 arch/x86/kernel/cpu/resctrl/monitor.c     |  8 ++++----
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    |  4 ++--
 fs/resctrl/rdtgroup.c                     |  4 ++--
 tools/arch/x86/include/asm/msr-index.h    | 10 +++++-----
 8 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index c0914829a925..eda6029d4b56 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1304,11 +1304,11 @@
 #define MSR_IA32_MBA_THRTL_BASE		0xd50
 
 /* - AMD: */
-#define MSR_IA32_MBA_BW_BASE		0xc0000200
-#define MSR_IA32_SMBA_BW_BASE		0xc0000280
-#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
-#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
-#define MSR_IA32_EVT_CFG_BASE		0xc0000400
+#define MSR_AMD_MBA_BW_BASE		0xc0000200
+#define MSR_AMD_SMBA_BW_BASE		0xc0000280
+#define MSR_AMD_L3_QOS_ABMC_CFG		0xc00003fd
+#define MSR_AMD_L3_QOS_EXT_CFG		0xc00003ff
+#define MSR_AMD_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
 #define MSR_VM_CR                       0xc0010114
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 3294b18ba45f..5730e23e03ea 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1024,10 +1024,10 @@ static __init void rdt_init_res_defs_amd(void)
 			r->cache.arch_has_sparse_bitmasks = true;
 			r->cache.min_cbm_bits = 0;
 		} else if (r->rid == RDT_RESOURCE_MBA) {
-			hw_res->msr_base = MSR_IA32_MBA_BW_BASE;
+			hw_res->msr_base = MSR_AMD_MBA_BW_BASE;
 			hw_res->msr_update = mba_wrmsr_amd;
 		} else if (r->rid == RDT_RESOURCE_SMBA) {
-			hw_res->msr_base = MSR_IA32_SMBA_BW_BASE;
+			hw_res->msr_base = MSR_AMD_SMBA_BW_BASE;
 			hw_res->msr_update = mba_wrmsr_amd;
 		}
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 62044489b052..25a5f0c8dc56 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -108,9 +108,9 @@ static void resctrl_sdciae_set_one_amd(void *arg)
 	bool *enable = arg;
 
 	if (*enable)
-		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
+		msr_set_bit(MSR_AMD_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
 	else
-		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
+		msr_clear_bit(MSR_AMD_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
 }
 
 static void _resctrl_sdciae_enable(struct rdt_resource *r, bool enable)
@@ -120,7 +120,7 @@ static void _resctrl_sdciae_enable(struct rdt_resource *r, bool enable)
 	/* Walking r->ctrl_domains, ensure it can't race with cpuhp */
 	lockdep_assert_cpus_held();
 
-	/* Update MSR_IA32_L3_QOS_EXT_CFG MSR on all the CPUs in all domains */
+	/* Update MSR_AMD_L3_QOS_EXT_CFG on all the CPUs in all domains */
 	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held())
 		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_sdciae_set_one_amd, &enable, 1);
 }
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 03cb22f4e607..0efeb3312d9d 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -40,7 +40,7 @@ struct arch_mbm_state {
 	u64	prev_msr;
 };
 
-/* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
+/* Setting bit 0 in MSR_AMD_L3_QOS_EXT_CFG enables the ABMC feature. */
 #define ABMC_ENABLE_BIT			0
 
 /*
@@ -49,7 +49,7 @@ struct arch_mbm_state {
 #define ABMC_EXTENDED_EVT_ID		BIT(31)
 #define ABMC_EVT_ID			BIT(0)
 
-/* Setting bit 1 in MSR_IA32_L3_QOS_EXT_CFG enables the SDCIAE feature. */
+/* Setting bit 1 in MSR_AMD_L3_QOS_EXT_CFG enables the SDCIAE feature. */
 #define SDCIAE_ENABLE_BIT		1
 
 /**
@@ -191,7 +191,7 @@ union cpuid_0x10_x_edx {
 };
 
 /*
- * ABMC counters are configured by writing to MSR_IA32_L3_QOS_ABMC_CFG.
+ * ABMC counters are configured by writing to MSR_AMD_L3_QOS_ABMC_CFG.
  *
  * @bw_type		: Event configuration that represents the memory
  *			  transactions being tracked by the @cntr_id.
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index a6a9090c4808..3ba9c8c26d5c 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -498,13 +498,13 @@ static void resctrl_abmc_set_one_amd(void *arg)
 	bool *enable = arg;
 
 	if (*enable)
-		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
+		msr_set_bit(MSR_AMD_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
 	else
-		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
+		msr_clear_bit(MSR_AMD_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
 }
 
 /*
- * ABMC enable/disable requires update of L3_QOS_EXT_CFG MSR on all the CPUs
+ * ABMC enable/disable requires update of MSR_AMD_L3_QOS_EXT_CFG on all the CPUs
  * associated with all monitor domains.
  */
 static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
@@ -542,7 +542,7 @@ static void resctrl_abmc_config_one_amd(void *info)
 {
 	union l3_qos_abmc_cfg *abmc_cfg = info;
 
-	wrmsrq(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
+	wrmsrq(MSR_AMD_L3_QOS_ABMC_CFG, abmc_cfg->full);
 }
 
 /*
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 6e4eeccd4891..8d0db76bb6f8 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -96,7 +96,7 @@ void resctrl_arch_mon_event_config_read(void *_config_info)
 		pr_warn_once("Invalid event id %d\n", config_info->evtid);
 		return;
 	}
-	rdmsrq(MSR_IA32_EVT_CFG_BASE + index, msrval);
+	rdmsrq(MSR_AMD_EVT_CFG_BASE + index, msrval);
 
 	/* Report only the valid event configuration bits */
 	config_info->mon_config = msrval & MAX_EVT_CONFIG_BITS;
@@ -112,7 +112,7 @@ void resctrl_arch_mon_event_config_write(void *_config_info)
 		pr_warn_once("Invalid event id %d\n", config_info->evtid);
 		return;
 	}
-	wrmsrq(MSR_IA32_EVT_CFG_BASE + index, config_info->mon_config);
+	wrmsrq(MSR_AMD_EVT_CFG_BASE + index, config_info->mon_config);
 }
 
 static void l3_qos_cfg_update(void *arg)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 443b41a4d467..a2047e7c4dba 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1794,8 +1794,8 @@ static void mbm_config_write_domain(struct rdt_resource *r,
 	mon_info.mon_config = val;
 
 	/*
-	 * Update MSR_IA32_EVT_CFG_BASE MSR on one of the CPUs in the
-	 * domain. The MSRs offset from MSR MSR_IA32_EVT_CFG_BASE
+	 * Update MSR_AMD_EVT_CFG_BASE on one of the CPUs in the
+	 * domain. The MSRs offset from MSR_AMD_EVT_CFG_BASE
 	 * are scoped at the domain level. Writing any of these MSRs
 	 * on one CPU is observed by all the CPUs in the domain.
 	 */
diff --git a/tools/arch/x86/include/asm/msr-index.h b/tools/arch/x86/include/asm/msr-index.h
index 9c26d4075c5f..87dd00bbc905 100644
--- a/tools/arch/x86/include/asm/msr-index.h
+++ b/tools/arch/x86/include/asm/msr-index.h
@@ -1297,11 +1297,11 @@
 #define MSR_IA32_MBA_THRTL_BASE		0xd50
 
 /* - AMD: */
-#define MSR_IA32_MBA_BW_BASE		0xc0000200
-#define MSR_IA32_SMBA_BW_BASE		0xc0000280
-#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
-#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
-#define MSR_IA32_EVT_CFG_BASE		0xc0000400
+#define MSR_AMD_MBA_BW_BASE		0xc0000200
+#define MSR_AMD_SMBA_BW_BASE		0xc0000280
+#define MSR_AMD_L3_QOS_ABMC_CFG		0xc00003fd
+#define MSR_AMD_L3_QOS_EXT_CFG		0xc00003ff
+#define MSR_AMD_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
 #define MSR_VM_CR                       0xc0010114
-- 
2.43.0

