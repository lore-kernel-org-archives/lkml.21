Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364124;
	b=cmfiUU0+mGe4bHMAw42zSNb2+iVaTu4jL8MZ8rTKDIyGn7twcK2iCCG4nXfttQ9cNF+3
	 u9n2zbtb4Gpx2zYI4GQfExJPXRQxP22gr8XkWPsmSJkNBXT7KXW/gEGSTQlqv20ELUqc2
	 MNlFyUXVdNp+vwI/A2w9zxiybuKkFrfXTBz5aYuaFmBRiiRw4sq9wz7rwHSPm4fCmbONE
	 LSwld75QIpBNtWrWCZp2YTa86TO1OwuNTHTRJGBK+6HusB8o+ScUrJrh6BcjJHeCBbf3w
	 VeChWdZKUJgocU3YxjSmFL/22QgwzrQbkJ6RBKEM2jZaWWXVcnrqps2i4By3P5N47YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wgX1SDVgjT+JuUO2+RmGmUy8lTeZXxevsdaO3KUTgRQ=;
	b=LsmAHkBiLFTcPNBtM86zc4LnxJg87qEXDiarGBh1UwcUDRje5ep+J3R+6cogZ0vZApWN
	 obUbOQ1fFqvLB8iq8vJ8hxskN5FH/6l0lUSfKPdmE/5lOO1s3nLd2cpMWoRkGOlwlzn5e
	 k2fPSIcjdHulNsF77d2SQozcxtJSkQ2Zb+XNbbFNIB1H2eaqyp462dna5jbCDnDzeO+xZ
	 Jb0beYfSDvgxOb2UVyW9tCLxMen7jyqZPqBUcLtju/O/8fdHuXUIkAoGBxqjNVLhC052W
	 PuzAW90q4Gs/wzdoRXmp/r/GL2BNUdJPWanouqgJ2rYA3MvaMCvHWtmOUUfXItwRbjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e5FllKDR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Blm1qv8g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044DC606DA00
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 044DC606DA00
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e5FllKDR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Blm1qv8g
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQFjS3382271
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wgX1SDVgjT+
	JuUO2+RmGmUy8lTeZXxevsdaO3KUTgRQ=; b=e5FllKDRh9NXn6q0XQCwIuN8PWV
	fPdccPI43ldZ5vvSs2zXxfzLttSwLndRyw3JJERT6uBmHVNTKZIofj2lsOruFM0q
	oRd8dj7TtATwpvn7pQwMWzDlufbjKzB+z0lB6Vh7X/kUNZ0RLNhuGazOxVKhdblZ
	ypt/adxxFtKrAe0WlDXO53UacH5Ow5nUnRSV9ZoxPHhPnKLc1pAT3WjgtKxGBi5l
	Qf5+xpVPzNFWO9cKpXjZDOTVqaizUsK46CmxW0LNH91latgSBFPnRF9IpO8PH/CM
	lMNjqh8ql80tLqA4W+3Sb9NOZUhPLZW6cP18JeqGgn/ceEC8qoRh8Ifq+6w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so473129485a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364122; x=1795968922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgX1SDVgjT+JuUO2+RmGmUy8lTeZXxevsdaO3KUTgRQ=;
        b=Blm1qv8gFYAPhTPUUGnqyYb0UaB9xTTs668mtHHON9gl9be+YpvDWn40lQjZLh5fJk
         XcTMD3v7I7VsZZZHaP/l2RM2mKrLrI65CyTwcfQGxOPX0nGk6lzFYOZdd8CzridqdH4T
         I5t1bIU9GsGzE2kTws8hKYuQIfwol9qrLKIn5f/Wn3fkpfbiEk9DITzwK8yWXcGwDMxA
         6YdTtzLHD4/FerRF+u3byUIKx536Fh4+s/0JrbXnK1tUp/hSUwXhRBs80+Bsg7+DX692
         rULKj6p42hBD3dHjQfNr5NYW4dTfVDJKixKWvGijsF7suv2YRlpwRSDc0QvuIz/aBXri
         Nm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364122; x=1795968922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgX1SDVgjT+JuUO2+RmGmUy8lTeZXxevsdaO3KUTgRQ=;
        b=Nx1uq8nBiUnG8g9srEKO/5Obp6kkcxiLMG5PyoScG53dWSWsHQfDGjUg8hc10W4AAO
         eL7ijU/umgUSwklO0sHREr6dc78ihr7tqumA8+qIeHwtS41iPymSsHYhh1mV+0lfXSUr
         R6ahIh5MITsYmiik53n1H+4wfsQd8hddEmwrmHk8qDy+6gZUJUQOJ+4DYMZhKQLd7sZM
         d9fHtSljEso3tVrroI7m7YpdAqEAZVJO73yazl6Hm/gIfTwrii9WMWbHodidazkIUy+1
         VyvdorPfZBbVp9fFa82zGagY9DLPC//AdiXHZlLoKkiaRPI5+7Tm3bFdrjyb9DDSaJbk
         ESMA==
