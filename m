Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364119;
	b=cKuJECggFaRSzmxk3mtXeO+JPyRO2fxcSVmRgaqqT5OoPon+X4lmNxIiRN6fz6+Hjg4c
	 bjJdJNDONSX7dt4zZ5Paxc+NmbKWSQy5BeoKkSMSaN+9MCe+w6C0ezDqoVA+2mwcgn5sv
	 wChd/j3Be1gDICfcSB7qPwyypH9szPWUaijcc+bGwKsUnXlVdHUxN6ZtER1rmdmA7zhLd
	 P2Z8LTWJoh+NGc7eTsmD1S0KACtjEztVgeUXMuwqrdU/LbET8BmRPBO10fU8TR53ILR1I
	 oXLjjAnSoNEC5ZmxP17RDQKLOOaeWXaYcUjSlI1/cLus5uXKi3tS9IFKd6Y6J0+AtAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rQb1Rne2+br43WeAfplRGz3KQERlby84CPK3q/3ZvJ8=;
	b=JNsoK8LEok9q/C+bDMSyaDsxXeDVTbB05cKVZgCoq3VZJy3BQbDviAGhwYLhGE+9m8w/
	 Zxum468kBHfYTuONDfpWicM8Z8v+N1tmjX1/oPJ2quMR9lm4yQa3gs+BCwGx23DzrqK5M
	 /R3zOYPqroGpBmBbRfIE+y9UMw7S2Xlh9ucm/ICOXEHRVgintGPNcrn/rC5gPLLu244nQ
	 6g78zssXwGcj5HxV79hl1Ur0fCCTIMX2lhHH7Xeb8WUWPzgCqTy1Mv/5gDIJm/MNbpQuv
	 6qJ20zJVfFJwwIumgURMtU4DkUTuPm0B+IOemtZZZtyYSK58k5vYPG0JdMpqlyBV0LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hjsTTYhv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D6RFLbkx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFCE606C56A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DFCE606C56A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hjsTTYhv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D6RFLbkx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQP693852960
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rQb1Rne2+br
	43WeAfplRGz3KQERlby84CPK3q/3ZvJ8=; b=hjsTTYhvq5t0A2dLhEewlBMuwC2
	eU46Pwig05AqUSrQ30+HerJaGqw4zDf8dWu6DwA1zzTOH+QLtdKWm8bGfMGHmgVV
	tFrBtwROhHem4hv40D8Bqi5IUd39GLQCevK92n4y1CA91bOUoEcN1+fN7f0gFT/X
	LgEkmpg3fTHalZeGEBhHi+VNaNYuAGmjr3kAtbyEUOpA+WpdDPSTBiRm2oBKxhVR
	nQeDOTtcGl6MMz14jCRxIDygN9YSH9M5nXcbDqelcZkIzJC5qc/M0gDhN/d7ai9i
	7qPgFrQFlkgEAlOWLZL8pIPHlU457cnXYpXHz9ATnkXeF3ibIeFhWx0i7EQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu3r2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso374638685a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364118; x=1795968918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQb1Rne2+br43WeAfplRGz3KQERlby84CPK3q/3ZvJ8=;
        b=D6RFLbkx05k87ldV7vQj7N99gS4708spaC1j6TFJP5d9/K2wIWfiKkNe6+OcsZCcUF
         jIeMBOp6vR+Yl+1jqXvUPiVxPYwQKGb1JfRoF5n5xqvTuHkWCb/yasvidRXfjom6ft2v
         dgaeYQV39yYJ4JMQBgkxCQWNxariSyJTl6DPrwkNYvDngMtXgDYaB1LKX5ult5q19tzy
         bKZgJ2958mfZXwvrgRX5AdZQzMwquh21Ixf7SVBF69LeGSLGLrdGqg+Kax2+X8Odntbu
         +ic/Y1GI43pdDp4VMQshEGmceyMoq5A4QoKnf3Ityw0h4jQYHBc8hQ7myuPNp8JplvbA
         /maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364118; x=1795968918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQb1Rne2+br43WeAfplRGz3KQERlby84CPK3q/3ZvJ8=;
        b=SfloCKjDyhW2VJma2TtxYa/xzCGw2tJ0HerUu8gO4xXA2bXFxFmalgzFNZJfjZEBaj
         SrO6fWpqtX6Y4Sh6COeeYJ8IaCHQ5Fk4KxmbYayFGjDAJOFR7oC9T7Zl1wUIdjGy9pb/
         WOw7G6KFErSGN7o3lsP+nECnnkPBI2TOI41TbchMmfICwY5amcA2nAzzLY8g2EVDb8A6
         wFLDqOCRXlSUY2Nf1HXWhWwsA/CTPcBhh+LfRuh8njfMI3brUudXOGblc57xa1hKvcaB
         InRs4ZfdxzwP+r4JmDM6Sg+hmm6AQ8PM/a1rWy08oOhzxfZpYeE3t27BKJxGB0eo7i1B
         uuQg==
