Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795094283;
	b=BsYFgZPbm/e0kNixCVqLy9XGhp+K9YxIO8AJyeYyiyRQ9CWCKk4Y/Bp9hYkFgrgAO7UH
	 PyvTyuRIbF2FMVNo/Q0JYyQwMvZZUaeDQbacfk7GhU6bzLS/qPrDz/yzfxMhp7Af3ySWv
	 HmTRs+KJSnoe3vA0Cwuyvykq/ofyAv1FqVlo53W1ya3a0XSGu9S4b1o9XzEGInUZaPAF8
	 l/IwBcZCZeFBxa1iksd/8A/dA0j/cW3WRJVfbTPlZah+ynnb2ZIISgmQ5zzqQVqARQaCO
	 ZIfzSFttZh+1EXZ7PpHumY/chWmQdnF8QbZPNonUHGRofH6fIgfxGn4UDo8JBugIZ2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094283;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=AeExFxJrzGYAqCw6Efk9xsv5vci+/i8QD7FhXc/W/Hg=;
	b=EmXNAGQGdpiJNcP1d3A3BncPztIUEmmXzECFJxfKgcO0iQnBI1mGpmSLOjX7cadkjuql
	 ra6F7yDcd4UwW5VFU61AkN84pw4gADDyvQau7VzpkAxXnCVyzPAEstxsNSPoQScexuVME
	 EGvpK0CIPocrfdQTDq0EH8bH7nEv7WmFIsbx+T0xvqDPKNB+etRc+qOROBH8HJs0M3Vb1
	 Z+B0hSdXqhmg97NUHVsj1ARkWW+L2cJUphxZUkuT4lK+IiAjWAKOn2I53aiYJkKRLNnH7
	 rBscF5EeAGJW7xH1XpAQUMFOhBunQV9RolGcr5u2nMHwOwulsyvjcPQaCLofpIY2D/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KkDFGCUf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.0
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDDD606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDDD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KkDFGCUf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1AZ6PvmSJot9u0SHtwThKDulBKmUZ7f+BnfN3qykrY2j/B0lpwv2EbRKKYioyh6CTy4kAss/L/aZmenZ0SLoTd2ZKUEC1UC/HCvUrrMFODrkEiTFrTZRJZjz6Uc1m0AI4Wfxyqqr0A9A13NZyvtOwEol5iDY3wMrv6CNnkxdLeStzHND3R0TZxy0B1+wG4fi7QKML9BOAQkXOtj3JbxNl6UEvgGnC/pXHs/F4KD5PWdh4SizHKp9ixSEnVHhvtx9xMzhLYYaJmtYGPNQh21qXuzXFn7SdJp5ExKYp5sdFj69GOu6Qn0mL76R9/SEZ7oxbLW6lyBoFI7cwrTSD5neA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeExFxJrzGYAqCw6Efk9xsv5vci+/i8QD7FhXc/W/Hg=;
 b=IMO8xDUSNZfc8Dq/NiLZS1vKr7IlnPRhZXtMY2oxKUtaOraFnrlj9pnpKPbqW0undPvGKZCsB6W7fq07gK1nznBmav2SxtggvUpnuM/nZJAnYr2y2gebWeRo5UhJ4coiSfr/vRrNCq5Kvc4TVKOuLWbMp8HO8fHhrm/FNWqTbGj3aIIP+9Ceet0r9nmIH1HtzMS5TlzRWQO3SxJKRR9hIKTz3siuIX1b1C7byoZZII+LO5z/I7Ybfy2rGN2FmqlsgZicyKCWe2vycU+fwAOHjIa46pG+ipeETYmZMPcR+VETmcJ9UFxv9Sn+dZzvOBOykqzcFZ1p4f/Gjk9URbD1Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeExFxJrzGYAqCw6Efk9xsv5vci+/i8QD7FhXc/W/Hg=;
 b=KkDFGCUfADHh3Zwpt7wZSsKTDBlgwi3wxRCEcnBwiVcCaEO4nRu2AMn4yRvFPe92hUqdJR6r8+/Y0kxfTJvLc/LlLkwmx5xnVdXv5YN8vI8a1nOPGk61QYqTtKnhb2tzKHUyqy+xd1WNK2yJK52EKGY0mZcpbNGTCK8gmN3+hG4=
