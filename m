Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982825;
	b=5Of8goRg8l1I/x4S3vSGzb2TT4qHK/HwNCOnfPQxEiVqhfkvM2Jl0xvX5ZIPVRtOwuQr
	 UAm7iRfxXB50i2AKGPSJbFe89r/lMUGL30VtBfWjscc3gUkJIBdXzV+V9db982+BxLYcS
	 c3Av7YIM585gN5LmkTDFkFVfwhjomEfq6121cCFn4hK8X5uJdbyP7L1nJHh6hqXEfE8DZ
	 yiEW+lT1NeRQGE1DWyALVZ0DjuY47Kr6AruwQ+ICin0cE93PYyBbqzOhSpa1vqb2jvhpa
	 /znEIZrSccQ5qndZiBiZ+sv53fL9FL8oeHYrkF10ZCUzBtpYzfq8mJ9SB/HdPIn08ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
	b=iVKNgpFrmr9KLoqPs7U8jEusXx5+kQsxfIHhd89tJjD623+FLOggeVPXBx9EwmDRWY+D
	 tyl2mNQ1ORjhXdh5rzaEmCMoXguC7kBwuQD3UukTEL0XFulwDIKmpSpcb00KVlh3eA3CC
	 K6cQm4RKs65F0XQ5QhdJbA+bqWdY14TX+pPrF7JyhE+jbCLH2HKcjHDVpoLI9vuhteNO9
	 f+ShA0bI6z0SPkLUj1/CboDOpaOtrncEm3V29Y7LHs7KN9WTTqK3nhLn61QhUcD3agKEc
	 m7n9E+uqS3xsDP0ei7aHBNnkLY6BvCUwn+UHUu/I0ClejBT8hbjDyEuFZkKq4Cd5ZmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dszaCtyd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyJ4CnAY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE81606A890
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEE81606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dszaCtyd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyJ4CnAY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1sp1430569
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=dszaCtyds8GmMzRu
	NqD6eCTgNjKoLD0nH7upIT1h1ntWT6epLgYzGDty0aregqwoDkWmhB6/5MpuJ80w
	s+15kvbwQX8Y3Ue6DE0GQr4KgZSo1ItfsZUQrEnHP88PGqByHXjvyxn3lhJjKBhM
	5kqK460fUsQ9/ydIzndcUmWNLRgvOYHYfQGV+LfwBooW7q7TmLcrXtDMcunAwBBW
	TVje+G1iha8VjAN5jpc7qA51QPsLQq3GJ/Lo3rhIleNBWTRl/BlJmL84+jwY11Tq
	ZfSrzps7LX3mH6qsRfHiLwmJWZzqYKxlPEuh0o0gWys4DsPisHJ+/rJlzEqgWDUx
	TLo6FA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91hke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso691504a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982823; x=1795587623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=TyJ4CnAYvTdbne83NklQM9RvnGrNt1L1ZLrIFWGWRt47F7yxug+bh15XW1bNaC5cYp
         zer8tUlG6OWimATSqda5LypY15iAY4x46SiMec/jR6FcgMMF5XXfFQHx4+hxTs4IOWjS
         SoGYAwV5bkcxfZooonLROwLBbUqebz7BpMKIzHbK/kQNHj3qFfn3tn7JcWCb2tGT5Nqp
         rXoYYXC3Ld2QmIZcZLaDTqGbi+/xeSglCXg+ehuAhr105a/kFsvP9XrGxLqdCzH9fzST
         WRDBFYxd9EL0OlBHC7TsHK8LGGa0IV+mU5lzxTmDjFp3xJ4D/WQkIeokCF7XyW8fFjIA
         Zm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982823; x=1795587623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=KS+jibd7W+vsGhLY1FOtE2n0Z1hdFQ8MTL5/xW95vUqx/WTQLjfm+rSpV/4ONFbEik
         IXwnFNu6rADp3KUdAJG/a8vum+lEJjyQTfKi2SBGwLWartvnglurK6eZiQqMfSEcQIgX
         O9rwcxh8va0oLudFlzhcdtCNVUN1r3AikB5lTHmvqpwvBQjWdywfO66HTo6arWgv9Ov9
         5KIah7bSWTKraJT2Og+Nj400p6MHWTU8ZWI8pgQ48I5VzN2btX00EPeDetNDJ7zFEGMz
         Jc79VJC8h8swNvKH3CTqDCefCc6TjF7U8vmoW7nhRCZUNPv6a4gRoxmLk0W3YiD/etJ4
         tIuA==
