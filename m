Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772310;
	b=k2EfpZaQtuZ/N9oN1NAmmDi7AdD91k7IgpE/WpE2lKPA7cPWJxyW7OU2RWQk/an9mwgo
	 ENUknNYO39Kl2ExPKHbcQheoFXfGJm49U7VU1wPuGxMxKZwvW1OuNiAdX+A6zDYZKH39/
	 XcrXXurXA3XH5REHsGneyaLmnOkgMtyFJVEgLTvYpMMKZ/pY6Q/Oa2kqs9Gm1wom5O4aR
	 enmtJyCDdvO//dwTMW47rBRySO7XdIDqDnH4wM1ZG3GTXnT5AsJfd0cQ7JGs36UuIsP9z
	 A7NoZjppJ6kLEfSabSj1qvsopyWGmuvAIkAt1wroaiWJum3IiQZ7ccO/VwUyOI/mC4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772310;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=Bm/p21emUc06gK9NgQHTFqR5KfCSnHr2oJGPXZtiaqQ=;
	b=YMiOGaLfjHEtbA7nH8xGgNY/3GazJOtJsjOPNqWFo6XsRatXCP+CpUvhrxiEAAQqiHgH
	 Hg+c3w77Mb4gFxEvjfsB4+nLoMc0x447EYmInXE1YXdbDDI9N5vf7/eUQo48VpUetNJVg
	 J/Hsz8dWnWMQjQWJjfo5Mduf3L/wVhyYauY5/IxZQP8FwSNLM0k21/4L8LZGN9iYIPRNw
	 6+7dTHx3qQeom7rPkklYpgHHs1AqDM0ZY0CGf0g+i4rjbP4vyqxoPMjyh89Ox97pDv7xz
	 BmgytA4s4n1X0kxt+KC5tCjjTcjjZYWvNz79RGkl3rTkxpTwoK8HxAAEzRjCtUPlfKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BJOouVAl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.32
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012032.outbound.protection.outlook.com [40.93.195.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949AE606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 949AE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BJOouVAl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofIdp5+/XHbVAhD6dNIMyohCO2d5Uy2IpFG2fUD065/5iPzpp5uvr1LtercvMND8Hm+e3li9A+RlQRsjFYsbcXMI0R9LFcpgX1oGp9NPIjF2wON56Qr6jAGWN89FB8cOfT7P3ZgimQsUCYp8SvWJywdcUIlWff1qfgc282Zv54zHBH2+iCHv79wVU5/dH5r8dC5k7kDbNHQooWri0sxKb4HQePQH9z89TNL5AGabubwTaqYTY8PkQwNCQCZb1QW1enhKnz6iTKzWsifeezlT+EBGPu2/EPZr6KQ8BiaAYNzQfqrAI0ACGI9X9jeFmcCJZJAHGHXfnBJOupLlYyyZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bm/p21emUc06gK9NgQHTFqR5KfCSnHr2oJGPXZtiaqQ=;
 b=aCGEozL6npmTBYxpsfuqY0mdeJ+D68kDtMfohkmWceeWoPNTrwKQUT0Bi8XqPmNDaEFuMI0gNFmSPnw7EErKmCl3KI59y2hY92UdJ8dPsjN6oOxP81sUOFAEnrNYhZhgOUytzDnCmAX07KyeQvj+WEfW26Lq2P41MjTOW0CVm1kKQtmmdzpjsYMB+M9XnK8+xMTEiMZoEMIF5HX7zazkZVH7YW/M3pkpJa1rWk+lhzcOmCTLZG2sjeRj2OTPMuBKJ2nJ7bIZk5VDG56KAaSdsAYwQFrP9OMfRrOBwdtdyUaMvhsL/TGkJlDm8EuK4Njncc0IldfCon+WrXPIF6z+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bm/p21emUc06gK9NgQHTFqR5KfCSnHr2oJGPXZtiaqQ=;
 b=BJOouVAlcjBfg4n1947W32IrFmJldktst71nIyrVzDeybF38slZKHUtYne1Nzh/tK79YsngDqmYFp7lVfRPo4iwIChTwPpreyA3w2lP/nE4eM+AikzM2KrUQTT9FqUsbPye8FDbVroTmxsRvGrPOQzrt1VkgfbQ0bVt1lFlAt64=
Received: from SJ0P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::21)
 by DS3PR12MB524383.namprd12.prod.outlook.com (2603:10b6:8:608::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:38:26 +0000
Received: from CO1PEPF00018861.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::a1) by SJ0P220CA0023.outlook.office365.com
 (2603:10b6:a03:41b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 09:38:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00018861.mail.protection.outlook.com (10.167.249.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 09:38:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 03:38:20 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 03:38:19 -0600
Received: from xhdipdslab46.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 27 Nov 2026 03:38:17 -0600
From: Abhijit Gangurde <abhijit.gangurde@amd.com>
To: <nipun.gupta@amd.com>, <nikhil.agarwal@amd.com>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
	<michal.simek@amd.com>, <shubhrajyoti.datta@amd.com>, <git@amd.com>, "Abhijit
 Gangurde" <abhijit.gangurde@amd.com>, Prasanna Kumar T S M
	<ptsm@linux.microsoft.com>
Subject: [RESEND 1/1] cdx: fix use-after-free in cdx_mcdi_process_cmd after timeout
Date: Fri, 27 Nov 2026 15:07:20 +0530
Message-ID: <20261127093720.266736-1-abhijit.gangurde@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018861:EE_|DS3PR12MB524383:EE_
X-MS-Office365-Filtering-Correlation-Id: f38aa7d2-cba8-4662-00d4-08df4c6a2f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	cxjkFwL3DlVbY6bkOjoiUyEHAakJgQJwuNSGpbJgKBXI55tffSvvGwDcOrUBzHXm4dFaNiMZYo4mKZzTwR325tdFyJydtGWDmXFlGdadW4AP/Z37gMs40e2blrk4rWYBmOOEgSdrGKC2QwLwE7h8ngNNvQqpakF3aWLOiO1p6GM2KyiDZX5uGD6Q6S6EymXjDfSiBlpuloE/L2gkjJFZTTNpOyMkcl42a/zPbA1kuVwNSgswW0mOqhjiiZoExfSBQH0E9FS8bVyOObbnxd29cyO77y5DCltDx7KCNcU1gfNlWRViOJpLWcr1pHORL6Ml455JAD2i7p9SpKoqqwOYy3xN8+Xf1gOb4laAxHr6+Lpa4xPIEemuAXAq7zNvcoxqFqy5yx9/uMqjG60cm1rOKDzlbHVMYnYinB55QVQ/LhLLawnoBJ/BDIIZ/sla1JMFNhG2ROy0tou8tq2QsXgxN6ezDyZvHDuGPaNnh97neUKtFdnHTyW/3ksr7sInzW3wYw5MYWtY3Op4EWFmmcuRig6kl8ZiY1aRw29lnpmwxV/rZw34CBOFRKXJIIspaBZ6KCVii915jRhDYLf+i+uYF05ZTaTifqBpmVzSwR9dXPwbHn3CqVt5lZ/JuL4Ukh61kAP8Aw1f5rOR0cY5nZY2xg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1gi1oWU48lhkae5hl5US/mG8zUfQN/lNBE1dT6ArI9FAWYSk/vaC/THWu0B+RciureVMUp0INZh6YccDePM0utvzTtCUD02U0s9U+iGLy6JlpjjzNm4Ytuzb6FP/RwdWZ8rvIFbRw1hZy8xYSbDTCq5Za5soY/0IeYfHLimGMAay4dCJ/vZiOKG4mlO+LzfNUGIef6VsbMYTe0XPVNdEUXl4C0h+EnlOqSltS+i99Zo9n2RuFvPVMgRgd9caTLr7KC2cYKXRvhhF8OYddX5vLIFl5acKJxAGNCLk3cjXQqQv0zsi2Ms8Kqpxfm+qQOv53Ux4560JuYNQSAilCRzbkOQLqLFRb5D2WIy2RsbSnCOaKHQ+Wmd6Ha4+WPD/kTIw/04hP3gGKhspJ2NorqEhc2b54hX3a/qeFw93nwkYsUy8IdkC3HSR9M9K/HJUc4Cj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:38:25.5634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f38aa7d2-cba8-4662-00d4-08df4c6a2f7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018861.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB524383

When an MCDI command times out, cdx_mcdi_timeout_cmd() frees the cmd
via cdx_mcdi_remove_cmd() but does not clear mcdi->seq_held_by[] or
mcdi->db_held_by. If the firmware responds after the timeout,
cdx_mcdi_process_cmd() dereferences the freed cmd pointer leading to a
use-after-free.

clear the seq_held_by and db_held_by in the timeout path, and
add an extra kref to handle the race where the response arrives
concurrently with the timeout handler.

Fixes: eb96b740192b ("cdx: add MCDI protocol interface for firmware interaction")
Reviewed-by: Nikhil Agarwal <nikhil.agarwal@amd.com>
Co-developed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Signed-off-by: Abhijit Gangurde <abhijit.gangurde@amd.com>
---
Originally posted at:
https://lore.kernel.org/all/20260807063609.2413865-1-abhijit.gangurde@amd.com/

 drivers/cdx/controller/mcdi.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/cdx/controller/mcdi.c b/drivers/cdx/controller/mcdi.c
index 34a07d6f41a0..ef46aeddcf01 100644
--- a/drivers/cdx/controller/mcdi.c
+++ b/drivers/cdx/controller/mcdi.c
@@ -405,6 +405,11 @@ static void cdx_mcdi_cancel_cmd(struct cdx_mcdi *cdx, struct cdx_mcdi_cmd *cmd)
 		return;
 
 	mutex_lock(&mcdi->iface_lock);
+	if (cmd->state == MCDI_STATE_FINISHED) {
+		mutex_unlock(&mcdi->iface_lock);
+		return;
+	}
+
 	cdx_mcdi_timeout_cmd(mcdi, cmd, &cleanup_list);
 	mutex_unlock(&mcdi->iface_lock);
 	cdx_mcdi_process_cleanup_list(cdx, &cleanup_list);
@@ -473,6 +478,8 @@ static int cdx_mcdi_rpc_sync(struct cdx_mcdi *cdx, unsigned int cmd,
 	wait_data->outlen = outlen;
 
 	kref_init(&cmd_item->ref);
+	/* Claim an extra ref in case response comes after timeout */
+	kref_get(&cmd_item->ref);
 	cmd_item->quiet = quiet;
 	cmd_item->cookie = (unsigned long)wait_data;
 	cmd_item->completer = &cdx_mcdi_rpc_completer;
@@ -506,6 +513,7 @@ static int cdx_mcdi_rpc_sync(struct cdx_mcdi *cdx, unsigned int cmd,
 
 out:
 	kref_put(&wait_data->ref, cdx_mcdi_blocking_data_release);
+	kref_put(&cmd_item->ref, cdx_mcdi_cmd_release);
 
 	return rc;
 }
@@ -611,17 +619,10 @@ void cdx_mcdi_process_cmd(struct cdx_mcdi *cdx, struct cdx_dword *outbuf, int le
 	mutex_lock(&mcdi->iface_lock);
 	cmd = mcdi->seq_held_by[respseq];
 
-	if (cmd) {
-		if (cmd->state == MCDI_STATE_FINISHED) {
-			mutex_unlock(&mcdi->iface_lock);
-			kref_put(&cmd->ref, cdx_mcdi_cmd_release);
-			return;
-		}
-
+	if (cmd)
 		cdx_mcdi_complete_cmd(mcdi, cmd, outbuf, len, &cleanup_list);
-	} else {
+	else
 		pr_err("MC response unexpected for seq : %0X\n", respseq);
-	}
 
 	mutex_unlock(&mcdi->iface_lock);
 
@@ -734,7 +735,7 @@ static bool cdx_mcdi_complete_cmd(struct cdx_mcdi_iface *mcdi,
 		completed = true;
 	}
 
-	/* free sequence number and buffer */
+	/* free sequence number */
 	mcdi->seq_held_by[cmd->seq] = NULL;
 
 	cdx_mcdi_start_or_queue(mcdi, rc != MC_CMD_ERR_QUEUE_FULL);
@@ -759,6 +760,11 @@ static void cdx_mcdi_timeout_cmd(struct cdx_mcdi_iface *mcdi,
 
 	cmd->rc = -ETIMEDOUT;
 	cdx_mcdi_remove_cmd(mcdi, cmd, cleanup_list);
+	/* free sequence number */
+	if (mcdi->seq_held_by[cmd->seq] == cmd)
+		mcdi->seq_held_by[cmd->seq] = NULL;
+	if (mcdi->db_held_by == cmd)
+		mcdi->db_held_by = NULL;
 
 	cdx_mcdi_mode_fail(cdx, cleanup_list);
 }
@@ -821,7 +827,7 @@ cdx_mcdi_rpc_async(struct cdx_mcdi *cdx, unsigned int cmd,
 		   cdx_mcdi_async_completer *complete, unsigned long cookie)
 {
 	struct cdx_mcdi_cmd *cmd_item =
-		kmalloc(sizeof(struct cdx_mcdi_cmd) + inlen, GFP_ATOMIC);
+		kzalloc(sizeof(struct cdx_mcdi_cmd) + inlen, GFP_ATOMIC);
 
 	if (!cmd_item)
 		return -ENOMEM;
-- 
2.43.0

