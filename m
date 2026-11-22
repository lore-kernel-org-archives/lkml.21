Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364118;
	b=FsEscDQt633ClPQHf91Ne7wHGg9vsmP1s3HqmPx2LLK8SA4WvXJTUmT8z+zNZj4i96Os
	 YqeRiB14EDFHHZUMaP1ntyFOYh/TmDT0P9zjKSjUC1qiMWjTX7d8pAQITlvgI4dgcyIdm
	 z2JcK73M7qj2kfA7KzQ9sd960zvK8/Cl2EFJpgSZrgZ261qKLOh/JJBY8DXb2PPD6wbGx
	 SGrJYM/1lMjT6Pal3l4AF5vL+UEcALcLSGwY1XWDPr/Unh+1UteTyB0BWZc/peJs2L0l9
	 PQ2dgXPNFKxP+BTVskFnuoW+dDBLxXIiJySN58G7up+yJ1mTD5eazG9Hl7wVfsSrDzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364118;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
	b=tfaD+wNgWabPtvbhxoDg5zL9Kb2vqe02H5sF3WF5V+W2pLQoYJf664qf0YyULXyhAAoL
	 stui5HYFnAD2oe2I+uIBfNZk+dm8liIAbRVRCFBfV1e9D1YyBZBkI347wWnDmSBsMBNTg
	 On5n6e1rHTr2DvJPH92hrSf8Z67lMOqK5ZhnphHLQ5NWI+uRT4vg5416zacuVYzgV8UeC
	 Q49DO7lg5vsJ17p8JqdXtlW0wwY9wHhtcEdQJ3Va4svFsC6YK/80ce3UjAQDPjVnseMDW
	 yLRzmvrEeu5Q8k89g1ck8uRaESMmyPzPhcBqgq4C6yY7uEMeJoP1DRYHW5hhJA5iK6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mnr3WYf0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3l2cn3L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71E60A261D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC71E60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mnr3WYf0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3l2cn3L
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQpp41248396
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OJ/t3yJRSO/
	I8Krm7cGvb9xURXfceDUgpjT74EYPghA=; b=mnr3WYf0RMNGwAS1YNEC2qcMZvo
	ddz23yc/mN33i1IAq9VcyeneKk6iYtaqJnOUdLuit7biAar9ZasMSpxBpW2pGokO
	0XG9aHzZwcLo0cJi7R6VschHqq0Jn1/GHYLOXqRNY1a6XTB4ia9EAso4YFmflJXa
	wlyrCnlZV8CWnjtPrmuS8mvcRL2Pxj8bS4BTUxsvDemaDSllCnkjQ3qOohqsLmXW
	anqnPAl6hs6vlClARhyPZemiCf17uaNlALmvAdndWoe0u9zJ7BWXWsSpIqR8bIdr
	Az8ZPnjXOtWayd6XXWh4v508JaKRajOatkt7reQBhVMex0F7N9EOT0S1KIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03rw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131befso408760785a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364116; x=1795968916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
        b=D3l2cn3LhL/fO+NgI2ydQfHPum2bBeFF6S6SzD0DuXBbPrrszCCsvWkJFEjiUjOxN1
         /+GUmZUO3UTcDYnQwkzweV5hcImxX+Et/zioQvouwnf/IkUdZQcccKkGfn6vPQ13SYMW
         S0YSlxSv4z39+8itLx6MPzmolh7b8XRRWb9Dbmiu2HjXZbdyb7t3MMzq+SuEWwId0hqk
         t00INT4qYNVbaZubFuiJprTpUgpZCarwiW4gPP88sj2OE/to/SU1B+42ma9iu+OyiblG
         4JStK4KTQooH/i5Y3O45OfJk+lx1D9PW6ink5BGI8+a77try5lSMYg+7DDT7+7NCp1cF
         aC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364116; x=1795968916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
        b=XCfXl5Xv2wblFN+VGuNMnZzTAcwBbF0AUPDUBeMdsFSRp71EEBmLQmuIGtVxVNn0WS
         OGvHHHN2PVi6JvJez0oETe9enRdog/vqa7D32JJRkJICNIIZuUDPA8PeA0/0sxjDfiuQ
         otxrwtbcrPAFpFd1NwI4T2ULhT4piRfQRuhE2vRhsV4pK2emT/p5nQLcC3LAyJbf4ai2
         0fal+uf4WG0Ae5cffUp15+XZYAve105lfJJXX4MZKLMNKhCcWcdeAgH1Pb00B62ynKgF
         wZEmWy7fRd/VJ9+BQmCUtq4usgA74EFagas4TSdI9bbl3SISEMr3T7q+19DVTAwMbPqI
         /lQA==
X-Forwarded-Encrypted: i=1; AL+hErEvpx4U1FJ3baDZ8fwEvMZLIPZIy/Y+GxVJ6m6+wwcRp+TJlY+IBNrsnkZE57IpIx/hjzbJRzYOGkoHx4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DdS9BclL9C5NMb9RizOiOhGDBfMcmnKHKzALEue3ADjWHKZZT
	25m4vjAop9yHg3hEWhXRGjPmFDRRmuSRgRjaV98vqkFBj7mRgBb29LUKKYU+RrVvpQUqJI69fjN
	X5WXh7TxpDQApCSDWMYMxlm8Cq1mPDpui/UsmXCchKEkga0QgZtyUa3Abo64USDWaPl4=
