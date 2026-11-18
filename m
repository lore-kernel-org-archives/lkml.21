Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989806;
	b=wuK/VQM44nwz9Mip5ZGzjpbLzBCe4Mk0d6oF/mmtBVtbPum/bkI3FcrmO/1dY4NSfJMQ
	 2W1FtAGvleAUYahGBpIv22afFSQbdKJ3TcKhTDp7XUp+pdAT3MCFHFQ7L9UpUNc0UMGzS
	 EC3+6Ro7AufpNbL5wWVYCe0l5+93hCb7rLzOV4Ll2oHadR/S0R3ULSWq1DHj1sP2gcKyc
	 FonN9wu8xrxd46Wf0oItYcrDB8FyqHudlyX43Du7+xg3UTZ6kV8fbr1UiWnCGHLHAVTPK
	 0sCBA2mbM6B5Ntj6u5x3b3DzHhBCG4avIEYyLx+T3+UyAOo5LvUknqaIg2NiiMLxLHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
	b=unniwq7GkH3LpW7kiQpk49/f7myBxEeQNr6tUo0Pv3nB2EEGkBoQBcuZ6XtMsVvTMesK
	 cK43VGCSWr7t9MUuwhSv+1GKM1/ICQYZ+VnaEkd3qx+xGkeoIZbsl67e08psloe716Ofz
	 tmEIzjANz2pOOmIBbrG6U0Mo7zbfQaKxQAaH6a4fyx070LHkzdtELtSveQ/6JT1abqn+4
	 DWvYRPxwOgaFRfnZvMZpCLMT1DDoQDq3j/jeJSUdIfEq9BWroq+RXYQNTlHrMMVMitiA7
	 kruSAVo/dQjybQ4xr7OsvU3y4oOrvA+L7HycuuvV6Dt8yC05+PDAC/B4qM78Iy/eruw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i37Fqcqr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ed5tyPLr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A0A606A89A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A0A606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i37Fqcqr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ed5tyPLr
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UrTh2383089
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=i37Fqcqr0WtKm1La
	dCTCT8Q8n9GLoaab3+q9uT7sbKLcrOEZiKgW5mGoBoPWE53ksCBnAK69W8bU5Ffr
	zik154VIWhmqetbNcC09qOrkMhOv+enxhywW0B4CLNbNeS4zAH3ZsILH/dFv/OqM
	vNi7jwugqr9VuLLr/oGInFgcswoHhixpoVkVeQIK7DSNNsS+LT19SFrZ2onZsA41
	pRY7UX+TE6NJbmahpIVzvkCboy12o/SYjitHGvSR545i08N0x4V0Jjoxp+69NrIY
	I5jGg62mE3/gHFepn08/5hU9Q3g7JtaE/VBLCzrMx73jdaQ9vHXklEIEcJEX5vXP
	3HpHRg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvat0ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3ad195a96so659040a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989804; x=1795594604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=ed5tyPLrSHji9aY7fPORKlyoeAC19ZqQzkCbJ5ArpOfWmtk0qBqa9DndSfD2jPVtro
         ejYh6+0wWu19VKt3PCnDvBsNFhsLpRLNkFK98nYfHdm035KL7DTScE6GJ5mjQX71/ki4
         JUKYqv/9Jsq8AdPCGwkFEmV+Vn4/MWZ4ACGJ9K1QKmCpVNAarPcXgRKNinEQICQ1GjgI
         oggUYoVNVDELmfFiD4AzLb3Eiv8oWu/XDBBQRPcXWj0IwcAunrR2cQbBgJLiVWL0uaav
         xxiWor7Vn9nJ8oyVM2v9HZ1DCpVUU+ZiDwOqN9znx/SmF+a3pUxDG6kMlUgCAcuaKS7a
         5SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989804; x=1795594604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=Ajk8gkwHXtAuEtPXukwCTRmL+/Oq+w3EI3bLP+vQUuWs58+hQp8Jw0SEWCh1tWDcez
         1d797T4yp7cReMxJKmtw58O/8tnGyR+VzAVERtLV8n9vvuAasgqHQ9UgKH/ljevXvSTn
         BvSdL2N0aKpoHUQUBtklqkv5gC9DxMW29GdvJdQM0zhLnbiLcVJ3p+fdNAihD7D+lrQr
         A0gpfyFo/xWl4DS6fP6Uq+R63HuvxWVPVfqe1QBHewvwyQXz2Fci62XxrLe0n6MPkP4B
         X4TyjV3sxgmTTY6aVvSAXAjHbod4Y3DViJdDg0pKFJcky09qaIhjeOhayXToX7p/m9vm
         D5eQ==
