Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658857;
	b=OOzhuSxYfi9S0+SmQ8Z6rFfc35MNZMMyZ2NVlbHVPBO9qFI5LDGc9hyjOm3Xv4D3GMs/
	 qCa+WPSeTf8h85sVz+p4RtdejXuxfRuPQ2z3PNlRPXj4+GXNYiIdl+79xAiUhhDv1d6p7
	 iBIh9bMujxoMxTGABty4M3cH8hqKPwjv4Q9XNa6bwb8jQ3ZEVGED4m8l9y7L6irGTp5ZE
	 co5fn9Yb4gW14QJhmS9AlAyx9OuKXL6IPhK2rpymgKUkGOutSSrFaGPGLtRi6YMJG0NcG
	 z87cacyrSI4jZeuWFOJs+UjsONG7KEWzROllxTgBdk394TQUO7IEumPjajhP4bGSrcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7s+V4BLd85h76ihqq+nMlOQ0TvRPx9Tm9I94LPUS5R0=;
	b=L5tVngVTqf/3sKyFXGdoKjBR4V7FGmXEf11mOusAlLc2HQZCrGmPJu0n6Ao2O3EV5b1W
	 zBlzQGSlvJ/6IMrL1hUXpBXRL5Wdg76JCleEFq4yAqYdVONuidKWVX3uphPnT/o3Tk12h
	 mo0RA+7+Jm2QdyBKapnMpWZVvXUQR81x8Q5BiH9vLtRcPEoNfj9lzyvIWuot0LWjVuOuO
	 SDsgWi5mrY+FMq8I8zBi+VHp3Mb14YCFQZ/7FO2H6ZNUuiooWsPtzVd8UXZOfXDs2Du5K
	 4zrqoeCHJv4Mx0QVrmPsIzc1eErDHuCjpFdqClCyzHLKSs+pUXOxJRGaEEGw0NYG+sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgyVSNcI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FhcCOMSe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF983606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF983606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgyVSNcI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FhcCOMSe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJArqa1357644
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7s+V4BLd85h
	76ihqq+nMlOQ0TvRPx9Tm9I94LPUS5R0=; b=lgyVSNcIQgHh6RspzqQ89UQ2QQu
	XMfZY/52O7IjCqeJ27QMDvkyGSma42fEn8mQf9K6u2ygvsc5v12tyu3xNK9rC25s
	1MiVn4rYOShsyEEEPCwpK3ldWyQ4oubwLhZzzcRcPUdMyTOc17E19iMcZ1tJZ7Ik
	aPw595S+XMXwLkpInXOo63wScp813UK5a8xHv5Ab69I71uCxXnFRn/xJJ2gGFdxU
	URY9ttIkhniKatib+enng9ECoyjINuQRmw5D/pbWwmqWITBXoybYt2tBra5h614V
	p0fZJp+TCbQo0RLGsvCMNHrthCfRtXVVceg54yQO4S5eqJGjaOTg1pkyqTg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxtsgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so4907905a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658855; x=1796263655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7s+V4BLd85h76ihqq+nMlOQ0TvRPx9Tm9I94LPUS5R0=;
        b=FhcCOMSecfPny+GFpU9Z6u/QtaTVMTnUt9sYU7sL7dc15ksmiWOBwD6koMND1kR99J
         BF+2raacKy3K+/uiG9MU7R0LEkJcEmwD9IK2MtBauZjvYfT5ypSqvfu/5/ohUsHyqdqJ
         e9JKFeQptWOXtaj91Asqzjyo0EBb2gPlZg4Vp0IlGireFyFj3oxblXO1PlLnN68rwHkd
         HlwXY207DDmLIRr8orQQEPSChGWH/vl1tWBfHmm7dZTLiH1nm9VKklXVMat9NA4PylDy
         RzJfVmqxLNCqeKwf5X69keDdKvq5gZGUK8LRLUB3pwfH35Fo/yuvbNkI2/n8obfzp2wY
         zSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658855; x=1796263655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7s+V4BLd85h76ihqq+nMlOQ0TvRPx9Tm9I94LPUS5R0=;
        b=Ak5MGzBbz9VT66PalzDWWMnGsMnelc/B8mnRrgOTva7wNnzxa048uEe9RhWTY1jeGP
         JkwJL4WDPZeQ0OBph95vY1X4uIRw6P60O7lWOAY+NhrKrWwiHlGqHfwohHaVcasE8wsv
         RTi1Za3zm7d0Pw33amyMZC3XZlIZbcE+hvQoHcZZVlx28u0NmX1z5c/hanX9/P+Co3kj
         iu1lkTGsgXy1TRxmKOgH3zbLBDfYjDacGrxqgWAGfA3GCuPWkS/2sTzF5ud5Id6r6N+K
         4aOWse3sBiZ1KxJtxxjUFFyDZpC56EMFcv6vSM6X1NX0LiXLkbfOcDF2OoNclY6ca6cm
         fatw==
X-Forwarded-Encrypted: i=1; AL+hErFTAxEDD/pyUtUoG8RPiSA5NP1ZkkNnIvl0LBvIOoBO/qJN9aD8V3w4jwvBI1Z6aB48chAVGgWed9QJRTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r4tdC1JZNR6wF5JGK6a8ES7Fidobsc5nQ0aIWe++RGHaNed0X
	9yCS3HaOkEjvDtjTWiG/u6EgIFtvt6x21dv9M8GlGz29DrIcJ/GZH7dulkS7RUynoxkWpqlMdYs
	PlyTZWo2D/mZyZmLGUL3x7d6SDA3eFeM1XHgigpw7cDF9WabDcK062eIi7hA7xWmP2Rc=
