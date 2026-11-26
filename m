Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658862;
	b=NmS7EtBXoPCNEVQI2Bo2+orx113J9FUFTasFT4rX5uAyx9XYsO6VTiB6y4DIaQkCsm3w
	 s/bXRxB8OZOs47gud2ep/ykcfYFqGjN4hix7gqgEbF+CNvYyCTQ8da5y6vV9GnTm9yppc
	 vCoL1tOLYKcxHJ+4zKJprsImWSLNt102cIC6cyDkqNw32pZx5EvT6zYjpNc5+x4ZbcX/v
	 EY3pYi5GNY+zLMd1XhBCo4SJ8jJ89ElubD52K+GnWfMXnZTocIMXKriI/JzBb7aJ5eG3Y
	 XmPbeheax29CfyWM35QO005ZE4MocwGgBeeKTIn8Gw9lGR6cIKJgzHe6NDeYME1S9hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z2t65+X6bE5g+Fc6Tg7IbK2g1t2NNkQ7zYkTkIeL4DU=;
	b=D5YPsCXod3icWz6/PtLm6HmTHmQ7IskxkFhM5JnZ9GZull2JPqSO3NnIY5hakap1I6BZ
	 WH6gJ6WSHWg0cvZouVKPWOXNzl+wgPDtEU/KFHKEkNU3cYkd6Yc5L8TMaX7beWVPznBWt
	 BbBdBzIlz4cbwtG9ZRnmXWF5OujQv5E65XOYnyZvg0iM6Zh7G0rsoHSv9RVFNekOXq0qp
	 sQVXAYaLKu0DvD6bB8wkl9grQrHW9LkXWbHggFv0ia0brThYWmGCpqlT7H6ldN4/XCQeX
	 hJM83lCAqdjCKVbGbzc9RttgZbQ3WgwvjsHMILJo+ZYoUSxd0Ni7ANZIWODrwAW6plg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvfnQzc5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JjuOCdOM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F076B606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F076B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvfnQzc5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JjuOCdOM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APNM3lT1175135
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z2t65+X6bE5
	g+Fc6Tg7IbK2g1t2NNkQ7zYkTkIeL4DU=; b=RvfnQzc5PTyXzRIxb60sbMdeVYx
	vgOwpaaCkax6zHTH3+bth5WtsxaugXvhqyTom1/yX3jNBQzZK7NGCIVzmHKvgZE6
	+2iqFDQm+u36/uhBTL/KcnCFVF4EOSMFkiDfOCrkXPXAvugrXb7qd2QFtblDtX57
	TblLmrMF7pad/Q2Uazihfiob1iXZQtElPQpSp2Q2uZHVf5smxY8VdbeklS0/Il4m
	ibAyJaffNQZ3ytC3cxr+qo8h4DwrvyLjgibsZXk0f3iCwH4lJed84KA3l2sYfwRk
	ZEZpHdXd/POVjpX1j8vEQptAaJG7YycUc1WQgI0xkxXEpIwJ5JhXKr/5jMQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61aht9mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3fa6c8d4bso6506597a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658861; x=1796263661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2t65+X6bE5g+Fc6Tg7IbK2g1t2NNkQ7zYkTkIeL4DU=;
        b=JjuOCdOMSz8YnuZwa9ofDEHpnqve4fcOphYQBtR1oKuHDFxZiFrH5VPS6B8A43Row4
         KBKmDLi5N8oqGYIHaeo13pzpXPnkbWIbGXtdQmClyhsYwTAadvDBE2rPbBRzm9K7gvyM
         wL2RjvRKrBiiREiDDy4yrf3VdQSR60i/m5jzmdKsaV6oD0QVDfeBVl9sBbWDKCfduGgn
         tF6Q8DLQJZjVc3qRmz7dIo5p3QIBEF0UCjnGVXxDuS2IHKgtT7GlLM1f7yEN/amzQCLs
         yxmU33k984XVp0oROLDUaxV8n/I80BYPa2E0cMA1SaC92+adPk1iFXoAVfS642UsRzA9
         PzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658861; x=1796263661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2t65+X6bE5g+Fc6Tg7IbK2g1t2NNkQ7zYkTkIeL4DU=;
        b=wZvChcPvSLNcaAklXR7+2kQFcBcsdPnjfCbzl7aC4gzlRJgOQBOJuIiWXO8Grj/QLL
         SsZaSp5INCIW8kCihVMM8EoZm0HvycKnjOy1TPaHd+VGpWpq3/SSahrhLuWiGTPlrNxv
         F2hsYbPhE2K/77HKwVkQ66GSUvNoAyw5yaGjjDqzj+86wkPtsL9oj9fymdzoszpaB6VR
         CwhQQzzSSBrFlJhUoMvEvBJbe5AWDs3YMVW1X5Bw/eNZH+zluWC+W/qMKr6tRAsK5lzh
         Rdt00O8qIC7iLldclMzaVOW0l+uCzv6MTdklV66xo97Nh5Vjav/nmBgmTf/xagWgxd4d
         YSCw==