X-Forwarded-Encrypted: i=1; AL+hErHGF6AeL8o/cWoXEElT5g96/6vVScIqpNXrQWszMlnoC/FUY7H0j1btOExuEvDmp4wamPmGYxnvcdijcIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mC04JxdYu4XZE19xu844qfjHXT+NovYoBD1WmPWiM4oC3BMjm
	awcVl1fobyfNa/wu9UQu6vgkRJ1qb+ZC2Pz/sKJQ6gxIfLXUddQjmsirUeZ1P4rj5sDcDX9xxjZ
	dAD7XPwTup2LjLzFZkFQa9ieJhA8oUaD+/uSnjKs4Uy+v0u0voTkRdJLGB1Gnb6/psi0=
X-Gm-Gg: AZFdTZe/iwUMnNNzX19/E4VKMvTRpGTo3gH51MDDkyulCBsrFVlybf9nEIJG/RKCXRS
	nJkara6wbGmCv8Cxh4HJd/gymodTbte1v553AdQpwZA4RGmJfUFfHh3YovWq51ISnfAqzRbSTRN
	RncXEFEqRcaEi0LLRZPa4WTL6mDEXAWVM39+EzGQlrd1e1Nk8cjwhtwtL6aahuboBpEPq/QgdcF
	ssl1snYXby71nuw9DrBUvhtxQDBo1n+uH0iJ2ERgy9lldy6OuDLq20UUK1PYTpsCw5pHpb1juR2
	94Ht8XeMVVfK7rNiA2pscEetGv74UOBSADRBeBxBmT7m6SU6QsCdy913cPjppP4htxiJOOzz4TW
	GnhW9mGMwjeudmbBhLde75ASTWqPIf6cUWe27klSVzHRwk9RelwHFyxMYpnI5Zr9r
X-Received: by 2002:a05:620a:4004:b0:949:7920:9d06 with SMTP id af79cd13be357-949bab0e640mr1530296385a.68.1795364121814;
        Sun, 22 Nov 2026 08:15:21 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:949:7920:9d06 with SMTP id af79cd13be357-949bab0e640mr1530291085a.68.1795364121358;
        Sun, 22 Nov 2026 08:15:21 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:20 -0800 (PST)
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
Subject: [PATCH v2 21/24] ASoC: qcom: x1e80100: register WSA speaker thermal zones for speaker protection
Date: Sun, 22 Nov 2026 16:14:34 +0000
Message-ID: <20261122161437.5994-22-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03151a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OvuEwESikzyZ2nAUfTIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX32dxVYT8slXn
 dVVw8zy2FqI+d+WfgGBYqX5FQnUdswOmxP+7JOfECsrE7swsTz7o0uxSt9M9wfR0X49cpKpMv+d
 6eAUB83vNiEhxqyUVRFQ+/R0sKWDsTc=
