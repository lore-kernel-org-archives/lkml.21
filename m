Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631026;
	b=tAUAp+ZtX7WWm2PtwjKtDZSJmeBx72nyJ9/p921UeYZoWBVGFRRKf3SENaU/cUVLMwgX
	 BmP41lH85EVtmZIHIGfaQ+EvH7JDfCSgaWzASAlSIrFN8YHsU1lRU9D7Qoh1XWyTdlXHY
	 iwbUyIJRMuBEy5YDxfeBuJNuJT5dpDUWuduSiLI/7RF7z3PnPRE899O3zjlzPh7r3pf3h
	 0rBxKUHsSLSrO1HygZTy5A52K6h/2wKENcSKPhWW813a/1tfw3wvj+oQfb6Nvn7qB+/Kq
	 V4MlkG+J+wo+Uxu+3mo/ntMTF4F5c6l3ESMVSJ72hi0c7fmBjjzk4O2dqa1sm+NfDyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zcxcyO7W33ZSQAndGKlwVO1qNMckslR3XsjorsVb4MM=;
	b=UOZwBWQAqwbuf8T7Ltcph1pLY8NTBw5sUORVI3MFHA8/eG5TMtI7AYi2WdRtBwOMXFy0
	 L7kBi0e8ipdotJ2ZwO+nVcIPa874cYaV0VOTeYWNbPamqXr6O7EbVYvwD55DVCcZdKb7z
	 AuzxGsyU0j79+Qh8hpOtd6fZwS7j5nAO/hmQKYt7UHBFscz8Acr+xJpRJ+r13w80aQXIX
	 UOmnf141VMdz0tilS2jWuoBzkK8zxr5q44jiLK3Y76jw822gMjjnFxGNuZc0LBj8eB0FJ
	 Tyg2+7Xucd3hJL/347VaEy1jaI5mDxRKwbaCYJcm7WsO1ucRwK48jkae/t6yru8POTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k0aY4Vg1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL5MmXub;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E63606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E63606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k0aY4Vg1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL5MmXub
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQKf13008189
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zcxcyO7W33Z
	SQAndGKlwVO1qNMckslR3XsjorsVb4MM=; b=k0aY4Vg1HwiQ/gbBgycxg6aYJHC
	uJrIkohCP+S0UTSPQbOMfkZVWBYaGloG5MtsEutJLNnN76WpHsSfC+9MYAReECkz
	wKz9KA+36gbZNgs2QlLav5WXS8x5jourGZTuK1nbMDmO8AjtZwBaKdVfFaoNmWd7
	zGvBRFnRS0WojSJqv419BthJqv7TerKPzcpbX9KArrBb0ft5roQvkGuanxaTUL7E
	VaiYn/B2hfqEuIJPVgfZ9HG9X0p55fPHZulb4H4wTBOWchFijLZQ9NAxCJJaTGB0
	7oUXNroA/olP0DyvZGLvLjsC4EuCkp0J9u1+3IRjnStCUtaacaU7mY5liTg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukt8pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:44 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0d978e4faso18330547b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631024; x=1796235824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcxcyO7W33ZSQAndGKlwVO1qNMckslR3XsjorsVb4MM=;
        b=RL5MmXubXji0BboE4jl/XScGiRIYKaRltxwmv9e6sCZQzSGCCM0N9gVGSuBk3O/e7m
         IhHExs6Z8fbbvXHf4kPer0r/6urg2wKYUanTSgqI1MI/QMdRCHHtQcFMyQHkUp7XXWQM
         eiC4KbRlZS4WB+1l/WPrKIgaI+oLWC0GMzGE76r4TRscVbcqD0TJJK2glj5W2TfuuWz2
         ybDy5DQwpXhW99FV3+EubPBNdkqXqUxM1E6kPAO5A7+qvREy6dHobdTeqMSiTEkXp0tp
         oF8wwQ8rKXCv4xs8IcicIYPNgx1NnAxHiBGeZ2xlzNOodXPm6pi0MmRDGPyX+7wR6wJL
         uFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631024; x=1796235824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcxcyO7W33ZSQAndGKlwVO1qNMckslR3XsjorsVb4MM=;
        b=kJ9+s+9TeHg3CN3sUgNPIIAaEM7POB7HqUQ/pZP8xXOyufa8X7ONVsYuaJniOKjteA
         e95XfUXpAwBWdogSLtIQsH4gukrTFjBAg5T/l5hyp25jEVORofgG3kAJdom/RlRKzAON
         7qRplDssX3Lyzy+/qrRpWhOjN8cOwY3/0Nvp5IYSWq+F7v/+/Av4cAxBqfajP86jj/Rn
         DETlONORxjPSZSWen9gXKvqYwxa7ypIApdx7pVJLHk09irfRVSdD/d+jedaLYC07Jx6J
         6hjoQwmJQpvZHkajBSBYDDQv3QSE8dx5IzYgjKJGesEd0skS6lFkgkYAVOFrmrlpmgoI
         0Dmw==
