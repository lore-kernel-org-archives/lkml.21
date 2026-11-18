Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970571;
	b=vB15v5Ofs/VLBxtFHuBCv0vF780wunrXUGY5E92MAHqn04G+VkvwbEBjkBpHQQ2SGPAX
	 IHKwyY+GHVuLUX0C7aCydNdTO6bLTT3N0XR7xtLkPOzi9/GQ2XO7ynqjgayZFC/A08Mu4
	 69FKHhkEevsBgm9ynlvHmOxLIBvopOsI9VIMyr3fHJHW6QYmdjeSTkAIj1+ctjWIcV0jB
	 QWSm0d22JtqWhg8OxyEhjHgi5eHR2fuWx6sRUzKytwS/+IoGa/UjYRzJJMwdsPaj038fR
	 RQpEgY+oW+K9dh89qCB7ebN9KFHxAqEJrn7BGUcx42ZJ48Qjf6bj7TskgoGmJ5OhKSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970571;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/BdE95b0vsH0P2ZevFNIECUO9aKI8fNqcDSUB1tbLiE=;
	b=N507ZL3Jmiw8uTER+xZB3w3zQnSuakVGlA8tShriO4FMfUm/UsybyY2jWCFev/nfqUhn
	 BiNHt+0UMjjd2eOQOxruDSEZudnGAaxhg5hvkyX81AXo90+Ldy98dvmBB1cVvc3Ec+HjR
	 yv/ZDXDTix7xs45M6LXeWLt2YtUhdI4ocO0lpSXxVdSimkqP/t3soh6V0TslgZQBhvcOl
	 I6KO8OQNXgX+enYJueBmHCboaQ3ukHD5e2KJormn2WSaUkMmRJqdn/f31N35tMhAJtoIl
	 fYC/80XtBOTTeQ4MEdLrU3rUamBzBt3+rThIYxY4tk7yECXY77jP+By5q9G7fcSfSSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hEW0v9VG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkNjgHWA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F737606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F737606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hEW0v9VG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkNjgHWA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VvjA4059968
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/BdE95b0vsH
	0P2ZevFNIECUO9aKI8fNqcDSUB1tbLiE=; b=hEW0v9VGQpu+MBWyXf8NJMRTZBc
	A25iPaJyTQgMxLkkiyyRcjq59JDVD5rYaBR/1GA4joAhvLfBh9enbXdDkr8rei4M
	YiVuZeRKrhVD0E4rQzgDnrBnm4dwYfODzOB3aHZsWagJf+BwZd6gMnsO5OcXCTDs
	Zdog3QdRmyCe+gS48t/jz0TuJ6PRDppNrXg6dG75hocqSCDKJ16pI3MSqv2ESp97
	cxvjPGRJrJJKbvgM0rxhwWa2nS/TjZ4rgy5igbYbksWwRGK5XrNxPnd+kYEjQ+QI
	DBsHsfmSF6752nysufCIfe40WhhU4Zrto9KmBQekLO+TtzvC+B8jVT5xiTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcgve3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eced5a4cb9so4404825ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970568; x=1795575368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BdE95b0vsH0P2ZevFNIECUO9aKI8fNqcDSUB1tbLiE=;
        b=PkNjgHWAbGj3ETAPEgeqS7+FwN4MRDvK/2Zah+nPSx73Cv5dM50Y0nbulIF+Aqd76/
         C5pocl/KqqoUoDenzwVoVnhB7dCp7xRrA+c9hb47fCNYJpJAI0T/uzCH5BeUe2nVmhnI
         5Mw8ascDUkz9C6s7vQi4QJHshzm01GT7wzPTKmG3GXWkncoR9gAf12ZG63wmHPId2Ej1
         qENIL5g8y+A3mDisGHka81+k/LkHEbdVqAMa/px48D9vDHSoBW5byZ2UU4haO+2TEkM4
         YtJY54CxPNFLMIyEDyZDrvsFiun2V+qThlnz4vxz7PDJo4xc0gP7Iyygr5EjAz+eTjgT
         vydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970568; x=1795575368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BdE95b0vsH0P2ZevFNIECUO9aKI8fNqcDSUB1tbLiE=;
        b=qvAoxeKAt6drmQDjOtX6pFNecsx83JBGwvzMsTDMO+uyQgdeObxGJjSF6wkslKIUky
         c31Ikct3944nQ5snlD/57dRZ+9UTG5uY2hh1+d0ZGJXQpR+VPoXHVlSlnXf2EKDnd+1y
         IkxsWWtbc5+YyfBnqTgmNKNQIeE/3pn3xv278r6Usmjaf37PMGWcgPd2+/Hmo7ATCCXU
         b5YKBmWvoIfiAqboSFkJOKyMGWIonQh7/G87lBMpxBTCv6dLNl7ig/mVC4LyUej/WPxz
         tdVbK8/m9AlWGtVWGXyDndxtf7TTaGEAv0h9YB/ECT03fpXtKQivZrBATaRWAaoiHWwU
         KcHA==
