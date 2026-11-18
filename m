Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795044744;
	b=c2dUh4U1Mq5E3Hg8kKZ/eEaahCCjRTE605xYfgTD0Lx07T5CyPRqjb0dhek59XUXHeVn
	 NkkIGZCKfZrrcNyg6uqUMlMJ2I/ezMt7du0MeRVvvvamAs79x9qEMeKy1pz9QwjIcoFNG
	 PQgXmwoLV8CniejTg2aw0V3aSZ8C2QCUu/npR4GkvBQOeo2yq1d3e1H5gltMaMa8qqXjz
	 N9273VZs0xZy8T6TCKoPMd2dmRJ9X+cg1NBhQ8xNS7wd2448BkhTWZ45INHlkZ39hiZ8c
	 WQx7D0VstLKCk32XfTxEz9sVLun+TtgfwTaeryDDjKGyesGsa5zfTSPRGiuIFEH7EfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044744;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=am3V468DuHp4DRiSd4+Y2x/+bxYIJ7R8lgMYTP4Hdrw=;
	b=rDQhhMvyIjfPJPApuPgE/7cZHDSdZ1GY1BpC33xBBgOfXpx21ixYIYJIUQtgLzwwPwiY
	 bTeLkBgRdeWSFqzYml/F5byxPOEmSBVS7k8JhKDAoPhF55eR/AW5ZO6wByx04JyzR8Tzh
	 U9gcvrAFjZ1TYNqMOfX1XwDRkJWTtdUhKzjRKZiJpswFBA51WQSPBFd/H43fIamEBE/lo
	 g+H3D8Ubg8yGMVOtDA8OS55kQxN3sGzjmg+0MAmV0RhHU3F3yIWiYVHSJ/HdsIScPy9np
	 9tGEBz6QTTKCCqK5c9KGgeqbGxreL5XB+D37aZUBu/2GPjNhvAmlvGlcuMcm1GM+o7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="dYl4jP/t";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.16
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011016.outbound.protection.outlook.com [40.107.208.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEAE60A260D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EEAE60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dYl4jP/t
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypTiq2o3TaujgpvwNMEB52MiSXhtaZtVILZNgiT79r84VN+cbIhHJtizmIDFVpt/lOeKkgKpJq4/2Fb/mm72h+0nkQoSLx521YpXwosJMRKUInk9QZUSfESW2E9O9YXjpJL4Zjpz8EKdBO6pefYyDesAJQRyDtYulh/ubtC3+OpTevWUja/aDuFWFU9ou9dd+f2JmblJvUw/12BozFWh4ulMZBpkJRnT/Cb1LnZRK6uv/0xChIRPyLFCcpUWxxcGuJ5+BfMsH2+yRC6JBj8E55nM90UaqnncPml5V7Zbsu8Px4zMdl9xi6ydWZlYsccvBKtIskQgh5QRRONGwSz8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=am3V468DuHp4DRiSd4+Y2x/+bxYIJ7R8lgMYTP4Hdrw=;
 b=eeb59SuSjc9pWiwOJEXLJXTQ1+3jQhDmzOAO97r8fBzUwQ0Xsh00Ssnnpn5luxjF/AtHB97hty8GQz60/YzzP6m5bqeGY+CzQ8F5jG4sCM3kKaFMMmg5z+WvsQ4HZU5zGwY+HgZ6QWAjrwUmZ5WXhs2vGAtYD3889xEcNjDdLmoioEVCtILVspwAeEfe2a09wVGHOieoA7GQ2nw5z/WVBa8dTFqgRrxxfqyJntB+FyBtJ4JZnLyCUOx2k9H2PoG6fOQ6DJcLYAjV1G2+QosiIQ+hLE2H5Ap0VP3v5wowFdkKkeWxUxfw0a883/XkJ4BLnuP2M3PjGqzOF4rgrgaRQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=am3V468DuHp4DRiSd4+Y2x/+bxYIJ7R8lgMYTP4Hdrw=;
 b=dYl4jP/tu9h0duS5vDNZbFGPFc3zIsiYYcZmLOvWsnHWbeeAiV9INsn+Gs14H0MnGfAVRqoQsdc5bRkjVoXYEKfRw2zXADZ09opYEYpgZJVGA3zQlE/cglMbps9y/vXIWuNCfF3gDddAJzjY4cWHrkqP+oMlVAkegzOwBT1rqEE=
Received: from MN0PR02CA0003.namprd02.prod.outlook.com (2603:10b6:208:530::6)
 by DS0PR12MB8502.namprd12.prod.outlook.com (2603:10b6:8:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:32:20 +0000
Received: from IA0PEPF00000039.namprd03.prod.outlook.com
 (2603:10b6:208:530:cafe::8e) by MN0PR02CA0003.outlook.office365.com
 (2603:10b6:208:530::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 23:32:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF00000039.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 23:32:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:17 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:17 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:17 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 03/15] firmware: xilinx: Add comments about number of arguments
Date: Wed, 18 Nov 2026 15:31:59 -0800
Message-ID: <20261118233211.4121361-4-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000039:EE_|DS0PR12MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 36801715-31d7-4359-ed6b-08df45cc30b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261102123227099003|261026140227099003|261028144727099003|11063799006|261022075727099003|261021121427099003|261021123027099003|261022105027099003|5023799004|56012099006|10067099003|18002099003|22082099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	AH71FgN5W1fVuq6bHQb4+l4A0RMsJQC+fhOXpIRzZOpjNv3tjg+1e4KO99RxUmVYymKYhF96n3MTc2CZPzeJ0IpaE9o6TXYHqC3vXiYLlJFT3m7UpYpxNpKEm/gjmmk5S3xIaASfrmY4KpKJWABy83SQOxoZDso3tcRJCyyNW+ueIvKVSyrCD3IRRMwl5I84LYwTwy/pZLvZjch7aP5LyhTI9DL1ZIFLte9rLJFQeykRtn07HqgnGW+V24NCilHWWO5sKbFlA0TFnB/vUwE4yBm5CZMz3a1mDxWBba9Af6s2VlYD2Ti43O3MQw7hahPTglyiMxOOkdqWt3OgW+zwF7RX6ZBZb+8342T4kGAJOTDH9Q4rzmP7L8Gccy/iRH3aLSa3QB3WBsyVcAyPir4A5dO6Jedkz3fbbndvHUTQHJnAnzQs00wo4OdW0apAeA7rKE4Tn4/EdHULLUDsqrEIKu6dycvJA0rpq1Y5Qnw7CVV190YCKYfKRP8JF8hfQLkZjvBUi/gEuOiDlIjOWzXic/1DBnAQXkzLHtXp/i541/zdgmWNeiHQnPE+lsVK8z/M2UO0YKsrpfrYn8qfhDJ9nUdiuCTzTgqDwqakqVXYOxDolHOXOFri+nvf5wU9KSLBDG5W0rFWPTDL65lK5doy+1PqPEtP7Qfi0LKQBG96+wKLnbxtsXLA8SGxJoeL2PlW9YiRegfyMWGVqsgr9Nzubw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261102123227099003)(261026140227099003)(261028144727099003)(11063799006)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8dqnKjd6uLKhZzCm6Ijw+U7mguSGRNQE0Urd0yRy/eon4HJnDWMeJw/ejsa+6oaMfJvFpjIik6WDteAPiNBCY0+GOM32BbYQeLuT40grHgR2JH0ny1vx2AsjI2P/eCJo4ym8MWEAadBdG8a02AU3zgxuuGMZNi/Nminvga5ocac0jHrpEgecLf9BSyrJj55WtbfGgh6ZHc3zhIBVEM1Vfrk6m/v5cRUTWqxIQmWCGpTWGMQmh8R3fvAUa1o+GBYICLeFDu65as7nll3+U5bS0iDz32MpKuY4x/HHPbwooVxCP6XUkf5magO/njI7PnQrA5ALKVQffWj/iOKfookbn5+1jvHGrkZqoe4lpmze7ekDUHCXyVKDrZGLDdUl3+cIakdaGSd29x1KFfsoQL7Wv/p3VFwYPlKbWT5ucgrY+hIc0W7tAX5wLeN7pxyVX8aM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:20.2357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36801715-31d7-4359-ed6b-08df45cc30b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000039.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8502

From: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>

The driver checks the number of arguments, but it is not clear what those
values reflect. Introduce the SMC_ARG_CNT_BASIC_32 macro and add comments
to clarify.

Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 14 +++++++++++---
 include/linux/firmware/xlnx-zynqmp.h | 10 ++++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index e264a1914f06..fb8ea7b9fdb1 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -454,6 +454,10 @@ int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 	u32 args[SMC_ARG_CNT_32] = {0};
 	u32 module_id;
 
+	/*
+	 * Of the 16 32-bit argument registers, the extended SMC header uses 3,
+	 * leaving at most SMC_ARG_CNT_32 (13) for arguments.
+	 */
 	if (num_args > SMC_ARG_CNT_32)
 		return -EINVAL;
 
@@ -512,12 +516,16 @@ int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 	 * Added SIP service call Function Identifier
 	 * Make sure to stay in x0 register
 	 */
-	u64 smc_arg[8];
+	u64 smc_arg[SMC_ARG_CNT_64];
 	int ret, i;
 	va_list arg_list;
-	u32 args[14] = {0};
+	u32 args[SMC_ARG_CNT_BASIC_32] = {0};
 
-	if (num_args > 14)
+	/*
+	 * Of the 16 32-bit argument registers, the basic SMC header uses 2,
+	 * leaving at most SMC_ARG_CNT_BASIC_32 (14) for arguments.
+	 */
+	if (num_args > SMC_ARG_CNT_BASIC_32)
 		return -EINVAL;
 
 	/* Check if feature is supported or not */
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 41a1cd810bda..681ab99ceffc 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -79,8 +79,14 @@
 /* Number of 64bits arguments for SMC call */
 #define SMC_ARG_CNT_64	8U
 
-/* Number of 32bits arguments for SMC call */
-#define SMC_ARG_CNT_32	13U
+/*
+ * The SMC call provides 16 32-bit argument registers. The header consumes
+ * some of them, so the number left for arguments depends on the SMC format:
+ *  - Extended SMC: 3 used by the header, SMC_ARG_CNT_32 (13) for arguments.
+ *  - Basic SMC:    2 used by the header, SMC_ARG_CNT_BASIC_32 (14) for arguments.
+ */
+#define SMC_ARG_CNT_32		13U	/* Extended SMC 32-bit arg count */
+#define SMC_ARG_CNT_BASIC_32	14U	/* Basic SMC 32-bit arg count */
 
 /* Number of arguments for a callback */
 #define CB_ARG_CNT     4
-- 
2.34.1

