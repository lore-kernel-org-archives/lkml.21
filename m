Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364122;
	b=3/S4KUVSKwXkXiAchxM0RR/cuXCqUOndOdethq7wxOmNAoQiDdYbrc9HT6JFFbP3hgVD
	 Y8NY+9nP5jh/x0BhdmIRIc/koON3tjiptJBqCU7UPPtVQDft4/ZjVdxACMf5osO0GtNDd
	 g6BP9w1a/iiHcUXA4QdJXTYkQTiJWU/wE5bAJplp4N9ieb0OiHmvB3HPU49/gFb0waG4L
	 gd7W+byZ7yeEjJo3mYnc/HmFpshmPGTUpP14szpRkCPF1ljPsIrfGD3cZRLK51ISfO4tL
	 hBxqIsCeBgMjpNgzkUfxXUaBwyIZFF9E3sFUa8rvmzUTm8sSd/PDviuemyon2O8vDdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F+L21FTarZ4H2hYqr5kYcDkq6L8oSj+Gr70Hhv90lJ8=;
	b=26CnJEoulX7qI7jOUD3deZwZErl3iXTEYuRnuHpiu9+vH13OGzF3p71tnJmZeWlk8LZm
	 hX7gnkJ9awlNKVN8zaPAeH+A4HrtzOhz07fv/E3OMu0Qkp2eUUzRi9ZpWYY0xvI0Hc9zI
	 yrFLUGRXWJqO1QBGlZ39NYlpglGoRG/hbotgO3sq8pq0IysMMuiiAtCMQwDNHS7xMIrQI
	 bBpe0e8ki+yWxbgng3XnndqGZhE0Qw25XQu3qrZ+tpS9XYTrD2sOjQ4WoQ2TzFWal/Sgn
	 jVipoParsn6AQSck4vr0AyHlw2r/fL3lyZJRMGZX8XkYTffwnhfk7u8wEDiBTwFZLkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nIWiu5jn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEn2d3hd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EE760A262A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46EE760A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nIWiu5jn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEn2d3hd
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQlkK1855362
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F+L21FTarZ4
	H2hYqr5kYcDkq6L8oSj+Gr70Hhv90lJ8=; b=nIWiu5jnqjksjhUVuUFsrWtdGlq
	q9tndseb415/879kOFcl4c7fPcfX1oLdjgDngrt+C+PmDi7bT87L7NCAEBMMO8Lg
	8bV4aXBbe/gqUNKrKU4+Yd0mSb90IIeP85kJTIcAxrxiR59YjcbAzm8IF3peTQlq
	4o/Ou/6m81wrqJ5hHAzCkdlG9M0Q9erZgHKijEOkE8LpqQi0QAVBg1r0i3Btc8/k
	o7rkNZssunMDsoO1Am1j3NyUb5or0CXDmzuJ15mbT9yKv9cAZRxj3G/smGqr27ag
	x/wzXce/sAMPCXxx+y1wR10mvo4Lx+7dGCR+JQs445h1JZx10H8e6LbyjyA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv42b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9493e89d4f9so378523085a.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364120; x=1795968920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+L21FTarZ4H2hYqr5kYcDkq6L8oSj+Gr70Hhv90lJ8=;
        b=cEn2d3hdgReyHYJtd1B+bfco8bVl/fBbBEkAT4hyDyVWYKFUBzKgXduZn8p04sRVjy
         VkQ3thomj2R/1/6tgWdnvRrgdwJBVQaTd9VehOPIMRoE9Em+jkwW6XfAtLpzBXQ/Ozr+
         XUVTdY8YcSJCa8EfVkypNb1pW+J8bf0ih7c8oJvv4tI2OS7rHEtFFBF9hUulkFKmGcGv
         269rc/ULINBmGKKXFlnL1UcO9/FZhCpCca1RZKu97Uez8afmkBmNveklI3VyjetxRVr+
         rdGrH4JK9reAX0U2CK6TwLoeHNiJvsZ75PK5qmirVk/tfert5GfeJs/bHQrtXAg8Irnj
         o2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364120; x=1795968920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+L21FTarZ4H2hYqr5kYcDkq6L8oSj+Gr70Hhv90lJ8=;
        b=FFV4JG/j0SgO33EwDDFVvvCuanj4PtQ5iTZYclj9AaIld+QR6F1rzhxAeMobDMug9/
         ku+S63yG2KfzeBdpJEqqI/UetDGLpgF9/KeI/Qr2sBvEyIUMcqdwHbZUdHnrzMKMkvyG
         8XF/6mNRWcQm823JcqRme23tzjznPLTiwkgdy9er/ue6pd6uQb5+At7ewVE6Fvz/uY25
         WXSqaaTTiPkrue9Cwuzbcowlgmct4RuUigQpBCJ1W1SfRIMgytZtbN5JgxOM0klZFMke
         sshd2Z8dVbJskMFGgWON1EZlskvNrk7r2qdR+Ze2ATSN5jfpxn6WKjVRzc67OkzRqrI2
         kkdQ==
