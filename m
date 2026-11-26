Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694273;
	b=xmbHXMZjbY2ubViGmoUfGoDk4oAJnpCEEh/lSlTdIBgcAIKbV5xYpD8TAxkElelxC/Ef
	 DBSp8uCKDQ1YWgD/lkglQp+c+4hmFPM/EKFQmA8Drr/747g4xWEvD6+ovxWzuJGuowMqb
	 2pNjPA2scnVI6QB8J0y5nek4pNdyqu24VDadrZKT98YB9trzLIzbPeRsANerzL7bYWwjR
	 bCQR9XB8bEnFMj9ecJWA/C3WoT/yn/f2+CQidoomAdM5veOgUL6PoO5TAOsjbZyU60tIs
	 UeusSZE02KkarCUnguSvgHJgOPjGTKZsRjqPvQ+69RDFHfxQzDkUzIihUrkIiIBDgKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O4UlguUYdmoiiwueiPudRL71BwenmWhQeCRuMEXVRYM=;
	b=BZQJXSJjsfgarfQWfp3EtxiGtMoYhv/eEbNl4FZwJUhBdXzgOgNAYEiZmVe1oe6Cj0tP
	 fx/T2BaTK/Td0okJ93grhuDEWtJBDXY0FehhsjYvw2SDTo8TicTFgxfpy620U0M9lHgZf
	 1cP2jk00jWBHeZI3nynuPyN6N1+6HSikUhqEpWCb46+FE2yARNVmt77sr3L0NuZnBTG+1
	 RR40//p4SNpn6/3tPN2g/LVM5FNaWgbZpfc6N4eyQuRT0N7i2h73KYl/64BzJ58QvlaWa
	 89TyxOLht7pXt/7T0CSqeiKSH/7tMP9Zsk0V1D7Z5hqfNgsY4L03uZMOczL+d4bgmbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8sOxO0A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IemUFAfC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F8D606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F8D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8sOxO0A;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IemUFAfC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVbEt2263762
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=O4UlguUYdmoiiwueiPudRL71BwenmWhQeCR
	uMEXVRYM=; b=F8sOxO0AnlWIWVoyxuxc1a0y6ka3xj8a2lFBTi8Y8XAWfGkqEaL
	7xyddG8pM5+v2BrzXrH4DOp5+DfF0og7QkwFth1gW9pWphGNG6stvcIp8IM6QhTy
	XIbNmKewXtPELG8nLqtZaz1p/AC3xiAq6w93TT1jRnLrju5sAa8PadpSnFR6V2DO
	2LqGOZIcJ1sIP2+7XJOBiiHulJ5oGs7NJYr21+aL8F7IacqY3HLh0araOHCvkP07
	qySkF3Ci1EpiggKLnHb4dWwitY7ESXj6AjEdhzX/L3tmpHNisb+i6yiYzRb0SaTG
	b1zWnu2iWweLB/FP5Fik1rsn5NdUS1IawzQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aem05u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:57:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94975041698so1646768885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795694271; x=1796299071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4UlguUYdmoiiwueiPudRL71BwenmWhQeCRuMEXVRYM=;
        b=IemUFAfCrNX9Nbrc/WD0J6k9sDWyxbPyy2nDZxYIjmxT5BQJAF0QZgTLtuQzW2iGVD
         SZBU/yP+sANMO1CKV8lLv+r/pgJ1Tt3N3WLMg1h3FAHQz606AKYNYUf9mbXxr+DHogKt
         BDfUiPQnI64PyKD1RDZXhznRJqgKNqgrv41TFaBSRQHpnJYoJqW5z3eFMPmxzAkuCyY/
         98KZW8Y1fPb51vaREyas8wphQOArhOb7D/Lb17Y6vCve/QXcmTdyc2hllFezNrGUETpB
         VOj3lked/50zsrc657GQW4NALNAGk/ZNmqh/xPGnJ5Euh/+F3mVCReJuvZ5IGVZdSFCG
         0VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694271; x=1796299071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4UlguUYdmoiiwueiPudRL71BwenmWhQeCRuMEXVRYM=;
        b=DmVt0ULZolAZwkSZOlLdkL7mTioYSGVKrlLB/3ckeCdhrDf7xO0O8hyQJKBGVq9UBY
         07CaqbzLYvmxnckbc3A7mI+CUqR7EbIJZtq5/t2B2DV8yfCC/Xi9einQHevSQym5nM5y
         TU1yD0PdZ0G6hvmW2O/aLEjGHdL+rFXoBcab4a7T3n4wrQT0QsPQwreJ6LrOZfCHyBSz
         qhno6CviAAHiikgs8Oy4xOvqa0ZIxa5EArvxzt3c4uF50HXOG9JLuRLirxkFMmlTKkiJ
         sQGgnEKevwpgovTnbNStMabEbatUsX04Xi/TPKFIZW16bXc4AO5gYWGn6E+Gu34CjNjC
         +kfQ==
X-Forwarded-Encrypted: i=1; AL+hErE1MiW7u2ewWgT1klBoU/TgT5xV7KrUkf9ovN5WTBGaTMbxashLIr3Niv+dIoCNzOMUNbW2FV/TdEV/SvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3W7rEQDkaSqu2BvjQ/acCmFi4E8e/CqifyEiRzqszq9L7jrj0
	tU5cGucr2uQWUr8H+uF9sHsweZXuvXx9U/nglQ1lAUlmdYwkyTN1eaylm3SmFocGO5JE4jc1d4r
	UV8w++n9z0IaLSu3quRiH3o0puxoTaCQ7FXw+k/gZahxR/6hqQzqEwK+mf3yoABOrBrg=
