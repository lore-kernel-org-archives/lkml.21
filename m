Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076821;
	b=lsg7us5oPFaO1efXNAYHbdI0KT1JX9qty0UEtCT4ifC+NkHmKGi63hjVarbu/ZtLBIjx
	 dtfcdzIfGqYjIGhLmHlLhTI3ntQ3O0CE+S/z3eAO5ZrAo41RdK3R7zYhJsyA+WVQZyOlP
	 zsgHwzI6MIyIJxcYcblR6u4OwPuOmK6E8ffcxqUxx0XqO/YEvN5itD81iitR7bSrQE2gr
	 WTZ4Xo4JdVr0HsxriDs04irpixkZEsxAzic+Eg79GaA0b5JUNEaHQHqE6TMZUQLi7HiMO
	 2YwyTQZo5FfB76Q9104lhAznI7tC1npaCYhqpCoLVmEAaNRD+GTiF+o06YSTS1pE6GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H7EyAW8gIZSrszNFTN7k6+v3oo0t52OnzoPD2MAjtew=;
	b=0GTZ4vmMxICbWy3hs9/HHueH4yiYh3yRo7p3U2w2B/8KLIq2AuHRdMIHY16OZKVkmf7G
	 7+QoQstwoIEc7Hm/60pOeCHwtkWFS7OGVCHiVjmV0bwwnskD8Zw+oXOnvPZk39DSHEMXY
	 dfnyNi0ZxA9+B98zT5zzA0pmNl8VNUj4RgRRQSIagzNEu/H2zkCbrQfyEvSe/0kRJL+dc
	 mWSkqF2p7dkzsWY6Iefcgf6IPoK/lM1Q0Od6oxjJKgGPy3GlnCFSEgdlaVQRjjvNhBzp6
	 1WPaqm3FbGScgdQuaoLNywHWulxvUqv2BCs5e4D5PjyFBukT+6vrV+hAMGOPZQQ0Yhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oUGjqceR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IhkFZBy/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27E2606A339
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E27E2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oUGjqceR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IhkFZBy/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7oaVQ1685166
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7EyAW8gIZSrszNFTN7k6+v3oo0t52OnzoPD2MAjtew=; b=oUGjqceRv3pdtJfP
	viq1yj4xZt8AJF5HtctmfYOqGmcstEHoGd/enIe0GPiO8MXHOZGZA7gpntwk1DWI
	jBn8hJZ49msAelEQk3ZgJ/dyQdZU0zcGnQI1DgXVOySgyx7UudM05ZjOZqEd4lb3
	MHWw+Jg6lCkW2ygE1Lq+9MiqNO234c3BOOSmQowJi0anVB42ieVOVXj8FJ+ZuwRp
	/eoSM7kWzryAfRRsmdUPNkyH1VtzKNHDkbLMMhXA3ZYqitmfNzBH1jJRlmxnmjTX
	5UB6g4PM7JCMPUDG84ilub7d7SxTRFujdwxxGoufrowH9kqsgz0SN55+p18WUuBP
	ZbFHEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux8gua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960bd17b5so325860985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076819; x=1795681619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7EyAW8gIZSrszNFTN7k6+v3oo0t52OnzoPD2MAjtew=;
        b=IhkFZBy/HJeywvs4HmfHHTsUxMU++O0NrUrjUC+fNo85gwRUyTDTxIdhg6WvsxCwz7
         J4LHFcgY/Y34ame+eej5NPkTVZtE2InACvcYjD/tn6bELEMtpHzfF62YovKMHxJ66Jzc
         I1cHFp/22K2vpCWRd4HYHw8OxG6KYV2tEnElVfQ3wKbmoW+bkhnDHqQI8a8AAWmoHJt1
         cUMcD+iXatVxcALvKaP8R5yXY5PEpn90OJ9rBRXXXzGFPMKrs3IQAol+vOtGmznzMHm3
         jeKBGRwqAOP6Iq5woquC9REG1DtfvyNohb6xZTR3YA/HNv8fr1DHniqGx3ZSK6RvVgsG
         pgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076819; x=1795681619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7EyAW8gIZSrszNFTN7k6+v3oo0t52OnzoPD2MAjtew=;
        b=tcoytd+i47EKLHIvqhpgZGv8B8kSJIWalMqXczDK1KZMChvT51kYXkP4ZVeF2POskA
         ijaFCgL4pimEJGkvHbaO9qmHbQm6hXeeTshq3qInJBDpNbg9tp9wSofbd6MKR2nxN6nX
         MfenRDFXSnBEJd4Uv6Tp7ZhGeypFSCqPUDslI2rQJGIBmrEHsmZXwxJr6LXIBQ5msxpA
         gIzI2y3M4UT/8YaTZIhrZhFi+HlVt1gtr3NsWdgx4Er8EAu2bb5R9c/2kORyH9asxOEE
         mrCe15vpp95EJ09jQXZi722qKA0JrRhAmXsQJpNDh7R9gSMWMqQQZydZ2tpmrI9SQUQX
         jPeQ==