X-Forwarded-Encrypted: i=1; AL+hErEyt5trQ8IHgYZZoQsDJajCzAS8S9AbneLCPtLcRUb0hm21KkIHNGwFmk540p2WzxYiscT4Ua2I1AAN/P0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/uQ4YzMLLxKUdCOsBZdu5s1F30zpwqvwdLEYk0aqM+TPUujcR
	9NrEPk8MOGKM1NGx/kYS1LuF+ETavxQRAUHnkX1wNQnG8V/SYF9q3FI/z6viY8Wtpi9w1gWoE70
	BsbBiluXrSkVtsLQlxfbb7ddJ4CKrnn3Z4D2+6ebv0aN+F/F54aOVFjlyD0N7KhCgPdI=
X-Gm-Gg: AZFdTZfrRqyUQRIC/EdWkB73tCUUtJtDb4Fl5mzzcgerFloG2+T4g/QeGoQ2K49WyH4
	Az1pn5pSR1cg5gCqbDrhPNG9KW2oueRe6c2mL7jzV1NngpbJ4SqWtLcvjHR/64JTaSZBUKA/V/N
	WBvRy4Db4IuokUIv4qi3eZcDddD4FLbjMq30Ngwy5nByRWdq+/wyb5wf5uePjx0Klepus/U3hzp
	3CtqcSaSz/0vM7Nr+Iq4iVQeDDn8MOFn8l/+lX3j9oWXZjmgBEi8WXfJdhlpDQoC+SaTFtlmmE/
	XArOW2RXJZ4+CPltT2r0iYflzw4z+fIKNtZO5gMKYRxgrMfgY14C4ywggfm7pC3etb2BrNnYeDj
	e/R2EMIx+v0D0AGlrEuRsgdIKCIu2cXkAo3Gb1SaJdCMt6KCcvnuKu58Yz8mcP4Vf
X-Received: by 2002:a05:620a:1330:b0:949:61fc:88a6 with SMTP id af79cd13be357-949ba81a0aamr1463126285a.11.1795364120425;
        Sun, 22 Nov 2026 08:15:20 -0800 (PST)