X-Forwarded-Encrypted: i=1; AL+hErGHYNzIsM8GszF26lYCoyubYpsNsY+gTFynF5R3dhoLnBracUVfNyjTUz4CqWUas08oT6H+0IagQIJ7FiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PnqCrqo3q8AssSd9dOEijP1getAwOWIAA52hsfoSNa/FjKpO8
	y099xLwDhzI+NLPQQB/FRk6Vb0KXw7j9Q71nUr2jJmwOMUqJfPOktHcmUZS/7+ANYZ/2OoJF5F1
	9bS1kA5tbh5KqI+vjDQLQK4IZa7cx0/xfhM0sneEsJ1+ythIBd5TQ46HyzzDraenZJxE=
X-Gm-Gg: AZFdTZfhCnb/JaSk0qAsptgNYanHLYSzt/53tfSYZg7pxkC5hOzkbbTmLkqnvcgBD7t
	HVHEfUb/jyAub+ngybx/Lo70l8oXPXH8SqQJhiVHgkYYEm9Vdw59yXK4U6cYLGEZY6eboOnJq85
	5XEJDnrX1Pa7nDjQWvgCdx1bGx7cwfIH40xjirxkSjrqdJXUdOxr9YVpxYcIbQQ1MoOuF5WSRN0
	vrnHYtrCAj9kgLC59Uyn+KZdRALS0Ua4Llo0rVzY982iIYIHAiMM9aE8tH2KdTqaDh6nmscevRI
	Cak7+EvlaKoTbgLeBKXtEQUzFNTuD6Fa4jf33GMr/Bwye4OXDoCi9hZ93ox4eIMDJBAXp75G6kU
	en8ACj7xs3t5NCh+hlJmOmWC4ybjpsrjCJg+DneQF+zsOiJt+BFpHWd3QZqJiRh73qGOJRXRD3l
	Mywd0ucWd6oSpSDgQVWOdG0oWQiFuFn1+VEYY1FH+j/LKoOQkXdZmSIcFHwsoQVDbl40seJ03dJ
	Q==
X-Received: by 2002:a17:90b:1b12:b0:3b3:ab74:cc9b with SMTP id 98e67ed59e1d1-3b3d04dd0bdmr2115719a91.0.1794989804466;
        Wed, 18 Nov 2026 00:16:44 -0800 (PST)
X-Received: by 2002:a17:90b:1b12:b0:3b3:ab74:cc9b with SMTP id 98e67ed59e1d1-3b3d04dd0bdmr2115693a91.0.1794989803982;
        Wed, 18 Nov 2026 00:16:43 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:43 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:37 +0530
Subject: [PATCH ath-next v3 14/15] wifi: ath12k: add and hook Wi-Fi 8
 mac80211 ops skeleton for QCN9575
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-14-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd5eed cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: madZVpRi_noTvJbn6nTz51BgQgKcPtHL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX5D1A3WhtI9/K
 IGXkjk2/yKvsRs4hnputI39FY/NBw1gjpNiVo3E0x3/ucX4Kdn7bWhm16SwUu+U+52ifYcS6Nnr
 Gaygri5y5DMWfARb8MgbE1ybLPZilrjdJsjndljS3/uk9UuxX9fyU5pCazHQnJi0dfhppGalq1w
 xWo9O0T6SzcjIFbkIG0qI0zVjnXm+xzZirG/NNRU0+2Qww2S9+/46jRFeJEdlAvtJrf7/S6N4p9
 ZxfmdPx5vzS5nrAR7CQanyQqVkjx7Y9UhvqW3wNwE2xnaZ0D7dCrG37Wgy7aCoTufweZBvjhMbv
 oZAD47hXmEvqtHizqQY4nExM4ihFvQEZ3h1zywwl2oItrcEgcpxp+PxuVM9cQ8tAMsCQEZyDS3M
 rQ7MyFGZ3REJZg1Es1WVL1P8/Kn1EruMfXkqai0rKWhGgBiB9VNm7/CrpQ2PXeuk5hY76PvFIko
 yliyfMO8oVGSTMeIy6Q==
X-Proofpoint-ORIG-GUID: madZVpRi_noTvJbn6nTz51BgQgKcPtHL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX+MfiKPfK+0FL
 PKLx44OrTlzStzNM15lAVOcAoE++4corQE10enx7odO655H7T/UBmDU2Z8cfyYP88ckkbTYs9D7
 pAwNA9AG9OO0ySHL1+XTl/iDsDgVRzI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Implement an ieee80211_ops skeleton for QCN9575.

Add ath12k_ops_wifi8 in wifi8/hw.c as a dedicated Wi-Fi 8 ieee80211_ops
table. Introduce a stub Wi-Fi 8 TX callback (ath12k_wifi8_mac_op_tx) and
reuse existing common ath12k_mac_op_* callbacks for all remaining mac80211
operations. Hook ath12k_ops_wifi8 in ath12k_wifi8_hw_init() so Wi-Fi 8
devices use the dedicated ops instance. The stub TX callback is a
placeholder; a follow-up patch implements the QCN9575-specific TX path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 92c897de16f4..30188f4fae02 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -10,8 +10,11 @@
 #include "../core.h"
 #include "../ce.h"
 #include "../debug.h"