X-Forwarded-Encrypted: i=1; AL+hErFsyfKbw4AWvsx7BlLqyoTzyoi10AyinrPXKlu0+33mMoX/s11SqSpteyJtQ/ZwfTsNAMkobbGLph4EBhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xuf1ZGoyLPuc8mhPN+/P2qfDsrQRFJMiE2d2YtcP5RcJ/NZlH
	Bop7CXTupi20h88x5XcpvFPqJHBrdyZWf+G+MTaR5+F16Q9f/3nZH7eTuO7wzsZ8ifRcDFnMK/2
	pFPKI3ErR+B6x8LTP4Eco0BiHAquhsr5TTgSLBisepIvqfkZFHjpxzHwMFzYQXbkmEjw=
X-Gm-Gg: AZFdTZcOypRbiZ3PfB3ftmgadqVjG+U+Jjfit2Xg1eLV7OrNI27AN8k6idbgkXoklnL
	3cOcbqDLg7Qr5T50/ueTVPQPU4tz2mI8I47deJq2ArvzLVLmh3FPyRX1guqTn4sG4jaJHnjJdCx
	cc1I1hDw0+ueAM+MUGPLO1K1oBH4LQe9oWh3End0saWNIJtOq3mF5rNoiAkH+VL0DC8f7ZlHo4V
	9FXr9Ft3A/uxoQjYIT3+1rWxtstahyIRIxR3jer2N6iMOuZ62b9TFvkgKoZelHmEsJIak/u8Rdv
	ZCbQEu07dceYobLeTEY/oi3i/Jqo2rdUu6e9TJLKCFJvuSXOn/aZHcuvYjqC8CAuvMpRhY4GYxj
	3mAZ/T1xkZMekHswozNlk+JHurvZD3dkfHfX59rA8GdcIGlGlYfH2S41Fc5G2Ngm6
X-Received: by 2002:a05:620a:6011:b0:947:b201:fad6 with SMTP id af79cd13be357-949bab48436mr1351182585a.68.1795364117569;
        Sun, 22 Nov 2026 08:15:17 -0800 (PST)
X-Received: by 2002:a05:620a:6011:b0:947:b201:fad6 with SMTP id af79cd13be357-949bab48436mr1351177585a.68.1795364117097;
        Sun, 22 Nov 2026 08:15:17 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:16 -0800 (PST)
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
Subject: [PATCH v2 18/24] ASoC: qcom: audioreach: add live speaker temperature (T0) readback
Date: Sun, 22 Nov 2026 16:14:31 +0000
Message-ID: <20261122161437.5994-19-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: POqph7rvUonCHghMY7rEA1-81tHawPWK
X-Proofpoint-ORIG-GUID: POqph7rvUonCHghMY7rEA1-81tHawPWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX7edrYH8vo0wS
 yFV5FVXfNeOdpYc14xFCB5aKvEmEOpDtiWS43bY20yI/xTQRydL0xQ4cTHH7y4jlTyFGtrAwHaS
 tjpEiXZpMP3kWhj4T/F7/pW3UfIyV8obD9E3qtFW3YVxph7Q036HKSyoZwvaIiBYvu74dWsEePy
 PQJT9Hg0WKRMs1POgGF4xodZJLAxuXi0PmEFr1FBtSWstWgyS9kaqgfd43zlrlC6xQM9lkPiCVj
 F/AlqWIThAmsA5qyBlN6ZvJuRO71Lzmo8tAtxz3tbHOasVR/ipYjp1Kib742wkTHqfVum5uYpBB
 Bka6XguKx7XsV630iRTu/5pKNrkP3oAlPU81xagHo7njkMmZKijA685qZm2/elRc3iiW1PHlHvg
 8nlUghTQTTiL/+9aHqan3lSrvXXkWc54OQaCfJae+3Cd3puMLLveMCLSimuI0u1LTnU5B+hy/Q3
 js24S71hz5xFs1pxiBA==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b031516 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jt9GbcDmORiCJNAdx5sA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxhhng0qmzh+5
 01GYS0ci4UV8DhYRORVhrTKDXYRuUK/vEBb1Mf/6pl7GIxbZXuniyv4uSxdJ+ray9FTLnVr9xHM
 1XuSqA1xCD6jv9sBKVGdAz729fSNr0M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

