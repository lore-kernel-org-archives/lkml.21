Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808716;
	b=2WAJ58/El4RRybgGAuKdIjjGW1t7qRjFVgXWolLdueh7q1ISzaBUFrGgccnadew1/tdk
	 /2C+ieUE2sOTXB1Vmob1FSBzhlU8PpAn3Te2TgHtMywAM4Y3BaZMYoycSzQluBexfQSfw
	 muLKZrnEeoZ1OMzRuYtTl05Hnq0/sqfqTImnDs2hA0GspArXa579A3MNsp/k2dvA5eh6W
	 ENJCDE8K78NyoARhLtqwkkR3sWCy9CacVZqtidV6I933q8QwDzak/h022HpuMRrmbvWEa
	 uace2OWy+EubDgWidyk6iA4XHN3GSUhBEDpJJo038TfIOhH7Ob0Td2e7sj2d1j91d1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808716;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ej/asanrzTQymdauv6gPhKq43WrK2pfQTUU20di4pRM=;
	b=1Ygz66vvgI0m55cj+37i/3WcY2Ysia48vGAfrO6jhnLwTtPraTqxiiif2s5BQO64Q0p4
	 w1ctWzWGMIYTuSmfX/wkfGI7SwAHccWjUMyzG/rBgyikruetVsNOG0VKMij+JjYLrL4KI
	 ZBFFdJI0ELeoXQHW4pN6MsGWPqvmPdxlSPtgdbwkUrTsdUEE7nmyne7iDbd8HK879ashy
	 MJfphfd1h1W+9cRqSfFgsyj2WnpZIwCUoxCHzt6nuvtCPSB8SsSULJayZ4N4hcUryY9Xr
	 lGSp86qlm6fxfObKebNTzjvHzaS5QkqpmYTJeRvTarKDLDoISKhDkjt2zuGohH9M/Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=an9z6BYR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mmzj8BHI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082A0606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 082A0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=an9z6BYR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mmzj8BHI
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJU3sI526535
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ej/asanrzTQymdauv6gPhKq43WrK2pfQTUU20di4pRM=; b=an9z6BYRjZ62lPhu
	rQPhRkFMTAKj2XZS5bZrXG3n7qcqXRdEzfC5uHMmXLA1IxU+MCz+QKeTwUNrVxz6
	HfgqTn5waD/yBZZ74nypJWDkLUrr46aoKIAjyscI8SELD2Mk36gww8inqUY7a4H+
	2rKgjJOvzxmaAX0iYzN3IfTLAXHI1zI/b3F1YojMymNjdVAjpYj+iR2dIeKWZLnU
	NNQ5dmNhf5lPly/kvHkvm8urhDl0NXN8XSQ8ow8+UIvDjtY5wZXYiuP8b8078Ih3
	psyzDF8OiAX0xz/Tqzl9ZvNvLMhUgV/TC/3lpBsG5U+5YE30YgdgXMzaZXOXr2vK
	N46BNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g2dr145-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so945095185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808714; x=1796413514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ej/asanrzTQymdauv6gPhKq43WrK2pfQTUU20di4pRM=;
        b=Mmzj8BHIDxlag7IwKAa/A9SMx7rP4ZIFV8Me3D95/492fyjZ0129TVJFO/AbVeuRnr
         fhEXTOayKhuIx9DHOiDp7QGDpZta8mw4j+t2fA+9iUTnIGs1kEaL3IRLc7ar5owgv1Tf
         3SgY+mNJMFlwM8bgmPKK0Ga/MThjud3zZD4aF8lUAPloL3IVAsMb3yWdxiU0P8gapU62
         NDmPDiGjbDY5H4TCIH1Kc0orkRhXWS50WCCJnUja8OSAWqAq3IQHXgx20MtdiRiwQ8zQ
         P7HctM8EnC7z6MWcXzBXE2JoWsWzEeTMV6jsr9/UVT4TSA6vf0vwEdVTfiPpXHXxUJep
         gAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808714; x=1796413514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ej/asanrzTQymdauv6gPhKq43WrK2pfQTUU20di4pRM=;
        b=ouic6LTLv/OnOl/06/YxiMdwXKJDQC4N07h936Kp7m4VKq4tLYsPkf41WCMRhvfBUl
         r0DgAPgP2BGimmjLFuBnbjzXlrxaHSaUDYQhpnWg2qnCS1ZXM4EYNSQgxExldQkgnnCm
         3Os3jmUZKCCU7Ye8T+KtgnBDwImJS5jaS22SngQTkCp+FAayGMB3AwRSmejda9Sue7g/
         Zb2OOBw5S3De2cX7+bh3zJXObbfq5dTYAKBU0axjV+tWP0vbIoeDK9y54ZYn7A+LoZ3W
         eKxGlK3FqaxWi8MUk6GQg6tO/EsGozPJLfzahpaVIxxrCPTpZ8MhSBkwAoSBHl0G2E67
         9Igw==
X-Forwarded-Encrypted: i=1; AL+hErEeRVIL13Rc9oZHTvRAdfhLlIEFsJU2NVTj+aGNyinK+3OS30Pjy1lxrxWlDLg9t503gto1LG2L6lIyAgE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z2PizfDpjfHN6SgpGkAzEpO5/Zx8dMFjHYuj+6R4xTx8/81el
	qyJ1FGTiz9Q4rO+3HD6vDwzMbIIvFAaIYVkLIejOQgRVpDPSjXCYdV1cuoapKtwfzynk5z0l12z
	CyGxSR3e0ZoAxxyiQcKvwcrNNSS3927QWdTQG/A35AKleXetCi0Bvn0Gg39btRpLhBSA=
