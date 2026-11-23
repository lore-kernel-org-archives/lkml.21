Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430919;
	b=Tp9vnUbIQSuN4ILJGVtBbNLpTxT8xmJDzFQNx5G37CwwmQMA16tL+ATyPMhuLVQQ8Vvh
	 IAwISgchqw2DmSqnMSO1XOSfBpzhMoLWE6Y9Crae5NeWVevVc00F7tj5jftMyYOscP+j2
	 GBGrQ2YS6f56KiIWQvwxyzvQpmpssvGHpwjADUZDOEIeJzH6eRnXAyqzIBiMlLuWKwTdm
	 eFQ20PPpH+gGi1lfQnuscZeExS+kvDx0YM1heYo1VUEYOzE1UDu2tjloujnAumAmryDoH
	 IZAprwWfifPvjs0gHVu0Ss0fNDZcFn1WBGSCPyMSoOmbCmXeha06jhNYSlPXmovMl8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9DuQUkmVsC2nbsYQKE93igh6iDE3a7mvoD13FupPHR0=;
	b=KjwMPIVB6S6v1txLuSU0ppjxduDpGcCJVxy0kzHL99iAubcVm6nkKJM+9y2xZpOk0GxV
	 O8/xC+XjP653xqKR5Q8165HQg0U/+1JXYk5PJlheBVNsgMlF/yKkZOMb8V7dGrjsGvAos
	 dc4zdTiu1DdVFW5GcQ101XtmdVkruRlqvpDdJ1fLpl4Mn9bSeEdhW5ujsdrwXsgh3ol1f
	 Sv4Wpik8fj+KjctB0jaluA5ZSdXZvXdmuitE7Vlh7G4BHdf3tcDHAtpsDp2Ohd/m3evWj
	 N5gSChjP0Dwnr6vkHhduPTaEfRTqnCPJTToeMdzshdTpt4ZxmVTxUGY5fNHeBZvDXOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aixyfQAA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IisZDukj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B1606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71B1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aixyfQAA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IisZDukj
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FxMi917180
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9DuQUkmVsC2
	nbsYQKE93igh6iDE3a7mvoD13FupPHR0=; b=aixyfQAAzTnHzCSpYwJUdInAifh
	b2IADcOH3PSgNZSUx7AasPdz54I6rkfwVfngJTrXwqFyaDqOboApeP9SDebMpPL1
	XxTQBmWkh0UR72NQxnER+Yt4ACfDMZ8Mft9qfMxRcyS69lBXiYWrwzNRSO3RamZs
	F2ndQoYFG36HjOqV1q60IbOz6W/BjN/peiesUUhbA9VGd+8E5hYUvxEzM9u8utUo
	oVOcDX/SjuGB3boCD3zvpFIFxypBbvtHtKAISIMVvn7SJvYnOacY60FAh+r7Dmi8
	uuHbsm1jIdTpt0mEbCkLfNeipz7kvaRgO8qgOlxdWFwe4RR0t+AxSFajrJQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a0xus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde85d5166fso535821a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430918; x=1796035718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9DuQUkmVsC2nbsYQKE93igh6iDE3a7mvoD13FupPHR0=;
        b=IisZDukjgMdkwfp86ri11ABle3ubHCz3FAZ3ADC20Hm9v8onFzDT+xBveZqHy1RKwS
         51+9wVTm5WZdcwHU2+YTpT0PkyA6g54jHM3rj60plaFeHaLOeg4+yJvHCGrzTNOqkyDB
         PU1gTqizZYD8P/RtDhF69ZFBhtJA1Nd5M+w7wH9RLUEQHho9ESsDPxLgiesmzsm2N4B7
         inlGQurb6NSaOq3ufVlLQFd7puA5VWNtVAjIdb4ApkF2ykIFgd9lUTYDi52DVk5nHZWo
         cM72XS9iP1zO+Z3ph/1Xk5qYY5/zcVDilIYxyr5fzuhQQ3OiH9UE7usoyYalExnwEzjQ
         JExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430918; x=1796035718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9DuQUkmVsC2nbsYQKE93igh6iDE3a7mvoD13FupPHR0=;
        b=GCwb/c56eRb2czD9kJEmwB6uyPudzmBeDCqABXJvTTOXPgt6G2I/V0QzFWskCt2IkU
         0ytasB5cLC8vGfH2shca53yi9NPUKjLGagoQLoEUHWs+yQzg1uO4nEu+JVQIYpvmbAz0
         NL6jUtXoXfpss6W75+mab1ojU9eNgkfirjhiA67qaSxSmgV6up0YmYyLFgiqYPaxctWZ
         8Top3QNncWgcOst8xmsjT0aNxWyzTBnLOb0FJrtoLN0HiYqy0JiIsrYXaxylupnzewcU
         BjWoPJDRzpy4mAMgSicRKeQ0V9GYlfNa1YwHh7FhV5Sfxcgicq97v8DCPYfH8ev1Zi4v
         iLiA==
