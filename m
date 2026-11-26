Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684862;
	b=DfY4aIr+5pfOMFiZxPBIDZIsoiZ/dTq3tm7k3szfciC3cQWvwoxqQrlcP8QGkGuasrs/
	 9vHPdAaCxx+xP5YPZoZq5X3Upwcno+lLlaWFydEBnGfY5RgIfKKLllrIJtmvxKql5hn5L
	 pYA5Lq3bBYmgozUAdwxuQ2PxjVsjzXNFome4+VE+NLKMD450tcGHnZjQkm9TbJoLMf91X
	 Y0rDtKsd2i4gZT+oCoGBTapQCMyzUeCCBMDMzX4yoUWJviMxGXmqDrd8mdQRqMMZGPtNg
	 BCjgWrUV9viGxoZCH7vmIEDE4w1t7uGoz7onk3eXyp0XqbhMe6tXYVMcdfih+KY0ovw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eJnnvQ5aLDsD97522fKzkf8jFAq8ARUXVpXmP0iy07A=;
	b=PSkgu9tkS/74c01xibP/aqNreFZd0Tq8A/TCzJCRGBzyQruRX+t1ygFtYLyTvFYkQkHL
	 apVpheTrmiWDWMu1F4+Mla5rrxxgjvjD6eqWaiHwO68xFVQV/maO6DWG6y2XAVaHa2RWv
	 iD3xbqg9gcgFg+UsbgnhaGKbbuaqhwURoFGo2Ut92mIxVCol1l9V+cnIPMp9sBnggT7aD
	 ekJEm0kX6P4JCSxM1OJcBAtNrKTQVs4GfmacwB+YWDfRvv3hDZQtGCUUA4K9IorQ/MfPa
	 PBaqLvR+1C2QJMQnGdOIPIvYyiOpMwIFTscaabc/+kaveO0Uhh9uIinJmRCfxd2vBMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DpieXgtt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cj4qx4zm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C53606A6AE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C53606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DpieXgtt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cj4qx4zm
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8NarQ2860320
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eJnnvQ5aLDs
	D97522fKzkf8jFAq8ARUXVpXmP0iy07A=; b=DpieXgttU48CowZjrVSLWlpN5ig
	61tA8QpPZbpJ1HxPr+GfOuAXVdQ6SMlWoDkAa+qvxe22P0fAdz0QxNjZDuwMkKjA
	KzIkt4OeokSaCTv7TEzbkxnsV3rJy6l//ZNIgH7AU+mqTgy2o3i1AYGjjzbcUxek
	DB3hmw1vdHzHo+RlEsPHX90/i8HotWxDH4TqxwkxA3aHrcvFDyjUSz4swk1+b6SE
	+mjnNWa8nKQTNk6NDeoRYU9TRN+BKYcL+6sqiqKwsNtsB1hTmNhjSwtYoFAbcDZt
	g4daWwYR+Poi7WPCnNkIuiqCDMxY4It5ZXFeihds2O8XDDn7m9CV84VnXxA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g87y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:21:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso5800437b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684860; x=1796289660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJnnvQ5aLDsD97522fKzkf8jFAq8ARUXVpXmP0iy07A=;
        b=cj4qx4zmglMsA13kTeCfPEDCoppYRTowwDh1u3sPhProfUbsXSJuuC+Y42PV+5OZWl
         yHoe9hs2gP8zruVwsgvPzabENvERhfPCoXICY9yLCd3/lYmEnpPfiZZbjp98NMZsJbDB
         fLgCVfhDojdnvzP9zf6h9sOaxp72S5Nb5qHAtdIcLnVj/MiMTx+CdpTYor18v2XT9eUM
         WB1Vbe06Wm4wFjAhh5BAZyJSgOFeWCZF7FH0LwaD/bSekx5+H7fVJatfY2vB2D0VTKsi
         l1iEkXUJPW5BgGCfVkAQPdc8sPDOCdJgRjFsQzHmvnijcjy4BE0L5ajXZZu9fzayZhQw
         e9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684860; x=1796289660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eJnnvQ5aLDsD97522fKzkf8jFAq8ARUXVpXmP0iy07A=;
        b=b+b+Xx5ENXMAft94H3v/VLGtozXxK6i8D6y+beMaj3pqTxzDrhN4O7bgUKubbPl+mq
         LVN8F3puPCmyBXlyvLqJKOHNn9f78jmz0SkQRXzGrN5NIe/W2voXJNWCDMVK896SBEc2
         UBu7TAlDwIdfhVQd5IdsQeuImgn1W8wbBQOf7hA5m3ftXcoDNOPy65ie//QfjSvYmLHn
         Q7G9N8DDj+j9clX7BJUninxM55ENgg77cgMM0GsjvJ5AeYEOpIlAUSb5G7JycA4k2rBk
         U9EaiXe1zFlQKajwav+FlRamFOMUn7z5CqbIoTsDLHYiSRRcKHC//hzRIcKBElbDKLD0
         rs7Q==