X-Gm-Gg: AZFdTZegLp0sjZ52bHQ24IBrua7p10u1PZuh8kZ9T2IrMVQdas3MZJMvSAsH7EAgbfd
	9Fy+Hc8j2Nggfe4pcmen9bltUgdsX7e5ckoqiCuJS1Tptb85ymEk3SiHv8xGdKwBdawNSwGktEr
	RmcJ/XjntYo7bKRocs/oz/8pY6x2CUdnZNY3sKM9qyjp/uhYDRiGnOFHbYjhtqrAycbKQ12udcZ
	XjIinxi6kCmeubRvPCpiLYcKBmfb+QyAxpdAKgD79mCkpt1Yz1/RLMUqHfk/PH7o+XrkOVCQTnN
	vZd4WUItkRV45/I1OeLZXskQI3r+5NC6eVMHCisyTLzGDfoDlT981UbYzEIPtW2BAivonIihd1f
	Dg5PYsvHjIJRuByPw2Nfnl1y5eP1qxzxx8DOdPa48i1vhB4+19sTtTfBqp0evgHAvdP3avoJx35
	/rhGNSsUa9iJvPDmjFE9HjKI4T3gdfvbVQw1dvPTk5FUFp6jan/w276A/YOjgwJg==
X-Received: by 2002:a05:620a:45a3:b0:93e:e2ec:3bf with SMTP id af79cd13be357-949bac7e22fmr4446255385a.78.1795808714068;
        Fri, 27 Nov 2026 11:45:14 -0800 (PST)
X-Received: by 2002:a05:620a:45a3:b0:93e:e2ec:3bf with SMTP id af79cd13be357-949bac7e22fmr4446241785a.78.1795808713225;
        Fri, 27 Nov 2026 11:45:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:45:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:26 +0200
Subject: [PATCH v4 13/14] drm/msm/mdp4: disable the vdd regulator on
 teardown
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-13-242b0a3f8e47@oss.qualcomm.com>
References: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
In-Reply-To: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1063;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Fjoc/t6O2FzPpmOj/BljVug/2AxVJMQttbKWnOBTdw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2tjbX8Fo40ddVA5EuLKAan7dqUWWEhva7Hq
 wtVDKaJDIqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndrQAKCRCLPIo+Aiko
 1QquCACkKYIik/izUwYWwnOcNmg/atdqLAXQRCRRoVIqIxLW89M2kZanMn09Z8pNYilxdOYbMp2
 F88yQLKO0oG/TsFZuEUpm/szBdxap2opBV8O930VsJ/Qbgeds+/5BYgFGZOyErrPihZ1U8tz7hH
 JRc4D/6SetoxrtK4m0Px4g42CoJqLTaksjpQERtbupcgxyr//5ngj/zurQkTQ7Xat8JYsmxafQ0
 rbOa5QvN/JjfOjDMM7U6WcfGnNTAi8aeC5z58lXJc30dE8Tr8Jt7YJb2CnXC910/BMspO5qQqCy
 fGYJbnaQQFP5MqgjHNb3wKC1FCx9S964o2Ogk57tSSloyQjo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX8TkYj5Hw2mOa
 ZMh6W2H6u7u7sXaKtBluF0SBlqwnHunsoE0Iyslb7T7Xyno3yyurtFlGMTbCNWUL6Ql4up6k5A4
 joy1fIvgJj9NALcfLRpNVvWQlYQ0zsd72f1G42PsOI2KPx9D4b1gG4wHQJzYrqZ0tqPQQaWJrLK
 Wtvf0p1VuZBfUl38eIOtXmljB8KcWKkpZT1XLxRhhq+ubqUmBTEte7hYyEiwYEEIuASo0fVfOJj
 7glhGzzX3/k2876USmi2qnmuB7aFrQV135lEg3uZdleQVd1mI9ufdVUBogNpTemXpcNOhOlFUhb
 H4NsiHmVTcwZ7wrpIRZOrhjUl1Khh41v49kejupnfv8SKunEQCXdBLFEmMbCvfuQXslI5DyKCb3
 Jr4DO8sQh6BW/QlaT42pE4okkltAArSGcRBZtUz7n0WIgekuQuIqMLRCTux6e2XIOil2YMtMJxr
 RO9aw11ltChIbVFJRPw==
X-Proofpoint-GUID: NClhDnB8a6Y7FkCN37IJiCdruD16bZ3r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXz1eEvGnOccoA
 zFV+r7iZUDyMC1z97hDOWQ9NgDfYV0SJzdO7l3KvkQn6fhKaScHO/qPYbieIbsgXPZqLDTytctZ
 g1oxwdDTCR/21RIxMOjFzuaQhQIeUOs=
X-Authority-Analysis: v=2.4 cv=dJEzC+Zb c=1 sm=1 tr=0 ts=6b09ddca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Fn2PsjeflmwALO0ttrkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: NClhDnB8a6Y7FkCN37IJiCdruD16bZ3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

mdp4_kms_init() enables the optional vdd regulator, but only its error
path disables it again: unbinding the display leaves it on, and the
regulator core warns when the devm-managed exclusive handle is released
while enabled.

Disable it again in mdp4_destroy().

Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index c1f61ecf800f..cb95a492e070 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -152,6 +152,9 @@ static void mdp4_destroy(struct msm_kms *kms)
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
 
+	if (mdp4_kms->vdd)
+		regulator_disable(mdp4_kms->vdd);
+
 	mdp_kms_destroy(&mdp4_kms->base);
 }
 

-- 
2.47.3