X-Forwarded-Encrypted: i=1; AL+hErGekQqLiU0pEczKZE4iC7hgofKr0fpKDD/6bZcRqQvPYAJ0v55/4YmyLrzg9+Xpc/aj+Qbp5J8nc4b0G+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dBb1NHyTr3BD22jKsF5AevFRglf+/emQ3dhQ2qhevoNnOwmQk
	HjcqxPWCY/SVO7WcHuDRdRsYxhDxGlpBihHgpDiS/UFJ09ADeSlky50zCe/Aabsq2Oook+9EsVr
	rngMC/dxaVds1PxVI5CD1LS77LtHG1knoL3NX6vxgL7BTJbB2cI9EmQifUU5mIsyo/So=
X-Gm-Gg: AZFdTZesIcaFw7CFm8sWsf5NKmKd8PoJWfn1PzC2VVzTJ0Oz2CBaMlHxxGOBmS0W2vp
	9pxbtrKe9eL/9vqXfV67H4eAtKtNHwyUm9+MJQkCjjpajDWDo3do+I0pRTn2oK8lBpHdggOE2/N
	Q3ySp0cWRGS30QxyDS7uGOwiViBTI8keVPZYWt8b6pYR+UbsIsEVxJOohalOSIlUTe37Z4+qJPy
	WGwXd3/gjt1p7sGW2Vq8d5WEhJjgjsAsQGNaOn6o4yatmqf9uQEa+DjG03IRFj0OgYQQLT8fhnM
	ttGjJx8lLYQAJRsEOvRQUNhNRHRVgJ7tZ3rZvapY73YuwnkWvmPpv+iUK6NALIHghm0CU/JEaTx
	vccn5wJb0cufhIwLQaAEt6REHWwKxqs2sqOPSJy9bpRg/hs94VbwoMB2OnLD6bU6NxszdVWBubE
	7LTz8IRMr8TaFaQ6AhP3aSRX54T2/Kyad7tgz9VnE6V+N3+jck3uu4y7PEpVqQaM6e1kkg0qq11
	pw=
X-Received: by 2002:a17:90b:4acb:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b3d07b08a8mr1866336a91.48.1794982823191;
        Tue, 17 Nov 2026 22:20:23 -0800 (PST)
X-Received: by 2002:a17:90b:4acb:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b3d07b08a8mr1866309a91.48.1794982822752;
        Tue, 17 Nov 2026 22:20:22 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:17 +0530
Subject: [PATCH ath-next v2 14/15] wifi: ath12k: add and hook Wi-Fi 8
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-14-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXzqYRvykCPsbp
 A5PXdn5rDcuh8nbvSxGCQaQnqJ5wCismIaNDfrMTzuOnDSvWuMLbcYjSpW1TYPhg6OrGTuUYs3c
 L5tiA1Y6iI2CB/o2o21Im2WVAha4KAf3gL8DY/IiLYsOaOnS8sY9RvbQhWyH4773UwueSBk83xm
 9jATRvzdAOYwW3x4EIKLjkCUvhDEJhJUmuBJPKupogmcFa1UvZLEF74HeSDWMjjJw7PDdvzFA6D
 qSsoGefYzyfSqlbHZwHMsW/Pklj81btC5m1In+m0bBZSTP/eaXr0s8i01V3nZGCx/IqvxHMC5dr
 5fVPNlEBfVFV3OuwQfiK6mUM9uBLATRN2xa6JTFfqIFF22Qw0wKsXSt9/TICL1ZltKWmarjpF7J
 QBdQxmRr8fGxOsQ66oljh1tyRfruwNaR1B8rqy6ysPmmC7g2dUWycDbBvuAoAPc+YqX45ljSeoG
 hVJgn59MBoLvU17NOkw==
X-Proofpoint-GUID: ghcjZtWVhZM_-Z5mpzzqUkcDVteGBaFJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX+jQRLt5kmkEm
 GVJKlBlQOCIGbSSKmyCAmHO7STBuJ9oOQybnKmPsFH+p/8xv4fJz3SSsxgMZk71SKelm5vqrG6i
 3NmwQoTYyT77luNXE78cH3m64srHG/U=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd43a7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: ghcjZtWVhZM_-Z5mpzzqUkcDVteGBaFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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

