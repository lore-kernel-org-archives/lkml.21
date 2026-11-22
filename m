Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364098;
	b=2w2TzGcm7y2lNdb6vbwV4n475mTYu7LS+fBf4aPQdotedXUDKxfVnPnoPoGEmpZnuzSC
	 bx/Gp1l2OQnUEZV0Xz7fo0GOhEZLmCY9DIlfMMChZD3wzYexjBH4kUE4lVzFTVEzjC5PG
	 PaehWFcqrO07PywSGiopt3EynYNPQgpqqQMjsCxzksy0f7AYBI4X82ZLQ0zFyADHqPC6j
	 LMXbLI90kkK+RlAwZACyNwXxB2HSkJZ3q66wpOOcR4EtLtlxT+rd07VYWo3F/bRZSOct+
	 Wm8uviZGe7syibY/zkdlJ0VIi+k6kX60D73jpee73iAlS7Vg8KRT/2i08ayEVN/d3zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
	b=hbQXEFWfuliFsmQxHmi0BpBC0bjNZi472BVaJ7pVRk8Q4+RuYunVmklyfNwWb0a33w2F
	 k4theVHqpUM7hbTTNq0dX1ASzyvL+N1BWeESfoa3izlQ5bV7f2FA55YWPHmhDHKCqL0+3
	 iAUOldG4M7L7crkr87a30F42jtXENy0me3Yy6GmRnviwD1D0c9GhSVVLaHVA/BUt6gs5V
	 6qM1lHsWgYQlFjqhKDq9E7RQLDCfv297osNtuUUuWjADW+BklOWsdx/lVXMOlA2GBWlXm
	 1HC6WnVYP74ixsAmGDXYi9x6Brsxw6ATUd2F/eU0XyHN1QEyjzMnmbettp3fA2vvqgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIQMXipO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRppqu18;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991D5606A6A6
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 991D5606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIQMXipO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRppqu18
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQI8t1854875
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CK8GS13yu76
	IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=; b=iIQMXipOBXcfer219SBFft7VYCe
	+Id8znt7MekKPgySSZ14jJyWkBiB+MSVe3x2b4PRdilfmK0+IgS5NjQeW5WLHWM4
	pw94meLN0i77Ge0G5sD65LM/+PRC5zlPDZjQYpV/ymU8oCEdxkVPvSQ2JTZEZmNe
	6Qih8c4tpER5SUKDFs/Y6aL3PuRxPhhwuto9xMoKSfL4YtHZxTV2mG7r39/bUYQg
	cGsUXumqzR0vZrmPBgOfV/cKQP1Tgv0tofMnc7Fh0yX5TTSSgPtS9OJ8JT/A7GjM
	wNhcJSaiR9xZRL8aeB7DasFiPaZ2uyFgn5PkR0ztVroZzK3so6aN3+Hs/Sw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv3xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:14:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92114c39cadso50961266d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364096; x=1795968896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
        b=JRppqu18YH5PHHQEo+s0GZY99av/5p/zbgiMImgU1LvV2oR+Hqa5+9j4f/37ohGgwf
         4O0WchXPoebdpQBX+6wUBkl191k6O/Jwfp7RvYIk3e7u2fVqaTf94NKru8vrGm0ieawx
         Rz82+Nt4QedWm2GET/zWwZvkfLIxDDRAGQ9WOZyw9jHsz3LzL9EQ2Vmu+8g4YRsE+Dfa
         c+j2hRfuBbkJGQC+rBnpKpUy8DWplEg3bEbkg+AEJdCUIt3N7GL0TW3M7+mlbvBKbN4h
         FHBzC0ciL47GU9IgtXTfygXxkD6gl528ImhZbOvg0nhRIUsvOERzGtbDeLSV54DxFN/K
         bs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364096; x=1795968896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
        b=ZHQIp6+/kXq2dLeCEhAHcObjVIefg3hQxGereS/iR4sNXEna5Tfmaa6Q0Nsbxu32Gc
         JAI+Gq7kd5mjtiOz3c7cF4i+mR/tJkrvmWvLrzPw6cH250tWBOoBlZgvVMSIFZVPa5we
         6/X2QxP3ur9z7Zy+XCRjxcgUlYeTPc0wPlBde9nD0O22YSvcET7V/lmLvBj8UofQLf9b
         W+KVDfRl23bnrIVdzH5MvPvDFL1FQF1bQRZFJLzJEoTqHfrroqYI0+lwJaNh6aG35h30
         xMmg5JrsKT/PddoGEV1dgX3KTVSgqve/7mRUHlHhkB1hkejXD0TubAyvUpopKmArRpwk
         dX5Q==
