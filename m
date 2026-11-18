Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795044744;
	b=LA6+YrbiCJ53yl6VaIhC0aVAQ3yzzpzRJrmvPkApeu4bPQn9I2tsJU3jhcrpRseZj7xS
	 ByTLq2l/Mcr9Uq3GCOJjRHwJCeI9TkQ8ll8Du6iFYikZl9ujpgqpidt0WAeg4G86cuYVT
	 /IEyUKhAuX/Hp1gyJunYw5zW+HVOKcJ6q+eIqlaj8kFKWigVWTAgQnadXPmgEkLe5IxL9
	 aLVFwZW4BO23mkHpkOVpjbDcyqBH1hVZpulYKPEv/H33TRXBh7UBShN0OmlVBdTquTPF8
	 9YDpnrdQzPKlcjzYgAZzlGaDQYtEDEWP4C5XBR6HhjwNxw9TJB8wGcuxLn1xQQxuI/g==
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
	bh=Hwh4WReI6acfvtAn72oePOoqUitjudHGN9q5R75UUgE=;
	b=UR6YKak8Fl82jzj/78a7BKtKNql/FQIOWWngc12ALXJHJmJboCE9N7x3xsGrtdsJHKl/
	 q2cHAj8O4b31WWJwC/UMx4EZ2d3KAsoE9qOrXrVeQM6nbk3g1dMcETzsaUhz5gBSo6CrM
	 hIfZ8cPhAWd1Yh/5YSS2keU/VgHuKoVAFOEfocPDi9YfKEkLC2F5k5Q9KV9S29A4Oj+4p
	 0Parrkhz612AgXJq5+ngCX8VKHw6kwNUDhi2JDrPrm33O1wgD2OJdlHVniwzY1DyoYNvY
	 QVycrHAsQ8BHrPUjWmjlnigThrfdvK8epCbtoDM1ZZ1xI8iuFiYg+zfutN2qMsuxGjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LeoCcgHb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.52
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010052.outbound.protection.outlook.com [40.93.198.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F199F606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F199F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LeoCcgHb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4tQZCdQ44RHRZeh1FZ3t2mnBq7Ck1rgqIdaABXI3cnH/SH0cr7GWGF0pwkI4BqOk3M/YnsSa6iTct5sFdCBd8ZVrcOQd5rHmR90ZS6uEPagK0Jqi8oL6kZt1EDS7BYKijiuJ1L23np/lTLPwojDoi+8jeyIxgIM/opCpw9aAFIlpj62NpODMDIhOKiQbi32PzHXw0aC22Bh6dzERvx2KWgB/2cuw6wwtxowv4V2MtaiygCG+3rJcXCAWMxlBGGc0yja/35pffZTk3MLPwm03r6LOsKVoyG3hj+/+lq8RGQooDai8JsBvm7yXFpOtEp9fUIMn2wiqdGvWmY1I7gkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hwh4WReI6acfvtAn72oePOoqUitjudHGN9q5R75UUgE=;
 b=Ac6CTPgYOdEjukxaoajFOeVuBw8muPVdG9n5Ia+tQqOuv6rbRYakRKHXLYrzUrQa5Dj5JtlmBl3Po4qWRdcfjEEPXkCwX6Di0xza+Zch7KK4yjDkzuvt6LB77MA4KSAgqcMraxzjm9gZPGb7GbQS/dwq6GJOEBrkRlw/HGJmb3BgO0iL7OfLkdTDDvXsPo1X5iX+031vxDKVp1Q2K4snDiXAa2OoBBIh4ztpJUeAOZ+iX9uWHcuMH5eP1QTNbxhltXj37AnBUTbLRpEx39Gf1okWkmY8vpHWREK+gUA6AXoPq9gMIelJrGfM6vxZ8Ha51+EGAvQbjVcmrk3mn7K+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hwh4WReI6acfvtAn72oePOoqUitjudHGN9q5R75UUgE=;
 b=LeoCcgHboctW7qaRZhn6y3eTrZBrokg8mslpUyjQeJFvVh9OE38ajaxh/fIXMDFrI7WfKwCEi8gVHy4yPDAyFxfF66D8lhSApu5SiRa9msk4ulRIvOOHQEnjY+ihQJJADSRUsK9eFM4O8RUDrafmztd8PtgMFvdwACdD6VEeBfI=
Received: from CH5P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::20)
 by SAWPR12MB999141.namprd12.prod.outlook.com (2603:10b6:806:4e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:32:20 +0000
Received: from CH3PEPF00024580.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::3d) by CH5P220CA0023.outlook.office365.com
 (2603:10b6:610:1ef::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 23:32:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00024580.mail.protection.outlook.com (10.167.252.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 23:32:19 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:19 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:18 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:18 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 04/15] firmware: xilinx: Use match data for ZynqMP/Versal
Date: Wed, 18 Nov 2026 15:32:00 -0800
Message-ID: <20261118233211.4121361-5-gregory.williams@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00024580:EE_|SAWPR12MB999141:EE_
X-MS-Office365-Filtering-Correlation-Id: eae53eda-aef9-463e-dcfb-08df45cc3031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|261026140227099003|261026130827099003|261021130227099003|56012099006|11063799006|5023799004|261026121527099003|261022075727099003|261021123027099003|261021135927099003|261021121427099003|261022105027099003|261022113327099003|261022115727099003|261102123227099003|261028144727099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	nlquX8O4v5JPL6ZKW4gtCSZJyF8ykwxJHMNILN2VoMgBXlFbBZhAV/7eGANlS3NI55/XWaRb63YeZP4PV2oALQNMgUCo8QAkvlWUVRybKIpWSOaJ/+ql6M7DtD03TsKY+9W/wdagk96IiM80Io2K2vqo+uNaX3sEiBKaC/DtTB7/6JrM1l2oOQD+kHRiXzQU6oERRiFMWTmCJLwqhYVCucU7RKrO3O7/21eCJi73iC9v4M08mhvXqafa8mSrKSJLwGFWCvoHxbv4/l1jLs5NQSrqvxwjO8oEN/EnvVs0uLgyA20fL8E/UICMcgNKdvqUe95fWSBHp53DFypwEtd117WGfOed257U2fWq6aIb7EX6506G+aY3gUPUW6PPNylOk6Uzes//bItoNM4SQn7b/xJ8+pawwHcDC/AVuaXGaAs/GuzQS6NRkj8VjKhR87DenA9NvHiRLvJZuMQjlgfrI/Pr+VzwnACJQVkZgwiVJYDejpYZp2eUiDrbd/5JEibQIGFfB7t7frsudWSyzTrbmTzUmG4i+YhgAnsI1ghmnkrTt8tZF3/83ntEvf2+BUwLgAlj3M+oJSGYC8xUKAFXwy/jl1nZVjoEcHU/IVW3pG91+vxTCpDZgshmFeG4iYxcdbHrcdj/gb9N2IARJHghhlMcF2X5HGz7h24ZmdZ+te3qYfvDQ59fvGr40xqT22MD
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(261026140227099003)(261026130827099003)(261021130227099003)(56012099006)(11063799006)(5023799004)(261026121527099003)(261022075727099003)(261021123027099003)(261021135927099003)(261021121427099003)(261022105027099003)(261022113327099003)(261022115727099003)(261102123227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k50D/PNd1DL3GQYrg7KjMEsj0/lsYjDSTWoNYxt8mwZXgF2jlX37s4q6Wj5xEKHvnycpUavOcVv92LCt5VSapI96mg/gtlXYLsy9ak6gf9KlJtk/UY0ErgjabIxuyYMeFRucTaA6GCeSyLlrInhWp4SxuGAFughTTSGhi3SkyOq5Nxe3clluQ9soRizEDFwS2y5us5NmbjHXsDpU4l0Qi1h/jQhWV+b7xlK481eHUnQOGG5fb3OjbLyS6Nj5WJM2CYF26PuXMfyCSiWEnYrUy55YbLXeZ57jpl58jfgZ1R6RbFAo7p60JZQ4OhDyEpkviCkSgv5USPQwmSrW1R3nw1LE9wzNSXEWihe518ui2DZvWtse/4vcBgwXFQ259makBwdUmoI+Mo5tQM8F85EzU63Zc/xiuNpPOesWwIbBac023ryshaPmM/fr3MpROPVx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:19.3543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eae53eda-aef9-463e-dcfb-08df45cc3031
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00024580.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999141

From: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>

Refactor the platform management (PM) firmware API invocation by
extending the existing `platform_fw_data` match data interface with
helpers for feature check and firmware call.

This allows platform-specific handling of feature checks and firmware
calls, and prepares the firmware driver to easily extend support for
the extended SMCCC firmware format.

Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c | 92 ++++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index fb8ea7b9fdb1..f5ad99e0026c 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -74,6 +74,21 @@ struct pm_api_feature_data {
 };
 
 struct platform_fw_data {
+	/*
+	 * Invokes the platform-specific feature check PM FW API call.
+	 * Uses either the basic or extended SMCCC frame format based on the
+	 * platform.
+	 */
+	int (*do_feature_check)(const u32 api_id, u32 *ret_payload);
+
+	/*
+	 * Invokes all other platform-specific PM FW APIs.
+	 * Uses either the basic or extended SMCCC frame format based
+	 * on the platform.
+	 */
+	int (*zynqmp_pm_fw_call)(u32 pm_api_id, u32 *ret_payload,
+				 u32 num_args, va_list *arg_list);
+
 	/*
 	 * Family code for platform.
 	 */
@@ -319,7 +334,11 @@ static int dispatch_feature_check(const u32 api_id, u32 *ret_payload)
 	if (module_id == TF_A_MODULE_ID)
 		return do_feature_check_for_tfa_apis(api_id, ret_payload);
 
-	return do_feature_check_basic(api_id, ret_payload);
+	if (active_platform_fw_data)
+		return active_platform_fw_data->do_feature_check(api_id, ret_payload);
+
+	pr_err("%s: no platform firmware data; missing match data\n", __func__);
+	return -ENODEV;
 }
 
 static int do_feature_check_call(const u32 api_id)
@@ -489,11 +508,14 @@ int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 }
 
 /**
- * zynqmp_pm_invoke_fn() - Invoke the system-level platform management layer
- *			   caller function depending on the configuration
+ * __zynqmp_pm_fw_call_basic() - Invoke the system-level platform management layer
+ *				 supporting basic SMC format.
+ *
  * @pm_api_id:		Requested PM-API call
  * @ret_payload:	Returned value array
  * @num_args:		Number of arguments to requested PM-API call
+ * @arg_list:		va_list initialized with va_start, containing arguments passed
+ *			to the firmware.
  *
  * Invoke platform management function for SMC or HVC call, depending on
  * configuration.
@@ -510,7 +532,8 @@ int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
  *
  * Return: Returns status, either success or error+reason
  */
-int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
+static int __zynqmp_pm_fw_call_basic(u32 pm_api_id, u32 *ret_payload,
+				     u32 num_args, va_list *arg_list)
 {
 	/*
 	 * Added SIP service call Function Identifier
@@ -518,7 +541,6 @@ int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 	 */
 	u64 smc_arg[SMC_ARG_CNT_64];
 	int ret, i;
-	va_list arg_list;
 	u32 args[SMC_ARG_CNT_BASIC_32] = {0};
 
 	/*
@@ -533,12 +555,8 @@ int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 	if (ret < 0)
 		return ret;
 
-	va_start(arg_list, num_args);
-
 	for (i = 0; i < num_args; i++)
-		args[i] = va_arg(arg_list, u32);
-
-	va_end(arg_list);
+		args[i] = va_arg(*arg_list, u32);
 
 	smc_arg[0] = PM_SIP_SVC | pm_api_id;
 	for (i = 0; i < 7; i++)
@@ -548,6 +566,54 @@ int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 			  smc_arg[4], smc_arg[5], smc_arg[6], smc_arg[7]);
 }
 
+/**
+ * zynqmp_pm_invoke_fn() - Invokes the platform-specific PM FW API.
+ * @pm_api_id:		Requested PM-API call
+ * @ret_payload:	Returned value array
+ * @num_args:		Number of arguments to requested PM-API call
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
+{
+	int ret = -ENODEV;
+	va_list arg_list;
+	u32 module_id;
+
+	/*
+	 * Of the 16 32-bit argument registers, the header consumes some,
+	 * leaving SMC_ARG_CNT_32 (13) for the extended format and
+	 * SMC_ARG_CNT_BASIC_32 (14) for the basic format.
+	 *
+	 * Impose the larger of the two limits (14) here so callers are not
+	 * rejected prematurely; the basic and extended handlers each further
+	 * validate the exact count required by their format.
+	 */
+	if (num_args > SMC_ARG_CNT_BASIC_32)
+		return -EINVAL;
+
+	va_start(arg_list, num_args);
+
+	module_id = FIELD_GET(MODULE_ID_MASK, pm_api_id);
+
+	/*
+	 * Invoke the platform-specific PM FW API based on the platform type.
+	 *
+	 * The only exception is the TF-A module, which supports the basic
+	 * SMC format only.
+	 */
+	if (module_id == TF_A_MODULE_ID)
+		ret = __zynqmp_pm_fw_call_basic(pm_api_id, ret_payload, num_args, &arg_list);
+	else if (active_platform_fw_data)
+		ret = active_platform_fw_data->zynqmp_pm_fw_call(pm_api_id, ret_payload,
+								 num_args, &arg_list);
+	else
+		pr_err("%s: no platform firmware data; missing match data\n", __func__);
+
+	va_end(arg_list);
+	return ret;
+}
+
 static u32 pm_api_version;
 static u32 pm_tz_version;
 
@@ -2457,14 +2523,20 @@ static void zynqmp_firmware_sync_state(struct device *dev)
 }
 
 static const struct platform_fw_data platform_fw_data_versal = {
+	.do_feature_check = do_feature_check_basic,
+	.zynqmp_pm_fw_call = __zynqmp_pm_fw_call_basic,
 	.family_code = PM_VERSAL_FAMILY_CODE,
 };
 
 static const struct platform_fw_data platform_fw_data_versal_net = {
+	.do_feature_check = do_feature_check_basic,
+	.zynqmp_pm_fw_call = __zynqmp_pm_fw_call_basic,
 	.family_code = PM_VERSAL_NET_FAMILY_CODE,
 };
 
 static const struct platform_fw_data platform_fw_data_zynqmp = {
+	.do_feature_check = do_feature_check_basic,
+	.zynqmp_pm_fw_call = __zynqmp_pm_fw_call_basic,
 	.family_code = PM_ZYNQMP_FAMILY_CODE,
 };
 
-- 
2.34.1