X-Gm-Gg: AZFdTZdiWkDsPQ9mC2z2rC54lmXpVW0Z+qa05vHh+8WGmi5h0H7mAiX4TDi4taUZx2/
	L8Lzk422ec3rRjxTr3jQqTVNP0ahia0++ZP7VsPEMq0G/p62ZopohbGvZ0nxKVwmyW3kNf29YHu
	fM4+4DBWcsf/oWsW4NdUqdbboEHOKQzkWO8ccloVCW/dw1BXdcSKyBUloS+6oMCm3obTl1Is07M
	SLxDnWEecX1SKaJtpfiNj7D3RrCMb05b6fSYos7ZAvDymWWQUyWoUw2tYAtxz1tOQrzFspElVGH
	VsRbJgyIv2/4aYu16TyBYTWlhcmQ5CgGsPk/tHmwZtd015fPtyxP74qMMHYK5SZCWFAyvecLrhZ
	sBGPWEyFpQGcLwk/gG2cttRlMLeKg6ANOJTdXd8n9SbAei8E1BraeMqcqggMl3NiBGQUq4D23uE
	7O77OmOrNv47A+ltv/myxemz2bWHjfQyhPQcRV
X-Received: by 2002:a17:90b:4d10:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3b41c8d4860mr17941787a91.21.1795658855352;
        Wed, 25 Nov 2026 18:07:35 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3b41c8d4860mr17941755a91.21.1795658854563;
        Wed, 25 Nov 2026 18:07:34 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:34 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 1/6] wifi: ath12k: encode MLD max simultaneous links as N-1
Date: Thu, 26 Nov 2026 10:07:22 +0800
Message-Id: <20261126020727.3273337-2-hangtian.zhu@oss.qualcomm.com>
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
X-Proofpoint-GUID: U5MF2sG_Iyo6Y1wE9JoVTBH-nkFeXUaC
X-Proofpoint-ORIG-GUID: U5MF2sG_Iyo6Y1wE9JoVTBH-nkFeXUaC
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b079468 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=G038fZ69IvUhEtWw0z4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfXwg0HrfXx3K3F
 KSCIVTBlaQNuOSfWipPjiVxNHhy2g+H4HP7hUM0NhHp6bfs1/z0OmsJGhH0I9h6fZYbENlxv4UZ
 tVsOvLDKtCVcBFPCwG54JeR44S/IYuB3VlLLJZ5cW3yVT17LDXd59o1EnwisIvH74UbVU6Zl3I2
 naygBRGXfyxp60TH98MQnaKvVF8ODc6bn6r/3neYYwmhih/DQ/m2CbrsJoFej3TDSKBBb224GEr
 kwrT+SUOiKSvFZ4s4UI4JosMLO8E+c0Cf8zFmjqcIM1DkpMXDRXsoJUKBFPmAeYF2Mi7KdcvV/K
 coBYCkqFwHEUdrzSW2UVjn/8hdG3T8tRpg4leTbms431lZ0CPoU0lV6O7rd7IgbCC4kAGsrdozj
 087tRp//JfUafvngZwVWQcWJpRk7ZNjCO1OzLt7IBogRvUyZ/ivflsrshR5nFMdOH/XVwXV8yWb
 tVumcpRT5XqjilvlxZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfXy1xoQQMviclU
 V8SUF/40/SCNvIq4Bq+VmVosb7dGJwPLbFMDLuZwUoCW6kbvM5NWCudvG6/S96Zuf5KMn6/54nh
 uTzFS6OYoeFXuYtH1vVCyNrvRA7JYa8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007

Firmware reports Max Number Of Simultaneous Links in raw form, but MLD
Capabilities and Operations advertises this value as N-1 per
IEEE Std 802.11be-2024 Table 9-417n.

Normalize this in ath12k_wmi_tlv_mac_phy_caps_ext_parse() before
storing pdev->cap.mld_cap, so all users consume spec-encoded values.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..d1af43ede2ae 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5293,11 +5293,33 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 	cap_band->eht_cap_info_internal = le32_to_cpu(cap_info_internal);
 }
 
+static u32 ath12k_wmi_get_spec_encoded_mld_cap(struct ath12k_base *ab, u32 mld_cap)
+{
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
+	u8 max_simul_links;
+
+	/*
+	 * Firmware reports Max Number Of Simultaneous Links as raw N while
+	 * IEEE 802.11be MLD Capabilities and Operations encodes it as N-1.
+	 */
+	max_simul_links = u32_get_bits(mld_cap, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	if (max_simul_links)
+		max_simul_links--;
+	else if (ag && ag->mlo_capable)
+		ath12k_warn(ab,
+			    "firmware reported invalid max simul links value 0 in mld_cap 0x%x\n",
+			    mld_cap);
+
+	return u32_replace_bits(mld_cap, max_simul_links,
+				IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+}
+
 static int
 ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 				      const struct ath12k_wmi_caps_ext_params *caps,
 				      struct ath12k_pdev *pdev)
 {
+	u32 mld_cap;
 	u32 bands;
 	int i;
 
@@ -5343,8 +5365,11 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 					  caps->eht_cap_info_internal);
 	}
 
+	mld_cap = le32_to_cpu(caps->mld_capability);
+	mld_cap = ath12k_wmi_get_spec_encoded_mld_cap(ab, mld_cap);
+
 	pdev->cap.eml_cap = le32_to_cpu(caps->eml_capability);
-	pdev->cap.mld_cap = le32_to_cpu(caps->mld_capability);
+	pdev->cap.mld_cap = mld_cap;
 
 	return 0;
 }
-- 
2.25.1

