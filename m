Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795780160;
	b=hn6uBecYJEyIfOfoPVTJKwJBvnq0j95bGgWFzYz6gXAjrjUO0Ur9jPWWc1aptI6jYcme
	 7g9VZm3XnyC8OQm8ErI6P+YzIezU5D6h067BM9v2inwQqaztAg7EFXKTozSdVw9mD04Eh
	 rd1UdOri+nVpDNzC8TmCGaDkwHU44bzdlWpe0HmRu7sBfUKEGTFQWDfU9+U6qSu7pcBRU
	 rtRLGpnAuzsK5FR0ygBn1c7/578QsUn0r/BMlxsXZTdHzjGEFCRYLzsgfbURmqCd9eget
	 DsVOpWJcWHI9g3xWcOxnyUN9sbZ44vU5HuPHI9V0pgD6AX7hNHUq0xeyW/QMXq3rvWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780160;
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
	bh=KJf5sRlRhddavP91WSqWvYii0VkBmURnB52/YYJ0o/k=;
	b=cqB08qe9OVkOOdiPvhNvlELjuwdR7SEGCKbyhObI0/h/C09kWFVlcRXqZJqDkGs0okJ2
	 YTxWDvbYlk830ZwfY+G/nnzF4amAa70KxsK3ielIG+ACa/ltpZxG2TBdcwLCowNVkJw3d
	 wQoh3duk8PVOt3+mSeaJ/Vfp26CnL4eEeVCip+w40ZA/SIdmrBnCiVimzsvK4+n5LyUox
	 Sh8kT+DtEUeA95OLWSNXQuIA7AStcRjZHKTYwG5GZ1BCvA7Lw8zcQY2u16MNHxA3HQg+H
	 yojyxevTqFyVxBH2ARIHfQxxWkLWbW4+LtOQF8RUp7rifwiFNMb0BHO9frQ3GfaQ2Ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CGLae4Bo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.41
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BD7606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56BD7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CGLae4Bo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdMnX2cqImZfQtSxgsYSgJy+J4wDIq5Lt3fi3ZuDGEyOpX8unn+ovrf94livM53iCxh/jd0fQ0DQeiMAMY4szlWYWOS0Y1c/gqcfGYD4N8F00Jm1tY5BdTyl6uS7WrBAKZIK5GOEFXGdnpEX6UhrKrUghYxm3OjrMgGadiYKrimqD7GqBGmTWDQVy4IpvFECtw3YG0hVxc+MDxh30+WEBdIRXenM7NxnUL3lCaX90f0dfuFtuOHNGRAx03k6LN+6sLMh+qGkin1y3TkucYbDwQFwHB1xp1T0vPE6ExJPSW+gSlBB+J4xHgzn054Ku/uhqLMBH776GC+j0xS6s7Zdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJf5sRlRhddavP91WSqWvYii0VkBmURnB52/YYJ0o/k=;
 b=Svsx+tRFB26ottP/gI4hRWIBJzIPtyXJbHqvbbBeol1P8BVIKWnRUoJus9dyFyFxZLmEsCwGI9uyDuWhK8XS6ac7w3nfvzku7/WZ+FNnUNEdbrggh2ctDdLnZPaMo1FJ+eIJZ05tQPkxnUgK6ADlB58R8T0XAKNaZk/NT3KMJSBCNPnG0CgTFVC0QGjkgezEteANG5EmDF/Re7rdLGAjGfFNWEaxdWrpuEux16HP3FwZg7NQzih1sd40jh3ZW13v9MjTZiLOqO2q0A9y0WJ2YzEdUzamlxK2+2CMEiB8Q07+Rho0/3YFj+MY4JIOfydh9Ej6r2xO1ApaE1BQRNRkjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJf5sRlRhddavP91WSqWvYii0VkBmURnB52/YYJ0o/k=;
 b=CGLae4BoLfe+b1WMICVSsDHzyXcsNvfPNiOTOv1X98yC5txjKc+rHa1xExU8K/vLVTNjNVPEfybvC4WM9qcHQTRoYT3MCBVjGNRb4Znw933vG3AmalErLQQuRoA1RgD48JnuRkTXZV4++7QKQAMW7aZMrddAC8W75kW3DNE4pOk=