X-Forwarded-Encrypted: i=1; AL+hErGsTRtrhALPBxN90mhVEfuRHT5nke3Eu6b0XRDInkII1hgP3rYWUIhSexB7oxSwnFTaXE1aIuAbQOpZD0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TPNtxkwsWGkPaR5JqCDa3BhzUHktg59pwe5+FL+rmQ7EItTUU
	IL2tUURckemvPGxVa5KMGFj6LgN5kkfzaOy/A01lAjK1LPBXbrJzsyDyFkefodV5D+3LfkBBEcF
	KZ0rutc/c+350eyKqN+HsKEyxYWi2jeqqfqYCn1kn1CPU7gnOJbT2wWpheHFW8x++AGM=
X-Gm-Gg: AZFdTZdD70HGFLNk0ZeO6z+Jbmc6lorFwNfx5kxzT4U4qwCXqP0lOcxpqmP7yTuXAp8
	OTI3yywBD6Xho3Nruz2FE+zQ8KixfDjWDcxdqeGF9hEQ+1y8vFYbz0kCDE+rmWGZqrzUD6B+LDy
	uEpbeYUCroMvW3yMElD9ZNaARMLMEHF8WRMPs193w/nBs9sewrJ6VE6xQX/Hddw9YPlc00qIDL4
	5L+KW/yJAPAH7J4J9AGWfqyC14BtwM6jY7kZ60EZxqfs+mB2NBdyqYsR7pLTAMRV6/bzNWuwDFj
	utQHL72UGaiOym/JnER6Vwe5BYh+DmFaF9TFugGVjnInVaPdv+gmRDEOMK8LRqIBl2o8nYYxqTT
	bxqXKGgzgEdsOzeToV9Xrtuhp9xf8WWoNaPJG7/yvnW/MUQLos/+yG9/SknVZKv5+
X-Received: by 2002:a05:620a:170c:b0:949:7502:696 with SMTP id af79cd13be357-949bab33006mr1738823785a.72.1795364095832;
        Sun, 22 Nov 2026 08:14:55 -0800 (PST)
X-Received: by 2002:a05:620a:170c:b0:949:7502:696 with SMTP id af79cd13be357-949bab33006mr1738820485a.72.1795364095325;
        Sun, 22 Nov 2026 08:14:55 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:54 -0800 (PST)
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
Subject: [PATCH v2 04/24] ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction links
Date: Sun, 22 Nov 2026 16:14:17 +0000
Message-ID: <20261122161437.5994-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXyPSkZzHE2nhL
 rUS3vUPQwlzLggFEV3M+2YDdOtkiQ6WxofgCaQc9BxYcOl54ixDIav2UZwIXkcPJD3N6ikl6+SC
 m5WaxWYKRZ+KyYZCriZMMQjr+4q80uGy6sTV1d+4ZnRIq9YRMYCREOlTWBMpT7lLPPysCFPvpAH
 rXSC9q0Ksdu4oNQuZyMO/SIHr8DI+VWgM3g0Y565pHUZoxV0LYiOcbORZeOFjzLXQUj453yjOgl
 WkOckix78Q5W5If/8IN52v6nJDni4T2VP+XnwNR8cqlhE+m8jvMDVVcpZDb0LGVaRl7Fosbmw0z
 ehj/CcmPqARrVCxhiNA/yYdxEzdJb4KL65tO9tw1uIKXBndLd1AbgzZ4+/oJHNMSLwkRrzt1fUy
 OUu10drV1UfDc0a24Gz+eB5zKnD7faypInIlWrD1/ROCbsj7xBM6fADDQ8tvehfQJBE8oaX+I3U
 V8EVpjWYljw+AplJYQQ==
X-Proofpoint-ORIG-GUID: 0QvcCzebqHe1At4m8bMPgvpIevh6PS3V
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b031500 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=NbmS5_GTq9OgXFR-vLoA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX9UNbwlmRmIYD
 BPRoUudqEYMgcUbBvB+L1rSWawX/ATnVE9TcDcoftLH5lU93EA+RliW/xqGKECQ1qhWGj5UR2sk
 ENQP7HEBZdWA1cRuJpBs2FiA0FSQq/Q=