X-Received: by 2002:a05:620a:1330:b0:949:61fc:88a6 with SMTP id af79cd13be357-949ba81a0aamr1463121985a.11.1795364119939;
        Sun, 22 Nov 2026 08:15:19 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:19 -0800 (PST)
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
Subject: [PATCH v2 20/24] ASoC: qcom: x1e80100: carry WSA VI feedback on the WSA Playback BE link
Date: Sun, 22 Nov 2026 16:14:33 +0000
Message-ID: <20261122161437.5994-21-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX/GSGA8S/wyl5
 BpfVQ+ExIKsQGYAL4fGDCRgZ8DZZ9mDEcMV5Hz2hNbA/TgZTTrXOGSfHFSiScSAZ0AFURiHYQZL
 yVA9Hbu47caLBM8G5lqZbZ8snhuk9b98IsW4Ex2AQjxkb4D/+/1O02ExKdwdqFVzfEMDwiDSugm
 aGya6sjHccTW6VLEIdsjGfXpGBi+82WZkeg98lTHsiJYB38eEyNugyXkCfzKYcAdyyEBD763PFp
 urC96JKZCXnucdkPMVP22zGKaenEBm1FWIFrNnj/clSEH3onxusdeCTmhRCfb73H09F9sA81zcW
 hRDH1TVyPZC9I4ZRhsJlVrBPFOJ1Mqjrg7hPqi7Z2DlZIQ5LLlPHAXv9q64Hm2h4xeeGtSQUFFR
 Ko7DNyX5iUbmTNKp6bTF5SRHOekKf4ou7GgpwEf2bK2hcy8HS+NTIPNFj9OTzZ+CkFsipQQ+x9L
 pEuYph7f2Qzoh+IxLLA==
X-Proofpoint-ORIG-GUID: qowYi5PsT_uNkv9pMQJ4WvpQCEWUw7df
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b031519 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=XkUP1P5AsvUOVAuvPJUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX6SE+SebpoABi
 L/CTBNZbLxzTNDmkYQFmFQ1FNCVWuAELe6P9l6I6BknHCCLZX36c5zyqAXl3DgmLOJtfps28e11
 xKv8MrXdfZOhk6myuzAl2THsnb7UMCU=
X-Proofpoint-GUID: qowYi5PsT_uNkv9pMQJ4WvpQCEWUw7df
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Speaker protection needs the WSA V/I sense capture running whenever the
speakers play.

Set multi_direction_codecs on the WSA Playback link so it can carry the
VI codec DAIs, with a params fixup for their 8 kHz, 32-bit format. The
core's capture stream events for such links power the VI widgets.
Nothing changes until the DT adds the VI DAIs to the link.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c927672eaede..3262fa39ceb9 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -6,6 +6,7 @@
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -85,6 +86,28 @@ static void x1e80100_snd_exit(struct snd_soc_pcm_runtime *rtd)
 	data->jack_setup = false;
 }
 
+/* VI codec DAIs on the WSA playback link run at 8 kHz, 2 ch, S32_LE */
+static int x1e80100_wsa_vi_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					struct snd_pcm_hw_params *params,
+					int stream)
+{
+	struct snd_interval *rate =
+		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels =
+		hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *fmt =
+		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	if (stream != SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+
+	rate->min = rate->max = 8000;
+	channels->min = channels->max = 2;
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+	return 0;
+}
+
 static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -181,6 +204,20 @@ static const struct snd_soc_ops x1e80100_be_ops = {
 	.prepare = x1e80100_snd_prepare,
 };
 
+/* True if any codec DAI on this link has a capture stream (i.e. VI feedback). */
+static bool x1e80100_link_has_vi_codec(struct snd_soc_dai_link *link)
+{
+	int i;
+
+	for (i = 0; i < link->num_codecs; i++) {
+		const char *name = link->codecs[i].dai_name;
+
+		if (name && !strcmp(name, "VI"))
+			return true;
+	}
+	return false;
+}
+
 static void x1e80100_add_be_ops(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
@@ -193,6 +230,19 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
 			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
 			link->ops = &x1e80100_be_ops;
 		}
+
+		/*
+		 * The WSA playback link also carries the VI codec DAIs when
+		 * the DT wires them in. Only advertise multi_direction_codecs
+		 * then, so stock setups without VI feedback do not pay the
+		 * extra TX startup/prepare path.
+		 */
+		if (link->id == WSA_CODEC_DMA_RX_0 &&
+		    x1e80100_link_has_vi_codec(link)) {
+			link->multi_direction_codecs = 1;
+			link->multi_direction_params_fixup =
+				x1e80100_wsa_vi_params_fixup;
+		}
 	}
 }
 
-- 
2.53.0