Received: from CYZPR12CA0003.namprd12.prod.outlook.com (2603:10b6:930:8b::16)
 by LV3PR12MB9186.namprd12.prod.outlook.com (2603:10b6:408:197::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 11:49:15 +0000
Received: from CY5PEPF00000E87.namprd05.prod.outlook.com
 (2603:10b6:930:8b:cafe::90) by CYZPR12CA0003.outlook.office365.com
 (2603:10b6:930:8b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 11:49:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E87.mail.protection.outlook.com (10.167.247.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 11:49:15 +0000
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 05:49:11 -0600
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Ronak Jain <ronak.jain@amd.com>, Aravind Thokala
	<Aravind.Thokala@amd.com>, Harsh Jain <h.jain@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 2/5] drivers: firmware: xilinx: Relocate FPGA library APIs to new file
Date: Fri, 27 Nov 2026 17:18:36 +0530
Message-ID: <20261127114839.1428778-3-jay.buddhabhatti@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E87:EE_|LV3PR12MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: bb008efb-8529-46a4-c9e2-08df4c7c7619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261028144727099003|261102130727099003|261102123227099003|261021123027099003|261021135927099003|261021130227099003|261021121427099003|261026121527099003|261026140227099003|261026130827099003|261022105027099003|261022113327099003|261022075727099003|261022115727099003|11063799006|5023799004|56012099006|10067099003|22082099003|18002099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	PxD27ipXegbWv3nNO6EzvnzHtYj2IXgk+ASqFba8UB+SDSopzf908aqOy7hWr7IUh5+ArMg5Id1CcJBcRzNd7Sucwhy42d/HcDLd5TXnttjFi96Z3ujFNMRfkJAjlDGcMo81xP/gHlSvrHNNBymTue1s79ua4nJEfgHk7cCAJqJmVl/BmffiDTtZ7HG2xN0EcXPoKFubxNBFlqrlWVrRYqCD2W3kCKTXKLz/hUpXIuB7GAo99pSA4/RsA62c8MnGrv8kd5EzHnt3q65smlBa4HwhCQs8aQwIVsgWtLQ9fIx/YDGv5GFqVfT+4ZBvonFKsdFuPtvLxEVyzz9IqTcIeta1rPOVGyM2mYtLnHMeEO9nsyvDZ6HeulnLfvPDSeQwJeKrTwDXzeQauspdUUQXtaRK9mA1JPCb89uMKaSGGZftxehz+D2DRUPlH0fiMzAawWZJOlSD5d3uRHgI/XgRctjzlpTC4Klgr3mKJzPG5Fd6hNc9U7Rl9d4/iZ5mwhvKdYN5lcksZO75L6Ev3pVWQF3/8lzqHKAYBSa0euV15GN1X82v9kTUC0fwev5cN4I6+1y0Zl2CC6PcCioPJsnkWf5+2SY1+yClT7L5IMTAjKBOyqevMg6964pvuv2FrkdWYOHFs2eZrVLO/zjsoAu+FMqsl4kYdbUIXaAbHypXMYSRX+IluB2wymDc3GT8+nXc2j1kzD5L/vBlxmZ/Ck25xQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261028144727099003)(261102130727099003)(261102123227099003)(261021123027099003)(261021135927099003)(261021130227099003)(261021121427099003)(261026121527099003)(261026140227099003)(261026130827099003)(261022105027099003)(261022113327099003)(261022075727099003)(261022115727099003)(11063799006)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MTgfoz+xguppdv0vFv/8C9Y3FJiEhGsobuN8lbaa0vpQCUpq4F/l6Njbdiki1jFb8cElVGjQEFEXUoh5unN8TVEieAiChXW8jZHHZRCEVJWFe7gdfNQ57CEroXnln31XmFLPZYscEWk744BlexnURaaPl/jF5OYZwmhF14UU7cVBa481SsBRXInXu2548/VanLopvBnllT4+C5xEcYhaTfm44CM93APimps1Iu85bBv7AfMLwb3AAmwEON4P7HfxZXqUHi999TMnFrkf1ptnmFJTywFo3sxfd0iL7SPv9ENBG4XbOw1xB/2UXzIOF7qzc2PAzcKE4JC1GRBaG3OIvP2WmvHfugP3AGz+JK9mpU4yEcmRCJ1CF/mVr668B3fsqZmWKcseryEz7SNqpBpUWjLaDWGBBgmiC6yx+G/QwT2odqhtfb6trMADy/TVaxhi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:49:15.0115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb008efb-8529-46a4-c9e2-08df4c7c7619
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E87.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9186

From: Ronak Jain <ronak.jain@amd.com>

Move the FPGA library APIs into a dedicated file and header to improve
maintainability and reduce complexity in the firmware driver. Keep the
existing behavior unchanged.

List the new FPGA files in the FPGA and PDI firmware MAINTAINERS entry.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
Co-developed-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 MAINTAINERS                               |  2 +
 drivers/firmware/xilinx/Makefile          |  4 +-
 drivers/firmware/xilinx/zynqmp-fpga.c     | 89 +++++++++++++++++++++++
 drivers/firmware/xilinx/zynqmp.c          | 78 --------------------
 include/linux/firmware/xlnx-zynqmp-fpga.h | 55 ++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h      | 32 +-------
 6 files changed, 149 insertions(+), 111 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-fpga.c
 create mode 100644 include/linux/firmware/xlnx-zynqmp-fpga.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9dfdb7ade5f6..8caad731367b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30670,7 +30670,9 @@ XILINX FPGA AND PDI FIRMWARE DRIVER
 M:	Aravind Thokala <Aravind.Thokala@amd.com>
 L:	git@amd.com
 S:	Maintained
+F:	drivers/firmware/xilinx/zynqmp-fpga.c
 F:	drivers/firmware/xilinx/zynqmp-pdi.c
+F:	include/linux/firmware/xlnx-zynqmp-fpga.h
 F:	include/linux/firmware/xlnx-zynqmp-pdi.h
 
 XILINX GPIO DRIVER
diff --git a/drivers/firmware/xilinx/Makefile b/drivers/firmware/xilinx/Makefile
index 684c3d43744e..edfba4110a7c 100644
--- a/drivers/firmware/xilinx/Makefile
+++ b/drivers/firmware/xilinx/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Xilinx firmwares
 
-obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp-crypto.o zynqmp-pdi.o \
-				 zynqmp-ufs.o zynqmp.o
+obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp-crypto.o zynqmp-fpga.o \
+				 zynqmp-pdi.o zynqmp-ufs.o zynqmp.o
 obj-$(CONFIG_ZYNQMP_FIRMWARE_DEBUG) += zynqmp-debug.o
diff --git a/drivers/firmware/xilinx/zynqmp-fpga.c b/drivers/firmware/xilinx/zynqmp-fpga.c
new file mode 100644
index 000000000000..2a3ac3a50c56
--- /dev/null
+++ b/drivers/firmware/xilinx/zynqmp-fpga.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Firmware layer for XilFPGA APIs.
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
+ * zynqmp_pm_fpga_load - Perform the fpga load
+ * @address:	Address to write to
+ * @size:	pl bitstream size
+ * @flags:	Bitstream type
+ *	-XILINX_ZYNQMP_PM_FPGA_FULL:  FPGA full reconfiguration
+ *	-XILINX_ZYNQMP_PM_FPGA_PARTIAL: FPGA partial reconfiguration
+ *
+ * This function provides access to pmufw. To transfer
+ * the required bitstream into PL.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_fpga_load(const u64 address, const u32 size, const u32 flags)
+{
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_FPGA_LOAD, ret_payload, 4, lower_32_bits(address),
+				  upper_32_bits(address), size, flags);
+	if (ret_payload[0])
+		return -ret_payload[0];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_fpga_load);
+
+/**
+ * zynqmp_pm_fpga_get_status - Read value from PCAP status register
+ * @value: Value to read
+ *
+ * This function provides access to the pmufw to get the PCAP
+ * status.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_fpga_get_status(u32 *value)
+{
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	if (!value)
+		return -EINVAL;
+
+	ret = zynqmp_pm_invoke_fn(PM_FPGA_GET_STATUS, ret_payload, 0);
+	*value = ret_payload[1];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_fpga_get_status);
+
+/**
+ * zynqmp_pm_fpga_get_config_status - Get the FPGA configuration status.
+ * @value: Buffer to store FPGA configuration status.
+ *
+ * This function provides access to the pmufw to get the FPGA configuration
+ * status.
+ *
+ * Return: 0 on success, a negative value on error
+ */
+int zynqmp_pm_fpga_get_config_status(u32 *value)
+{
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	if (!value)
+		return -EINVAL;
+
+	ret = zynqmp_pm_invoke_fn(PM_FPGA_READ, ret_payload, 4,
+				  XILINX_ZYNQMP_PM_FPGA_CONFIG_STAT_OFFSET, 0, 0,
+				  XILINX_ZYNQMP_PM_FPGA_READ_CONFIG_REG);
+
+	*value = ret_payload[1];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_fpga_get_config_status);
diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index bebd2bfe5744..fe887d5e9354 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1087,84 +1087,6 @@ int zynqmp_pm_reset_get_status(const u32 reset, u32 *status)
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_reset_get_status);
 