X-Forwarded-Encrypted: i=1; AL+hErGjguGhI37mNN5SgnM5phIOn6iQnQIUD1EI8EfoQ0V4LSfdkvKFwKbuZ8ipg/uYuF+TzFORl5qVtKiVvj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/84+t8KBeXnkqfXOi8YjFqu7eCe4I+J15QozhNHiYeoaicjyoT
	ARPfmXrNqSom5VF/JUmujoSPahhny5VQMuot/PMO5nLSRXJH/vOcywL9uKcf+vFm2PBr07WRhCG
	fwrC8MYkPwPIagZH2U+JUme+nfEu34czCueLERvtP5X5vRFaXjGCHdoDHJg1nBGInAt4=
X-Gm-Gg: AZFdTZezhMvaRgtW9cXDl05Q2Byg3N/zvYLtgm6N8nS0dIQTgq2w4grYMU8xiGnWrnc
	ahJJHKg6Mkqiy4Xp4t5POepKHc+AdMM5Hg6suOriPlEYq6t3CvziV7ZgBCvjeGygXxtgr+5Tk2q
	uEuttoeQWQZaS6IfdIQmJ0bWizLFEfPSziCQdjcL9za9qrgHLB3y+cnZ4ukT2e2E0F3CEwd08f8
	aEIe5Za1T5cE73euponnN0IGm3E+xiVeaU16VwMOtNvM7+tweuoyz9FkGcvvMhtCdTaNnQLqCv1
	Nz0X2R0zih7dyheZbhZPCVcAx7p4FoFmbPpNMCFmD/AegvwofQwcQ8wN6AymTIBP+32f1mEar9P
	iGQ18R/E0hLNeaAE0MRwZ2eI3n+iuP8OC+FtvHhkMeI1HYoD/uEZbDYNqgDZkkh5T6NbpP9jfWV
	wXWrAZvokgQnmsjZKr+m2ECYLEZoSlwyhikKCm
X-Received: by 2002:a17:90b:442c:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3b41c92c161mr13102294a91.24.1795658860350;
        Wed, 25 Nov 2026 18:07:40 -0800 (PST)
X-Received: by 2002:a17:90b:442c:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3b41c92c161mr13102266a91.24.1795658859644;
        Wed, 25 Nov 2026 18:07:39 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:39 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 3/6] wifi: ath12k: initialize per-wiphy MLO iftype ext capabilities
Date: Thu, 26 Nov 2026 10:07:24 +0800
Message-Id: <20261126020727.3273337-4-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
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
X-Proofpoint-GUID: _w-kbeZD5WnT0pMNp_1XYSVR4tzySpxs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX21CiIsT/igzQ
 ZLc4dSYcr5ykO/vmISqOIOhSjww+QJBWCbnk2ZxPNBvMNTeei76pylrp09J0I81jQi3BQ/5LPGp
 nDIzKB1s5XsWsKhk99hdoBOutn8OChU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX3n2NSvacCzSp
 Bkr49IixBWEwjr0jGqYIZyhYothut3c0AMS8D9IGO4c8OjPsvwVaUQu3G7bJVnLjuWuIzi/WQYl
 sBBGu5W+hg36YhSWLc7FtB2iDvulz6ZWuY1/Ta0JrZ1UIbnr7KpXlN6I5vIMCZxAEcGLaCR0/ka
 EGsu/lsY80m/uItLSM+1QQ5kXLKFWU8GpqYk74EUT0Z0tQD2LZFWvhAQQvV1dRDlCL+wxN2AHW8
 phY0mKWIrVrY7T60FraxuiR1uLPzZFa5sWFYjazi/WCGAKvUhk07seTwg/CvEmox+cWYO/Xm8Vy
 xDa/gszYajrwm+yQQvNL0UJrqcF0JHD4rnKSiWOxUp2lfnRxBasM9qgRc8FR+iiFTiZFsCLLNee
 NbfdC+BpIcA21GF/ytEP/74xN59o7+Kl+KXCj96+O4ewnWUDT6iaIeuXSbpY28s5OiezGZP843O
 qiYykfFHisRUgHsNiWA==
X-Proofpoint-ORIG-GUID: _w-kbeZD5WnT0pMNp_1XYSVR4tzySpxs
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07946d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=PHNU0lTNFGNsHSJflXwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007

MLO iftype extended capabilities are currently stored in a single global
array ath12k_iftypes_ext_capa, shared by all ath12k_hw instances.
When more than one wiphy is registered, ath12k_mac_hw_register() on a
later wiphy overwrites firmware-derived EML/MLD capability fields used by
earlier wiphys, because mac80211 points all of them at the same storage.

Fix this by keeping iftype ext capability state per ath12k_hw/wiphy:
copy a read-only template into ah->iftypes_ext_capa during registration
and point mac80211 at the per-wiphy array.

