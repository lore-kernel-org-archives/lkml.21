Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694272;
	b=mdWTbu+DaJR1LfO9lw98FklRdbEP1NlpFAZ+j9BKCy96iI2tNsc3uiBak6CuB64ew0ji
	 Q3jmN+7EMqTYxbWPRV3UE6YTRA6fX/E0CnmlInoSgBk0wxkA+aKY7f05TfxIGayAcevj2
	 pb4CD88zA+2u2t7F3/9+jBssfCXwGTQPIiZm3ud8ZgKQGSN8LeCWUpozW1J6M3JcL+0kE
	 tKi+S5NE/1oKww002FD1PTDCfMz1t5rRCW5SeAqCh0mPUhfcUzolTCfMgaPmfGO6fLNxU
	 M9lOOzr5cqh8JBYiazEyiZvsu2kF0va8kbpsMFLVwGwGAEIVZq8AFN5aNnbT9HHHHLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mzQOTchH4MjU8uxQYctA0NAX5s5bjdPbyih9K0pBMKo=;
	b=WNiKmdJChQwuldiNHNB73MedRnJ9JrZmZg1u/ivBGfEjjrAHi1Kwok7m5f36dIZf5m9O
	 /mlp/IEif0/BLMot9SveNaZgAcDq/b6Vj3jrt4z8uy6Q6dM3SVPaSWU9sndRcoddNya8/
	 /xrRPDhMYO/RdrcndwgfE7SDECMQaQ7TWev1k4r87trb5XWWEUINNERzCzOXfAss1M4a7
	 n86pG7h5xWW/5UFv9ApMZEjYGPnJ4gkZc9E6IgQD4ZcBknre1EdlB/rZB11mTqmvgnzNJ
	 T5tNUK4KpVlWT9N/2KqMwAfO/8z90xVCepNCC30i3WtetQ9K6QHTPzXJDeUuyIBIeFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DccJYY+R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZwiGf4I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A3E606A335
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A3E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DccJYY+R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZwiGf4I
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVijS2263813
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mzQOTchH4MjU8uxQYctA0NAX5s5bjdPbyih
	9K0pBMKo=; b=DccJYY+RcoCwcbqXk9f8jxdh/VvHJh68QcW29sMUhE6z5nMrnJw
	Q9NkK5R8fjKAFYsouAnSToYty5k0zNWB/OQ1aG/OyQWbDohhAU0gHEuuBGcMl7JO
	8xwqOyGkh4EmX1SzjQkbkJjhhSd33ve8re+AwRukx6fgAKyXyK97j1ezpqBWJrRz
	lKViIQNrPPUoTQyxzP5YTOgO00cElzYvIqc2C+nln8flHLCCmvsBhJZK/G1DpCJT
	5BFc9vlRT/JBwUXPvvVnPNh03z1Koh/5Mrm4PKdiQAn4DpbR3Kryv12EaHY1WY2V
	q6gYHGnZ0sMZsJqmgvjcWSM22POUTiSRNjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aem05r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:57:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so1168025285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795694270; x=1796299070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mzQOTchH4MjU8uxQYctA0NAX5s5bjdPbyih9K0pBMKo=;
        b=TZwiGf4IZKn46HCip1eaoN/Xdi2+1pi18qgysxRmDJtRp4csp1cSGT/jQjR6AAVj0I
         2w8/0gnXxmB/bvZsnDyed0JrkB8GSNHo09VQODOANFSK3gYaroUNUcsQVVW/DAQGWJ3E
         VmPTJCGVkuV4Pd1XqBpb2mKbwzgLuQtqVWCL7CKuEc4Gu/yX3aqdViNH408EGBJVGoTy
         bQN2CoXBOZpvdSIRNLwbONRF2Ud95LMApaX1LB7vQ1JLEacINr8yXfC+q4FJrL8mYh2B
         d9QlZVEGT6Nh/NMRwr4qBsLlKuA1j1Uy0amlC7/PW9CLeaSGQ1CPkVLMJLVfm1sXTGXP
         +CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694270; x=1796299070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mzQOTchH4MjU8uxQYctA0NAX5s5bjdPbyih9K0pBMKo=;
        b=XZD3RGIx1oEY4cDEYgzbsHr3PSfi9O1A6fniDpGmiFs5QT0kTs+ZwhpZp2U/OMQdrR
         ryeAbAN7pht4DWck/9wgzDKNsO4NEniw8X0FWJzmVWUXT5tb/fvNEbHUlV0WwzAF5W4o
         YDW/l7vRQVW49jGpFBUQSrqvG0hf6uD+9a+0zjsG5+5NT83Qus77IOH5lg474yTNzIFP
         0m5AIGgUAeed+qY81xyg3f6JXRzed2mAT9oIoqpTrGNiMctj2YKHyxyIVwK/M7zzXPya
         S+v8pxNX8itplaDUjld2Fqkyd4e8nWsr9lb5sq95u6KRGkm6cKEkFkUDwnHGzam72egf
         dFjg==