X-Proofpoint-GUID: 0QvcCzebqHe1At4m8bMPgvpIevh6PS3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

A SoundWire BE link with multi_direction_codecs carries codec DAIs of
both directions, and each direction needs its own sdw_stream_runtime.

Split startup, prepare, hw_free and shutdown into per-direction helpers
and run them for both directions on such links. Stream runtime names
are suffixed with "-Playback" / "-Capture" to keep debug output
unambiguous. A small sdw_find_dir_stream() helper centralises the
"find the stream for this direction" lookup that was previously
open-coded in each callback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sdw.c | 225 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 171 insertions(+), 54 deletions(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..953a6eaae127 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -5,9 +5,55 @@
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 #include <sound/soc.h>
 #include "sdw.h"
 
+static struct sdw_stream_runtime *
+qcom_snd_sdw_alloc_stream(const char *cpu_name, int dir)
+{
+	const char *suffix = (dir == SNDRV_PCM_STREAM_PLAYBACK) ?
+			     "Playback" : "Capture";
+	struct sdw_stream_runtime *sr;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "%s-%s", cpu_name, suffix);
+	if (!name)
+		return NULL;
+
+	sr = sdw_alloc_stream(name, SDW_STREAM_PCM);
+	if (!sr) {
+		kfree(name);
+		return NULL;
+	}
+	return sr;
+}
+
+static void qcom_snd_sdw_release_stream(struct sdw_stream_runtime *sr)
+{
+	if (!sr)
+		return;
+	kfree(sr->name);
+	sdw_release_stream(sr);
+}
+
+static struct sdw_stream_runtime *
+sdw_find_dir_stream(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct snd_soc_dai *codec_dai;
+	struct sdw_stream_runtime *sr;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!snd_soc_dai_stream_valid(codec_dai, dir))
+			continue;
+		sr = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sr) && sr)
+			return sr;
+	}
+	return NULL;
+}
+
 static bool qcom_snd_is_sdw_dai(int id)
 {
 	switch (id) {
@@ -49,43 +95,42 @@ static bool qcom_snd_is_sdw_dai(int id)
 	return false;
 }
 
-/**
- * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
- * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
- *
- * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
- * Soundwire stream runtime to each codec DAI.
- *
- * The shutdown() callback should call sdw_release_stream() on the same
- * sdw_stream_runtime.
- *
- * Return: 0 or errno
+/*
+ * Allocate a stream runtime for one direction and set it on the codec DAIs
+ * of that direction.
  */
-int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
+static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd, int dir)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
+	const char *cpu_name = snd_soc_rtd_to_cpu(rtd, 0)->name;
 	struct sdw_stream_runtime *sruntime;
 	struct snd_soc_dai *codec_dai;
+	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret, i, j;
+	bool used = false;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (snd_soc_dai_stream_valid(codec_dai, dir)) {
+			used = true;
+			break;
+		}
+	}
+	if (!used)
 		return 0;
 
-	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
+	sruntime = qcom_snd_sdw_alloc_stream(cpu_name, dir);
 	if (!sruntime)
 		return -ENOMEM;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
-					     substream->stream);
+		if (!snd_soc_dai_stream_valid(codec_dai, dir))
+			continue;
+
+		ret = snd_soc_dai_set_stream(codec_dai, sruntime, dir);
 		if (ret < 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to set sdw stream on %s\n", codec_dai->name);
-			goto err_set_stream;
+			goto err;
 		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
 			continue;
 		}
 
@@ -93,59 +138,106 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 						  &rx_ch_cnt, rx_ch);
 		if (ret != 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to get codec chan map %s\n", codec_dai->name);
-			goto err_set_stream;
-		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
-			continue;
+			goto err;
 		}
 	}
 