X-Forwarded-Encrypted: i=1; AL+hErGl00uKPlrJ/QMDX11VoQzUHiaeUB38VDj2rC06RC0VJ40eAlh640SzuSy/ywL1gETkN4pICfcAKuTz7fs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CrnKGnKzisnGt4PkfpDqzBxpON1Kb34ue+uHXBPztvuPBGAhs
	79+rEH4qy5MtvmtTqWYPe/uN1MfJuiz8a+CLXzJR8hEVzKnFAwXCkhEctrLOO+1bSHuWfo9BUp/
	bE4k3t8XadL4egCWKfjfvoem7DFoR28x+GiLwARqEbzf2JIUSio2NljEWaWxa1ES4vao=
X-Gm-Gg: AZFdTZeGXnJc854ukL3T8nuKErQu0dSdXXNyA3zU+D/g4MutMD7qhxPZ2xYEmFHMz1r
	3sxQNmaONklnodSOhGpBsNJ9m2XbtzSuAxqJo5hL6cYAkiTPHfFA76svRm8n1ICzUtJbKE27UJV
	zOZGN2SjgA1eAJP04hHiPnsqMz07rKojlC6XJRbo+uwNtenId+Hbwzpt+4nlk20TaDlQbeeg6jU
	+7oZP7Sk57CRZctqJNHJfxz5aObavsdOSDKJ7aTMVRueK8nVFSg8pwqiRGasyllOIzD/eZMW8Ur
	ve7ykJUr4UqVsh/XLWLe2lmgJZktV6pawJXwoDSenTZaWhGvrl4RkV1LGWidLzkLrI4fbQ+TQc+
	aruogTWLiCM1rvgDPcik15E5/ON7kTyfcgkKDOPUen0Kh53lQ4b1RNIp10bdvSRb80RpHg0Uiis
	eURiqP
X-Received: by 2002:a05:690c:6307:b0:8b3:22c:b40c with SMTP id 00721157ae682-8b520329badmr85103777b3.7.1795631023952;
        Wed, 25 Nov 2026 10:23:43 -0800 (PST)
X-Received: by 2002:a05:690c:6307:b0:8b3:22c:b40c with SMTP id 00721157ae682-8b520329badmr85103667b3.7.1795631023298;
        Wed, 25 Nov 2026 10:23:43 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:42 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 01/12] media: qcom: camss: csid_gen3: Fix multi-VC buf-done IRQ mask
Date: Wed, 25 Nov 2026 20:23:15 +0200
Message-Id: <20261125182326.2767771-2-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b0727b0 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=-miQo-2tu4ND6FEhOZYA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: pS_8RcG2gcMb-E9oeQdwUZeZudi1J5at
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfXzeFXMGk54W7N
 HvC82+8xjxjLimexAVm2yb1t/mczZkHSIPxSB0Le3bTJFEyyd6k54MBiG2tfsnOyZy6LZ8QZQ/4
 X7X0JRu/r78W8rrPF3o9k5XTfqiUWDA=
X-Proofpoint-GUID: pS_8RcG2gcMb-E9oeQdwUZeZudi1J5at
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX7Ir33vccG8zH
 IyNfB2Ytjhu/8QakYI7+QrmWfoPMzIGf7nG2cdW3abR2NEFCcdUWmCjv+2PN+0Gax57RLtGR/E7
 faJm9f/7tb8WG5vQ9Qxp4uqf+/vaLNF7lEBuAaVq9XxRSAVCgax0T/HTlNQ2CwFSlE4IgtNKX02
 UTUFE9Q9tsVcA5THu3SRAy9bYD5xFht/wL7xRdvnLEIfCEKNjJI538KCo4Pm8S9tCdrRusE1uLW
 arjjmUkbKqadRqfPP5xMMf3qNWepXSnREVp8km3u81e0KIOlRBy/X9m8GGkROgFv3qhnANMBd4j
 VKDOZKdXvMMXWRWmC70nUcXkZuSbXpTsZkobLWMWvRY/WXzeiqQ8WRqt3OvgjweYpJXe++mni06
 oFUeRm4N6ME+cqH62+t/FAgXbGgaYQxyG+3y2zobbYEvsl17PsSpX6Cp1viYSgKTl4214h76gTr
 4lrudUNw6Bpw9zp2ppQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Csid reset programs CSID_BUF_DONE_IRQ_MASK with a separate write
per enabled VC instead of accumulating the bits.
This change removes the not needed for cycle and write regs
in one pass.

Confirmed on RB8/SA8775P hardware during TPG multi-VC capture
testing.

Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78..231b53d3e44e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -339,7 +339,6 @@ static int csid_reset(struct csid_device *csid)
 {
 	unsigned long time;
 	u32 val;
-	int i;
 
 	reinit_completion(&csid->reset_complete);
 
@@ -347,14 +346,14 @@ static int csid_reset(struct csid_device *csid)
 	writel(1, csid->base + CSID_IRQ_CMD);
 	writel(1, csid->base + CSID_TOP_IRQ_MASK);
 
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
-			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
-			       csid->base + CSID_BUF_DONE_IRQ_CLEAR);
-			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
-			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
-			       csid->base + CSID_BUF_DONE_IRQ_MASK);
-		}
+	if (csid->phy.en_vc) {
+		u32 vc_mask = GENMASK(MSM_CSID_MAX_SRC_STREAMS - 1, 0);
+
+		val = (csid->phy.en_vc & vc_mask) << BUF_DONE_IRQ_STATUS_RDI_OFFSET;
+		writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+		writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+		writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
+	}
 
 	/* preserve registers */
 	val = RST_LOCATION | RST_MODE;
-- 
2.34.1