X-Forwarded-Encrypted: i=1; AL+hErH4b2tJTnHQwbqXaTffqXtHtNzxr1hAm4H25PNMZ+AqKT215OiiQ9M3g8cQHP9N7vJ+A5yI33tbYgVbJxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gTIfOgzQeiIn7B8cSKlCW3yl2JjrxwsnvXi0PCs1Nu+kzOP4Q
	3yxZ7tnnCeyMtM6V9SFPq/KWOYaYDMqbFvnli/9RMkFI5ZmvC6/TyrMqYPTJXwJ+WALAyoXksSw
	nkk9T1744l3OLr3o8bRdUn++SDACW+g3UXyR7Sv6Az40sgH9Je4pqKiZh87KiUekJSB8=
X-Gm-Gg: AZFdTZfY986fESAapQ1mhBTH00TgZ2F+83pYdLXUWOSmwmK/JSQDg63rXHXbXMulZO0
	vhr3/Xw4wNZ+9lJNSJFF1JnzQ9+TehqQ4Rh42KFEVSdhal2leEz0bZL7hII81anW4uIoCE1q8Em
	+q80j4NzZRVrnuwPOM1jjL9nWBuARYCBEqrI+tV0B9QG/kpPTL8GuG00PiNAph3WfyK6/R9OcS6
	HQVCHnMMbL/HdIYbyz4/etMv9gTavbecnVASWQNGGWNtaHo0jeOD//mZnyF4UQPQa5Vf07sgW0g
	+NQkrcz0Zs/M3ylZg0tihZsxiKHAXj7NjGQlQwozeNNE9mZ9aMlL1QbRiNzLJUM6CA4beo7fL0/
	GQWlJ/JImRyt4yJRq6NP2pVfVvljNEQUIDgnQAbEhoWJ+Gx5DsmjTkQN9BohjVpfL
X-Received: by 2002:a05:620a:2986:b0:949:aceb:b799 with SMTP id af79cd13be357-949b357272amr3804914685a.13.1795694269586;
        Thu, 26 Nov 2026 03:57:49 -0800 (PST)
X-Received: by 2002:a05:620a:2986:b0:949:aceb:b799 with SMTP id af79cd13be357-949b357272amr3804910185a.13.1795694269069;
        Thu, 26 Nov 2026 03:57:49 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm39533135f8f.10.2026.11.26.03.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:57:48 -0800 (PST)
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
Subject: [PATCH 1/2] ASoC: qcom: q6asm: fix 24-bit PCM level via media format V4/V5
Date: Thu, 26 Nov 2026 11:57:37 +0000
Message-ID: <20261126115738.1765949-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX2Hlxfvp8Ba3X
 vcjl9snCUHQZbi/ASfVzBEHDANHhs38wsFjsYFNLJFkxaDNgokkTAFtyZmVHKJ2rHp89G0r0DnU
 +uZYgPX62d7G68YZiTX4whprn7cgdwp3Kx9GisGFsSAQIjDQsJYKS7twqYmFlLiCJTsMJz7hhn5
 /HF4HgnIGmBX6iG+/F3kKDW7IPCNUqqC3BS4TEpSfjuBU32KQ2VZ/ci4DEHlNhUvxewPjhvCXNH
 ULLBmvmFkYh9tQ9zi7Kz2R3wsdyhwgAJNtqr+GD0eV+GUyd2rwimIRC1WnGq8mRjCgcP5ZPNI1/
 TKnxkaMk8LOU5kJ07Z2KyXUQqCPk5iaUriN9niP+x+/3KW7qyX3uKN9dabnfg/zhQA1ov98JKBy
 OWcWyDyxE+sUubANv+PtFzQB5V6e9ijaoEOZFkKZeJPfuJa4oi7o7mvch8WDOSAJObWVPONGCR3
 6XbV+1XkqUXw9yACKQg==
