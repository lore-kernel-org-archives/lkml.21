Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364109;
	b=u8ltDorivg0I1+gW5fD+WbT39M5fy6jiUfnN3D5WK+Euy/110pvNLm9v5vZ2yRdQIJ6k
	 W2ND1zOQEqMshZIizoCOHpe3N0oH1LMayRHVwxRcRb9fGIaZiKe7gSu9jPk2Y+4o0MLHx
	 BtrwlKpGH8iOYAYcXQc98JVL2HF2o92CTXPYbDR5fk/K8qqGuKgoz6a1XqiKcvLqQb26J
	 5Gb/r4QTfrCaAA1sxmLcPHbcCqO/DmBtUBdDsrYErCQosrjL191NG0XXnEIS1NZl24cDV
	 OgRj/t5JO+6T+ZqI9lxEiSVANQBgC8BfB2LM6Ca5LM3jRC0wufd3/B3uY9QRKbJdyXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
	b=co/kYAgWwrp4h7xGcygJwHmA7IM8hKwrmBynIqsh8DCpS7dVlEhbRWL7+BsrQMDsi2xt
	 +n8cXjcOtkOm8vPqNb2RgyUymJZ67+iIU1y1/jpmRqJt2eruYW11LocUDMZSfCq14Eg03
	 EvnbZo4du9ZxUgjt2UCvLSnykG5hfw441gGWzuCFPkutFCkLoR5ZX374nB0/HrWQUOA2r
	 H5eq5Pk8k5T2ZKIPnfi9ocmBmQT8b9cRlVRRCeMXg6UDmDL4EnzSMx6FCYVPeNMVnpbGj
	 cwmWAhe8YyREoVLKpQ4a2zV65DURvuxMxspYA0pHMngZiXnu0uEFRe/mrXrkjOcYFEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi9h5i9b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LLDu41YZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B0060A5BC0
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B0060A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi9h5i9b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LLDu41YZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFRQV21857167
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s7yG2kXY4Jn
	+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=; b=Xi9h5i9bgGoE4JL5X8INRZkm2m8
	RnEGRn3wCA8EYxnsv6G26qZ4nHkFtowVLEEyeJqOHYMjyIB6AECNbsyVrldAshwJ
	3dRjCnmSGFQzENLynWfWK85ZpzWUNYzMeZSLVPWGBvd9N3fteopX7+sW0Uu6oNXG
	St/T3tX302/jQIA1Ij59xF9tUEXiuDDlD+E7e5JtTCvVvnV/2+OYKBSYjj+LfMth
	7YtyZISbGmhxMqkWqSJTsovTPutdD3sNOqjy8py14gvXoFAZN/u4qFob5OsESlHO
	bE6S57ruJAT3faqtq93hX7IWhBydWEQLOwXRm/OWaE0s1no+jgZYaK7R5rQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv40g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9212335e257so55643676d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364107; x=1795968907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
        b=LLDu41YZ5P7YFZzHnNeGbdTg4ztt8cJ7KSa8Qz3RCbSEQq9pb0ap///GcKmGnn02FP
         ej/je7EaUOuEe4AXS2Y/0hIuqSkVjaJuJ0k1KSm26zfgMCNQH9BzgHTZsNXhywHLXABP
         DLfU2D2+lvMXLhpXn05wt8i721rUVdZTN5OGHh650GpF/fABJ8tneObrJJChxtneZkuA
         VyxziWipfeFjBvww1Qquacg9n+aRnb89fUP3/oZm3gTcVUykMmlv2C3eQMAdOVJJzCVt
         ralzTEGc7/z1GbF4pA9UdPedhZZBLbUAvMP+BvYTMTTKejIKu5JRIaaJiRg66afmdhyv
         Utiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364107; x=1795968907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
        b=j830fqGXFwIFIQw5tOJ4XsF+ArcZ3LJB142M/j+mJcfOoV41nogvstQ457wWsO0iVB
         4WSiaZ5h6yClnNdHWuwNiGYgylqgklWFkY/W6pSKZTXrEFl9jqG2D2DaMzp1TjFPJKkR
         eS48Y58GXzsFkOzOkrpiMQKigaxIJ2a4O0VZ+VsKe/22FD2mv1DJPUu02MTtVqEo1ezy
         dfSS47qSb3k5NVQKctTRe1klkypfQtTOJvrRjWPm0FKCjcJDz+Jbh5l90fXNyWATDYVO
         jCrtR3mjc3ENkgk3Hr3T8lvmhISLlNAaFr5v3qyy7MJTpDpVB1RsDXlRtRLFv+ye+GuO
         II2g==