-/**
- * zynqmp_pm_fpga_load - Perform the fpga load
- * @address:	Address to write to
- * @size:	pl bitstream size
- * @flags:	Bitstream type
- *	-XILINX_ZYNQMP_PM_FPGA_FULL:  FPGA full reconfiguration
- *	-XILINX_ZYNQMP_PM_FPGA_PARTIAL: FPGA partial reconfiguration
- *
- * This function provides access to pmufw. To transfer
- * the required bitstream into PL.
- *
- * Return: Returns status, either success or error+reason
- */
-int zynqmp_pm_fpga_load(const u64 address, const u32 size, const u32 flags)
-{
-	u32 ret_payload[PAYLOAD_ARG_CNT];
-	int ret;
-
-	ret = zynqmp_pm_invoke_fn(PM_FPGA_LOAD, ret_payload, 4, lower_32_bits(address),
-				  upper_32_bits(address), size, flags);
-	if (ret_payload[0])
-		return -ret_payload[0];
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(zynqmp_pm_fpga_load);
-
-/**
- * zynqmp_pm_fpga_get_status - Read value from PCAP status register
- * @value: Value to read
- *
- * This function provides access to the pmufw to get the PCAP
- * status
- *
- * Return: Returns status, either success or error+reason
- */
-int zynqmp_pm_fpga_get_status(u32 *value)
-{
-	u32 ret_payload[PAYLOAD_ARG_CNT];
-	int ret;
-
-	if (!value)
-		return -EINVAL;
-
-	ret = zynqmp_pm_invoke_fn(PM_FPGA_GET_STATUS, ret_payload, 0);
-	*value = ret_payload[1];
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(zynqmp_pm_fpga_get_status);
-
-/**
- * zynqmp_pm_fpga_get_config_status - Get the FPGA configuration status.
- * @value: Buffer to store FPGA configuration status.
- *
- * This function provides access to the pmufw to get the FPGA configuration
- * status
- *
- * Return: 0 on success, a negative value on error
- */
-int zynqmp_pm_fpga_get_config_status(u32 *value)
-{
-	u32 ret_payload[PAYLOAD_ARG_CNT];
-	int ret;
-
-	if (!value)
-		return -EINVAL;
-
-	ret = zynqmp_pm_invoke_fn(PM_FPGA_READ, ret_payload, 4,
-				  XILINX_ZYNQMP_PM_FPGA_CONFIG_STAT_OFFSET, 0, 0,
-				  XILINX_ZYNQMP_PM_FPGA_READ_CONFIG_REG);
-
-	*value = ret_payload[1];
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(zynqmp_pm_fpga_get_config_status);
-
 /**
  * zynqmp_pm_pinctrl_request - Request Pin from firmware
  * @pin: Pin number to request
diff --git a/include/linux/firmware/xlnx-zynqmp-fpga.h b/include/linux/firmware/xlnx-zynqmp-fpga.h
new file mode 100644
index 000000000000..2e0b1dc084d1
--- /dev/null
+++ b/include/linux/firmware/xlnx-zynqmp-fpga.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Firmware layer for XilFPGA APIs.
+ *
+ *  Copyright (C) 2014 - 2021 Xilinx, Inc.
+ *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef __FIRMWARE_ZYNQMP_FPGA_H__
+#define __FIRMWARE_ZYNQMP_FPGA_H__
+
+#ifndef __FIRMWARE_ZYNQMP_H__
+# error "Do not include this file directly, use <linux/firmware/xlnx-zynqmp.h>"
+#endif
+
+#include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+
+/*
+ * Firmware FPGA Manager flags
+ * XILINX_ZYNQMP_PM_FPGA_FULL:	FPGA full reconfiguration
+ * XILINX_ZYNQMP_PM_FPGA_PARTIAL: FPGA partial reconfiguration
+ */
+#define XILINX_ZYNQMP_PM_FPGA_FULL	0x0U
+#define XILINX_ZYNQMP_PM_FPGA_PARTIAL	BIT(0)
+
+/* FPGA Status Reg */
+#define XILINX_ZYNQMP_PM_FPGA_CONFIG_STAT_OFFSET	7U
+#define XILINX_ZYNQMP_PM_FPGA_READ_CONFIG_REG		0U
+
+#if IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)
+int zynqmp_pm_fpga_load(const u64 address, const u32 size, const u32 flags);
+int zynqmp_pm_fpga_get_status(u32 *value);
+int zynqmp_pm_fpga_get_config_status(u32 *value);
+#else
+static inline int zynqmp_pm_fpga_load(const u64 address, const u32 size,
+				      const u32 flags)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_fpga_get_status(u32 *value)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_fpga_get_config_status(u32 *value)
+{
+	return -ENODEV;
+}
+
+#endif
+
+#endif /* __FIRMWARE_ZYNQMP_FPGA_H__ */
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index cffec74a0436..5038c9051dca 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -17,6 +17,7 @@
 
 #include <linux/err.h>
 #include <linux/firmware/xlnx-zynqmp-crypto.h>
+#include <linux/firmware/xlnx-zynqmp-fpga.h>
 #include <linux/firmware/xlnx-zynqmp-pdi.h>
 #include <linux/firmware/xlnx-zynqmp-ufs.h>
 
@@ -102,18 +103,6 @@
 #define	ZYNQMP_PM_CAPABILITY_WAKEUP	0x4U
 #define	ZYNQMP_PM_CAPABILITY_UNUSABLE	0x8U
 
-/*
- * Firmware FPGA Manager flags
- * XILINX_ZYNQMP_PM_FPGA_FULL:	FPGA full reconfiguration
- * XILINX_ZYNQMP_PM_FPGA_PARTIAL: FPGA partial reconfiguration
- */
-#define XILINX_ZYNQMP_PM_FPGA_FULL	0x0U
-#define XILINX_ZYNQMP_PM_FPGA_PARTIAL	BIT(0)
-
-/* FPGA Status Reg */
-#define XILINX_ZYNQMP_PM_FPGA_CONFIG_STAT_OFFSET	7U
-#define XILINX_ZYNQMP_PM_FPGA_READ_CONFIG_REG		0U
-
 /*
  * Node IDs for the Error Events.
  */
@@ -606,9 +595,6 @@ int zynqmp_pm_set_requirement(const u32 node, const u32 capabilities,
 			      const u32 qos,
 			      const enum zynqmp_pm_request_ack ack);
 int zynqmp_pm_efuse_access(const u64 address, u32 *out);
-int zynqmp_pm_fpga_load(const u64 address, const u32 size, const u32 flags);
-int zynqmp_pm_fpga_get_status(u32 *value);
-int zynqmp_pm_fpga_get_config_status(u32 *value);
 int zynqmp_pm_write_ggs(u32 index, u32 value);
 int zynqmp_pm_read_ggs(u32 index, u32 *value);
 int zynqmp_pm_write_pggs(u32 index, u32 value);
@@ -794,22 +780,6 @@ static inline int zynqmp_pm_efuse_access(const u64 address, u32 *out)
 	return -ENODEV;
 }
 
-static inline int zynqmp_pm_fpga_load(const u64 address, const u32 size,
-				      const u32 flags)
-{
-	return -ENODEV;
-}
-
-static inline int zynqmp_pm_fpga_get_status(u32 *value)
-{
-	return -ENODEV;
-}
-
-static inline int zynqmp_pm_fpga_get_config_status(u32 *value)
-{
-	return -ENODEV;
-}
-
 static inline int zynqmp_pm_write_ggs(u32 index, u32 value)
 {
 	return -ENODEV;
-- 
2.43.0

