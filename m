Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562007;
	b=5of+eEyiu7YM23TPZ4FXWGxLXaeCGpN+3S1T/KtI7413PYCGSfyiNf3F4SP3oYesYMXP
	 O/VVuhrGt94ZyFAmq9abmPaDhASOLWaMULy5yjm0GYfNlWkYlXMVOuTC5pD9WQGpVkfVa
	 L9GKVX2FfBUvtdG1uqTKSwPYHhJGr9sy9XJEJOJIKbLR+iaXsKyRbWwY8Jy5jwGFvtOZ7
	 GP60RdLkLs/ZcbKZjrFgwXy2DNUiE8wPIKfNb0e2VvzG4fKOyLUeyCrxJSyWULQOYWQ0q
	 jLFFDUTzfnFKYmYp4kTI96pqLhOwzOP5p8uTmWWlJew/TGbszXrddF6D3K6KHxAK8Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cjiR/MdBLxo+zRp2BRTcZcjEQ/mSe6WUU93dr4HBkCo=;
	b=kF5kcncxL3geO7KlDqyEwYok/HyEgit4+GOnzYynWrJawKt+tssI0Sg5crD0Zf/n9Vzr
	 tloQZvuLxn7s9pWEeqPSpaOgmkXfLvR86E8QOzIL78IlxMXjnFcL4ldUZi27cKRvRNlIH
	 9oSNRPPDzeWk4EECn/Bv5qpDWhh5X+5fVBeksY1gbt7HQIcYvZIC9wcgcNcMehJuS65O8
	 mtqhIX1SFY8RJUVV3jiNG/bO5BHHNNBiMFqNW7fji8Q/JJDsiTsvSCW7EvO7gxOC6FZR4
	 mDDIz8Wontv7JeDqdYdd5bXCwTaLUp0y3Tcjd4w73ZZpY2PqLszWctgmypououGS0rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GkwNMp1J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e23qEMrR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5120606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5120606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GkwNMp1J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e23qEMrR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMalFd640319
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cjiR/MdBLxo+zRp2BRTcZc
	jEQ/mSe6WUU93dr4HBkCo=; b=GkwNMp1JXdF9NWfFlmXBLS4CFCYjyslZ/OMhQC
	ghduQAh4xtyXzrB6PbaWrD1ERa5bQyqcppdnxY5fr4bCmGMNSGY9UZmOTqpPVGtb
	NhgXlXZvBiuwntGXdKcSPiJNVXOdN3Iw3uQB77pPo6+lrXAb1iQLUXQw/A/8o/xU
	OFro0ndfBBVipMkVL9xyCkEhBzDkDf1Wz1jmoU3TYIO7HswUBYzuHt9Z2kkWS9Yk
	BwJkKsYw5YIZ33sN1mhqO0LRCqSHSezY/Q7XNW7k0MCcU6bf6Uowq/GG+8D4ejNg
	gWKKo4yzHd+G31F+c+vdn+ik4UapXXgYdXuMJv1jGBSdv3yw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effsede-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:13:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3969a2a7so753484485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795562005; x=1796166805; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cjiR/MdBLxo+zRp2BRTcZcjEQ/mSe6WUU93dr4HBkCo=;
        b=e23qEMrRt/Vlwb/StcG4YUmLY//+RqzyVBa0IQVGpUId9qeffC4mXr4HeFWEhP5qk5
         XR3U4l2zM/k2DIlgqqTHtXu6jrE/0ZnnXZt8hT1gm8SEBPGAl8cDy5HROY8GfkvT6sJp
         M3DIrB1FNrp+Lkz/XrVrYs7uhpbz+sO+OsQwuKaiHSt6ORBdxYguaFVfLykWTnxBjryU
         4glz6+P2q3ezFis+o4mPNYwkDmw5HGqCmrCum9SlA/cBpTtWUE8UDXqunfAaEEklWijM
         FMY+HTYWS721mly6riVNPANEAHykWgfjJl+iY4DtGCJB6QoJllG1SVqAqXG8QUn/hUu/
         wnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562005; x=1796166805;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cjiR/MdBLxo+zRp2BRTcZcjEQ/mSe6WUU93dr4HBkCo=;
        b=OwVnPS2yU+f4f9CO7o4gr6rLPZdboUjOvUtRBXp9Yr/uc7KwJ/xuuDzpogHLQYnLnT
         4gQzjf2N2hIGkV5KL2Jp8sHRelt5qpkNDX6NBjyHQ5Wm0vTQ2yZdOZADDXUid5bQvu/i
         r9X9ix5DS5ZFrnCvZu6rg94ImE+yIUhQqk6g/LyzOR0h+eouWFm8ORXpbQxyNjcfa6dY
         1Y86NgUvcHUgszZsvbCI+2DBgG3Kp8Z+wwaM5lAVNMJoUhnmdruLIpxBShNnF6D0G/Mf
         owTALxb3uSalDCjnvAEiFmhwYb7R0AUEl5J56fjGKOWbnTJdxDealQieGrlrvJWNtkvD
         Sj9w==
