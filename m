Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595929;
	b=qnu+z9GP3fYCsi2m1mkvrwDBMC67irx2NmvDNPrMiuKHOI0oU2GyHzs3wdnznFRljuTL
	 hWHYcjuKYzD7NhgMEiKuYXBDEvWaaupunp7QNwzAzeg60UzgHgp10grNBgi4oDXjng5wD
	 ERZz/Pjknty+nOTTWTiq7aSLsV2jehKxydQ01gIwWbMtEDyPCt2AuZia48rmw4gEersue
	 sg7p4RZHS6Wm0ppL2983vsjbJqsLXCavVP5ntjkSFkrQcXNFlUTc189XaY9Ger2wlG/+i
	 FAHVr81TWUr60sfJ3W8i5DQpHxzrGYRRCi8FQdMT7ZLMb2xFL6GkNeu6C3fmuWHeuyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gls3ERr6Kl3ADITH/EmRG5cdeVSYQKTO1P6yUuCMgCY=;
	b=W0kVjPbwxAM7MHLI6osMyx3cqSC8lbqIuTf6IqN2SnFRl81DefNP68Vv0oCQVj4A48Ox
	 QOpkyZX8ZK1MyaQX5x71vl+2n3zKa7RgsyCd2D/bDar26sQZTolg+E9cbtdmC1EqlWg40
	 7p693kamdcfrBUcZx7pf04VTe91mkC7OahAMUIE8ZscNzE21duLIAnXK1pXFb6W5Ptf70
	 w6s7jjMNe+bOPl6Nf6Z49Kiei2FA+ujeWbyPupXd5qXJ7YxyVw0jFgUiduMOvL9GNlx9v
	 o9pGTFnUBYsttfrpVOMAkaZA8rHPVGLB3njbtzPrPoj7DAXFeuiFMGb0SeSAUpPOioA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gngjxp3P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZKAEUFf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0C3606A681
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C0C3606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gngjxp3P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZKAEUFf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68UvM3534198
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gls3ERr6Kl3ADITH/EmRG5cdeVSYQKTO1P6yUuCMgCY=; b=Gngjxp3PJowqgNgu
	auXqnVG8/uwmMf0U2uo8olYknrgD6XhklCgf1HS6PgYZ5LJ+/n9MGI90saEr+rY0
	fIBmzqI1Kk+ZXNk5yiuao+DcxJtpnozHE2oSfPRr4zHJIUQ7SMYn6tMePzkhlGah
	kUe5ObDItTf1HyWdMgg5G64/YHiekwN4Cz1l/I4v+ZjixaouTF6a8WmLaYJKaq49
	YMA/tJwhNvi2T9TjBFOFPOX2iMRiT+wiOG08MJmWyfVHsEwQc5fSVOX2kzs6LpKr
	Pe5wTmdXVNMxUU2cDzOBYqgy6ZDP1Hsg1Pt2wsLB2FU0gImyBTFAh8fmSfOMyJr/
	QFQprQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbhrrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:38:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9493e89d4f9so793575285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595927; x=1796200727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gls3ERr6Kl3ADITH/EmRG5cdeVSYQKTO1P6yUuCMgCY=;
        b=GZKAEUFfjXOwZFZPaETFMGkQ49oQflksnCxiORt1HM3IazPiT84xCRC/z61scIRSzr
         lM9rnSfzAmhcO7QBtayLTGhc8pghwDAfZwvvcC/UCYeJuz+Z5yGiQRWASV7YiovWyZZZ
         c5c8tJJmhxuwX+XzIkL938zasbP/9ZFAEPXJkEN8hLllCSXGGSaVlnyZt/woIGShrvLK
         o5OEXrZfi3TRrmIlTGG6FqyHfi1Nq+xJ9tFS1Yq7C8DDRiUezrEzjsUp590ek6Xa3YyB
         CS6YvAXrG4joBW1gU0sYVw1HlybPV8hs31RjFzxXzWTlGF4S0D1Xw/+JPyEy0JMZws9I
         Nm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595927; x=1796200727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gls3ERr6Kl3ADITH/EmRG5cdeVSYQKTO1P6yUuCMgCY=;
        b=2KY60a+HKqCFfg8doT4fVI/5utL1OFMX941nqMSS9PX19KuKswk+MUgfMJIWaf7EHZ
         /hoAqWAhUPtMUjK1KNvIwq6K2PirJcOSN88uTm+kV1khP0EEJSR+V6DXQ56XyWaQjD1B
         QsmKs441VqM+lsSXS4acQ77sBtBKKSFfe/GnBGMPiWDpDDbnOtFeRnQj5OvYQsEcCIxB
         somEkizC1loBLJxLZSVgs+A7kccS9uTELuDnW8hAkAaPbGgwefYCOKjzmiQ001YuxnXk
         WimUEKlTJ9Q/2fLe30Vr5jp263/mE1SGAtnkB66U3eMeIlMr/P/qf2wQqDg0u3xL5P4Z
         XJrg==
X-Forwarded-Encrypted: i=1; AL+hErHI0hd3tGaH/5kKCg+fy4ctBsgH/cj0BKK4jIvspUFVcz7jbnRGlWTpdOJOrUOUItQD/HI3BpODCdLXhqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z892QwPtvqRKmKnfNBvi8nPjv+qr2uoXMcr61VgoCWvMIWXF/YF
	wtJGhaaraAoXz7jkHVzwhQIVM/5Hk//LZVk1lmfDJ3cqMD8XWLQHIhfA6rKz30o1ayg64embRK4
	pW9hS2CfGqPzamN7qxaFPPpBByAuhCq9ks7QowVrc6gi8+quwpEb5UlZEqdu/zPOTFlE=