X-Forwarded-Encrypted: i=1; AL+hErFwcE/b4wuL0YNlNVXA1TgfWMrrg0kpwzaq542CDeWpMqKFDjslXkyjsubfkRt63t+iiEMC+ufe3nAZw+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jHj3zpv5YRRapP/5addooa53z3z+TAbZ9ePzfEFrLTEJAibjO
	6iGxEJpdOMuvt4Ru4dU/j/+RxwfoJNxSltrYSBsSQyVld6KKnNgMQHbMUUKD8O80y2liEGgqHcI
	tMqOF41PftG82xxua4hm7f1VPDPOxDQwL6LkDLt5PrmHZ2NgF6l4rnjlN9ZchIonHg5E=
X-Gm-Gg: AZFdTZc9eJoWsUtn98q807myWtxiJWgUuJTItvJlPaq4IwyJwzdJw6prIzLwc9wmKS8
	xU5cEOiUkAcdItTX8gPgeS5nqC5d0N2tL+BnZBwUxl2Y6YfwjgWYdngLAQvy/U6lTh3qyJXSPfZ
	WjJYy647709+10rp6YqMcpxT+2qOuctFxLA9e03rbJyCg8qe4SWjZmBLdRnYL/5F17oe9foKPwP
	jjIdAtm3KMlTNp9YeKyVQq7TSoSxWqlbc39cZa5gX7I0zZ/lKOCfrYr+LGGK/qMlJuG34PO7VOO
	XDv/sM8jPUaMp+TOnvU0g6Hq6HAVlbKqJOpd+ErFYU/Zg3KqcvIMEc9Iu5ToaDFAnZh08u1Imhm
	glOkfdc5xttZPyY2VhcjZTbAGCcmlLvve4JGGrb38p+D8i/Ci5gWAGjgIj2MrSDY4
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr1581393385a.46.1795364106961;
        Sun, 22 Nov 2026 08:15:06 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr1581389385a.46.1795364106613;
        Sun, 22 Nov 2026 08:15:06 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:05 -0800 (PST)
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
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 11/24] ASoC: qcom: q6apm-dai: add S32_LE format support
Date: Sun, 22 Nov 2026 16:14:24 +0000
Message-ID: <20261122161437.5994-12-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxhJhH/k3zZdd
 a1ys8/VkwlpdKbJGMhwGDCzGGlzMhfmHEJZILFF3Px/hYB55YCI/6IsoJHoiPnDZnBN8cSlYb9h
 VC5i3rh+FkeGvJyozVxeu8QAEqs2y6yE6LUSthLlRIbn7XHRuuq0aB5X/OE5TnSjCZNhngr8Ere
 eJEYkOW0/z03CP60LUD4d+bvkGUCGYI67xlyNmt1XjRoTXAytiL8b7/M1pu3vehZ5EQhMWbjAJi
 qcCiWrf5PLX4Ef39iRT08SMFE9WbQXOlTkZZyKFZtXz3XbmwLVgn6/zl2IJao5j2ddBgOCJgVcu
 QlX8hoJwixuL38J5mDkX2eo/CmzvJrx2GPSUlJVWfq5354udb8pkIV1It4JSH1GzoqFEo4lW1P5
 6+MghpflnzyRYvl1TjuV9R0XPLZH1/OyLJh3+1ngQmbgyPZh7/o5JEyflz0zl5gEJSgt6VGQZI9
 hFugWlWm1zp66hZgL2Q==
X-Proofpoint-ORIG-GUID: M_lzAEh10A9kkcX0tm3hxjW95kXv3Zgm
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b03150b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0GeEMZVGUYcv1euD6hYA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXz5C3tacfOGvt
 FICFG8rAu+VmoRSBPONJtsO2gtbJFcGoOvtCoZ/KA9knxwlC84CkwM/wMk7ACM33IxZw9MMFxqb
 r7uUjfjFfUFKnHz9AKvv1tSP1O0Ngdo=
X-Proofpoint-GUID: M_lzAEh10A9kkcX0tm3hxjW95kXv3Zgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker protection VI capture carries one 32-bit V/I word per
speaker. Add S32_LE to the q6apm-dai formats so it is not converted.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index afa4bb095e09..4a86e7dd48e8 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -202,7 +202,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_48000,
 	.rate_min =             8000,
 	.rate_max =             48000,
@@ -222,7 +223,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_192000,
 	.rate_min =             8000,
 	.rate_max =             192000,
@@ -643,6 +645,9 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 	case SNDRV_PCM_FORMAT_S24_LE:
 		prtd->bits_per_sample = 24;
 		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		prtd->bits_per_sample = 32;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.53.0