X-Forwarded-Encrypted: i=1; AL+hErEjv3K7ZL++9b2kTqetHjuJ0nbf0qp+EzInhTQof+TtZNSYkOt3GSMMQi2EChx4kat3dJdnjcQ0d9m6UI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z90z5i0smyTvZxeigTq0JUrt71MKYAOvAQIFzChFJMPBjuBjfzc
	o8ysakyeEvg0e91G1WnNBqEKrTz+55Qjn8PEOuGwOWDHwjN5Q95Yw7nPV4AA2nmBfvpAPYAKwwH
	6mPpK1MKOFywh6zLw9bvsvM+hlpmA9zA/+UVJIInpj/NYpB3Cs+FMJ4diQg9Bzcf6WlY=
X-Gm-Gg: AYBFou0U7b8Fm/0bw82ThS/XN+n3VhFuYJNEjH9v4ZrgG6K16QQ3D4dSRi4eFju2pyW
	pQOXjCeTOIiZWXHVQnePT/s17gJZwHfBAcXXJPmkfrexoHDMyXyR5MsJeHRfpmWeYWkN069vOUE
	kJXAeenjdu+28hKkcWYvChfuHZdsBaeLZ3wE9Cf8ZPgpUfPvDr1iKdZmHsL/0QmxtVlY3breWIK
	+3LNLFSjs22Y/zrMYR6quqTyCVBMvR9J8NDGvZY84P2eLPYTEa5K/7QUv/A5Iicf96SDcCUoHvl
	JGYw9LWang7FSoOABZv68pguS7dO58T/EmkV3Pc3yCSA88nJAlu3+UkuyP5TAs4D0umS3LZ2d0x
	4FMBpXECo2p0xMqob+KHHc8MvIFmjQeUUjkWPIXPIAz3LkvJmy5btZP/YNjo4VyonTGU6h30wwk
	cOZ8IAUWjGlodObceN6q13Py3qvTvCaQytonx7
X-Received: by 2002:a05:620a:6c18:b0:93c:a191:88fe with SMTP id af79cd13be357-949994af046mr819246785a.8.1795076818715;
        Thu, 19 Nov 2026 00:26:58 -0800 (PST)
X-Received: by 2002:a05:620a:6c18:b0:93c:a191:88fe with SMTP id af79cd13be357-949994af046mr819244585a.8.1795076818214;
        Thu, 19 Nov 2026 00:26:58 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:57 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:31 +0800
Subject: [PATCH v9 29/29] soc: qcom: pmic-glink-altmode: skip retimer reset
 on DP IRQ
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
Message-Id: <20261119-msm-dp-mst-v9-29-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=4168;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=TmXXqL4+QkkVPUU1CXlnanGogNfSgc71YZHywrBoGyI=;
 b=Q6I/JovIIdyQKcMt76CYQBhCV4JoyljJDor7HDEc2HiMNCQP6UyyM96jcJoOWA0eC0gdcjaRM
 HACmEwkMUp+DL95zkJnPY4uvoH+mfs0sYxtG+8bDNjtQjC26l8aCSQA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: WtghgGVEgTEbCm6SQ6dqLgntrWCxhxgj
X-Proofpoint-GUID: WtghgGVEgTEbCm6SQ6dqLgntrWCxhxgj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX8RKmcC98/ldO
 PkTIAg92mvUCu56aeS/x/x0DePKxvVvdXGCO9CGc40SG3brmMoXrTvaY9b+rWKxhXdLlCd/dzzJ
 WIak6bbW8s6WquQ7Z8/BRdo7n91yqxo=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afeb2d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rzLW7fUJNTnmvIt_Je4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX2sEIIjsRVVLv
 DgW8O7bFPm+4xnYNElkY4ypWANZ5gtyHWZvSTTtBDoo+j8IR/6Vpj/qad9P3wRYDEMDzEj521ey
 m9BxbklFKoUt37VY3n1Sx5i3eexBI0kX7L4jLfyaSuKmpH+wuOng5zSIjm412IxppKPdvkr2x8X
 bRz1UQOr9VJFY2TuFmfjj3qBFHk8YnGywFypH8yhvxu0vkxNYd8YAzMLuIvI7YQjdGbQ8dg5FM/
 7+I7gCoVyn8tDTModgG61BHHE9k5FczkmY23nQ473kML6wbq5vDY9Pte3Qae5zCYfQzaYKIfMCe
 4zKV9zekbLowcgxxPLcFn2CkvAe1PzBuQgEA08chsqVlJ3GdAe5R9OaZEMxo6Ii66swehgM8Zus
 rZuY1MjXTk9HT+RtwlyN0oHGDsfdXoWdDh2LFwftnA6lmjMZETYZsPP9lInUuWRu8mVRGTX9hmm
 Y8yb79qKrzfKR3twzIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

