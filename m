Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174708;
	b=4ggV2BXNaS9s8UDjYU/lxPVr39z7HA+Qjs0drHJ/enjtm4QxGM8exB/DtummWy0avG+5
	 Aty0Mf5kKI2wf9Zz267VWP1w5RYDiu3hPdCNTlRRBfrE0L/v8EvG9NWSLMhAvQxz2pV3N
	 wbAuzbkXz4I1j88RFzeUSnnx4FI/AhuvURJu2KW58y1KXLdPioIuYVyVptmeE7A9tCsBt
	 ieDdw+IO0ZFPCTwCt3LrPV7uCBNXWeFFd+nfxrk7TS2DBFP1x6rdCexL3Ytj3TXqh9s95
	 tC6WabRKg/Xh9nq72jvHFf/03qn2+rbxd4kcMJati44QeFfgMvhFNBUfT5H8Dg77YPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174708;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:X-CLAM-Verdict:X-CLAM-Score:X-CLAM-Description:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=hiCRmoij9JJsnm+BsxGpp9JuhSl9u6krRPLDyg/pLTo=;
	b=13uMZGzCet9GNV6zyTEFXKaE1bBSfO+Fvk3aUOHYfhxPsrCKljxODHusyX517kjKN4Cv
	 VRGDBSdBSrtsmiVRkIKaBaSM6y+DMPsvRMEGD5WYgqI2jUabvV87ZnlGGYlBK3c9QDHfC
	 PT2zCXcamVJC6v6g+RpIJKjktT37e+LQszZt0STXBUHIPtEXxYXxRrPg1gvNyQg7oFIYG
	 kW38g77Hpc9gF9Gr1oOFrOBaErzYJ3quczRG2j8AY3Qwn6UJQq6380z4sS1xAT/vFSbaN
	 fbbGAj2eYIqvET5je0spMPA95U2D1MdoWz+G1vRhIeAV/34irpsQq0FvyPq2fnQeUFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b="DJW/PEsI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.33
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63041606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63041606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=DJW/PEsI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRNgfZorKPDOrHw1MpPk1GRhI0Bn7dTcczoSaFuIVGQLqZTlP3hq9E8WywsLzl9SaCIiAMpoHXIxP4+EdnNcPnAnjcNBSHWT5mZVUZHu+T7w8lM8Op7sRW0+33y72yXdNMzM6oj5vqICXS6lwe1ELdV+acEOlhZ8OT50fZqoHfgCPviILtL+jAeNAI36v8LahWrkuL9ohJmRx9chxvczaVvJr/JtPWgqYZvOM5F6Tw4WND0Pn3tSrjOu/PzDliCu3Q/6QHpGr1qL1WuCIaqq+NspDrNW4mRdsc2fyMHjBaKtuH3OzXHb3la3yzHbgkL7fYObefu+MBdYbSEB1UTuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiCRmoij9JJsnm+BsxGpp9JuhSl9u6krRPLDyg/pLTo=;
 b=SzONt4HJqbXPChKerWunjF1LJWF3pajgciokfA7i+9Uzm7C71lPNFbsl3sN0elDvmnUL4ox5mUHlXqNI497ztfhmSb0AqJoMpQaicyJ9PSN/xz4T/4bzv5mjCxGdqkyuPxANW8mZt6qu0EBNjQjR2EcxyNdGiZnOqHF2eB1PZ4mF+hUKJxdKXIx2pV2It/OfId/lICkF07Qk6ZDx/RjFuqWWV+F1Wt//aHDayv/uWAf7kSBq5j1fgPI+zfwx3EuqjaEmuV9QehkJE360GWZUCSdqAqsFupwrkRJ44nggUZ2TCq/1DgQ2I9+5u+EXHgdHOxbAEyE0vDGPEzMxQtJaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiCRmoij9JJsnm+BsxGpp9JuhSl9u6krRPLDyg/pLTo=;
 b=DJW/PEsIOMLFIEslHbysWLyP2lElU3n5at5dls7t5gcmsY++btwvSdST/lkIM2iRY1MVrDjF+if4dIVzGvJFBAZYqfYQXB4LdUssQQs3Rmwd+tMt4oQMOJtxnBbGTANjg6Z5YHl9XHJdGf4eW6oKz1+/sn9sj/ZZ21JJcDgqChA=
Received: from AS4P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::12)
 by PAWPR10MB7198.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 11:38:22 +0000