X-Forwarded-Encrypted: i=1; AL+hErEOT3f1WcSc/r4dvfweSFEkL6n4whixS4u0qjfV3isb9lHPlnwLmOtCCnOXHqEkBH2YlEfjuvk+qjfvZow=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9+DqNHpnBc/thtqL0zBqyWHTb+0sRxlwGm/aZgfKrAuFKQ8HK
	Zicq2afUKgb6h2bbbT93v0zkHk66nBSQiMtuMIO+WhIAj04tSwzmV5O9RVhl1UZ64yYmmcmLJQT
	H5Tlolb+cLKFldjGZQvAdvkOyEmYsilEfMPmidPxpsLCo2O4GL1jIMR2pQyX1vCZykhVaEmH9ay
	g=
X-Gm-Gg: AZFdTZd8LrtIbB8vnyWM5ZLcUO108i12jVX/wz+r8rWE6uND1hZuPD4HAqBetlVUOCN
	kVmbxhEM6sMXBikYsJYd+gBsnQnfs5im/pnzzYB4r/v4fq7zFJeEWGV6GtZQQbock3q3k/bDbd/
	3zbnhZxSRuajWkSJO5oU5pGDa+0pujLJ9RbFO66fW7m2qLgL78JXx/GaVKxyahg18v1SJ9BJ4GV
	fYWKnj3ANTMvW4v8Rw/Ovo4usRHapsLfskka1wUTPSDJOAk0x/SMhryNY3/Ag7m53Nmyy+xcsKL
	3h+glyG59wsBVpbso58DHE27oh2Nv/hYlpy9DrBDpUza8bsMQJcLcgoikbWh51teOEwRIhC98hG
	myFiRr21ZFFahsk85FMQX0nnqEHZRocXVFn7fCSZ1vNDX7gqdKhYM5TOaEBxOaJ/EhM9uUQ9zOX
	Ovxfyryw==
X-Received: by 2002:a05:6300:8095:b0:3e2:83d5:191b with SMTP id adf61e73a8af0-4014c25610dmr9462419637.63.1795430917725;
        Mon, 23 Nov 2026 02:48:37 -0800 (PST)
X-Received: by 2002:a05:6300:8095:b0:3e2:83d5:191b with SMTP id adf61e73a8af0-4014c25610dmr9462402637.63.1795430917261;
        Mon, 23 Nov 2026 02:48:37 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:36 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 11/11] usb: dwc3: qcom: Enable VBUS override at probe for default peripheral role
Date: Mon, 23 Nov 2026 16:17:26 +0530
Message-Id: <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX0WgWsUTZG5BT
 ER6L9laxjCFjHPjnhmNM7BNNfw1fLaRwQ85ltSOkxbLQOZE1SY9HxwZtbbB7i0bhJHNaSC6zDKu
 7wqbNuzIXVY9qMT/7zEPIEBTXWcmg34=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXwl3VPK48wvY9
 4h4zYBX7Edah282I15dSElxo1dPdJlFI7pFvPuF2ngPCvS99Z90y2lMuc2bzr+CEN4IHc9rrT/K
 ihd+6A9KO07NKwla3lOVSq/A/VkRZGS3H9ecgqvvZtDh4lYnf/w+h32phr8F7naQz2WsclYLslG
 etGhT8kXN6DmiEJS5K2wb648voCPWAaQEeQr2SX0OaCr0l0vF+09neH4doQDjjfQN0p52TIpcOZ
 Ogt1NMYi6MNUWf72Ziz7wai/esv//rmzK+qufWceBR2ALG7sm4zUQPIXr3P59HyC8DW0NafDHjt
 mdsuY2FqkC3SQ0DwL+TuBu0IisLLz3wT0xiuVLPxRJ2WmC1hbGS3ByO5EFGpCmH3t5Ya21tn+Bk
 Tce9cD4Aqwn04nSs0qQ47cns4mIE/35R9q5vvJby6U9yfnCsRwglgXUiFgGrxWjUibVvFil65OP
 U2jY7ks7AlqoaFZ8lWA==
X-Proofpoint-ORIG-GUID: Wl6GqjbKBLOpU_-jMkCVTarnUi21bXJr
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b041a06 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6vjEpHyq_EskaYpSVAcA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Wl6GqjbKBLOpU_-jMkCVTarnUi21bXJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

When the controller is in OTG mode with usb-role-switch and
role-switch-default-mode set to peripheral, the role notifier never sees
a transition at probe, so the QSCRATCH VBUS override is not programmed
and the device never gets a session-valid indication.

Enable the VBUS override once at probe, after the initial role has been
determined, whenever that role is USB_ROLE_DEVICE. This also covers the
dr_mode = "peripheral" case, which previously programmed the override on
its own.

Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
suspend/resume iterations completed with no failures.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 559de5172e61..22b6c7ca0297 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -964,7 +964,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		qcom->current_role = USB_ROLE_HOST;
 	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
 		qcom->current_role = USB_ROLE_DEVICE;
-		dwc3_qcom_vbus_override_enable(qcom, true);
 	} else {
 		if ((device_property_read_bool(dev, "usb-role-switch")) &&
 		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
@@ -973,6 +972,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 			qcom->current_role = USB_ROLE_DEVICE;
 	}
 
+	/* Force the VBUS valid indication to the PHYs in device mode */
+	if (qcom->current_role == USB_ROLE_DEVICE)
+		dwc3_qcom_vbus_override_enable(qcom, true);
+
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
 
 	qcom->dwc.dev = dev;
-- 
2.34.1

