Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009086;
	b=luVHvJlntyoanuD4tCVJ/vpII+D9N9qvjnvcnXKjMmzbuql8hJCuJVsFJb8eFssTwFX8
	 r3sOEYgFlNqdl1oMoUlIcaIQj5GUjc5eLq6ABpNO75lFKGv/aOwGPWo+nhpnJXajeOV3/
	 3sLhW7P8JRMCF9ZzvL6aEgNGnMOUFoBSO5DpvS5SyukcE6U0xKdmkMcLu0edxy5Vp7jU5
	 xOETtGc4RqZXOZYprH5ZdhuCye+33OZlbhuoOkXVNg3S7fCq9aBWYZeylM2genlT9qyEE
	 3TTj5rBE7GIUidHbw4Suhs0knoK4ReGRtGgU+C/LfNeQ9YhLXl9KZ8TiRp3CpV8LrfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jmhWy+WQRuCKo2Tjc57zADzpzLLO2qlhH7Slwf7b5N0=;
	b=rdsDmWtRtYSSGHcxXTvHWD8WMW0KAU3zN91NLz7cMBkr1GHqyzGQXn9RHkismcPV0Ye8
	 hTsiGd5nBhnhOpQuFgbbYFZIEGnH0dqdqDzNuW5QDE/rgU17nU2kWNzIENokMCTo+mRqh
	 yBjPMrti17zIF3M9zgUaU912mtEjKW/DwlVcUeZci62srayKMwrTuWmSfEuc0jeYxwAMq
	 2P4jsJ6uyM3ocqAmrGcL7cNXLcsc6fv6sn/A9SjUfmvnzK+ojzJianv80K/dutVw4Mv0+
	 eWEP66Ptyc1AbpnXX3NiIId95e6ag+Um4RITvorUWlct/+ISZ4TwZCA10RIPCfm86lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iqZ6TJKC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HnMhp/bj";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6762D60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6762D60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iqZ6TJKC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HnMhp/bj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQhfU1320652
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmhWy+WQRuCKo2Tjc57zADzpzLLO2qlhH7Slwf7b5N0=; b=iqZ6TJKCTh/qnM18
	RwwQDjB6rYObtNJUCtw9348pqp/uqSsR0nkkGv6w8sFgRks2fbvBYcQnOtsTGRC+
	je0Nk7LJvGKH/xOxI5faov/jsvUAeEbT3j8vKjDeWczQpqpgUYeGLvjd79+jsLsj
	El3zmIlfOQq5MPhAshKYi8wxanyvv+HDeskrfB9mGC5ZMew4PQRnjaEvt1o0ZINb
	TQIpg6HFXU9J7ayZzU4dQxoX03TGTyNtrOQQuEttmDnu2gEPds+KND6i3+l5ZoMY
	lpIYxVuIh/Hfb+S/hkAgh2F9Ww0iAxEt0qf16EIIBEvpGqG5ofALL3+6zsQzHy7e
	NurNIQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvck6rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:38:05 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99859876e19so162617241.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795009084; x=1795613884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmhWy+WQRuCKo2Tjc57zADzpzLLO2qlhH7Slwf7b5N0=;
        b=HnMhp/bj9cI/N4CzPfB3jHwnwII9o7YZGAT7hb1Oik8Rmqeqi4CDmJBf7whFmsza8z
         odKincnWYjp4zUwl5oyCYMvwnpXIRzqtWiuh6x2oE88MBN+rhKjYu2Z/DcQaS45pDHt3
         78rCee2vt3bctmo/OA1fj2Huf9b3KG3PZVfRl+wKRGPM9rdYT24R3Gw3wg3bB0jwgiAC
         pgnUCYxlERhH/Z2NLeq+3LPj2UCj8rIpAw+Zfki4f3ekWPf/MY1ahOJTwVB0uRUrL+Se
         JJn/rnQkmkSz5MAE3EjQpMcXcCl6+jIZIul1aV5ngCMut9J70JfnbANi+9BmIAivgK7o
         DtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009084; x=1795613884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmhWy+WQRuCKo2Tjc57zADzpzLLO2qlhH7Slwf7b5N0=;
        b=bG0SEqtK23WMoijyioPhtY+5+80ZhOkUda6adVToPSwMoTO0P5tZ+T9rQ5xQ022yn1
         vtr0HODCfIEPV5hfQnx5Ui+KdpM3i/qzpa8LGS6SdGezTTsOh9AusIttsn7zujexXRms
         vALaA0VKkOvchjuqHZC/p3Lq9YDwRXZ6wd/tuYKnZJcMoyjT0dPoPK0/0ktYJasgsk4+
         GbhdOK8b3d0nETeRqDz+EE30S90FSP06NF99cAvTtbmhfq9XvAnTLkmcbnoKhLgHegHb
         P7zuBGPrKDx88fjFwC5IlXgm/aTEJ+gpPKfaXeEaKyf7+8tQw3MTSXJKRxaoygs2mNoV
         OU1Q==
X-Forwarded-Encrypted: i=1; AL+hErG6bQt0A+iDptXjdvKWNJWswoZAVdPGZFE1dF2pxtrOutQP0z9maSc0aHfc7f2ecdHkLEh769o1ZZERgys=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SurFHX+sa8CqLS+2TLJSX/ML7gYZ5scRHo5e/f0if842Ly9mP
	oQYzJcsBcWSVM2MxkddNbqkVLkSIQmOGlATnpt6ae1E7Gru6JkfVg9Y9F+Aja4xHZTBaEU3nrbn
	MUo7IX9Ae7hIHQccNf44hbVfbZYtk/7CEXmg5ik/VssyddMm6sGYwewSE6CqZ8c9SF88I4N8rrI
	o=