X-Forwarded-Encrypted: i=1; AL+hErF/kOnCIoxzl+eaYha+4ZENxEJzj0bPku/zvh4kv5Z77DCnJq9d1SSg5iE0RUqJeyaJ4JPNsG32jmLe4bA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZHirnTUmYvM76nM9W7DEilE3LWnxS+rQmNqHVYTCA3MYywFYq
	n09/SvJMlL9t7UdlE75VP9IxkP8quuRCfxYv6YM1UeJV7+Zk/lrglDZdXYmV71nc2H2zNjyqsBq
	HNq0tY3f1Ty57kthT7dNtqOtsd7qZiSm3500r53YFeWfrnqeoJuSLo8HVf/qZiqOKlkc=
X-Gm-Gg: AZFdTZcFWYDhjuFjnfHhdqs5uaERSW0hI2CGf7VaqLActq19qsbB9cpu3P9rHykmt/8
	Ew2gOkl9W1QVbujWdIacDZ1Ct1t2ITRZOu31p98+QZ327+hHLkPfL6Hb/e+p8eYIiw0ywqcj1RY
	/68O4orVc4/nABofad5WdJEkC7B6J2xlN6uw5OP9vtizYG7byzcUNqlOLGpzEfA5+4j2oIbFn9F
	gyYpW4kiUcPZPI+RO3SZCjDwCxQRcdakzKIIU6Xz8Scrm8GMtfGsnF/eHBSKrAKCnx+u3kZxyaX
	lpH4oIeh67lgNRdF6jVK/t4pYBmzBfP7JxJtcklGFT/Y728R0dKZjKdC3ntv3eGqPJ49caY9tf+
	bWRfIapL1dryFfhbg/ylM9QOWifkgIgvy51zuLUL0BIE4i6WpBRHC4BOoh4K2ZZJf7ly82ZSUtE
	J3dENghAMhwyZCM02r6OTCz7nVydzyDsMHNKJiqBIjDrQBfDnt8nVwN3iU3zK1CA==
X-Received: by 2002:a05:620a:260a:b0:949:7502:6a0 with SMTP id af79cd13be357-949bac8117amr2408148485a.77.1795562004812;
        Tue, 24 Nov 2026 15:13:24 -0800 (PST)
X-Received: by 2002:a05:620a:260a:b0:949:7502:6a0 with SMTP id af79cd13be357-949bac8117amr2408143385a.77.1795562004264;
        Tue, 24 Nov 2026 15:13:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8056b207sm43708401fa.37.2026.11.24.15.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:13:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/bridge: lt9611uxc: fix firmware update
 verification
Date: Wed, 25 Nov 2026 01:13:14 +0200
Message-Id: <20261125-b4-lt9611uxc-fw-verify-v1-0-7aed8dec8018@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAoaBmsC/yWMyw6CMBAAf4XsmU3oykP5FcLBlq2uMUBaQAzh3
 1nlNnOY2SByEI5QJxsEXiTK0KuYNAH3vPcPRunUgTIqjaECbY7v6aY8rw79Bxft/ReJ2F/thbO
 8cqDxGNjL+h837elxti920+8G+34AOjWm2HoAAAA=
