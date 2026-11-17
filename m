Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794943345;
	b=gzB1yBidmY/52R8TQ+ityX5L5K0xTlhyn9scIqaAgMiFsuzaoCVc57IRFdF2L4yT43t5
	 J2v7cFj5Mou8IKQYLYXYgt/Vrd54VOZDD0dEdd8GUhg69g04x79WpoBJYsO4RgNWDmIL7
	 lZjr3qaOO8kMAfa5xdPS2ixQjicwlgKQ0YiwvOc+s5JDFrkt4QXIWKVI9Z1GTw8xIuOFz
	 ZjXNNKahjZNRc2BSDxjA0wW8bL9ols8tdswd/pLqHmoxcz2x1cjG4eE4NkL9J3peZupvF
	 XTyHWQ1MtB9OaTGVssUmYYFhx/1dFxsFVuxlAaeDc0DSetR89raUG0MdBjWf5eUtg+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943345;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=rq4Rp5EzhMSsqJ3fR2k7VFIwpTFwZJmjS2pXkHGfHYE=;
	b=UrNFd5iQrGR5SMiWfT1LBIfh1EtEQaiCAPTyUB8P/nB5k9pYj276pAlQJFjUnKgOYRnp
	 5PKq4VMifrN+Ta94p8IULm2HSTPT3zL+KG0ZZepBj7bfw3gfyU9iuzr3WZYznT34oqfyb
	 K9zV48Gf5yw8W694BdvU5QRXnKECiBmIGmhLe3m5WTMwyOI18ALjbOfV3rr5mD1k37MtP
	 FsTBOCu0JWlV1vZEnIDul8nXoPqIZbtEaPRBPGMOqSu73h5oRLR72S7JAZ+I7cVE/SqSG
	 Mnw7iOX3pOf8l08Qs8/el2paH/LuUlR6FgTc15HxM9l3Gs0veQ4WY4Zzwi2YKp4HojA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SFpJpgcu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.20
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49693606A8BC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49693606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SFpJpgcu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZE8AaA4bmquVh5voLD+I7vse1YaBbdCFWxsEKQuPZOv9oD8c/WUWudS7JVycRRht9bbC+Kg3QU92zgVJTD8C0lbjviqjJmQkPd5rKKNzjoD246ylyJ9bDXXpCeyZE6LmxOe/yS3jwsr5/JRQyplU1yCroxdi7AICUEP+P9qA3SqFqiUFtDBRI/fA4eQrv+oAH9m/jGCyEqIgmeGtLw+CdvnqDjdboxmRHd3Tg2Tx1+VHrPdPFqke/BKjOSSQlyQ52qwpngXgrIeozB3Uc7EWcAII6vXpUZYDGqSIchmyWpWmRJxX1IH1iySYczkKLwRaYgCtqOu9SwRt9yzG6mJ7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rq4Rp5EzhMSsqJ3fR2k7VFIwpTFwZJmjS2pXkHGfHYE=;
 b=QFBuRy3ncD6tLdnFLZCbx58gqtB3iGjN8RDWjB1/VxeM+DUCPfhjowVOLU/UlLZh6k8dtwMUHF60brdhMGrG/xlMRFiP3FANv4bx7qKy1/zTD4V5UrFVqtBiIsYvUsib9m8T4na+q5F2ix3GnMF5N7ZJcVL893g2EeeYng4+1TZhov1/saG6zkCyn/e+1NI3IEeOTBZUH6txDOiF3y9mYM3S3nkFhh/RVpwnpo2aGlE34rrQu8bnoNLoqsldn4svgi2n6eNhjkF/e0mVWfywrpVjggRJdsIdepllzbuzo+tmaSwoPqKicFZMI0GFt84fwgrOBm7ydu5EyHRDp/38DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rq4Rp5EzhMSsqJ3fR2k7VFIwpTFwZJmjS2pXkHGfHYE=;
 b=SFpJpgcu+/EL7jg2E+9KjrquBPycG4b9NIuC8XGOmyl34t4cUM51QxFrXqfoUMH4ZtZSR8QSLgXptwa5wvlCN/krEPaC3T0aiht80syVb9UlZclo1b4hRfC7Ca6J3umpp+j2Qk3nR+b+2yfH9cs5lWhyx8Ie/LbiYyJNxUDDREw=
