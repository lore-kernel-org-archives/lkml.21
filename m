Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674732;
	b=e7gEM5r092vARmLYEKRu7nNzRII+xvLFuru9iwJuJNDT++mzZIX8iB6aK4lwNiOfS89l
	 B5ci8tLcGlTE8PMi1btjLp3sQ7M8q8Mn7b+fEKLuljoJq8sQlusqKN1oetF46UTWRKqhs
	 U9h6NMPkd5790KTvqbVKR3aWgWPOGikhR9M8URgiKhhy0XP93GbR5Oj4btJXPQBBGe1v3
	 MlourLh6Wh/g1irgzWCgn+Ynsv/J+h6edZGAkjj8o0y7V89I37dTXFO2tVlNDUkO2n7to
	 yh7r2aFodqww758Q29H/op7UhcghxEcpZGnvjIGsfF6wi+81X2Rt1BW+9ymsTFOcLHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=;
	b=2hwn2a6iGCcc2kgSb/yFrhc0p4YbfOZVDe/ReSTv8OQgK6tVnFOiYrO3TttM6tXttndo
	 43HgWkLlPovilsrppLL/inR4weOCWr+aSRWDpcGKFljdPKXunw/TR6BA1qzKlJqMCrqgt
	 pz8OQsOMJaR2O90nLbgHoq1wl22s99dIBlj9UO5aghTexKFZLJlmcQdvPR3/JoGDCl1rN
	 CdVWU20Uuvlub4pMDeRvklzlCVzQYgJEj8Xf/9kMWjSQ85VBTlQaCsqgIrwZ8J1gjLUg7
	 SJEW/kJg2VwF7s44e9ou6tumkrdkiTMcHWMg15Xo2bm3PKPPk6b58cAXhk5EFZGSJkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KwLkEcN+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YHuwOi48;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97472606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97472606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KwLkEcN+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YHuwOi48
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ69fvA2749528
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=; b=KwLkEcN+3tM7E/Jq
	zrm3P6u1PZaHxwIDGxCqcQv67I8AFt5Z6oAFSlGRZNygTSa8Zdud/JWqoU1ciy1o
	ZVUDxEtEFTew0UWzEEQhlj+leiGzmap8kC2czZcUp03ICNBUAoms5plgWzac9age
	WAcJsgbhjFE4f7BMXMyjKs8I7cG6IJrtN33VUKJEJyp0AcWn+VEDAuZ05Zl7cchV
	B7wsoLBOEatDcqR4Qx15WMs1Vf9vERRaioz7/HjuDhj/znDdBNmr47SurzVMqeMv
	7MHECDSdFczxFmeKZFjYehR1CVIwg5U93GZwcXFmvsvc7ZzlwqLVhg6BuI8JL9yl
	t4xmZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rg2mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:32:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f02c63901aso60170545ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674730; x=1796279530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=;
        b=YHuwOi48sQZqP35mnueZaBwuAd9EUBqR8x0amSmD/1fWMKj+gHujO2dUyFy+NHyfg2
         AXpQ2zusIwUv9TKmeHqa03rwzdYmtZbB0hPxCHDWoIlT+Q0RKNZqfzpqqTN5yQ7ckXKR
         4W1+sLPKrX2JUQGFEHPJWZcJ6EkYD00ZNNJfopwrAP6CU/WLHQXbz5J0wokC6KelJyi5
         6uo43YD1pxA0r72JDzN0HQKWggcOztz8EXswYWs2kefZ28TAF44q3zfd0yF4+mLXTtEa
         RoQVux5gXs38Kb3p6XrsOjnIDOYDIrezLfpdpojlnp2ChO8vLv4SuP1D7/7XfhSp9pVQ
         T+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674730; x=1796279530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=;
        b=N3ZQPLF4vxhfmkWjYLcUmkuYF46cYA5yf5CjHOQ9PpOhdK5mZay5a+IRgo0hvHiOSx
         pV+XgpUKr6/0q/FN/JzDY550TRx16HMtPNM3IGv16V4SlEWaWeRo5xTWO3E3oNkR2I5y
         Ag20L2XeZO2CtDknBqO6/F9ZyLjJ81U+neT5d7cuyi3jOoQ7ln6dkBWFtIuGFgrK7/Gn
         oAnmZuh6ET/Pwuc4Zo4l8ZIgjUihkhwAtxkBVI+61EIKIjRPqNLI9FAYsnJ3Hq5L8eST
         qrn+GdRz2957NjySD9vN/XVhj0vtCncCaAieLFa9S7JCeEPSrUY3FEBwHWXdUIpULMUh
         pFeA==
X-Forwarded-Encrypted: i=1; AL+hErFlNgUtp0XmKrcVj/M9wxopSstWYReI+LJDTHVDQ6MtXOu9l6/QO20aOr5wxoZ2JX2zlDpNCXzVkCUwYc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z87CJk/J3iJcUgbRaw2qMYky4kF9ek5Nr9NOEcCgcZflY2Yv2L1
	cqNga0Bz2yTY574rhxnXpmrgleuON7+YiXiaCCKq2lVytyAscQZKnWlo5ykk5mqa3PFCQLYLlPX
	sqdElgzLhbsvv3ZOX9IV92dfrPOQ3WAJEMSkE37HJ1CCS6UeP3kSzsiwSvfb7MfUH3ODhQ3QbvF
	M=