+#include "../debugfs.h"
+#include "../debugfs_sta.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "../testmode.h"
 #include "ce.h"
 #include "hal.h"
 #include "hw.h"
@@ -152,6 +155,72 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	},
 };
 
+static void ath12k_wifi8_mac_op_tx(struct ieee80211_hw *hw,
+				   struct ieee80211_tx_control *control,
+				   struct sk_buff *skb)
+{
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+
+	__ath12k_warn(ah->dev, "wifi8: tx stub is a placeholder, dropping frame\n");
+	ieee80211_free_txskb(hw, skb);
+}
+
+static const struct ieee80211_ops ath12k_ops_wifi8 = {
+	.tx				= ath12k_wifi8_mac_op_tx,
+	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
+	.start				= ath12k_mac_op_start,
+	.stop				= ath12k_mac_op_stop,
+	.reconfig_complete		= ath12k_mac_op_reconfig_complete,
+	.add_interface			= ath12k_mac_op_add_interface,
+	.remove_interface		= ath12k_mac_op_remove_interface,
+	.update_vif_offload		= ath12k_mac_op_update_vif_offload,
+	.link_info_changed		= ath12k_mac_op_link_info_changed,
+	.vif_cfg_changed		= ath12k_mac_op_vif_cfg_changed,
+	.change_vif_links		= ath12k_mac_op_change_vif_links,
+	.configure_filter		= ath12k_mac_op_configure_filter,
+	.hw_scan			= ath12k_mac_op_hw_scan,
+	.cancel_hw_scan			= ath12k_mac_op_cancel_hw_scan,
+	.set_key			= ath12k_mac_op_set_key,
+	.set_rekey_data			= ath12k_mac_op_set_rekey_data,
+	.sta_state			= ath12k_mac_op_sta_state,
+	.sta_set_txpwr			= ath12k_mac_op_sta_set_txpwr,
+	.link_sta_rc_update		= ath12k_mac_op_link_sta_rc_update,
+	.conf_tx			= ath12k_mac_op_conf_tx,
+	.set_antenna			= ath12k_mac_op_set_antenna,
+	.get_antenna			= ath12k_mac_op_get_antenna,
+	.ampdu_action			= ath12k_mac_op_ampdu_action,
+	.add_chanctx			= ath12k_mac_op_add_chanctx,
+	.remove_chanctx			= ath12k_mac_op_remove_chanctx,
+	.change_chanctx			= ath12k_mac_op_change_chanctx,
+	.assign_vif_chanctx		= ath12k_mac_op_assign_vif_chanctx,
+	.unassign_vif_chanctx		= ath12k_mac_op_unassign_vif_chanctx,
+	.switch_vif_chanctx		= ath12k_mac_op_switch_vif_chanctx,
+	.get_txpower			= ath12k_mac_op_get_txpower,
+	.set_rts_threshold		= ath12k_mac_op_set_rts_threshold,
+	.set_frag_threshold		= ath12k_mac_op_set_frag_threshold,
+	.set_bitrate_mask		= ath12k_mac_op_set_bitrate_mask,
+	.get_survey			= ath12k_mac_op_get_survey,
+	.flush				= ath12k_mac_op_flush,
+	.sta_statistics			= ath12k_mac_op_sta_statistics,
+	.link_sta_statistics		= ath12k_mac_op_link_sta_statistics,
+	.remain_on_channel		= ath12k_mac_op_remain_on_channel,
+	.cancel_remain_on_channel	= ath12k_mac_op_cancel_remain_on_channel,
+	.change_sta_links		= ath12k_mac_op_change_sta_links,
+	.can_activate_links		= ath12k_mac_op_can_activate_links,
+#ifdef CONFIG_PM
+	.suspend			= ath12k_wow_op_suspend,
+	.resume				= ath12k_wow_op_resume,
+	.set_wakeup			= ath12k_wow_op_set_wakeup,
+#endif
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.vif_add_debugfs		= ath12k_debugfs_op_vif_add,
+#endif
+	CFG80211_TESTMODE_CMD(ath12k_tm_cmd)
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.link_sta_add_debugfs		= ath12k_debugfs_link_sta_op_add,
+#endif
+};
+
 int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 {
 	const struct ath12k_hw_params *hw_params = NULL;
@@ -171,6 +240,7 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 	}
 
 	ab->hw_params = hw_params;
+	ab->ath12k_ops = &ath12k_ops_wifi8;
 
 	ath12k_wifi8_hal_init(ab);
 

-- 
2.34.1