A calibration needs each speaker's die temperature when R0 is measured,
so that the R0/T0 pair given back to the DSP is consistent.

Let the machine driver register the speakers' thermal zones in VI
channel order with audioreach_sp_register_speaker_map(), and expose
their temperatures in Q6 format as a read-only "Speaker Protection T0"
control. Record T0 with R0 when a calibration completes. A slot that
cannot be read reports 0.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 65 ++++++++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h |  5 +++
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  7 ++++
 sound/soc/qcom/qdsp6/topology.c   | 41 +++++++++++++++++++
 4 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 97d8585a287b..2bb56933b9de 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -5,6 +5,7 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/apr.h>
+#include <linux/thermal.h>
 #include <linux/workqueue.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -44,6 +45,13 @@ struct sp_vi_r0t0_cfg {
 static struct sp_vi_r0t0_cfg sp_vi_r0t0_cfg;
 static DEFINE_MUTEX(sp_vi_r0t0_cfg_lock);
 
+/* Speakers' thermal zones in VI channel order, set by the machine driver */
+static struct {
+	struct thermal_zone_device	*tz[MAX_SP_VI_SPEAKERS];
+	unsigned int			 num;
+} sp_speaker_map;
+static DEFINE_MUTEX(sp_speaker_map_lock);
+
 /* SubGraph Config */
 struct apm_sub_graph_data {
 	struct apm_sub_graph_cfg sub_graph_cfg;
@@ -1605,6 +1613,50 @@ void audioreach_get_sp_vi_r0t0(long *vals, unsigned int count)
 	}
 }
 
+int audioreach_sp_register_speaker_map(struct thermal_zone_device * const *tzs,
+				       unsigned int num)
+{
+	unsigned int i;
+
+	if (num > MAX_SP_VI_SPEAKERS)
+		return -EINVAL;
+
+	guard(mutex)(&sp_speaker_map_lock);
+
+	for (i = 0; i < num; i++)
+		sp_speaker_map.tz[i] = tzs[i];
+	for (; i < MAX_SP_VI_SPEAKERS; i++)
+		sp_speaker_map.tz[i] = NULL;
+	sp_speaker_map.num = num;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(audioreach_sp_register_speaker_map);
+
+/* Read each speaker's T0 in Q6 (degC * 64), 0 if its zone cannot be read */
+int audioreach_get_sp_vi_t0(long *vals, unsigned int count)
+{
+	unsigned int i, n;
+
+	guard(mutex)(&sp_speaker_map_lock);
+
+	n = min(count, sp_speaker_map.num);
+	for (i = 0; i < n; i++) {
+		int mdeg;
+
+		if (sp_speaker_map.tz[i] &&
+		    !thermal_zone_get_temp(sp_speaker_map.tz[i], &mdeg))
+			vals[i] = ((s64)mdeg * 64) / 1000;
+		else
+			vals[i] = 0;
+	}
+	for (; i < count; i++)
+		vals[i] = 0;
+
+	return n;
+}
+EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_t0);
+
 int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count)
 {
 	struct sp_vi_r0t0_cfg new = {};
@@ -1670,6 +1722,7 @@ void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch)
 {
+	long t0_live[MAX_SP_VI_SPEAKERS];
 	bool decisive = true;
 	bool success = true;
 	unsigned int i;
@@ -1730,12 +1783,20 @@ void audioreach_vi_calibration_event(struct device *dev,
 			 i, r0_int, r0_frac, sp_vi_r0.r0_cali_q24[i]);
 	}
 