X-Proofpoint-GUID: wVeUrtHCbXbkGa8SrusVM2DSDOYuxxSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX8am0LQ2RsBmE
 ACvsIdRRsppdYiEbjQtgeu2T17K5hVwhD5EVFhyilFelVgrNJAAXndfo+uiofI3dgydlWQBp3mN
 DJUj3ue9SvmYGKbhjQaWRCsz3FPsjbX5fwS18rg0ylkN3uIAl8UKJPQ5kzQAwDoT1CUsf6nCins
 hiGbsmlcj1UB6/Wuck8mty2f2DuOCpnjmtKeKgORSt/l2acP5/Vuzt8dLVl8KZp4KEelWMG/fcH
 uunRgjOpO9SQskQZaBLugzYtZHVdUrx3jQLZqOdRmiqR2qpfiT0bGvND4WeYFTdUQ4St2lKjUPN
 XsZ+ccKVwZNlKYBRhayh/nRShpuhpU+s1H1sR8wEFb2pjXnG1roMKjHUq+V+yrTLO5kId2bs54a
 kylXXmY5COLw44WoBgPwgSAQ4/uY6CYCgmWIxxexTXhe7ajpItlqTpNM4C0fHQM+xOI9b8UGXD2
 soFCNkLPH3ke+Sw6ulg==
X-Proofpoint-ORIG-GUID: wVeUrtHCbXbkGa8SrusVM2DSDOYuxxSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Look up the thermal zone of each WSA884x VI DAI on the WSA Playback
link, in DT order, and register them with
audioreach_sp_register_speaker_map() for the "Speaker Protection T0"
control. A missing zone is logged and leaves its slot reading 0. The
map is cleared when the link is torn down.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 3262fa39ceb9..9401d4702432 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -5,6 +5,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/thermal.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/jack.h>
@@ -12,6 +13,7 @@
 #include <sound/soc-dapm.h>
 
 #include "common.h"
+#include "qdsp6/audioreach.h"
 #include "qdsp6/q6afe.h"
 #include "qdsp6/q6dsp-common.h"
 #include "sdw.h"
@@ -24,6 +26,49 @@ struct x1e80100_snd_data {
 	bool jack_setup;
 };
 
+/*
+ * Register the thermal zones of the link's wsa884x VI DAIs, in DT order,
+ * which is the VI channel order.
+ */
+static void x1e80100_register_sp_speakers(struct snd_soc_pcm_runtime *rtd)
+{
+	struct thermal_zone_device *tzs[MAX_SP_VI_SPEAKERS];
+	struct snd_soc_dai *codec_dai;
+	unsigned int num = 0;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		struct snd_soc_component *component = codec_dai->component;
+		struct thermal_zone_device *tz;
+		struct sdw_slave *slave;
+		char tz_name[THERMAL_NAME_LENGTH];
+
+		if (strcmp(codec_dai->name, "VI"))
+			continue;
+		if (!component || !component->dev)
+			continue;
+		if (num >= ARRAY_SIZE(tzs))
+			break;
+
+		/* The name wsa884x registers its thermal zone under */
+		slave = dev_to_sdw_dev(component->dev);
+		scnprintf(tz_name, sizeof(tz_name), "wsa-%d-%u",
+			  slave->bus->id, slave->id.unique_id);
+		tz = thermal_zone_get_zone_by_name(tz_name);
+		if (IS_ERR(tz)) {
+			dev_warn(rtd->dev,
+				 "no thermal zone '%s' for %s (%ld); SP T0 kcontrol will read 0 for this slot\n",
+				 tz_name, dev_name(component->dev),
+				 PTR_ERR(tz));
+			tz = NULL;
+		}
+		tzs[num++] = tz;
+	}
+
+	/* Also drops the zones of a previous bind when none are found */
+	audioreach_sp_register_speaker_map(tzs, num);
+}
+
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -34,6 +79,8 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
+		x1e80100_register_sp_speakers(rtd);
+		fallthrough;
 	case WSA_CODEC_DMA_RX_1:
 		/*
 		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
@@ -82,6 +129,9 @@ static void x1e80100_snd_exit(struct snd_soc_pcm_runtime *rtd)
 		break;
 	}
 
+	if (cpu_dai->id == WSA_CODEC_DMA_RX_0)
+		audioreach_sp_register_speaker_map(NULL, 0);
+
 	qcom_snd_headset_jack_cleanup(rtd);
 	data->jack_setup = false;
 }
-- 
2.53.0