Received: from AM2PEPF00070CF9.eurprd02.prod.outlook.com
 (2603:10a6:20b:5db:cafe::aa) by AS4P189CA0021.outlook.office365.com
 (2603:10a6:20b:5db::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 11:38:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 AM2PEPF00070CF9.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 11:38:21 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id UHizxpVgKf0UDUMwfx0Sn6; Fri, 20 Nov 2026 12:38:21 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id UMwfxTcvDbtn9UMwfxpfog; Fri, 20 Nov 2026 12:38:21 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 8C8CD1803CB;
	Fri, 20 Nov 2026 12:38:21 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id 8A2AEFE023B; Fri, 20 Nov 2026 12:38:21 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: linux-wireless@vger.kernel.org
Cc: briannorris@chromium.org,
	francesco@dolcini.it,
	linux-kernel@vger.kernel.org,
	Vishal Gupta <vishal.gupta_1@philips.com>
Subject: [PATCH 1/1] wifi: mwifiex: fix race on scan_processing in mwifiex_scan_networks()
Date: Fri, 20 Nov 2026 12:38:11 +0100
Message-ID: <20261120113811.36916-1-vishal.gupta_1@philips.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF9:EE_|PAWPR10MB7198:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 10496d6c-e089-4e79-9e30-08df46fac7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261028144727099003|261102123227099003|261026140227099003|261026121527099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dJryyzZlRMwOf+N9Ut4sFKIofvtHycVznKkZqXYcwXk1ZFnriMeSBJUbaBP/Wlxocl2fWLxj8QNpBVaIDLbUEOvuHVTfe9+NsWy+5ZUmLFz2MYJJNRH2y8tnmoN2OXkdRcaj0ZU75odTVVauosW3xXOrcoHPKvrX0jUenp2qv8haDNsmC+PcByLBBy+JJJR5Uox/mw6IdeXu6N6oOHwO0XRfMZmPzZu77KVEZMLLJsdOUZl5xkQbe2uCO7OD/r5HeCShwQK1rxfTk0/pgGo14REnikKcjWdZpBlDKhPMtUb6sc/JAaNoA++a8PWA/tvuvuVo/P0vRg0vbnMLqAuxPail6r0HpHYGCBhcretgxtaGkXcS5o9LT3tkHyZibFaspu2VAxd0xcUuln2fGxLNa6vc86PHiKt/rwSew6S5lLeH/zZh1VxuZB4R4pkhlDxMgU+v/HbbuagbkCR1mJ6CrnszSAocgV+nvtYD+dSBgEknig9hkauDC04H6Erw+UKB12YOVn5Ui+rDyPQFpnYwKULmLMvgT7gjBsx88lex+OCJkT2NjTQTd3tHPAiNVRaFzHHsV6WCu3gUhwqBUBTA4XJTuhqDVMChevXzd9tpDqiCN0iCo5FjqGFOikt8WpulGT6DmPdx5iblwTJ3NOWXCBnaZqwVeJxzU7wVE/cMkx8HFgdCFGFgjRVyrpAbXxpKfU0gkdbLR42faWytDkiAUw==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T47avAOubaH0+zg9aENuDcGA3JXczaR7SDmBfL5BnjKltzgWiOnWND2Z/RHgdBvDLPnQlEKtE4Qael9YWGAvES62RWPX/1VRih8J70a7hHVcS4wABKQTamA/Gf5SrRrp54JLUn9gHEizu3PhUFnQ+uYJ2Q/X8kAA5ItMF5mqR9pgP+EgQa0SdIL7Wyft2M7PZdUivD41hlcadhhMDveDumlLPxmPmy6xsFQryTbhKE/YP8aGYwRBt3UmlBCqCJ+hj8IU/x5oa4yHXAHUcM6/S3lFJ2XFsFt+LRDnovl/m3A8i9i+QS4Ibc6bbU2iOAD6OICb6HlCjjqF63YAHUaYH7evho+Lr4hVuGxyL1E5iPNtkNN8mVuQ4NQ8HPTcsRTIicq7RVPwbJJiIvjw39e+yBdhmQwxiHWFnhhykulPt72qslJRflJt4uqlCIYgMJHP
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:38:21.9378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10496d6c-e089-4e79-9e30-08df46fac7ec
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7198

mwifiex_scan_networks() tests adapter->scan_processing without holding
any lock and only sets it later under mwifiex_cmd_lock. The test and the
set are not atomic, so two callers can both observe the flag clear and
both start a scan.

This is reachable because callers of this function run in different
contexts: mwifiex_cfg80211_scan() runs from a cfg80211 operation, while
mwifiex_active_scan_req_for_passive_chan() runs from the driver's main
work via mwifiex_check_next_scan_command(), which is not serialized
against cfg80211 operations.

After the last scan command completes, mwifiex_check_next_scan_command()
clears scan_processing and then starts the follow-up hidden SSID scan;
a scan request from user space arriving in that window passes the unlocked
check as well. Both scans then queue commands on scan_pending_q and share
priv->scan_request, so one can clear scan_processing or call
cfg80211_scan_done() while the other is still running.

Move the scan_processing check under mwifiex_cmd_lock, in the same
critical section that sets it, so that test and set are atomic.

Signed-off-by: Vishal Gupta <vishal.gupta_1@philips.com>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index bdd4b8465863b..c99c5378b8486 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -1499,12 +1499,6 @@ int mwifiex_scan_networks(struct mwifiex_private *priv,
 	u8 scan_current_chan_only;
 	u8 max_chan_per_scan;
 
-	if (adapter->scan_processing) {
-		mwifiex_dbg(adapter, WARN,
-			    "cmd: Scan already in process...\n");
-		return -EBUSY;
-	}
-
 	if (priv->scan_block) {
 		mwifiex_dbg(adapter, WARN,
 			    "cmd: Scan is blocked during association...\n");
@@ -1519,6 +1513,12 @@ int mwifiex_scan_networks(struct mwifiex_private *priv,
 	}
 
 	spin_lock_bh(&adapter->mwifiex_cmd_lock);
+	if (adapter->scan_processing) {
+		spin_unlock_bh(&adapter->mwifiex_cmd_lock);
+		mwifiex_dbg(adapter, WARN,
+			    "cmd: Scan already in process...\n");
+		return -EBUSY;
+	}
 	adapter->scan_processing = true;
 	spin_unlock_bh(&adapter->mwifiex_cmd_lock);
 
-- 
2.43.0

