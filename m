Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795780162;
	b=wek+m3SZ3FMbYM9XmcTob4ENs6qY4fTth9uzJyH9kyQ6OpE/l1GB3kXS0soRUiOemBA3
	 jjyC6yXOtQ7LEotWQVzDgC/V3wL/u4soRED8vITlkGNQT0vJfXAZZ3eZLmchW1sP8ilcp
	 rKG+qe0psZY8Dsg8hSWB+D2XNS+pTehVJ52qS65Nxhy+H3X9v3HISuqqF4AoILM5u0Skf
	 raK1YUO30FSUNhh8cswShyDPKa8I3/9+YHqlztbQ9JvMQQJe8qfbMPW50nkn4E8RhJCUF
	 d0i1fc+fEbi30Sj4PO5VHxsfUIaqr3YEoOl1OpYjY6zLj5ANGU8qImAudlCkuDh6AKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780162;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=dX2TpkWrPrdRMiLFXij2mb3KEndgqtwPQ55Sxl/V9iI=;
	b=4DHj9p21Yq21pIZjbv04USn176gz11ThEflgbk8+BKbWhU3LTbtyhUiu5bVH2B7AfZ07
	 mp4XRApHXOYrP88Yw+ecoNsMROcXeUCrNybZYoYwzrxT2YVfmqJhY/+P/zdY+Eg4zZaHf
	 LL/9YDpzH0RHN/+1LB3Tk3x6KfHMXDwhpiIX1dH/pf5y6kJNGwkirG319OdU0+wXU4x9g
	 hU10XASDW6OVBK/j+LKSv5EaWcOXYPBIdBgArL9D+4BfcrBORQesi/PMAzqOK9MfV4OPJ
	 6Pa3cMyNW2yCUNGA/XXjL/VB3bUP8ExhGO5sCvyeXdoYqLXWH498u1pivRgqjOzUNDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FnoMWu4B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.13
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010013.outbound.protection.outlook.com [52.101.193.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E30606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E30606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FnoMWu4B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/DzO0gD+EV0vRg0jLhv+Sxx7w4gIpNbG37gNRqA31ots5zxwXpUUVX1g5Ptq1P8o4sHIxv62LN241E7jtRkfzTbAASy/1Mn5yz7z/lMNryZTQl/2buwPKs5CTbryPCsXC4fmdu6sCQ/6dOFpGPXYFEDFoaFWmf62wI/KSVt3DUWTLAcqBVy9Mpu9+zQ5hua+JbDG7/+or5o2hyKraZ3X2WGNnjY8KCc6DKzeBBXxJEg6T2uqDQOOJxHkPTWaHeDLs9kwyMfrtDUUKV/0q2TocdMBS/0bLUEXHIUtL/5cVvrb08+eQUjV9fw2oR3wvUTtDWBbsMfCOpj0GFFaNQgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dX2TpkWrPrdRMiLFXij2mb3KEndgqtwPQ55Sxl/V9iI=;
 b=gO2IZnpvzrKP0gBEtMeNNW24vtZnH8D8aBnX90HkaG7kHx32UZoMjWHilfAk9N41JYo5kQ1v9TlwiNoyKxq0APqU5qAN2+IxfMj29AbrGkPmtV7iYYkZvO24HiJrJ2FhiKZYZmvs7dX+tOBisx2GNMgUytolEqIrzBw2UXrXosoHTQvOsTsaP+NilKXOLKusHzNVlh6KEvRb2Mznp8JlOSzILSbwC9XKsiOwHj0U7K37pAd40F1Gq1pJPYzi9+w9HkegZs2++ifBMgzDRTQLaA6s3LTu9ZLcaPMS+BctBGTlbYA5qGSc9OUkctx+ft/o+RUmUr9Cs20COaDf4lyAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dX2TpkWrPrdRMiLFXij2mb3KEndgqtwPQ55Sxl/V9iI=;
 b=FnoMWu4BU9nGcarxia8dG7p5OOOESPJoakbge7eqg8H3FsJAjNAU0m/uvGs4EYpd4yg6d6b2xNvrcYGx/faAQNcG98zdL9J8fSGU+ZqWieyVEoegjmiYhyb7EIcURXo+8mYcp4pnENDHQRp5uVzNQlYwHUmDTbFJdOcVPd7CxrM=
Received: from CYXPR02CA0039.namprd02.prod.outlook.com (2603:10b6:930:cc::16)
 by CH1PR12MB9718.namprd12.prod.outlook.com (2603:10b6:610:2b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 11:49:18 +0000
Received: from CY5PEPF00000E81.namprd05.prod.outlook.com
 (2603:10b6:930:cc:cafe::aa) by CYXPR02CA0039.outlook.office365.com
 (2603:10b6:930:cc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.11 via Frontend Transport; Fri,
 27 Nov 2026 11:49:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E81.mail.protection.outlook.com (10.167.247.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 11:49:17 +0000
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 05:49:14 -0600
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Ronak Jain <ronak.jain@amd.com>, Aravind Thokala
	<Aravind.Thokala@amd.com>, Harsh Jain <h.jain@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 3/5] drivers: firmware: xilinx: Relocate NVM library APIs to new file
Date: Fri, 27 Nov 2026 17:18:37 +0530
Message-ID: <20261127114839.1428778-4-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.16.0
In-Reply-To: <20261127114839.1428778-1-jay.buddhabhatti@amd.com>
References: <20261127114839.1428778-1-jay.buddhabhatti@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E81:EE_|CH1PR12MB9718:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de64df3-e00c-46cd-f57e-08df4c7c77ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|5023799004|11063799006|6133799003|18002099003|261009223027099003|22082099003|3023799007|10067099003|56012099006|261102123227099003|261102130727099003|261026140227099003|261028144727099003|261026121527099003|261026130827099003|261021121427099003|261022075727099003|261021123027099003|261021130227099003|261021135927099003|261022115727099003|261022113327099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	dvoJ+uyfdeAjx/xTpuYKdxlaps/iImLk21yOzYOlKYA0ujQEl3JIaLPpPKXjZSGVo/lnGzTuP8veuTB1iOyhbzCSXMQa5xbK/PJ7PSQu0RaIec+J9NpL9PV5lUnIJFvENBkcovyywi5yIcbfRPOx0PhIFvL2XibOFQ71CEv6C8nC+yLOCatXqH2ACRnB+9Qqk1rAWxF6vWdEgu3UVmIt1POC9uot5STfzytFC809n6/ijwxsThQwocrHAOsI0L3lQP5DNTE86gvQwqK4mk6o9J5Y98L25lr0v0yYOBGK1vQopPIbOqvku6j/FEuMFUhrN6hutyEeeFzILUOUJBcVxxDHjzXpkbXqnkgpWU+uzBE93NgdMQKAZJKjrHl5PGDuILqXaCk3sVObWi8IqfaR6TmZopuZJVSHNhSvoJ0DLntQpcwrQW22x2j/RrIA8XE+0VphUUBs/l6dR3VHtjBUxKtmVlI9wsWKFFkKvrytSY+mVwx9nsxr6MOn6NSv/DPzy6p8B//q0PT25NRtTqz8h66bGrIgmQsRwrqfQ3qC+Wa9sZD6aZsDqVISnvmlOhGe3AhW69i5d9z7bXeyszoTkz14ED2RwB01787EGWhfTTxNpWcJpUblAtSPGBEhTQgEk28QeFwrckrJ0WPDeocUAIcwrpKP+7870XfXbvFj8lmhaINxS+Ixzm+wBNX4U529KbO7HpbyNUhrYgv8ZXie9Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(5023799004)(11063799006)(6133799003)(18002099003)(261009223027099003)(22082099003)(3023799007)(10067099003)(56012099006)(261102123227099003)(261102130727099003)(261026140227099003)(261028144727099003)(261026121527099003)(261026130827099003)(261021121427099003)(261022075727099003)(261021123027099003)(261021130227099003)(261021135927099003)(261022115727099003)(261022113327099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vcnI2QdtOC5Pwkq8Zsuse0cUIVsnJkiNUkwX1TrqLmqAt1lS5zCdu8gzj6KM/RgR1PkwB1b4p5vkSVfXZcD/cEceIR6ZXGslEd32fzHFXNduKCSfzTSCGMYecQ4XMfBxn7TjwlV0oiqiMKi10wY7NkQH5il94MWm5Ntt4/YR3D/8rm4+35BW9VUkCAGi9P8aA9O0U7VAoG/cfiN/4hYhFXtoVpEZ6O7H0Ro8DoFjzDx0uTBky8IjNv0/CBF6B0YEuFLYFPyc/DCaQO9qNmfbWEumzNnozon0QtOOZZkfs0gdZUYYpfTwMLDAM4NIqpDkJDbuNd95h8dTugpOvLhiwEAdLewMcHqkgKzQuJpwEhnTzEa5KkyefvyY1iClyiAeXTx2koMuvr599Cq26KyI/7ccXyvpXSV9kccCYSkdIZ9zsp6ZwHNe/lipdpo2h0kW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:49:17.6500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de64df3-e00c-46cd-f57e-08df4c7c77ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E81.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9718

From: Ronak Jain <ronak.jain@amd.com>

Move the NVM library APIs into a dedicated file and header to improve
maintainability and reduce complexity in the firmware driver. Keep the
existing behavior unchanged.

Add a MAINTAINERS entry for the crypto and NVM firmware files. Include
the new NVM files and the existing crypto files in that entry.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
Co-developed-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 MAINTAINERS                              |  9 ++++++
 drivers/firmware/xilinx/Makefile         |  2 +-
 drivers/firmware/xilinx/zynqmp-nvm.c     | 35 ++++++++++++++++++++++++
 drivers/firmware/xilinx/zynqmp.c         | 24 ----------------
 include/linux/firmware/xlnx-zynqmp-nvm.h | 28 +++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h     |  7 +----
 6 files changed, 74 insertions(+), 31 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-nvm.c
 create mode 100644 include/linux/firmware/xlnx-zynqmp-nvm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8caad731367b..e010589c13e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30660,6 +30660,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/xilinx,can.yaml
 F:	drivers/net/can/xilinx_can.c
 
+XILINX CRYPTO AND NVM FIRMWARE DRIVER
+M:	Harsh Jain <h.jain@amd.com>
+L:	git@amd.com
+S:	Maintained
+F:	drivers/firmware/xilinx/zynqmp-crypto.c
+F:	drivers/firmware/xilinx/zynqmp-nvm.c
+F:	include/linux/firmware/xlnx-zynqmp-crypto.h
+F:	include/linux/firmware/xlnx-zynqmp-nvm.h
+
 XILINX EVENT MANAGEMENT DRIVER
 M:	Michal Simek <michal.simek@amd.com>
 S:	Maintained
diff --git a/drivers/firmware/xilinx/Makefile b/drivers/firmware/xilinx/Makefile
index edfba4110a7c..d23d41c6a8ac 100644
--- a/drivers/firmware/xilinx/Makefile
+++ b/drivers/firmware/xilinx/Makefile
@@ -2,5 +2,5 @@
 # Makefile for Xilinx firmwares
 
 obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp-crypto.o zynqmp-fpga.o \
-				 zynqmp-pdi.o zynqmp-ufs.o zynqmp.o
+				 zynqmp-nvm.o zynqmp-pdi.o zynqmp-ufs.o zynqmp.o
 obj-$(CONFIG_ZYNQMP_FIRMWARE_DEBUG) += zynqmp-debug.o
diff --git a/drivers/firmware/xilinx/zynqmp-nvm.c b/drivers/firmware/xilinx/zynqmp-nvm.c
new file mode 100644
index 000000000000..15c646273aee
--- /dev/null
+++ b/drivers/firmware/xilinx/zynqmp-nvm.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Firmware layer for XilNVM APIs.
+ *
+ *  Copyright (C) 2014 - 2022 Xilinx, Inc.
+ *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/export.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/kernel.h>
+
+/**
+ * zynqmp_pm_efuse_access - Provides access to efuse memory.
+ * @address:	Address of the efuse params structure
+ * @out:	Returned output value
+ *
+ * Return:	Returns status, either success or error code.
+ */
+int zynqmp_pm_efuse_access(const u64 address, u32 *out)
+{
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	if (!out)
+		return -EINVAL;
+
+	ret = zynqmp_pm_invoke_fn(PM_EFUSE_ACCESS, ret_payload, 2,
+				  upper_32_bits(address),
+				  lower_32_bits(address));
+	*out = ret_payload[1];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_efuse_access);
diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index fe887d5e9354..619ead2069c5 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1597,30 +1597,6 @@ int zynqmp_pm_set_requirement(const u32 node, const u32 capabilities,
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_set_requirement);
 
-/**
- * zynqmp_pm_efuse_access - Provides access to efuse memory.
- * @address:	Address of the efuse params structure
- * @out:		Returned output value
- *
- * Return:	Returns status, either success or error code.
- */
-int zynqmp_pm_efuse_access(const u64 address, u32 *out)
-{
-	u32 ret_payload[PAYLOAD_ARG_CNT];
-	int ret;
-
-	if (!out)
-		return -EINVAL;
-
-	ret = zynqmp_pm_invoke_fn(PM_EFUSE_ACCESS, ret_payload, 2,
-				  upper_32_bits(address),
-				  lower_32_bits(address));
-	*out = ret_payload[1];
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(zynqmp_pm_efuse_access);
-
 /**
  * zynqmp_pm_register_notifier() - PM API for register a subsystem
  *                                to be notified about specific
diff --git a/include/linux/firmware/xlnx-zynqmp-nvm.h b/include/linux/firmware/xlnx-zynqmp-nvm.h
new file mode 100644
index 000000000000..65dda350b66f
--- /dev/null
+++ b/include/linux/firmware/xlnx-zynqmp-nvm.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Firmware layer for XilNVM APIs.
+ *
+ *  Copyright (C) 2014 - 2021 Xilinx, Inc.
+ *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef __FIRMWARE_ZYNQMP_NVM_H__
+#define __FIRMWARE_ZYNQMP_NVM_H__
+
+#ifndef __FIRMWARE_ZYNQMP_H__
+# error "Do not include this file directly, use <linux/firmware/xlnx-zynqmp.h>"
+#endif
+
+#include <linux/errno.h>
+#include <linux/types.h>
+
+#if IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)
+int zynqmp_pm_efuse_access(const u64 address, u32 *out);
+#else
+static inline int zynqmp_pm_efuse_access(const u64 address, u32 *out)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* __FIRMWARE_ZYNQMP_NVM_H__ */
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 5038c9051dca..852e952fc8e5 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -18,6 +18,7 @@
 #include <linux/err.h>
 #include <linux/firmware/xlnx-zynqmp-crypto.h>
 #include <linux/firmware/xlnx-zynqmp-fpga.h>
+#include <linux/firmware/xlnx-zynqmp-nvm.h>
 #include <linux/firmware/xlnx-zynqmp-pdi.h>
 #include <linux/firmware/xlnx-zynqmp-ufs.h>
 
@@ -594,7 +595,6 @@ int zynqmp_pm_release_node(const u32 node);
 int zynqmp_pm_set_requirement(const u32 node, const u32 capabilities,
 			      const u32 qos,
 			      const enum zynqmp_pm_request_ack ack);
-int zynqmp_pm_efuse_access(const u64 address, u32 *out);
 int zynqmp_pm_write_ggs(u32 index, u32 value);
 int zynqmp_pm_read_ggs(u32 index, u32 *value);
 int zynqmp_pm_write_pggs(u32 index, u32 value);
@@ -775,11 +775,6 @@ static inline int zynqmp_pm_set_requirement(const u32 node,
 	return -ENODEV;
 }
 
-static inline int zynqmp_pm_efuse_access(const u64 address, u32 *out)
-{
-	return -ENODEV;
-}
-
 static inline int zynqmp_pm_write_ggs(u32 index, u32 value)
 {
 	return -ENODEV;
-- 
2.43.0

