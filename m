Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364096;
	b=wWnaBD6CmfTeJdjuIEH3vR0i9Wc4USdnl191oG1CIuQizF7BYIIfLmkAPS1wBaRtl1tt
	 W+1XjIVQnM+U92KsaTfbNbKrK27Q/ePk4niDnBGbOAbb+HYJ1GIuG1lNUp/iYr7SpZb2b
	 B8oQ0iCcPWn8rdwFM/S8ZhPd9beSHgnMkDwYWdC8WixnrhRjTB3SWEMngqbQDtTLEh6yw
	 yynJKLcLgiT3ANzo1muQo2nRN6pNaiH9kf3C7vWJoe6XjbpOBWUNEhe7kfFx0TBPNvh0k
	 ynaz+uCBML8uCu7cnwHBo1vQKbm1uSa5S0dgHXCk8ntVevv7dlR31J07Z5sS5cRvgpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
	b=aVkyaGr7Iq6e74bQQdoc2Ik0v2OwipaPCED/Z/OL3bNLely2QzKhXXohVAUMPkYxVMsS
	 C7hDQyakSFFpWT/7FUD+xdI+0RI/N2chft8aV1ncLfzSIQDjj7F08LDfBfTfZiRvEUt1a
	 c40+wwcfz/nkk6ep3z1yJz9+gHac2Sbi3Fkr2rfIaVgxNW7K81l6JNb+xRrmjQoqV4q3v
	 02wJLiCWH/bSXUZ1HBK5QQq4ybwmb0l6uYPykMPbEkBWfPov6qzCFXgpVYo0sie2cRIaP
	 pLeC/MMRCNXyr/T12kPv701YR9251FJGJ5k4KyN5jeJq5XqC9tJZcURdUIidPU6Obmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EQRtFRUA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGv1bW25;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143D7606A6B3
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 143D7606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EQRtFRUA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGv1bW25
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQpow1248396
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FZNFp9/0dkT
	sTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=; b=EQRtFRUA42GVrHwo0ldgQX4I3GA
	PAZx8Os3MMJfGEcsywP+egPL4DbHxJYUAmZgcDzK7sWLMMPnbJEG542RgH5Tw54z
	NAlON/htb8L4E1TF+hopzK9kjf2wBDjsetwXs7DkRN4KytENZf80qNO6cl0mFC26
	Ohao35go4UajhGtLaPIKj/se7cSCncqrizmjy8agWQqBcCWypUMFvybR355Jl+C+
	xqv9yOUTjGTQQDaEDHZvKz/GXxR15WM+31vlZUHh+mzMkuoNB+Pj8iaXjz/9YM+T
	rMjx9y8Rx4X/i6xltwPZ1HLlqYuvhctKkL4fkMf5pLcrfe7pN+sPHDI+IVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03rt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:14:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-948d83322f6so427894885a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364094; x=1795968894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
        b=QGv1bW25xC33LD76O50/YzWSkmxkQd/HhumnuKIFW67bE+j6l5+v6Qo7jOJc246tAf
         7nYLzkFdI8h2nNwUoThw1wyYziVnHQY56OSkjFBtEWZnb50ALHXOZM8VFxE0vkcm6Ap0
         trCbOjf9rRmL8GlyjvPd6JVeznMXxbrPDIQavEkftn/RHg3N1IWvHqCEz0sfzT1UOrRu
         Sdvlz1KhZImwgjvHmmx2sJx2u+0WKKC2L/QoQDWmW5kYfJgh/dpaHH+LPWIjLe0JrKnI
         jF12kfiDjbRE54kXIrqSbbcZLRTawbslKcf6/7+agYeqfLKcjRBCo+43wpPOJnj5VjM8
         FHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364094; x=1795968894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
        b=eCUeBSyKvTx8jVK3Nrsq3wikzWRijwh40fnzwNqq+uziAmNY3O/WNTTxQiNizMH0oo
         Mfq/hnGQEQ4j6Ym+G76FM1XHj1H3nbQO9kOoPVQCPKy77TUw4NSAU6f8IVU4t3kfClsw
         ZYptTQlkupc44IzMgVbk3xWF0I2AeiWAdZpXaAUtgPb8VLAjllrMz6gzM027TRVr/Ajy
         CRe90y2D4QTqWXpVTK4/IpB+O1a3cHIun36vxaYkGoeONqO34mkC3bbILrCniUmhAKr5
         sVmfxKy3IjxH0XhK5i52gqqAaAUVPv+GgJd7N4ZdPrmG4pl3C/u0Gz3BUxBMZwqAVg9S
         0iwg==
