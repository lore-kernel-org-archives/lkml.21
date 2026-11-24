Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538867;
	b=pWk1LDm06hhJb9TkYc0ARSDgcAjqvRgRe+vO6N1seEnuCFGHS5YEVxBYT3QTW5I8gN3N
	 VeP4Gi6t5/kWQqWH0/YOHI3DpZvTdN830zXhm/SZSO42VST/N/E0Q6O3VgEhp61zyBcn9
	 J/wNWz9RZCaB7rKJfZJoz20pPXfUcSKEIfVbtWlGhD2pyEQ/xvAuK2JjR03CibmUv7U1Z
	 Q3DYLcTKvKTSllFQFaxgknRbFesx3GzJEjZEwUUQGMzvCSWVkmzVD4pujBlB725oapIop
	 Xv+48PAHI5MkFaSUtZ71ZwVcYwJjerOqIDhu2xwqT2YkOYuXnW8AXvWrEfPsLpKLUmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KRqdx6jqRm+c0HwTJepA2KEMZ6p8DecuJ/3DCQP8dRE=;
	b=G33Rl4atHaI9epOmSg2hXrx5tgUsoEOv1B3Ly3pu/jxZuPmWf4+nbuQxxYKmwoYi/zF3
	 WOk6+0kgeD6w3ZleSZcxDgLUX6kOhtdwPneauPhIAwB2M2YJKl1DjwZeAEvU/HB6n3Hal
	 L4BWkqoKNQp05/WuLQVnzQzZTbvhYWnBEh4QTLQJnMlTDIU/Pf3dcTbH+7e4MbOYk24r3
	 qglc6LPK23iPZetdNGC19xfbIc9ARRNwcwQRPuEIHHFuwnuSuhatjai82j+sAiqGNJH5w
	 JQc54eXiRvSpLjq9hNZ49vj/yyPvuiHz3wPAIvPueF/m2tsCBX5voShFhJyE7xFKXkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ajAFrMyP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGvBdCX8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715CC606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 715CC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ajAFrMyP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGvBdCX8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLF4H1215443
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KRqdx6jqRm+c0HwTJepA2KEMZ6p8DecuJ/3DCQP8dRE=; b=ajAFrMyPNlaEgKEs
	FbBFJU9wYgC9rU28HFwSZXQHanhbLP2V52NAvrQABxoeZsOyy0WhZ8pch7B1u7qA
	9+BcHP0WZyNWeonLemVPJTxWQtXYUpbYVDXZ3y5Y/7SyBhKCqmIzaKwyjhq2AJHN
	DKJs4Z7ItctQIcS/C0JdAfdqVUk/roCG4dKGkdushf9vm31kkBaf1KJ7/obflFJW
	G+q7UjsPpvRZcIXl2qrtmvkFruaR5LosaatO3RIOj4doK1Pge7FZ9PAcrEf8NzTS
	wsyZaKE+aC/Iy7M4fIdldM6234Y/LINZfG44GcQhUx4IRKTQ/j5HY1yI+f5pNpG9
	Q1oOQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpjuya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:47:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94975041698so1256011885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538866; x=1796143666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRqdx6jqRm+c0HwTJepA2KEMZ6p8DecuJ/3DCQP8dRE=;
        b=gGvBdCX8Oct/h46E9pQ6BpK5VPOctDPPmcpeec24S1Tq30qKAUH8WpNS0KZO2XjGFQ
         xw7rUkzlS+agBQrzx+vJvw1Zfl8N+/qsqaDqKDsHNkQzlT9q4fDmvD7eyRyWMArPy48f
         TgeBuTWp3s3BZwIQauk8NJfEuEJ3VCwO/QTx0EJgiPuiYQQ+8PkOo7syUPd6jjGe1wpV
         uthU9bJ+dj/Y4oGR3BAsvggIkaJGCAL9GlzZTi9HePgOswuDpeMjmG8zYvjd6XKz1tJU
         Sj33R08h+mTQ/CWals4GakHTx2Puc1uiz48wwOUExHEtOU79pW1Q1hRW+ObZOszfz3Cc
         acLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538866; x=1796143666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRqdx6jqRm+c0HwTJepA2KEMZ6p8DecuJ/3DCQP8dRE=;
        b=TMC9L9Gke9xExQNE3i0s9I81d85Ru23H/uFxpj2rVACJKJ4TOEJGZCCT0tot663PNZ
         B2F6bnFmvSz0g2kS2r4SMnExASTzQWpy07YQ/s9+ZS4mNJqPZkPbv/+lC4ZxCSJjw8c6
         Jw4vAJ4L3ibV65foqdt9JfwOIIf1VehTTjoZFLrWyWjAcIhM+sXJeYFIW319tHOgAUuz
         fiROet4rCgJAulAkgbQz+fRX+rXxOaOTBQ7e9qilHv7DdN/G9C/KnX8pqWDQtizXEklq
         cJCm3FH5bhrDgRGeF3OmGCE8lQsqSpF/H3DuE1jwaRZALK0aBQXXzSma5K2/FzrP3OoE
         6mrg==