-	/* Only a run where every speaker succeeded gives a usable R0/T0 set */
+	/*
+	 * Only a run where every speaker succeeded gives a usable R0/T0 set.
+	 * The DSP reports only R0, so pair it with the speakers' last T0
+	 * reading; a zone that cannot be read gives T0 = 0.
+	 */
 	if (success) {
+		audioreach_get_sp_vi_t0(t0_live, num_ch);
+
 		guard(mutex)(&sp_vi_r0t0_cfg_lock);
 		sp_vi_r0t0_cfg.num_ch = num_ch;
-		for (i = 0; i < num_ch; i++)
+		for (i = 0; i < num_ch; i++) {
 			sp_vi_r0t0_cfg.r0_cali_q24[i] = cali->cali_param[i].r0_cali_q24;
+			sp_vi_r0t0_cfg.t0_cali_q6[i] = (s16)t0_live[i];
+		}
 	}
 
 	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 713bf3ba5b6f..fb3f2f61e2b1 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -8,6 +8,7 @@
 #include <sound/soc.h>
 struct q6apm;
 struct q6apm_graph;
+struct thermal_zone_device;
 
 /* Module IDs */
 #define MODULE_ID_WR_SHARED_MEM_EP	0x07001000
@@ -1137,6 +1138,10 @@ u32 audioreach_get_sp_operation_mode(void);
 int audioreach_trigger_sp_calibration(void);
 void audioreach_get_sp_vi_r0t0(long *vals, unsigned int count);
 int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count);
+int audioreach_sp_register_speaker_map(struct thermal_zone_device * const *tzs,
+				       unsigned int num);
+int audioreach_get_sp_vi_t0(long *vals, unsigned int count);
+int audioreach_add_sp_telemetry_controls(struct snd_soc_component *component);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 4a86e7dd48e8..7fce42cf1ced 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -20,6 +20,7 @@
 #include <sound/soc-dapm.h>
 #include <asm/div64.h>
 #include <asm/dma.h>
+#include "audioreach.h"
 #include "q6apm.h"
 
 #define DRV_NAME "q6apm-dai"
@@ -1185,8 +1186,14 @@ static const struct snd_compress_ops q6apm_dai_compress_ops = {
 	.copy		= q6apm_compr_copy,
 };
 
+static int q6apm_dai_component_probe(struct snd_soc_component *component)
+{
+	return audioreach_add_sp_telemetry_controls(component);
+}
+
 static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.name		= DRV_NAME,
+	.probe		= q6apm_dai_component_probe,
 	.open		= q6apm_dai_open,
 	.close		= q6apm_dai_close,
 	.prepare	= q6apm_dai_prepare,
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index c07a27bdd3a2..0e28c68c735d 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1527,6 +1527,47 @@ static int audioreach_put_sp_r0t0(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+/* Live T0 per speaker in Q6 (degC * 64), 0 if it cannot be read */
+static int audioreach_info_sp_t0(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = MAX_SP_VI_SPEAKERS;
+	uinfo->value.integer.min = S32_MIN;
+	uinfo->value.integer.max = S32_MAX;
+
+	return 0;
+}
+
+static int audioreach_get_sp_t0(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_t0(ucontrol->value.integer.value,
+				MAX_SP_VI_SPEAKERS);
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
+	{
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Speaker Protection T0",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info	= audioreach_info_sp_t0,
+		.get	= audioreach_get_sp_t0,
+	},
+};
+
+/* Kept apart from the topology SP controls, so FEs have them without it */
+int audioreach_add_sp_telemetry_controls(struct snd_soc_component *component)
+{
+	return snd_soc_add_component_controls(component,
+					      audioreach_sp_telemetry_controls,
+					      ARRAY_SIZE(audioreach_sp_telemetry_controls));
+}
+EXPORT_SYMBOL_GPL(audioreach_add_sp_telemetry_controls);
+
 static int audioreach_control_load_mix(struct snd_soc_component *scomp,
 				       struct snd_ar_control *scontrol,
 				       struct snd_kcontrol_new *kc,
-- 
2.53.0