Received: from MN2PR08CA0012.namprd08.prod.outlook.com (2603:10b6:208:239::17)
 by SA0PR12MB4414.namprd12.prod.outlook.com (2603:10b6:806:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 19:22:19 +0000
Received: from BN7PEPF00000095.namprd03.prod.outlook.com
 (2603:10b6:208:239:cafe::8b) by MN2PR08CA0012.outlook.office365.com
 (2603:10b6:208:239::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 19:22:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF00000095.mail.protection.outlook.com (10.167.245.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 19:22:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 13:22:11 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 13:22:10 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
	<dri-devel@lists.freedesktop.org>, <mario.limonciello@amd.com>,
	<karol.wachowski@linux.intel.com>, <max.zhen@amd.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
	<sonal.santan@amd.com>
Subject: [PATCH V1 2/2] accel/amdxdna: Abort jobs when the firmware context is gone
Date: Tue, 17 Nov 2026 11:21:57 -0800
Message-ID: <20261117192157.154516-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117192157.154516-1-lizhi.hou@amd.com>
References: <20261117192157.154516-1-lizhi.hou@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000095:EE_|SA0PR12MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c395ee-a6fa-4349-aec3-08df44e01909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|18002099003|22082099003|261009223027099003|3023799007|11063799006|56012099006|261028144727099003|261022075727099003|261022105027099003|261021123027099003|261026140227099003|261021121427099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	LTB2Z4yRt6dc+657vkq8pLmgi4Tiic/jdFHFomBKuW+uwSO+zNfz9l8ubIoyF7/PBLDqv0RYci1Eu/OyNw1XqaFMc7sj1RMqUpaFhuNLo0UkNLn9R8GIbZZAG28DmzwguVIAiXunF0m8F8gPbD6ndDoOWUl5Dk9esPx4ZE1Mra/R6gjO/DkA27/jk0YCC+nuDSLiwnGL0glNOVL3NSURjeIZvVQfQLIQakLQzQBkPmprMdikTJbrVZSCmd2Iz54/3cnUylHnQwptpWDDCDgyetnvD1PazSUHjSsx7enaCWxrNas3XMLoAGphclN4ovgqiOnBtkT76hHYmTM2N62au/jia9QIpKjpnE7yctUDYJdT+6aENUjGFravfqlrFTwnvR41GXZmfQhn2GIwq8PjcVQ9mFS5Ii+D3h2OkIob0vEarjvFzySJuYYPWEBn5b0szGa+fiSmF+srE5e9tPxTzoV1jtgTEer8BXq++AGRl2G1ZVFEqHUD/AqUP1K+U7eFG4tPGmEoHSblWK9PINaxTUw7WFQ7nHtLW/DxoP1e1pKUyEG9HA4Yp4VPXT5ZaAjbTcCxLDvIs3pynTP2TCbDWarcb32BlSlz7nsePJN935U253Y6LZOX6Ebr+N7kqt8F+uCnwkTQDcGawi8dkcLplE0VagAKM8jgAIOk5icTIqnnziTn1n+Sn9LTur7TQ1XiIDNY1Zc12UxKnzUjXKQdIA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261028144727099003)(261022075727099003)(261022105027099003)(261021123027099003)(261026140227099003)(261021121427099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7CPhiMz7O69GoUVLG3UJLSZ5K/Ecdui+zr8OUZGxkYoDf/VAFztd92iTz8QiMIQ9hEfSlSeKGOKbmGZdNRNGvQN7ETkKkfQOwgvSFWsmw6Ghfp8Rnh32v47b236S5ATkBkY1dv1wfam4qLATsHhSNHKTcxgHgFClYCXWaCmpwEq39lKP8EhkBMgtI5vYpT8kkj2ZYcP0qJHvHFMuOmEhOeWyNqS15bnTN+zufGjW31HefvrKysGNdDPaQYqvmQne+OqZEp0E6uZS01GZEp4WXXSFB4f8XKb3db3CMC4+Y+fi69e0t0nu+/hjKMrIwBhlgE9fVSoJ10Z++8qd+Hoba3VpWguWOJEYB8ZTmTc5YBd8dtVFfX61eEN5EjyouGRWfAnmjDcq7bQ9CqPWaJCIjh0I6/PgQdHsdh1DzsJYJtBDCaUoOr9sLU9fdR+0ePDE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 19:22:19.2891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c395ee-a6fa-4349-aec3-08df44e01909
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4414

aie2_sched_job_run() returned NULL when the firmware context is gone
(mbox_chann pointer is NULL). The DRM scheduler treats a NULL return as
a job that completed without an error.

Return ERR_PTR(-ECANCELED) so the error is recorded on the fence, and mark
the command BO aborted.

Fixes: 6b13cb8f48a4 ("accel/amdxdna: Fix runtime suspend deadlock when there is pending job")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 0a1914f0f1c0..3b898c05513e 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -404,8 +404,18 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
 	trace_xdna_job(sched_job, hwctx->name, "job run",
 		       job->seq, job->drv_cmd ? job->drv_cmd->opcode : DEFAULT_IO);
 
-	if (!hwctx->priv->mbox_chann)
-		return NULL;
+	/*
+	 * The firmware context is gone, but the scheduler keeps draining the
+	 * entity, for example from drm_sched_entity_destroy(). Returning NULL
+	 * would make the DRM scheduler signal the job fence without an error
+	 * and user space would see the command as successfully completed.
+	 * Abort the job instead. Driver internal commands have no command BO.
+	 */
+	if (!hwctx->priv->mbox_chann) {
+		if (cmd_abo)
+			amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
+		return ERR_PTR(-ECANCELED);
+	}
 
 	if (!mmget_not_zero(job->mm))
 		return ERR_PTR(-ESRCH);
-- 
2.34.1