X-Forwarded-Encrypted: i=1; AL+hErHePoCxM6re5USsefpUykXLej0jHQ8g22V0LWYwodDPENkrP3uBVE+mpalYPmBSUefDY0tcV3iSHofpVws=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4UNdoghqvYN/QuIT0/JAk7I3o4owXluw7qzNMfRqwBZJsixIQ
	4A0ZjSvDsUJNd98HQQWVrhK5qor+xO2NDBjFWsOmT8xSmXmaLjhH85Azd49kIcTuH9fdV/XkGQ5
	X0UB/ibH7VRemOdEUNzRfwdNJmLF6sS+qPL1C+f7OWWMkY8Lw+e93vAoOBox/pzn2NaM=
X-Gm-Gg: AZFdTZcBl0frYH4CRo4CyK9p46m+IkXYTRIYORa50t9moOrScPTIims+nBzDTw3T/Vm
	NK9CeLoL9L6OkExNndiZ/otCOL4DRwVTOXtelD2z4ZsT3DYitbRpzocnDXagiINLbRV4bWc7cpV
	MtITGnWp20Qo0vUP5Z+N40FsRHrtd1E+xovUIP5GEVWRhtiNt3gTs/oDR01IlNRCAxAvDUe7zWl
	AEDvIW96H9w+DD/paNKAkyZy2laRw775Lc5/iAkf3gDH/wqMs7nfy21sbwCDtFK09vbxZwRauhw
	s1EEIpvT5hEj8ZcgGoJHpcPhZFD6Zd7mCXTMx/4f2wavH8st3YocooUwMZkuDHzPvBKTealp41v
	djobCSpUp3gpRFl3oOFPMdhCgsr90YswwMCePsgsvPZ65flD90uJk373FQLeVDG4dkY2Bnyi8GX
	Ime8mqFxJ1Mda6DRdFq3mZUgI/x2PRSigrI5rpA6gCOhodHjGKm4BweNTaVUdcxHGqX/rT7mTZp
	t1v6hquJkgzar41MbN+ZxzoiAzF
X-Received: by 2002:a05:620a:258b:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949b36034f8mr2873314585a.29.1795538865718;
        Tue, 24 Nov 2026 08:47:45 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949b36034f8mr2873308485a.29.1795538865223;
        Tue, 24 Nov 2026 08:47:45 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm29388605f8f.5.2026.11.24.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:47:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:47:39 +0100
Subject: [PATCH 2/2] media: qcom: camss: vfe-340: Skip the register update
 when queuing a buffer
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
Message-Id: <20261124-tfe-fix-irq-v1-2-fd9840d952ae@oss.qualcomm.com>
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
In-Reply-To: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXwGWYTb/AH6RS
 wGtf+UJmELkrwXQC0xQZiJWdNbbtbm8dB/GYHmQMYvvofcIuhtSip4rcBIVVzxCd4pPTG7WsnyL
 Ce6yWlPnBH5nh00FlWoUQLbTUp3yE9RUR95K7Wdo23GIk4IkDsy3EOp+tlaminA/yryyWLYeJiX
 Dsi8t9QC8c9hdMGXKwj1KZWXzWA4ZJybA/lDTlbWTOrHHinIfP0NuINStVWLY6S8eafApTCQTSM
 pa+2PtvRBT/j14Eg8i/cZoTo61p4o0DP6n8hFGzRefrNOehAodRvf/ln3dq0d8HQsf6logNu11C
 GhWCD0WQLsTwsruTRNLcRqOQij+RU8mwSmeGhZEjslJAAuxgzKoNs13zGHVzPCB+OEvdM6aGs5z
 f5TAobONCvn0mSPB7GuPMXAN7c7Uv37YzIWJcYLQnzDRxoYpCxdjVYM9IoMFZlpnjg4dnlo383+
 deepbK9aWk+tmTa3jSw==
X-Proofpoint-GUID: MUsIaPWFuNOMZx_pxUKhXC239ol8xuKv
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05bfb2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6k50daf3fveMbYCwvhsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXyUIfHtUv/kKI
 6UCIv2f9+aGv4fQEhsZUSjcIX2EPwTGuerVKdijAD297IIzLiUf+EQ89XWFxPE0X3u9fz0Yba9j
 DEsTenXf48M8olF57atMkGGb3lY6zRg=
X-Proofpoint-ORIG-GUID: MUsIaPWFuNOMZx_pxUKhXC239ol8xuKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

The TFE bus image address register is a FIFO, not a shadow register, an
address pushed by vfe_wm_update() is picked up by the hardware on its
own, with no register update needed to latch it.

The register update issued for every queued buffer therefore costs an
extra RUP_DONE interrupt on top of the BUF_DONE one, for no effect.

Implement addr_update() as a no-op so that vfe_buf_addr_latch() stops
falling back to reg_update() for this generation. The register update
done at stream-on is unaffected, and streaming now takes a single
interrupt per frame.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-340.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 2526d568686db06a233f0aabe4bc176e4c440ea5..e6f863d8f38d0a7f1e8fba431dff2d8583eb2cba 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -365,7 +365,13 @@ static void vfe_reg_update_clear(struct vfe_device *vfe, enum vfe_line_id line_i
 	vfe->reg_update &= ~BIT(__line_to_iface(line_id));
 }
 
+static void vfe_addr_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	/* Nothing to do, the address register is a FIFO so vfe_wm_update() is enough */
+}
+
 const struct vfe_hw_ops vfe_ops_340 = {
+	.addr_update = vfe_addr_update,
 	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,

-- 
2.34.1