X-Gm-Gg: AZFdTZdtHBZwizvgP5KluQQ22oHyKXVrnl+ogL5TKIDUOIqlJgzevrusqC2hn1aByFS
	o3I2YWxQ/3dsk5u24RMjgUAuWse1/Wrcdt3aP4bAKnF9yObjTQDa8NiS8atxO5QavU8fkLlHuiw
	GXJGa8eADPiDot9nbeobUO47bT67H7YAEYgT2PcCoUtcq7easUP1bJ6IF6WAF2g5U/8lCY1Fcw4
	T6eRqBHWBh1lpjvenMxJiP5uk074EFYiPCoXiyhzkF6LBJ3bVzAE8Oit60VioVF0+d6njHKv9sQ
	esCtBgjjN2G5xa1RkhEs6/IVz91G60Gl83+j4JLk53Y8YWzV3BZp+386fY7ICwqfZxWHSJb6OVH
	a6D68/n/R2kPtLpwdgDI9jgGMaeDi0eG48Ep24gu+1FW1V8sxHFEKVQZFRpKp6YRW
X-Received: by 2002:a05:620a:1b89:b0:945:f28f:ce92 with SMTP id af79cd13be357-949ba9b0744mr1506517785a.40.1795364115996;
        Sun, 22 Nov 2026 08:15:15 -0800 (PST)
X-Received: by 2002:a05:620a:1b89:b0:945:f28f:ce92 with SMTP id af79cd13be357-949ba9b0744mr1506511485a.40.1795364115542;
        Sun, 22 Nov 2026 08:15:15 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
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
Subject: [PATCH v2 17/24] ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
Date: Sun, 22 Nov 2026 16:14:30 +0000
Message-ID: <20261122161437.5994-18-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXwPMlK9CeLoNp
 NmhquQAvpOiO/UqfXWGN8/Kh1iOgqjL4uM8faYbCSH5Bc4w24HV6jUZ9/McRnE+qJntf7Gs/tBh
 /zuLjU7Az/swZuG/XVO7t7GjmXrNbsWfXq8INOMfkyMaaxgNZ626FIoJfyDSIbfR/sregdYGRw3
 2KWUpqySVYRSbCvl61bwTjyOHtY4XvXw+HlNPc5y8VrBod+ESLwe1PD198E+in84Dz4DBrA03b3
 LXUFt+hXWSAkauJS2jbB5g7Ey1zxxgETEYUQVCFGtZGb4wt0NVZYYUV1iRvwouNiEuoilDE7oqc
 uMwWbqpk5tHQAOaH8htRsiRDR3r0624Yel5q9vwdS2NUIHYx5iHlK1p+RfVmPcmE1DufKAgDZ8x
 G/I1SoEgrk4zVW368D/dLqm6gcvoBXBBPCnG6yN8diYqNd/ZxULMP4erlp7VpISRuYUtjZptmcG
 OSXGR5ixy8WDYOSSncQ==
X-Proofpoint-ORIG-GUID: HUpBvFezkHgiYV_62xwk3C8jxmFm2AeO
X-Proofpoint-GUID: HUpBvFezkHgiYV_62xwk3C8jxmFm2AeO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX40S3RjevPgM7
 IP2b00m2ZXQs7xbOvUzzpBkHZsNnD7dFcxyVu4ab5IW3l3qvv09JKuJCe0D7UUs8OVBpYdNFUsj
 +Ymvd99EnVcUXwDYdNFlWedalBGYJpc=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b031514 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2Irll14qWxTS2nb0BqIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

With multi_direction_codecs the speaker protection VI subgraph is
opened with the playback stream's parameters, but the VI module and its
codec DMA source always run at 8 kHz and 32 bits.

Use those for the VI module and the codec DMA source in its subgraph,
and keep the channel count, which follows the number of speakers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 436d33ea568e..97d8585a287b 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2084,12 +2084,41 @@ static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph
 	return audioreach_speaker_protection_send_static_cfg(graph, module, "VI");
 }
 
+static bool audioreach_sg_contains_sp_vi(const struct audioreach_sub_graph *sg)
+{
+	const struct audioreach_container *c;
+	const struct audioreach_module *m;
+
+	if (!sg)
+		return false;
+
+	list_for_each_entry(c, &sg->container_list, node)
+		list_for_each_entry(m, &c->modules_list, node)
+			if (m->module_id == MODULE_ID_SPEAKER_PROTECTION_VI)
+				return true;
+
+	return false;
+}
+
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
 				const struct audioreach_module_config *cfg)
 {
+	struct audioreach_module_config sp_vi_cfg;
 	int rc;
 
+	/* The VI module and its codec DMA source always run at 8 kHz, S32_LE */
+	if (module->module_id == MODULE_ID_SPEAKER_PROTECTION_VI ||
+	    (module->module_id == MODULE_ID_CODEC_DMA_SOURCE &&
+	     audioreach_sg_contains_sp_vi(module->container ?
+					  module->container->sub_graph : NULL))) {
+		sp_vi_cfg = *cfg;
+		sp_vi_cfg.sample_rate = 8000;
+		sp_vi_cfg.bit_width = 32;
+		sp_vi_cfg.bits_per_sample = 32;
+		cfg = &sp_vi_cfg;
+	}
+
 	switch (module->module_id) {
 	case MODULE_ID_DATA_LOGGING:
 		rc = audioreach_module_enable(graph, module, true);
-- 
2.53.0