X-Forwarded-Encrypted: i=1; AL+hErFkNQc7t9tzlISYYrBBsqDL2gpPdKnR7HIO1pfjOJM91iCKNo3PjnxSPEZJD2heDBPYFGaEJ1zAj1VWzXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GJO0NxC2LHDJY3lWRcmtr7oZ3vejJDUpq7MxDSqN5n3bF1lpZ
	bF8QGEod56AccINfyDOoOu+AasELAtrWUmYUCDS8LRk7R53YwvZOYNiYF6s2aKaw6GrOqOPxfVQ
	0wU1DuH3OQxJq/fIMfb8cY6qvpexuc86HBW6XCCN89osqF7H4zTxowveVd5iUwt+4DHg=
X-Gm-Gg: AZFdTZfWCdM3I+jUm56y69QNZjyKoOZKWY3t+/rD4pNMv0pA0ChciQ22JxUYtoumfU2
	Qj8ZU6fgKnt8AH0ooR/TzZfn95yuTjHlvKlkXA4+ScuVEjosfSCszWyzPmpeCcZ041fTA1xVXvi
	9VQ0HjFC91swZrM2zMporZxcjE8vlTfwSWOpxb/FXP7z7ih0XViXbnusPnqikCjXT1vyn1SKWOR
	/K7ovRVnvftanglXr40xbb7UCTFQYjsPWxEvXgkARNxfd7/QySKzOsvJLkMIKHsit9jMw+HRJOn
	exUmChYO2QGlvxOKcQkVI1+5jjAsfkdSOBy9zn05OGpx/ZDkLhGaHv756are+x1oSAqzpOzAwfe
	MDE1/1Gc36c1N8NG+u2Zk7Tnv6PoCokhvvqQRJGVPzBr7+QmfM8mt8+a/bUCqZ72POHHB24nZXL
	IC4q4WYrGYjP+7u3P9RjxsdKDx8ktZLuw=
X-Received: by 2002:a05:6a00:1492:b0:8a0:5f42:a482 with SMTP id d2e1a72fcca58-8c7de587185mr14794951b3a.43.1795684860346;
        Thu, 26 Nov 2026 01:21:00 -0800 (PST)
X-Received: by 2002:a05:6a00:1492:b0:8a0:5f42:a482 with SMTP id d2e1a72fcca58-8c7de587185mr14794930b3a.43.1795684859810;
        Thu, 26 Nov 2026 01:20:59 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:59 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 4/7] wifi: ath12k: skip links without channel context in ath12k_mac_get_vif_up()
Date: Thu, 26 Nov 2026 17:20:34 +0800
Message-Id: <20261126092037.462830-5-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
References: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: to2tTB2-5eI9kjMnHrJ2tSsdCywOw5Ty
X-Proofpoint-GUID: to2tTB2-5eI9kjMnHrJ2tSsdCywOw5Ty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfXwdgjuUPswJRI
 2HCjmEjbZq3L73tzrnpD8cVnpEeNy9wXODNzx4qFp7UdzhgNoCX8cgfnEr1KRe+HeuEDdcKR7Tr
 qCvvcVmYl4eIX93Cri1yIsvcmRMRfJ7bAQTAs6kAl885zjSjvL7ZWG7q2H42sclpLnyfLMGHf/M
 vKC4Y4SK7Fgq9wNKQhvvVkCjHeWoDXTrb+wX+3Sf9zxoWAlmlO9dR2qFWo7iVl5VjFFvje3ZxvG
 9IqvACOigMRhprMMHULJQRtznh21WVYaLVSZThJkDJG98IKeTiy5XTrwNGHzMzx9E7HLB+QgAJY
 DSvxsfuB3Skv/ds1S3V4XJhz++7jSe9KdFrlKLZl08baGwHb1/fw3UyDZYmm7rzn6+xLrkmIuKm
 actaKAIZEriEt79rg0qWlqkj9Nis3mYiI/YRbbtW/NJ3/tK1p4hwtNfGcmbAGMo8PknNf8xYxMh
 3NdXq+SX/at2Fk0D59Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX386l9d/p/zeL
 rXyMePbIUwS8h5Hw0MfeJISO/6Of1BeDlTYuelUMjl+xUIZShGquZcR8EN+R2PsZeJL4WKgH7m0
 YhWpQDjvOxRMZfox/ZYAhugpLzfV1aI=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b07f9fd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=gfZQdUK8Rj-w2-3WJ4IA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036

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
index d7234ef9c025..2b4dfef3efb7 100644
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