X-Proofpoint-GUID: 2WY_H8y8UwUHkFtmYKPbz9MExwHi1xb7
X-Proofpoint-ORIG-GUID: 2WY_H8y8UwUHkFtmYKPbz9MExwHi1xb7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX688lgBRAZAyF
 QWokmHb+O6jfYLQW94665V7QdabSKn9rYkJM+2jH9rBujpPfbd1RRMuyeMLlk/7etHQbByu4EML
 1WMBHrNowXfVhkA3Zatibu87ovZgDpk=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b081ebe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=CxJzD9-pnStplVTlZCgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260046

q6asm uses ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2 for every LINEAR_PCM
stream. V2 has no sample_word_size, so the DSP defaults to
word_size = 32 and expects the 24-bit sample MSB-justified, while
ALSA S24_LE is LSB-justified. The 8-bit shift costs ~48 dB.

Switch to V4 or V5. Pick V5 when ac->q6asm->ainfo.api_version >= 2,
V4 otherwise. Both carry sample_word_size; mode stays 0 so the DSP
picks the default Q factor.

Apply on playback (q6asm_media_format_block_multi_ch_pcm,
q6asm_open_write) and capture (q6asm_enc_cfg_blk_pcm_format_support,
__q6asm_open_read).

Drop S24_LE from the MultiMedia FE PCM. Advertise S24_3LE on
capture, S24_3LE and S32_LE on playback. S24_LE can't be made to
work zero-copy: the firmware ignores the Q-factor override. plughw
converts S24_LE to S24_3LE transparently.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c |  26 +++--
 sound/soc/qcom/qdsp6/q6asm.c     | 184 ++++++++++++++++++++++++++-----
 sound/soc/qcom/qdsp6/q6asm.h     |   6 +-
 3 files changed, 178 insertions(+), 38 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 384066986735..57cbce2bb0cb 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -63,6 +63,7 @@ struct q6asm_dai_rtd {
 	uint64_t bytes_received;
 	uint64_t copied_total;
 	uint16_t bits_per_sample;
+	uint16_t sample_word_size;
 	snd_pcm_uframes_t queue_ptr;
 	uint16_t source; /* Encoding source bit mask */
 	struct audio_client *audio_client;
@@ -90,7 +91,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
 				SNDRV_PCM_INFO_INTERLEAVED |
 				SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE |
-				SNDRV_PCM_FMTBIT_S24_LE),
+				SNDRV_PCM_FMTBIT_S24_3LE),
 	.rates =                SNDRV_PCM_RATE_8000_48000,
 	.rate_min =             8000,
 	.rate_max =             48000,
@@ -113,7 +114,8 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 				SNDRV_PCM_INFO_INTERLEAVED |
 				SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE |
-				SNDRV_PCM_FMTBIT_S24_LE),
+				SNDRV_PCM_FMTBIT_S24_3LE |
+				SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_192000,
 	.rate_min =             8000,
 	.rate_max =             192000,
@@ -139,7 +141,8 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 				  SNDRV_PCM_RATE_176400 |		\
 				  SNDRV_PCM_RATE_192000),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
-					SNDRV_PCM_FMTBIT_S24_LE),	\
+				    SNDRV_PCM_FMTBIT_S24_3LE |		\
+				    SNDRV_PCM_FMTBIT_S32_LE),		\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min =     8000,				\
@@ -151,7 +154,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 				  SNDRV_PCM_RATE_12000 |		\
 				  SNDRV_PCM_RATE_24000),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