A DP HPD IRQ reports a sink-side event and does not imply a Type-C
routing change. Reprogramming the retimer for every IRQ can reset or
disturb its datapath while link training or video transmission is in
progress, causing intermittent DisplayPort link failures.

Cache the successfully programmed DP retimer mode, HPD level, and
orientation. When an IRQ arrives with the same state, leave the retimer
untouched while continuing to notify DRM so MST sink IRQ handling is
preserved. Invalidate the cache on non-DP modes and after a failed retimer
update so later DP transitions are always configured.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 38 ++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index e903d4910e9c..5ae554dc01d9 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -121,6 +121,12 @@ struct pmic_glink_altmode_port {
 	u8 hpd_state;
 	u8 hpd_irq;
 	u8 mux_ctrl;
+
+	/* Last DP state successfully programmed into the retimer. */
+	bool retimer_dp_valid;
+	u8 retimer_dp_mode;
+	bool retimer_dp_hpd_state;
+	enum typec_orientation retimer_dp_orientation;
 };
 
 #define work_to_altmode(w) container_of((w), struct pmic_glink_altmode, enable_work)
@@ -180,6 +186,7 @@ static void pmic_glink_altmode_enable_dp(struct pmic_glink_altmode *altmode,
 					 bool hpd_irq)
 {
 	struct typec_displayport_data dp_data = {};
+	bool retimer_state_unchanged;
 	int ret;
 
 	dp_data.status = DP_STATUS_ENABLED;
@@ -200,10 +207,31 @@ static void pmic_glink_altmode_enable_dp(struct pmic_glink_altmode *altmode,
 	port->retimer_state.alt = &port->dp_alt;
 	port->retimer_state.data = &dp_data;
 	port->retimer_state.mode = TYPEC_MODAL_STATE(mode);
+	retimer_state_unchanged = port->retimer_dp_valid &&
+		port->retimer_dp_mode == mode &&
+		port->retimer_dp_hpd_state == hpd_state &&
+		port->retimer_dp_orientation == port->orientation;
+
+	/*
+	 * An HPD IRQ is a sink-side DP interrupt, not a Type-C routing change.
+	 * Avoid rewriting an already configured retimer while DP link training or
+	 * video transmission is in progress. The DRM HPD IRQ notification below
+	 * is deliberately still delivered.
+	 */
+	if (hpd_irq && retimer_state_unchanged)
+		return;
 
 	ret = typec_retimer_set(port->typec_retimer, &port->retimer_state);
-	if (ret)
+	if (ret) {
+		/* A failed write may have left the retimer only partly configured. */
+		port->retimer_dp_valid = false;
 		dev_err(altmode->dev, "failed to setup retimer to DP: %d\n", ret);
+	} else {
+		port->retimer_dp_valid = true;
+		port->retimer_dp_mode = mode;
+		port->retimer_dp_hpd_state = hpd_state;
+		port->retimer_dp_orientation = port->orientation;
+	}
 }
 
 static void pmic_glink_altmode_enable_tbt(struct pmic_glink_altmode *altmode,
@@ -214,6 +242,8 @@ static void pmic_glink_altmode_enable_tbt(struct pmic_glink_altmode *altmode,
 	u32 cable_speed;
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	/* Device Discover Mode VDO */
 	tbt_data.device_mode = TBT_MODE;
 	tbt_data.device_mode |= TBT_SET_ADAPTER(TBT_ADAPTER_TBT3);
@@ -271,6 +301,8 @@ static void pmic_glink_altmode_enable_usb4(struct pmic_glink_altmode *altmode,
 	struct enter_usb_data data = {};
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	data.eudo = FIELD_PREP(EUDO_USB_MODE_MASK, EUDO_USB_MODE_USB4);
 
 	if (tbt->usb_speed == 0) {
@@ -307,6 +339,8 @@ static void pmic_glink_altmode_enable_usb(struct pmic_glink_altmode *altmode,
 {
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	port->state.alt = NULL;
 	port->state.data = NULL;
 	port->state.mode = TYPEC_STATE_USB;
@@ -329,6 +363,8 @@ static void pmic_glink_altmode_safe(struct pmic_glink_altmode *altmode,
 {
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	port->state.alt = NULL;
 	port->state.data = NULL;
 	port->state.mode = TYPEC_STATE_SAFE;

-- 
2.43.0