X-Forwarded-Encrypted: i=1; AL+hErE8O5mVYZCJBGhGebqJIgWEZzy51JZi2RseIrS7gYyN0zrN6VPO5wVv5jEb31+j/KyEjvZIeMZaWK92ZE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qav1DY1XwtzeAQ0Ty+l7x+dNeUKahOdq2P/reyvRni4ewFNhm
	V8cpqjQafy+A7AYf7NwVbrChK/sGOpicX7RnDCHCNbe2e3TzvC4v4W1VfnQszvOYQl0mCVuLSOC
	za+wmtnQl3xsVriqg03O3B8RRJbE2HtkxKZlBUJX6fxare2wmoP+v/xRACWFCGy7dKD4=
X-Gm-Gg: AZFdTZfhng3wj0yOURwp8U0tGPPq5byV4ix3ma61NqXqN3EtINxfWp+G+o823KIFFYe
	MkhnbS2W5zSGLXX12jF135dxB2baaN+UTsgey26TA/2n1ODIYxFlik0ogS9ILUrHKsMDVirbs3s
	q+ixYp/eXyF8pmZwfCakZAEW1n9dOim+ZBK1DfOmYWFE917OZwDsPH2o7pdGGZa2OPH73LnDBXN
	BQ6A/pYI63/OaD17Xtl189bmgS33vyphzjORW0qZcnEWX0e4geeKK05okjy6ZU6VN/j0yDh/5tf
	hXJLulsXaFGelSec3U2AQyhG5b8eFeaEZvt8QXb0/UzV8TtJCY/hOE1YPr14aRHZQn+LPoUyhhD
	riVubdDgaca2+iQQT/xzPiUc/kGQJGW1nsaIlw1JZvQz9pAqa3WZiG3B+hzGtjsx79pCHETjg4l
	Dbf/aV5CrvaGLs8KfkEKhdwGSphUngB2Y=
X-Received: by 2002:a17:903:184:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2eff72f4e6fmr11288555ad.16.1794970567996;
        Tue, 17 Nov 2026 18:56:07 -0800 (PST)
X-Received: by 2002:a17:903:184:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2eff72f4e6fmr11288395ad.16.1794970567552;
        Tue, 17 Nov 2026 18:56:07 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:07 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 4/7] wifi: ath12k: skip links without channel context in ath12k_mac_get_vif_up()
Date: Wed, 18 Nov 2026 10:55:17 +0800
Message-Id: <20261118025520.39269-5-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd13c9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=gfZQdUK8Rj-w2-3WJ4IA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: UIyYJ3vAIC2cE7T7Pp-rKLL96_yxK1sY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX+G7nvm/uNLX3
 RNqc+/3LM9Lp35+NwwZGwwXoArKH8ewuEyqAn3idApH40ANgjboJlJTyMxhA9mAIcUmubHvPFsH
 1fFz/q5pQ2VKDfVOVwlVw2fMHr5+kzw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX0qIWuEUBeNPP
 +Aq7Ii6RL6WxKx0BlbeGo+QShsF2lTuANs+pSjKMRsSFjnmbDxT8jAHpEx5tLxuSU05yoWAD3+o
 39IjQEgt671xdlCUCycVFFc3YvR9gXWer6qExqewYHlsEDSoBUAMUH1OXPBkmPM2geuxCauGoT6
 41KHfqwFN3tG+3MNnWKf2EdnH6K39frlUFWCuQW4P1TcsYmmeLsozXsTmDx0t/LuXn9HK3DCj0m
 /mc37kxMvV3MKhe3AhB1EUuyKKOCRrHvS4u05RYOlEwhRnc3X8Nv7X36r7J1DQNEpx+djUr+6Z8
 OFTjKMtgj3G8LqZjSN1ZgdmJEf4bMd3yNMzxSf0ccgtNnPUQw3M/thYQWGkmsxrSXjMvjwrfqsi
 qWbtA1DnKY26JKownngczzTmyYuVk6asjGt4u/rjs8TN9hG1No9OTGZ9Xx4PVSE8i/qUxvw/+vM
 HrB1z+jkr24O+8pxcdw==
X-Proofpoint-ORIG-GUID: UIyYJ3vAIC2cE7T7Pp-rKLL96_yxK1sY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011

Active-link deactivation releases the channel context of a link while its
vdev stays up in firmware. ath12k_mac_get_vif_up() returns the first vdev
that is up, and that vdev is used to derive the target pdev. It could pick
such a deactivated link, and ath12k_mac_get_target_pdev_id_from_vif() would
then find no channel for it.

Skip links without a channel context in ath12k_mac_get_vif_up(). The
WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif() is kept, since
callers reaching it are expected to have a channel context.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 28cb549b1f46..08d9af0a1127 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -953,12 +953,23 @@ void ath12k_mac_get_any_chanctx_conf_iter(struct ieee80211_hw *hw,
 static struct ath12k_link_vif *ath12k_mac_get_vif_up(struct ath12k *ar)
 {
 	struct ath12k_link_vif *arvif;
+	struct cfg80211_chan_def def;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
-		if (arvif->is_up)
-			return arvif;
+		if (!arvif->is_up)
+			continue;
+
+		/*
+		 * A deactivated MLO link keeps its vdev up in firmware but has
+		 * released its channel context, so it cannot be used to pick
+		 * the target pdev.
+		 */
+		if (ath12k_mac_vif_link_chan(arvif->ahvif->vif, arvif->link_id, &def))
+			continue;
+
+		return arvif;
 	}
 
 	return NULL;
-- 
2.34.1