X-Gm-Gg: AZFdTZePGGOwUUj3iA60h+zfdy2Wd5vl7aaKNY6egPX5Vi4cFgs2K+bUfwMqOS4Tpp/
	4BeTIJtStoc7NHcVmzWXgY60eXW7IUvOEbdxDCAgQrPG7y9eo3RfjUET/W1bJdt0Fnem+mZqP7C
	z0gLYUkGN/YB+sK8chQ5zk/GNXaerC6X03UhwKTj/KhWTXD2ypdIkpPpR5zZRSO4U6eM/lOLZ6f
	E38VMfspOhswVKlr71cJs/aw0o4hK21xaejSjFJXIWVCchAM09iyQTxIW+nKJ/OwVq9tworylNw
	wvUzZ6b41HoYXanu1Yp5V2x1PbpsNLKoJZO24VA/RmywTg2cgXc/o8NhL6lbRjYvulCW7aH0qLp
	rO7/bhnJNWxmiJ9R7n1UxmdafahwmnbTn2X4IrK81vDMjLN7N9jQb87shW7FgERt2n944HVDVWc
	H9e2omtAGy
X-Received: by 2002:a17:903:19cb:b0:2ed:101c:480a with SMTP id d9443c01a7336-2f03f1c007dmr218270995ad.37.1795674729902;
        Wed, 25 Nov 2026 22:32:09 -0800 (PST)
X-Received: by 2002:a17:903:19cb:b0:2ed:101c:480a with SMTP id d9443c01a7336-2f03f1c007dmr218270835ad.37.1795674729434;
        Wed, 25 Nov 2026 22:32:09 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:32:09 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:27 +0530
Subject: [PATCH v3 19/21] drm/msm: Support KMS backends without a display
 IRQ
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-19-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=1191;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=OeeUkS71qhEHZfJKt5l7tFxYoS0sgnGLM8wENixTSYU=;
 b=xviT776rfCeMHIFO3g8aaW6MLHf1PKw27DBdPxkNYkyDI6t+nLjVEm6uO4H7Ode9HZee3kh4X
 Qit8ls5DWndAfFs+hSXsT9IZFIJa4EXjRfVkVEvK5CL6qZ2pjmmnDDb
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX817xW/JfZfwi
 b3wRg78SKjj8EX+uYPhJ1YH/0BklpPd6AbaXE20/vy//uxt78GB6pzXCPqiTBcRwVhubvYCAhqg
 HnG3CoAeEO3lAxZaxpP6QTcIlijrSxDtpWG2XLRb73JstHk124nD+eE9af31CEzxKXcfHSfOg11
 uXU5gImQEL6LC/dOU/D+jr93gVuDDIkMqX7czvZXDi5uA7N7MR9B6c+fBtn9KZTrhTg62TUcugD
 af9c8f0gUwPdtgDsUvfafJsyuohXQ4tIhUPuEO1zvu65w2ddPTOnqJF0fsowj8iEByfEDW0GRAs
 t6VATtJa6NfAdmfzCDGq8fpC5ClvSKR5arNtRYb+psS/4WC7OUIyLHp/2TzyPEMhQMuQzpK33Ct
 vj9rxAvKMwLCln7cHlhSy/O2/6T/vWS+3dY401RvavseeuJsD1cmT0hB6gsSuoQV39ALfK3hmv+
 6//Gsan0qMY0pwwcE5Q==
X-Proofpoint-GUID: DkfSjTunG8IbOe-yI0w0LVnqBU87qnZR
X-Proofpoint-ORIG-GUID: DkfSjTunG8IbOe-yI0w0LVnqBU87qnZR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX7t1LhlIUmvL2
 DbIuB48igZlz9rOM9WjGBBRt6k3fEG97pxVMzy9GSfD2QKsnDMAEHzlYC4fAy0DWbgUfFjZ5FaZ
 DTCA1vlc9gHvFt7gnadYPwXXqPGAuMA=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07d26a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=g9RcmOnx5enkyd0xrYgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The DCP (Display Co-Processor) KMS backend receives display events
through firmware over VirtIO and therefore has no host-visible display
interrupt. Rejecting it during common KMS initialization prevents it
from using the MSM DRM framework.

Allow KMS backends to use IRQ_NOTCONNECTED. DCP receives VSYNC and
frame-scan completion as asynchronous HFI events over VirtIO; its IPCC
interrupt is reserved for power-notify acknowledgments. Existing
IRQ-backed KMS implementations retain their current request and
teardown flow.

Assisted-by: LLM
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 9592fa28c85b..fe6f290d7be0 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -72,7 +72,7 @@ static int msm_irq_install(struct drm_device *dev, unsigned int irq)
 	int ret;
 
 	if (irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
+		return 0;
 
 	msm_irq_preinstall(dev);
 

-- 
2.43.0