X-Gm-Gg: AZFdTZfvCU7bAyJFnsQqysmu7ha4MK20CKiSpeSgOOWgHe42UtNatU6AWRjn2F1H5fN
	TUpbxs+C4EsXGVbLEf4xlXIL4kAasMeLwUByA5vv/l6d1h4D+7DRuaEme69KZ2JYsfJ7J9uVZZr
	DBsfy+/x35zhOa0Al6nc4/g1UejKmh17gdxLxh8bL0yp/tfNVLjlt+yqdifAeiTF04iYzHMhocx
	iG41RJHpik70ry79OR8pdDyVloAGIgP5i3Tk2/+vq/aBdLmivee3DkAarroAR4uxyD/M+NI6Fqn
	QuIm0Wow+8eSzPKYTYgd3Djnoi3toS3yDRb+XWmgVj0P9gMAbGz7m3MtBqTWQvm864x0t6VBHn/
	vHUFCFTZ4hi/naoprcpJKGV7ZYp6SdAY8HveckI1txwyFvNnzhJBz/yiqVUy4XSH9
X-Received: by 2002:a05:620a:4409:b0:949:5f22:e849 with SMTP id af79cd13be357-949b37208dbmr3685689185a.35.1795694270792;
        Thu, 26 Nov 2026 03:57:50 -0800 (PST)
X-Received: by 2002:a05:620a:4409:b0:949:5f22:e849 with SMTP id af79cd13be357-949b37208dbmr3685686485a.35.1795694270343;
        Thu, 26 Nov 2026 03:57:50 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm39533135f8f.10.2026.11.26.03.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:57:49 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Michael McAllister <me@michaelmcallister.org>,
        Riccardo Mereu <r.mereu@arduino.cc>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: qcom: q6dsp: add S24_LE and S32_LE to MI2S playback DAIs
Date: Thu, 26 Nov 2026 11:57:38 +0000
Message-ID: <20261126115738.1765949-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX7S0T9XU3Sgfz
 cmFXWho1rcvz1y3ypEAsP2ngWu8nKh0yQT28zfti44GCl08S8iqmLoyUaf8i43K+nJQA5OnM8Tv
 9isRzstexQuCVAMrB5sNILot+lfPG4hQ2lDUScBjE2szuWRdtqW1yH8+RiFvzhkNGDdh9byFbQC
 97cGuZT0LTZAlCn//nYb7lWSvwwLoRZhCI0nJwLZ34C4qGVRbPd2LXHx1VkJNpQvhRjJie4EE2p
 dLcFzzqJ5n3WV8rstX/ktsbuqZRxHyyeF1tZcMlnBmB1afaXbkbwcEK19xPzJYa7vdHV/G9t2Jd
 ZyoHOLXoKmPMInasUI2808WGaDnfdq+V76prJokVywSdmKIQnBozr5tRY8tWJzfMvUlOZnkTKia
 EX9sZdxRYLR+AE1S8LqWrmCSnMjdLgnOi0tfqs9Uom9Y5KocLODyvz0QY5Zp68mcMZ7tyfFKiJL
 jLVKO4edc7fbqe3rRhg==
X-Proofpoint-GUID: 2wHNbdWOs3M6gs9OTlX47P0IgmvyyPna
X-Proofpoint-ORIG-GUID: 2wHNbdWOs3M6gs9OTlX47P0IgmvyyPna
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfXxMMevEycTgN4
 7EdhImFlKbDRJ+kpWPCvtgFGwVz6P7sGvy3o5YglBdv7tKFUC8YJvi0PgMGSWgiDMoGw+0SApHk
 UxbPUjNwgSbLmKx837UwfKN5IvOw/bQ=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b081ebf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=mYXs2Ah8ihme7N4CQtEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260046

The DSP supports 24 and 32-bit samples on the MI2S ports. However, the
Primary through Quinary MI2S playback DAIs only list S16_LE, except
Primary, which also lists S24_LE. This stops the machine driver from
running these backends with 32-bit slots, which some I2S sinks need,
like the ANX7625 DP bridge.

Add S24_LE and S32_LE to these DAIs. That matches the Senary and LPI
MI2S DAIs. Also have q6routing pass 32 bits per sample to the ADM for
S32_LE. Without that, the session would keep the default 16 bits.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
[riccardo: rebase onto the reworked lpass-ports, fix indentation,
 add commit description]
Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 19 ++++++++++++++-----
 sound/soc/qcom/qdsp6/q6routing.c         |  3 +++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index f422346a50c6..49902abf8d2d 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -389,7 +389,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -416,7 +417,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Secondary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -443,7 +446,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Tertiary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -470,7 +475,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Quaternary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -498,7 +505,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 			SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
 			SNDRV_PCM_RATE_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 0a55d1f384d4..5e532b8336df 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1170,6 +1170,9 @@ static int routing_hw_params(struct snd_soc_component *component,
 	case SNDRV_PCM_FORMAT_S24_LE:
 			session->bits_per_sample = 24;
 		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		session->bits_per_sample = 32;
+		break;
 	default:
 		break;
 	}
-- 
2.53.0