-				    SNDRV_PCM_FMTBIT_S24_LE),		\
+				    SNDRV_PCM_FMTBIT_S24_3LE),		\
 			.channels_min = 1,				\
 			.channels_max = 4,				\
 			.rate_min =     8000,				\
@@ -284,13 +287,15 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 		ret = q6asm_media_format_block_multi_ch_pcm(
 				prtd->audio_client, prtd->stream_id,
 				runtime->rate, runtime->channels, NULL,
-				prtd->bits_per_sample);
+				prtd->bits_per_sample,
+				prtd->sample_word_size);
 	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		ret = q6asm_enc_cfg_blk_pcm_format_support(prtd->audio_client,
 							   prtd->stream_id,
 							   runtime->rate,
 							   runtime->channels,
-							   prtd->bits_per_sample);
+							   prtd->bits_per_sample,
+							   prtd->sample_word_size);
 
 		/* Queue the buffers */
 		for (i = 0; i < runtime->periods; i++)
@@ -507,9 +512,16 @@ static int q6asm_dai_hw_params(struct snd_soc_component *component,
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		prtd->bits_per_sample = 16;
+		prtd->sample_word_size = 16;
 		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
+	case SNDRV_PCM_FORMAT_S24_3LE:
+		/* 24-bit samples packed in three bytes, no padding */
 		prtd->bits_per_sample = 24;
+		prtd->sample_word_size = 24;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		prtd->bits_per_sample = 32;
+		prtd->sample_word_size = 32;
 		break;
 	}
 
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index d042132caf03..ee1930e41d4b 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -40,6 +40,10 @@
 #define ASM_PARAM_ID_ENCDEC_ENC_CFG_BLK_V2	0x00010DA3
 #define ASM_SESSION_CMD_RUN_V2			0x00010DAA
 #define ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2	0x00010DA5
+#define ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V4	0x0001320C
+#define ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V5	0x00013222
+/* ADSP ASM service API version at which the V5 PCM media format is supported */
+#define ADSP_ASM_API_VERSION_V2			2
 #define ASM_MEDIA_FMT_MP3			0x00010BE9
 #define ASM_MEDIA_FMT_FLAC			0x00010C16
 #define ASM_MEDIA_FMT_WMA_V9			0x00010DA8
@@ -99,6 +103,31 @@ struct asm_multi_channel_pcm_fmt_blk_v2 {
 	u8 channel_mapping[PCM_MAX_NUM_CHANNEL];
 } __packed;
 