X-Change-ID: 20261125-b4-lt9611uxc-fw-verify-22ef8b3e047c
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=805;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+T/MOVlT5oZ3ZJe9Oe4wZLBaImuh0MwfsiiB5kqiBbM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrBhoMLGUmIPl50SxT+LpImTbqXaO4zEvNT9c+5
 fERrLBS+rGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawYaDAAKCRCLPIo+Aiko
 1YWTB/wKcopixoLFY2rRSb4/Yl5oxmPIqc6C7I/i0LgO0oS3OQnoxsdM1dwuxdBFMh0fKkE0Rjv
 8IWFwAjt5gl/gjKoRSVRIBIHJWNsyzf6IMcl2p+Y4Ft/g55OgbkNdRskV9Yzm/d0/5nvTIjwhCE
 fTqB9RWZlXE2yrJximpvlFLqLyhB1VfG/QHXq2UdTlgILqUPOzVjYctoCywRO3Zxv3nEjRl8Sj2
 tlIlITbyAoi6C7uZNKumFl3d/ZntamBKcUxaBgoNN0SU9m6euEO1ynQM1p/V1lnNLcj3QiBQb6V
 OkAjZp9F7nE8FG33TfO51t40d74WyLqDRiJgVbaO9CwxBp4Y
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b061a15 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=lFySJRcj7EoOnToY0NAA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfX28XkhaA9e0LZ
 tRdeQgz/Da3yNBMsD7jkJSb6AiSzm3P9lVtwv2U3ma5r+PYordAKcy9t+mxQXuvR9hZwk2YmNM6
 4yqNuGjePwHVilGweoPatEBAA5k+ARUVQ5EaGw02yrgVu6Mi33uWgTTZ26BUh1wsNeDHDbnFS0b
 nZDp9yRLmx84xYEgWmedvi69jUCZEfa2i+8ApGc6rkrUAqtRGGhMl+RHqF6eWENnKz4qdkuEkiz
 UNMjnOzMhqHuHs9Fw2AtpXHkTVUVj2P1POj4RzmWwVmm5tA9tAd8lT6Yjaf8mlRXee5gTgmk+Q0
 6Y4NkDOS35qySimDWGGrG2aMfLat7+pmWL0BkM8StEC2i0dvhgpNSYanYQ2Rym1NRmrOh1VCuD5
 ZRQudOJAZiDcsmznsT5/IeFkTiaxLNOQFpbOnWQZN8zseaQ/Yn/ikOXmx+6sLqwAs5tUsToKiXe
 LniB5j1VXSSRiZFhRIg==
X-Proofpoint-GUID: lxZuSNYCxEjYrcbPc3Kow-lMlzznIFuy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfX7oCWwyD9fVM6
 sZx0cevrVByIC+Erq9PaVE3+7bPuwvgDMgMNvB6iI8NQ2vVhznbrxhwIHlo+tBbNJ/dOu5DsNnG
 nCPN2YHdOTx6o20+oT6JnNlAb3hm+TU=
X-Proofpoint-ORIG-GUID: lxZuSNYCxEjYrcbPc3Kow-lMlzznIFuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240091

The firmware update verifies the flash backwards: it reports a failure
when the read-back matches the image and success when it does not. The
read-back itself is also broken, as it never switches the flash into
read mode. Updating an SM8350-HDK bridge from firmware 0x41 to 0x43
printed "updates successfully" even though the comparison had failed.

Fix both.

---
Dmitry Baryshkov (2):
      drm/bridge: lt9611uxc: read the flash back in read mode
      drm/bridge: lt9611uxc: report a failed firmware update as a failure

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261125-b4-lt9611uxc-fw-verify-22ef8b3e047c

Best regards,
--  
With best wishes
Dmitry