X-Gm-Gg: AZFdTZf8WTg+uS23V56MlI9FF5a+tuKojhDkHBdt7wDsi5L2I/ShLDCHWdNhtGBVg4s
	XI3gFp/4g4CY1UcfFtaS4jKM0Mdh6qv47EINb9zBqAVkVYCKMmO6qdPqHynFSUgF/RRGM2+kteU
	DIZBp5r44QGZlaof5dqBgSzo+RGLflyT59uGhns4OwMGXDv6cBzFOd9LYpkgS+HCkWpyJxxNxKN
	aa7m0Hi0GoZKQBEzDEVi0U8lIEsNEvS/9Ff9Ke93yUZv+e/8X1qJKqHNl7FfeIUsRTHfepeJJ3J
	FCzKgZ2rL3cW/z0BNRivK1BdfK7t/DWE+fWS/CwxbiOzocGaLvOmNGYP7DJ+otJQO0rC8y7+Nu3
	e+Om//hq0U3B3ZjKg5BYV11m5gF2H8RXEO4/dvR+uses3zg5mkbub5vT1Zo0PCyXcoSaody1qaI
	AZlTqfjhdDqfnTRy0oBKmCEw292YoKlFYt4ak95k9s74MGCZMGTQA7wNDMS/HrZQ2sRAQOs9img
	q/bwciBk1icRlPWtEhgDf0D/BJ6
X-Received: by 2002:a05:620a:29ce:b0:949:8bd1:15d with SMTP id af79cd13be357-949ba9b3e0bmr3209292685a.26.1795595926663;
        Wed, 25 Nov 2026 00:38:46 -0800 (PST)
X-Received: by 2002:a05:620a:29ce:b0:949:8bd1:15d with SMTP id af79cd13be357-949ba9b3e0bmr3209289985a.26.1795595926240;
        Wed, 25 Nov 2026 00:38:46 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm24626021f8f.15.2026.11.25.00.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:38:45 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 09:38:41 +0100
Subject: [PATCH v2 2/2] media: qcom: camss: vfe-340: Skip the register
 update when queuing a buffer
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
Message-Id: <20261125-tfe-fix-irq-v2-2-29dfa0955927@oss.qualcomm.com>
References: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
In-Reply-To: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX9A9o2kWSoIZW
 o7OPErHLCVzBwcUy32g+IoqxyjjKb4GIbNG7N1NlM/hTyPhrrNRXG/gMt3bbHgI8ctjzIWL5ddF
 qHtKeiEm3TrpBlzkP+rh/lv9IAeQWQ0=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b069e97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=6k50daf3fveMbYCwvhsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXzih6serx0Llk
 24TgLbq89rEduTlXEdtJZXNn3SinxzkiZbtREK3KFHG2uCc+kqZCcbkqi/YBamcHeLkHCJ8SfWA
 o3+ivvg/sEhpsIDhmMX7ztzbF57Z9IjnaxL0fyMKuBs6a7mGBxemQTR+pyBn0L1xwByof4HRK5M
 7rR5igwn1Y9j6JznL4EGUpiNe2Q4goBrMOiBO860N26ul/xu4kQGfK80xwS0Uzr8/5+w/a59K0e
 HtqMV4r87F2KYcd2JUcyHFzh2unViplK8ffeFu9PfJCdy9l66PV7+jlLiCu5cBlXxSHAUFhIzPP
 axEK1/FaaDF+omxhG32wfJ+MWkHJv6oh4esnXrTrdfjCxcGJTMOo2BXImCy3ijgyUmGDMYH/79a
 0Kmb1WOPormPas+Ol/ZCkF3gG75x3iXk05qX1a9REMGabFc10Xw73k1SfXRs9syQ9pBqT3tKULq
 iJvzYas9XR0xFV2vNtg==
X-Proofpoint-ORIG-GUID: hRCln8eHWbeCu8cgH0DuJeXFylNipxCL
X-Proofpoint-GUID: hRCln8eHWbeCu8cgH0DuJeXFylNipxCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

The TFE bus image address register is a FIFO, not a shadow register, an
address pushed by vfe_wm_update() is picked up by the hardware on its
own, with no register update needed to latch it.

The register update issued for every queued buffer therefore costs an
extra RUP_DONE interrupt on top of the BUF_DONE one, for no effect.

Implement addr_update() as a no-op so that vfe_buf_addr_latch() stops
falling back to reg_update() for this generation. The register update
done at stream-on is unaffected, and streaming now takes a single
interrupt per frame.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-340.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 2526d568686db06a233f0aabe4bc176e4c440ea5..560acec0e0297a4bbe862fc71411b792841a7623 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -365,7 +365,18 @@ static void vfe_reg_update_clear(struct vfe_device *vfe, enum vfe_line_id line_i
 	vfe->reg_update &= ~BIT(__line_to_iface(line_id));
 }
 
+static void vfe_addr_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	/*
+	 * The TFE bus image address is a FIFO and not a shadow register, so an
+	 * address pushed by vfe_wm_update() is consumed by the hardware on its
+	 * own. Latching it with a register update would only cost an extra
+	 * RUP_DONE interrupt per buffer.
+	 */
+}
+
 const struct vfe_hw_ops vfe_ops_340 = {
+	.addr_update = vfe_addr_update,
 	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,

-- 
2.34.1