X-Gm-Gg: AYBFou3JHxJZWTKkmsBgfPOWYUoYValsO/2HcBoHpKy3nnqAjFL/lvvqA4nKAvRylDN
	qHpdFRNWZclra9avmJHh3Srg8j7iTcnJO7sgzPrMHZqFf2ObuDtt1L1R/7Pd82/MT1Ovn94s3e8
	PELtAN8/BOQ5TLQHKncEEzQBgzfvDYUb6t7VQ+zpnoMp9+Bw2aPTVUc/nLhhP5Ok3xKaPAXMzIF
	ckXUYGg7i0zst4QlMZGnQzHTB7ef8tzW2Pl35hsU3w2PH49HtuVrRvqt04UbMGz9zkDRunkvnd3
	8Gtw9HI2CCeOlEhfo3t0KfAw6/vv3baF9fvYe0sZHtspG2Bosc3yWnzpHY64etgv3wdaz5JNP33
	YPrVZ6Df8m6OfixX8uC6pgvuIUv3I0w2IIQiP2aIt/Uv894hFrw6CQtMhspry92IcxFI/7JgTxl
	aOPEU=
X-Received: by 2002:a67:e7c6:0:b0:7b3:6079:1900 with SMTP id ada2fe7eead31-7d6ba4af66fmr748736137.37.1795009084312;
        Wed, 18 Nov 2026 05:38:04 -0800 (PST)
X-Received: by 2002:a67:e7c6:0:b0:7b3:6079:1900 with SMTP id ada2fe7eead31-7d6ba4af66fmr748716137.37.1795009083820;
        Wed, 18 Nov 2026 05:38:03 -0800 (PST)
Received: from hyd-e160-a52-3.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a1b61eesm1809090241.3.2026.11.18.05.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:38:03 -0800 (PST)
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:07:31 +0530
Subject: [PATCH v2 2/2] pinctrl: qcom: lpass-lpi: Force runtime suspend on
 system sleep
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
Message-Id: <20261118-lpass-lpi-system-sleep-v2-2-a6ec7f2ba424@oss.qualcomm.com>
References: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
In-Reply-To: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795009070; l=1591;
 i=gopi.kanala@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=lDn5poKt3ysTuETVGTT4YGl451c5NuKPmmjtEKR/+IM=;
 b=Q0JHIHwGWcVQxFXb8JpOXQ+BpXkPF4Sz0hk3T73DkXD3wVl9a/QtNd6Zo7xdsaxshoA9zq9Az
 sKRiZbvYzBADA5EomgMLnr4M4SRyhJXB6+cTM8ValrtU5GSYxP7m1AY
X-Developer-Key: i=gopi.kanala@oss.qualcomm.com; a=ed25519;
 pk=4bCmbkbT6dfZt13k29qAL6yx8zUQ6p+yOdkRBH8lzXQ=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afdaa3d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JB7U5Tp15nFzE9-rj4MA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: Y3-lMYUbKwJEJDewXm3fHECq9MbIqWO7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfX+HZuE2RhOIu0
 wMdyuWLBDksiEFLghHdXbcQ7KKTMvVQnO12mQ/QqVRiJ52gDGMM0R038EFQ9mpXZeYP8yW9YNo/
 KIpOVNAVVDf5BW737iV0M6xU1Ez+2QU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfX69DafpEV7uhz
 fD8lIc8u91ZQuWB3Vv7Jcpjnsy13aK0lALLECHsJS4PcNWBLIB8qH8PVK41e71R+Z29v4TQPT1B
 P7BDcda27G3n2BgvqEcUD7BDWBCXAiJj6CWrSYGY7ssLclZJG4YL5bZ1Kyn4KwjQUykmbcm99d5
 +PpJ46Hl56BYwTn1juqwrYSUQh0/Cyc5pN3y9Zy1vIuqhCkQK3eaJu/3Zg9L73tUMfxyqw9PkJT
 fGPS5lsBPs72MRxKQ/6W2wPqAZfSmbILEZ8fSzEUlE4R12ed9yrwOrX5Q+b39GEep8WT9/ka/+y
 Ml6S3co+jRISqpFxOgdtC8LBjjZ20wc4d1utCRXo8yWnSsXEHg3ZL7m8uDQWSKjSNofNc9lPePu
 eL+sByHQ7VfTR7bWG9doM4xAd6ekoltRwTvnjr7JT0aiVcCoF/iX80mQ452UI1VIrdbEQRA6VD0
 zgaRj+nB2DJfWWOQCCQ==
X-Proofpoint-ORIG-GUID: Y3-lMYUbKwJEJDewXm3fHECq9MbIqWO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180054

The LPASS LPI pin controllers vote for their LPASS clocks through pm_clk
and only implement runtime PM callbacks. Their consumers, such as the
SoundWire controllers, keep them runtime active through their device
links. If a consumer is active when system suspend starts, or is resumed
during it, the runtime PM usage count the PM core holds from the prepare
phase keeps the pin controller from runtime suspending, and its clock
votes are held for the whole suspend. On Glymur CRD this keeps CX and
DDR from collapsing in s2idle.

Use pm_runtime_force_suspend() and pm_runtime_force_resume() as the
system sleep callbacks in the common dev_pm_ops, so the clocks are
always released at system suspend for all the SoC-specific drivers.
Consumers are suspended before their suppliers, so the pin controller
goes down after them and comes back before them.

Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 1f1635ec53d7..f693e5101a7b 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -612,6 +612,7 @@ void lpi_pinctrl_remove(struct platform_device *pdev)
 EXPORT_SYMBOL_GPL(lpi_pinctrl_remove);
 
 EXPORT_GPL_DEV_PM_OPS(lpi_pinctrl_pm_ops) = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
 };
 

-- 
2.43.0