X-Forwarded-Encrypted: i=1; AL+hErF9FkON3dznhAPRTabZeU7+jLfHfnS2Aqr4CRRfWWjVFCg4upjfSrJClieGoNPEw/8rzqwwIWokBGlhkUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F7PP3298+0XPUev8DhuJ9oRjtu8K1IsIAplPczNslpdi2WMNv
	dgYx6Qj72W1fdeKbeK35wlXLLMJCvjAaLa72e+lV5lR6x3/Ym8aN+5vqkqQvzu9fGf7U5NEekGV
	J8mVqPj9QCf8GNIsYOdthn0pcRL+JsJfgl0tDmXc3DvzCs8sXQnG6/1En5u4vkEJdm7Q=
X-Gm-Gg: AZFdTZf1QvSHJaPdk0gOayqR6IXBhBBulAVpijEtpVaXcVk1uEWiDrAttKrpQjXWk+I
	dD7v0sSDu4pOas/1HyEMyM0YngRecaaVJDyhjBpKGSf2yP2YsqCltGs6zOnCDZ04ER7SQY8bMRL
	0k6xqBu8d2rLNqqtnKstbx74GnxdufuzzNKzrTKu5WogrtJvUeQeFQbRmpo5yWExDl2WXSnXMtn
	uTtkBlmgONgcrN+X/+45s7P2tKh3Qvv6weqqHLUsJ3rgvXYyRaJSj9elQnO5A99WdgQYYWLTiDV
	XevKkMxLhW1Fhgb8B+Oip5VhdvpawJxHeHKFOcfbnNOe3RGQys6/74M/twCgLElgvZrhFkWVvEK
	Bhh+ko4ebc7/44VU2UDTJbj3AqlWNLdSAMmGGAt6gPmj3rSR8Cq+xGqoqPUZhHvgl
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1412220085a.0.1795364094324;
        Sun, 22 Nov 2026 08:14:54 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1412216185a.0.1795364093887;
        Sun, 22 Nov 2026 08:14:53 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 03/24] ASoC: soc-dai: export snd_soc_dai_stream_valid
Date: Sun, 22 Nov 2026 16:14:16 +0000
Message-ID: <20261122161437.5994-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX13t8l6VV9vED
 9r+ZBdcPJUmY+aTKYga8uOc4R5LzTFQ57eKqonD4aqSFwam70JRdCkr86nroKzCpAHDyY3kmij0
 wMuBGneSzepmOz1gO6MKyaJft7L/XzGOO4c3z0qO+E3tYM7w3+yEYQTD+e9ZuvZ5Qy+M2ojtozI
 grxWh6yghQeNcUXzOmSr07ecG38GVbof2Ojtu027JPi92bMlJtwEMNn3tE0C/s7UJEvSEYFAZ9m
 tByljA7BWEsqVeV7I+elXOJtKA0YP36O74MvMSTw7iVl2YKsKjqstejzltI/MJKJhqjkkoCTnes
 fKe+BpRUXn0eNGPoq2iiG2j4oENlLiigFaOPzhgA293eZ1ZFJl18S02V3TdEuFu7ugqbtL4T4cE
 CKvkBg2fXKouAcrLJuNnT9WqfpoWk7dflrgAwKZkgX5Ea3UB7Et9MlC2oZJexCBjGRwbmBUsADU
 Zd0DnylvTvH/4pfddnA==
X-Proofpoint-ORIG-GUID: KOgHmpyVggkfP6G_cYL2EOnYodxBXFwA
X-Proofpoint-GUID: KOgHmpyVggkfP6G_cYL2EOnYodxBXFwA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5voOrzx9RMs9
 9LTFmA77jd6GwO+tQaN2o0CBO0aANJ7sq2cK5ZEqaz99qoq7rVapmVFUlg7TBBDM3EyV0XdZRXp
 wAstVjJF/R3VrZLkjvS7ffMM7DQAl3Y=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b0314fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=cE0UM4t--Vybx2cbpv4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Modular users outside soc-core need this helper to filter DAIs by
direction (e.g. the qcom SoundWire machine driver, which iterates
codec DAIs on a multi_direction_codecs BE link to handle each
direction's stream runtime). Export it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/soc-dai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 9e34f34eac3d..5d6385b02719 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -706,6 +706,7 @@ bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int dir)
 	/* If the codec specifies any channels at all, it supports the stream */
 	return stream->channels_min;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_valid);
 
 void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int action)
 {
-- 
2.53.0