Rename ath12k_iftypes_ext_capa to ath12k_iftypes_ext_capa_template to
make the data flow explicit: the table is immutable source data, while
ah->iftypes_ext_capa is per-wiphy capability storage.

ATH12K_WIPHY_IFTYPE_EXT_CAPA_MAX is set to 3 to represent the per-wiphy
entries ath12k publishes and updates: one generic entry
(NL80211_IFTYPE_UNSPECIFIED / iftype 0) and two role-specific entries
(STA and AP).

For MLO-capable wiphys, initialize station and AP entries from the
normalized firmware capabilities, preserving the existing capability
source.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: d33bc467e832 ("wifi: ath12k: advertise MLO support and capabilities")
Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  4 ++++
 drivers/net/wireless/ath/ath12k/mac.c  | 28 +++++++++++++++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3a92a4b03359..82aead52fcaf 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -42,6 +42,8 @@
 #define ATH12K_TX_MGMT_NUM_PENDING_MAX	512
 
 #define ATH12K_TX_MGMT_TARGET_MAX_SUPPORT_WMI 64
+/* Generic, station, and AP entries in ath12k_iftypes_ext_capa_template. */
+#define ATH12K_WIPHY_IFTYPE_EXT_CAPA_MAX 3
 
 /* Pending management packets threshold for dropping probe responses */
 #define ATH12K_PRB_RSP_DROP_THRESHOLD ((ATH12K_TX_MGMT_TARGET_MAX_SUPPORT_WMI * 3) / 4)
@@ -812,6 +814,8 @@ struct ath12k_hw {
 	struct completion peer_ml_id_done;
 
 	u8 num_radio;
+	struct wiphy_iftype_ext_capab
+		iftypes_ext_capa[ATH12K_WIPHY_IFTYPE_EXT_CAPA_MAX];
 
 	DECLARE_BITMAP(free_ml_peer_id_map, ATH12K_MAX_MLO_PEERS);
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4cb41b8b1d3b..e78c711b7832 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14758,7 +14758,8 @@ static const u8 ath12k_if_types_ext_capa_ap[] = {
 	[10] = WLAN_EXT_CAPA11_EMA_SUPPORT,
 };
 
-static struct wiphy_iftype_ext_capab ath12k_iftypes_ext_capa[] = {
+static const struct wiphy_iftype_ext_capab
+ath12k_iftypes_ext_capa_template[ATH12K_WIPHY_IFTYPE_EXT_CAPA_MAX] = {
 	{
 		.extended_capabilities = ath12k_if_types_ext_capa,
 		.extended_capabilities_mask = ath12k_if_types_ext_capa,
@@ -15051,12 +15052,25 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 	wiphy->features |= NL80211_FEATURE_TX_POWER_INSERTION;
 
-	/* Copy over MLO related capabilities received from
-	 * WMI_SERVICE_READY_EXT2_EVENT if single_chip_mlo_supp is set.
+	memcpy(ah->iftypes_ext_capa, ath12k_iftypes_ext_capa_template,
+	       sizeof(ah->iftypes_ext_capa));
+
+	/*
+	 * Copy over MLO related capabilities received from
+	 * WMI_SERVICE_READY_EXT2_EVENT if mlo_capable is set.
 	 */
 	if (ab->ag->mlo_capable) {
-		ath12k_iftypes_ext_capa[2].eml_capabilities = cap->eml_cap;
-		ath12k_iftypes_ext_capa[2].mld_capa_and_ops = cap->mld_cap;
+		for (i = 0; i < ARRAY_SIZE(ah->iftypes_ext_capa); i++) {
+			enum nl80211_iftype iftype = ah->iftypes_ext_capa[i].iftype;
+
+			if (iftype != NL80211_IFTYPE_STATION &&
+			    iftype != NL80211_IFTYPE_AP)
+				continue;
+
+			ah->iftypes_ext_capa[i].eml_capabilities = cap->eml_cap;
+			ah->iftypes_ext_capa[i].mld_capa_and_ops = cap->mld_cap;
+		}
+
 		wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
 
 		ieee80211_hw_set(hw, MLO_MCAST_MULTI_LINK_TX);
@@ -15083,8 +15097,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->cipher_suites = cipher_suites;
 	wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
 
-	wiphy->iftype_ext_capab = ath12k_iftypes_ext_capa;
-	wiphy->num_iftype_ext_capab = ARRAY_SIZE(ath12k_iftypes_ext_capa);
+	wiphy->iftype_ext_capab = ah->iftypes_ext_capa;
+	wiphy->num_iftype_ext_capab = ARRAY_SIZE(ah->iftypes_ext_capa);
 
 	wiphy->mbssid_max_interfaces = mbssid_max_interfaces;
 	wiphy->ema_max_profile_periodicity = TARGET_EMA_MAX_PROFILE_PERIOD;
-- 
2.25.1