+/* Note: in V4 the channel map precedes endianness/mode (unlike V5) */
+struct asm_multi_channel_pcm_fmt_blk_v4 {
+	struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
+	u16 num_channels;
+	u16 bits_per_sample;
+	u32 sample_rate;
+	u16 is_signed;
+	u16 sample_word_size;
+	u8 channel_mapping[PCM_MAX_NUM_CHANNEL];
+	u16 endianness;		/* 0: little endian */
+	u16 mode;		/* 0: default Q factors */
+} __packed;
+
+struct asm_multi_channel_pcm_fmt_blk_v5 {
+	struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
+	u16 num_channels;
+	u16 bits_per_sample;
+	u32 sample_rate;
+	u16 is_signed;
+	u16 sample_word_size;
+	u16 endianness;		/* 0: little endian */
+	u16 mode;		/* 0: default Q factors */
+	u8 channel_mapping[PCM_MAX_NUM_CHANNEL];
+} __packed;
+
 struct asm_flac_fmt_blk_v2 {
 	struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
 	u16 is_stream_info_present;
@@ -191,6 +220,33 @@ struct asm_multi_channel_pcm_enc_cfg_v2 {
 	uint8_t   channel_mapping[8];
 } __packed;
 
+/* Note: in V4 the channel map precedes endianness/mode (unlike V5) */
+struct asm_multi_channel_pcm_enc_cfg_v4 {
+	struct asm_stream_cmd_set_encdec_param encdec;
+	struct asm_enc_cfg_blk_param_v2 encblk;
+	u16 num_channels;
+	u16 bits_per_sample;
+	u32 sample_rate;
+	u16 is_signed;
+	u16 sample_word_size;
+	u8 channel_mapping[PCM_MAX_NUM_CHANNEL];
+	u16 endianness;		/* 0: little endian */
+	u16 mode;		/* 0: default Q factors */
+} __packed;
+
+struct asm_multi_channel_pcm_enc_cfg_v5 {
+	struct asm_stream_cmd_set_encdec_param encdec;
+	struct asm_enc_cfg_blk_param_v2 encblk;
+	u16 num_channels;
+	u16 bits_per_sample;
+	u32 sample_rate;
+	u16 is_signed;
+	u16 sample_word_size;
+	u16 endianness;		/* 0: little endian */
+	u16 mode;		/* 0: default Q factors */
+	u8 channel_mapping[PCM_MAX_NUM_CHANNEL];
+} __packed;
+
 struct asm_data_cmd_read_v2 {
 	u32                  buf_addr_lsw;
 	u32                  buf_addr_msw;
@@ -912,6 +968,19 @@ static int q6asm_ac_send_cmd_sync(struct audio_client *ac, struct apr_pkt *pkt)
 	return rc;
 }
 
+/*
+ * Both the V4 and V5 multichannel PCM media formats carry the sample word size
+ * needed to describe e.g. 24-bit samples held in a 32-bit word. V5 is only
+ * understood by newer ADSP firmware (ASM API version >= 2); everything else -
+ * including when the version query is unsupported and ainfo is left zeroed -
+ * uses V4, which the QDSP6 firmware has supported since its introduction. (The
+ * old V2 format, which lacks the word size, is no longer used for playback.)
+ */
+static bool q6asm_pcm_fmt_v5_supported(struct audio_client *ac)
+{
+	return ac->q6asm->ainfo.api_version >= ADSP_ASM_API_VERSION_V2;
+}
+
 /**
  * q6asm_open_write() - Open audio client for writing
  * @ac: audio client pointer
@@ -955,7 +1024,9 @@ int q6asm_open_write(struct audio_client *ac, uint32_t stream_id,
 		open->dec_fmt_id = ASM_MEDIA_FMT_MP3;
 		break;
 	case FORMAT_LINEAR_PCM:
-		open->dec_fmt_id = ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2;
+		open->dec_fmt_id = q6asm_pcm_fmt_v5_supported(ac) ?
+			ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V5 :
+			ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V4;
 		break;
 	case SND_AUDIOCODEC_FLAC:
 		open->dec_fmt_id = ASM_MEDIA_FMT_FLAC;
@@ -1078,6 +1149,7 @@ EXPORT_SYMBOL_GPL(q6asm_run_nowait);
  * @channels: number of audio channels.
  * @channel_map: channel map pointer
  * @bits_per_sample: bits per sample
+ * @sample_word_size: size in bits of the word that holds a sample of a channel
  *
  * Return: Will be an negative value on error or zero on success
  */
@@ -1085,30 +1157,60 @@ int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
 					  uint32_t stream_id,
 					  uint32_t rate, uint32_t channels,
 					  u8 channel_map[PCM_MAX_NUM_CHANNEL],
-					  uint16_t bits_per_sample)
+					  uint16_t bits_per_sample,
+					  uint16_t sample_word_size)
 {
-	struct asm_multi_channel_pcm_fmt_blk_v2 *fmt;
+	bool use_v5 = q6asm_pcm_fmt_v5_supported(ac);
+	struct asm_multi_channel_pcm_fmt_blk_v5 *fmt_v5;
+	struct asm_multi_channel_pcm_fmt_blk_v4 *fmt_v4;
 	struct apr_pkt *pkt;
 	u8 *channel_mapping;
-	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+	int pkt_size = APR_HDR_SIZE +
+		       (use_v5 ? sizeof(*fmt_v5) : sizeof(*fmt_v4));
 
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
 	pkt = p;
-	fmt = p + APR_HDR_SIZE;
 
 	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
-
 	pkt->hdr.opcode = ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2;
-	fmt->fmt_blk.fmt_blk_size = sizeof(*fmt) - sizeof(fmt->fmt_blk);
-	fmt->num_channels = channels;
-	fmt->bits_per_sample = bits_per_sample;
-	fmt->sample_rate = rate;
-	fmt->is_signed = 1;
 
-	channel_mapping = fmt->channel_mapping;
+	dev_dbg(ac->dev, "%s: fmt=%s rate=%u ch=%u bps=%u word=%u (asm api %u)\n",
+		__func__, use_v5 ? "V5" : "V4", rate, channels,
+		bits_per_sample, sample_word_size, ac->q6asm->ainfo.api_version);
+
+	/*
+	 * Leave mode=0 (default Q factors). Per the ADSP ABI the defaults
+	 * are Q15 for 16-bit, Q23 for 24-bit packed (word_size=24), and Q31
+	 * for 32-bit, which match every format we advertise to userspace.
+	 * The explicit override values (15/23/31) are not honoured by every
+	 * firmware; the default path is the safe choice.
+	 */
+	if (use_v5) {
+		fmt_v5 = p + APR_HDR_SIZE;
+		fmt_v5->fmt_blk.fmt_blk_size = sizeof(*fmt_v5) -
+					       sizeof(fmt_v5->fmt_blk);
+		fmt_v5->num_channels = channels;
+		fmt_v5->bits_per_sample = bits_per_sample;
+		fmt_v5->sample_rate = rate;
+		fmt_v5->is_signed = 1;
+		fmt_v5->sample_word_size = sample_word_size;
+		fmt_v5->mode = 0;	/* default Q-factor per bps/word_size */
+		channel_mapping = fmt_v5->channel_mapping;
+	} else {
+		fmt_v4 = p + APR_HDR_SIZE;
+		fmt_v4->fmt_blk.fmt_blk_size = sizeof(*fmt_v4) -
+					       sizeof(fmt_v4->fmt_blk);
+		fmt_v4->num_channels = channels;
+		fmt_v4->bits_per_sample = bits_per_sample;
+		fmt_v4->sample_rate = rate;
+		fmt_v4->is_signed = 1;
+		fmt_v4->sample_word_size = sample_word_size;
+		fmt_v4->mode = 0;	/* default Q-factor per bps/word_size */
+		channel_mapping = fmt_v4->channel_mapping;
+	}
 
 	if (channel_map) {
 		memcpy(channel_mapping, channel_map, PCM_MAX_NUM_CHANNEL);
@@ -1347,40 +1449,62 @@ EXPORT_SYMBOL_GPL(q6asm_stream_remove_trailing_silence);
  * @rate: audio sample rate
  * @channels: number of audio channels.
  * @bits_per_sample: bits per sample
+ * @sample_word_size: size in bits of the word that holds a sample of a channel
  *
  * Return: Will be an negative value on error or zero on success
  */
 int q6asm_enc_cfg_blk_pcm_format_support(struct audio_client *ac,
 					 uint32_t stream_id, uint32_t rate,
 					 uint32_t channels,
-					 uint16_t bits_per_sample)
+					 uint16_t bits_per_sample,
+					 uint16_t sample_word_size)
 {
-	struct asm_multi_channel_pcm_enc_cfg_v2  *enc_cfg;
+	bool use_v5 = q6asm_pcm_fmt_v5_supported(ac);
+	struct asm_multi_channel_pcm_enc_cfg_v5 *enc_v5;
+	struct asm_multi_channel_pcm_enc_cfg_v4 *enc_v4;
 	struct apr_pkt *pkt;
 	u8 *channel_mapping;
 	u32 frames_per_buf = 0;
-	int pkt_size = APR_HDR_SIZE + sizeof(*enc_cfg);
+	int pkt_size = APR_HDR_SIZE +
+		       (use_v5 ? sizeof(*enc_v5) : sizeof(*enc_v4));
 
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
 	pkt = p;
-	enc_cfg = p + APR_HDR_SIZE;
 	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
-
 	pkt->hdr.opcode = ASM_STREAM_CMD_SET_ENCDEC_PARAM;
-	enc_cfg->encdec.param_id = ASM_PARAM_ID_ENCDEC_ENC_CFG_BLK_V2;
-	enc_cfg->encdec.param_size = sizeof(*enc_cfg) - sizeof(enc_cfg->encdec);
-	enc_cfg->encblk.frames_per_buf = frames_per_buf;
-	enc_cfg->encblk.enc_cfg_blk_size  = enc_cfg->encdec.param_size -
-					sizeof(struct asm_enc_cfg_blk_param_v2);
-
-	enc_cfg->num_channels = channels;
-	enc_cfg->bits_per_sample = bits_per_sample;
-	enc_cfg->sample_rate = rate;
-	enc_cfg->is_signed = 1;
-	channel_mapping = enc_cfg->channel_mapping;
+
+	if (use_v5) {
+		enc_v5 = p + APR_HDR_SIZE;
+		enc_v5->encdec.param_id = ASM_PARAM_ID_ENCDEC_ENC_CFG_BLK_V2;
+		enc_v5->encdec.param_size = sizeof(*enc_v5) -
+					    sizeof(enc_v5->encdec);
+		enc_v5->encblk.frames_per_buf = frames_per_buf;
+		enc_v5->encblk.enc_cfg_blk_size = enc_v5->encdec.param_size -
+						  sizeof(struct asm_enc_cfg_blk_param_v2);
+		enc_v5->num_channels = channels;
+		enc_v5->bits_per_sample = bits_per_sample;
+		enc_v5->sample_rate = rate;
+		enc_v5->is_signed = 1;
+		enc_v5->sample_word_size = sample_word_size;
+		channel_mapping = enc_v5->channel_mapping;
+	} else {
+		enc_v4 = p + APR_HDR_SIZE;
+		enc_v4->encdec.param_id = ASM_PARAM_ID_ENCDEC_ENC_CFG_BLK_V2;
+		enc_v4->encdec.param_size = sizeof(*enc_v4) -
+					    sizeof(enc_v4->encdec);
+		enc_v4->encblk.frames_per_buf = frames_per_buf;
+		enc_v4->encblk.enc_cfg_blk_size = enc_v4->encdec.param_size -
+						  sizeof(struct asm_enc_cfg_blk_param_v2);
+		enc_v4->num_channels = channels;
+		enc_v4->bits_per_sample = bits_per_sample;
+		enc_v4->sample_rate = rate;
+		enc_v4->is_signed = 1;
+		enc_v4->sample_word_size = sample_word_size;
+		channel_mapping = enc_v4->channel_mapping;
+	}
 
 	if (q6dsp_map_channels(channel_mapping, channels))
 		return -EINVAL;
@@ -1473,7 +1597,9 @@ static int __q6asm_open_read(struct audio_client *ac, uint32_t stream_id,
 	switch (format) {
 	case FORMAT_LINEAR_PCM:
 		open->mode_flags |= 0x00;
-		open->enc_cfg_id = ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2;
+		open->enc_cfg_id = q6asm_pcm_fmt_v5_supported(ac) ?
+			ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V5 :
+			ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V4;
 		break;
 	default:
 		pr_err("Invalid format[%d]\n", format);
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 6fafda5bd849..2d969dbffcff 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -106,7 +106,8 @@ int q6asm_open_read(struct audio_client *ac, uint32_t stream_id,
 int q6asm_enc_cfg_blk_pcm_format_support(struct audio_client *ac,
 					 uint32_t stream_id, uint32_t rate,
 					 uint32_t channels,
-					 uint16_t bits_per_sample);
+					 uint16_t bits_per_sample,
+					 uint16_t sample_word_size);
 
 int q6asm_read(struct audio_client *ac, uint32_t stream_id);
 
@@ -114,7 +115,8 @@ int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
 					  uint32_t stream_id,
 					  uint32_t rate, uint32_t channels,
 					  u8 channel_map[PCM_MAX_NUM_CHANNEL],
-					  uint16_t bits_per_sample);
+					  uint16_t bits_per_sample,
+					  uint16_t sample_word_size);
 int q6asm_stream_media_format_block_flac(struct audio_client *ac,
 					 uint32_t stream_id,
 					 struct q6asm_flac_cfg *cfg);
-- 
2.53.0