Received: from CY5PR14CA0014.namprd14.prod.outlook.com (2603:10b6:930:2::27)
 by IA1PR12MB8335.namprd12.prod.outlook.com (2603:10b6:208:3fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Thu, 19 Nov
 2026 13:17:53 +0000
Received: from CY6PEPF0000004B.namprd03.prod.outlook.com
 (2603:10b6:930:2:cafe::73) by CY5PR14CA0014.outlook.office365.com
 (2603:10b6:930:2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 13:17:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY6PEPF0000004B.mail.protection.outlook.com (10.167.247.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 13:17:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:17:51 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 07:17:51 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/6] firmware: xilinx: Add comments about number of arguments
Date: Thu, 19 Nov 2026 14:17:27 +0100
Message-ID: <1c92abfbca19daa7da0310bfc85f9175db60429b.1795094242.git.michal.simek@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288; i=michal.simek@amd.com; h=from:subject:message-id; bh=LKk5UBroxxgf6dIeQavEPx87RZnwbyC6u+XCxhDR07M=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9+/bBXnPer4idB4/PPfyZyfZ3SvObe7Y5aa7ff8XPK rsxR3vu545SFgYxDgZZMUWW6Uw6Dmu+XVsqtjwyH2YOKxPIEAYuTgGYSEwkI8O1vUf/brjP3p/u 9MBBc+/HJWcqTEXlN79ieKLl2l1ypPg2w2/W+Rxik2ziKo2Z/pVUvr128VWLkbNrhRtvYlPL8Q7 OZF4A
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004B:EE_|IA1PR12MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 03920116-7ecd-4b8f-fb35-08df463f8465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|22082099003|6133799003|261009223027099003|56012099006|11063799006|5023799004|261026140227099003|261028144727099003|10067099003|261021123027099003|261022075727099003|261021121427099003|261022105027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	01MeCuqGZR0JuznFAcpzyE8X3OTdqPHb31WoLCmfopdo3uh23wWPYTgs/Q8UJNKTRqOM0X5Uuv/fdV7PO5an4O8Qlxtt+K6lbbcpEjmFQlRQiehsILKV7g7vw7QUq/iQ16i5rS/c/Un5Guzf901IqKYPLAZ8l5NU4hbj5Y26iW5YRxtS0JvSulg5tkRSGvixHURHdPMPNXSIwOxqxN239eMd1gMquuDQcifu9G12GZc17La1xruqyopTAsDyIPgjn/mEbAQb+ZixVAFHZguj8kfJxvG+W676AJ5mTQqIqtmFmCjb8Ou3RXlcTdrS2xdFQkEeGvTvK2Gij7+DV8suXJqqHHAIUJL9Vyrkqt8n+TrRn2EW3KJ26rN/d4+OjfzidOY3GkocMvd3+7JNKKwq4fF1M9uxatjsNL6TKNK7/g8mvj/+IrvRurUKEYhRHsvFaP02j7zPu5ZIzAf5CMAP3kkehmZtk5GE1/dxprSSDwPDrvncvV3zujF2x3uENy56R+dX/+1i+ArCn5C9ZdfPrRnxc41wAKvcrg1USsRNhH2kmTfzvvy7mztYi8vs6WdnLgUFB2xilEQcGsLDWedSTHVXXl3Vw19MBRnSF4R0WIFEXAe2IWdbSbgXB87w6dSDVJjmxRPh43LttSCiwwBedGP7RaUd4M50G6NhNY4NCkmMqSN3z1g6ZNMB/PTNrXyhQfGfCbIvTG3Lw4FE3PQVTQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(5023799004)(261026140227099003)(261028144727099003)(10067099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BQQUrDBlQjT/uXX3a7fF53lE4oUEABXuL2odvlDOkecwb/zi9du6JsbRgxuJEA/UVhe3UZqXSr+dx/1S5wDar3Z9qi2tHk6x0zPkVejI4o5180ozJhFYWl94N0M4dD+oE751LoRpiyb0Wc8ZGI3DSSOpGY+Ca2z3DJB1IDKY4xm84GYpjQhjvJyXIn8xvByI3YU8RLYhdt5sjp8EKUe62pT7aPKHnIrxnBjzRerPF14uiV2zNo+UNPvEqpV4VhJGvo9hn8Q7ZmFvr9r7+ZpWvQb9umpH8WHNAlZtmutGeUdBFOsjsRhq13PmUCQUn+RLHD1P01kr6IkgehPY/bI+Vzc0wKOH8Hh1a8y3RmM/SEta5JkZ1T5JODFXnwiPuoMTASoAnKOv8VoF0y6HgMZmehoFoHa/hhkGEhmNDiEsLfYTOJh6IW4S4HieR4qOf556
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:17:52.7086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03920116-7ecd-4b8f-fb35-08df463f8465
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF0000004B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8335

The driver is checking number of arguments where it is not exactly clear
what that values are reflecting that's why introduce SMC_ARG_CNT_BASIC_32
macro and add comment to the code.

Co-developed-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/firmware/xilinx/zynqmp.c     | 18 ++++++++++++++++--
 include/linux/firmware/xlnx-zynqmp.h |  3 +++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index a0ec904b1819..597393d5ea69 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -388,6 +388,13 @@ int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 	u32 args[SMC_ARG_CNT_32] = {0};
 	u32 module_id;
 
+	/*
+	 * According to the SMCCC: The total number of registers available for
+	 * arguments is 16.
+	 *
+	 * In the Extended SMC format, 3 registers are used for headers, leaving
+	 * up to 13 registers for arguments.
+	 */
 	if (num_args > SMC_ARG_CNT_32)
 		return -EINVAL;
 
@@ -449,9 +456,16 @@ int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 	u64 smc_arg[8];
 	int ret, i;
 	va_list arg_list;
-	u32 args[14] = {0};
+	u32 args[SMC_ARG_CNT_BASIC_32] = {0};
 
-	if (num_args > 14)
+	/*
+	 * According to the SMCCC: The total number of registers available for
+	 * arguments is 16.
+	 *
+	 * In the Basic SMC format, 2 registers are used for headers, leaving
+	 * up to 14 registers for arguments.
+	 */
+	if (num_args > SMC_ARG_CNT_BASIC_32)
 		return -EINVAL;
 
 	/* Check if feature is supported or not */
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 41a1cd810bda..b489fbd21bd2 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -82,6 +82,9 @@
 /* Number of 32bits arguments for SMC call */
 #define SMC_ARG_CNT_32	13U
 
+/* Number of 32bits arguments for Basic SMC call */
+#define SMC_ARG_CNT_BASIC_32	14U
+
 /* Number of arguments for a callback */
 #define CB_ARG_CNT     4
 
-- 
2.43.0