-	switch (cpu_dai->id) {
+	switch (snd_soc_rtd_to_cpu(rtd, 0)->id) {
 	case RX_CODEC_DMA_RX_0:
 	case TX_CODEC_DMA_TX_3:
 		if (tx_ch_cnt || rx_ch_cnt) {
 			for_each_rtd_codec_dais(rtd, j, codec_dai) {
+				if (!snd_soc_dai_stream_valid(codec_dai, dir))
+					continue;
 				ret = snd_soc_dai_set_channel_map(codec_dai,
 								  tx_ch_cnt, tx_ch,
 								  rx_ch_cnt, rx_ch);
 				if (ret != 0 && ret != -ENOTSUPP)
-					goto err_set_stream;
+					goto err;
 			}
 		}
 	}
 
 	return 0;
-
-err_set_stream:
-	sdw_release_stream(sruntime);
-
+err:
+	qcom_snd_sdw_release_stream(sruntime);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
 
-int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
-			 bool *stream_prepared)
+/**
+ * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
+ * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
+ *
+ * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
+ * Soundwire stream runtime to each codec DAI.
+ *
+ * The shutdown() callback should call sdw_release_stream() on the same
+ * sdw_stream_runtime.
+ *
+ * Return: 0 or errno
+ */
+int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
 	int ret;
 
-
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (!sruntime)
-		return 0;
+	ret = qcom_snd_sdw_setup_dir(rtd, substream->stream);
+	if (ret)
+		return ret;
 
-	if (*stream_prepared)
+	/* Also set up the stream of the other direction on such links */
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_setup_dir(rtd, substream->stream ^ 1);
+		if (ret) {
+			qcom_snd_sdw_release_stream(
+				sdw_find_dir_stream(rtd, substream->stream));
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
+
+/* Prepare+enable the SDW stream for one direction. */
+static int qcom_snd_sdw_prepare_dir(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct sdw_stream_runtime *sruntime;
+	int ret;
+
+	sruntime = sdw_find_dir_stream(rtd, dir);
+	if (!sruntime)
 		return 0;
 
 	ret = sdw_prepare_stream(sruntime);
 	if (ret)
 		return ret;
 
+	ret = sdw_enable_stream(sruntime);
+	if (ret) {
+		sdw_deprepare_stream(sruntime);
+		return ret;
+	}
+	return 0;
+}
+
+int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
+			 bool *stream_prepared)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+		return 0;
+
+	if (*stream_prepared)
+		return 0;
+
 	/**
 	 * NOTE: there is a strict hw requirement about the ordering of port
 	 * enables and actual WSA881x PA enable. PA enable should only happen
@@ -153,15 +245,25 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 	 * accumulated resulting in Click/Pop Noise
 	 * PA enable/mute are handled as part of codec DAPM and digital mute.
 	 */
-
-	ret = sdw_enable_stream(sruntime);
-	if (ret) {
-		sdw_deprepare_stream(sruntime);
+	ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream);
+	if (ret)
 		return ret;
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream ^ 1);
+		if (ret) {
+			struct sdw_stream_runtime *sr =
+				sdw_find_dir_stream(rtd, substream->stream);
+			if (sr) {
+				sdw_disable_stream(sr);
+				sdw_deprepare_stream(sr);
+			}
+			return ret;
+		}
 	}
-	*stream_prepared  = true;
 
-	return ret;
+	*stream_prepared = true;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
 
@@ -187,9 +289,13 @@ EXPORT_SYMBOL_GPL(qcom_snd_sdw_get_stream);
 
 void qcom_snd_sdw_shutdown(struct snd_pcm_substream *substream)
 {
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+
+	qcom_snd_sdw_release_stream(sdw_find_dir_stream(rtd, substream->stream));
 
-	sdw_release_stream(sruntime);
+	if (rtd->dai_link->multi_direction_codecs)
+		qcom_snd_sdw_release_stream(
+			sdw_find_dir_stream(rtd, substream->stream ^ 1));
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);
 
@@ -197,18 +303,29 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream, bool *stream_prepa
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *sr;
 
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (sruntime && *stream_prepared) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		*stream_prepared = false;
+	if (!*stream_prepared)
+		return 0;
+
+	sr = sdw_find_dir_stream(rtd, substream->stream);
+	if (sr) {
+		sdw_disable_stream(sr);
+		sdw_deprepare_stream(sr);
+	}
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		sr = sdw_find_dir_stream(rtd, substream->stream ^ 1);
+		if (sr) {
+			sdw_disable_stream(sr);
+			sdw_deprepare_stream(sr);
+		}
 	}
 
+	*stream_prepared = false;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_free);
-- 
2.53.0

