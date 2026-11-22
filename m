Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364105;
	b=cx+mc9VAC6Fh6GhAHEpjgdvAsx+rprgSb3KyfvbVmEUHrHJGlLV7QWymDc5HOUbbqlUc
	 X75gR9HzRt/At5YwM5lD1673NNO2yjkV9kYj4gD3qfDunlv4qZDYw1t/iUA27Jz4utXBo
	 XzaHfQ0JiJEoIEFeaEbhKBgQr3QnHFaP3KZy19NHSYkDIoTTjEKvKyAedlC6gFlp+97ME
	 34DG4P6jTNRf8id3vE7hIf0L/lcN6tUws+RthHWF2+YSbtHIFnpn7zjMETk2vWD0Vi0ng
	 49PBadxBJ7YofzdMCrBUTs/q5Veqeo5fKb9pj+v1eQHnb9kLYuX4Ji9PzNxAyMzZ9yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LNvBP6gZDP/q+H/JUPc6WwtfV2r/pDb45V46M987ptY=;
	b=uxMayjo9so8SmqL8gd+0lyXKdNuFIE0RCnaIa/9tYrDLEP53Dpetk4ygqO+jdAH5jL2K
	 FSUrwm9RoEL+hYsaY5aJGbhN5JHdLLIqAX/38xKpYFfl9BgLZhPuqMTcDFFWV0/mE3abp
	 OMluArcaRraGT2DpQR2Sig6UdhcMmg0Gi3vUf7+s3lvKIZ+9hT8/4ETkv8Ft9yGCKrNtU
	 vQOkCMv9OenI0HYz5XVpb+nbc9SrxvBt+zJwadIY/ymhaFcbEDD8uFzmxXiX66T7q0zvG
	 pN1VwZrNbB+ihZChcmK0RY1VrpiSjtQBv9XNCiq0qQqq0e1gLvYZ0xjMV/J305tXv3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OfMlJFkR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRiAHPCm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0960A3809
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD0960A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OfMlJFkR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRiAHPCm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQFiu3382271
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LNvBP6gZDP/
	q+H/JUPc6WwtfV2r/pDb45V46M987ptY=; b=OfMlJFkRoP+8+n/IgP95ooERg/J
	2HpfIrWwaFRBa6Ddaiz9XfOxmzEU8CMc6iBwLF7P7aVwP3SeByiiNNY1an233QbY
	UaDIsQ5+dllISnUucOfeGiuwKTaFXq2tKCsj8kYkUCOMzYOzk5iOzppz3MFkYHF+
	Ik6/8trOx/CMvKoqxeU2Vvl++23RIGTuMGBf75G2waJOaCFxFa5WfrhKj/IfnjUm
	pmK+Nq3ZyYQrjzMOaMlEcjZl5m2iCYQ3YsZXCwMnXMwLNHX4eeYqZ2KYaliOsAfo
	cmmMrxMawjqMOb3kBYcoRd9yx9i5nm+8Qk1BoKIDrNrsfdbFpQaSuPriq5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d3232fso393538185a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364103; x=1795968903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNvBP6gZDP/q+H/JUPc6WwtfV2r/pDb45V46M987ptY=;
        b=VRiAHPCmKHr9NLmXgnhF/3YRuSASuDxuO7INP0oKIZsORmpFVEUtxXKhqORSwiu/M1
         yAWqSm6DtdIWxgWxBZsXFRgxPvuOSk7zByidxaSQxGLfDlPXi+UmHwHSvfc1jGbBwt4q
         Ai33/5nV5Q6M9WrvWPIAXku98+eWhSHsoHMTs7w/IpPTUrLt5zigfu0cWmct4M37Zms6
         dwSZbO6JXWRQexKgGtCv3fuRYbM4vJAbnZbR+AuR/5cowzXUX7bRtHL8XTMRkBJPW3GX
         YmDV48nMz+eZcY2K+Tcedk1TNlCzr7pMVpjLLRo1vzdrYq6pFTYH0kEBWwoIStEKUion
         bDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364103; x=1795968903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNvBP6gZDP/q+H/JUPc6WwtfV2r/pDb45V46M987ptY=;
        b=J/H0LvvCzP2V+ANf8RTiJacwOqZ+k0VYC8KRmY4SkFnJeryjaAQ3ywJenU9Yv2F/ZS
         yWtqBsbEmvIa9dGppsSrs0uS2koYlVRRi/nQtfxh/UbkXauYwlXFslzNyp8Cere0g0Hg
         zXfAjKpiBbHCEH2rF/Aov17rbOrUK/eO/3W908GNk/7lwTm9WPZzfJtJVzn/yo2IRVTy
         d73sGoD6gaQvJDvvcF9vJSTegrJk9uE6khQsEF2Wg6bdn4kXJqfPv6oVh293vRyYt3xx
         9nfkVjXy4Tv2NvZ6IUuTVgRCryQiLfuoN9kX4SALKnphpGxJOr6Gxbzwna2docA+QyX6
         Oj8A==
X-Forwarded-Encrypted: i=1; AL+hErGe3vfM40pTGwZ/C+UFuy83YOW1+yvHiqb2moO/tpz049h2JLEayNCvTo4RQPt/GrVnbd/csQz52uckee4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hRi7mEIo1fFM+PqzRPkQcNswb1f7r/5y5+yL7UuPkjqH6VnV0
	2cyMt2iytgs9SuJSGRDUp+zdcOPsCd3gX1CPf4jpLOFLescyJArDDxYLd+aSzFFdvWUpgehvSfp
	SshXqEw6YDdcl1HReuJcx2LpeIfscE+vgrkyfVUegKKU4GAFyGIBPlB8fwMM5Vyi5M5A=
X-Gm-Gg: AZFdTZdDxVlMg3m6+vUMcNJcta6Jr8nfzI0UgL27mqHPuKZ5U28cmGzjaR0OVSVcK1D
	Uo4UqHOxSYRADNkcKPjzwqhIWSHScn31J+ibgUK2nC1CJpP65ReQDEOAqav3LnR7xCWQFd9iKKQ
	VXEE8AB9b4frYtQQUzGi7+Eo79wTRyL+PAnO0OHTgFuIYf0G3UeTg4kDzLTi7H9oH/zDmqxXTQV
	HUqjH82fnNLZdBIWgZZj9zIZpvnQz1V+sCANd2xdM6FOAJARJppfNETPAPoUFJGJnjRhDPf4F9D
	wd1ybS65o/4eqm51Ctt925Yosb0Dz2xNuIKGSCbWRhmYRaCfW1T8oAYt1h94KXhZi/VpbcUP3rO
	IU5kQqb53TstVujQrxY5RQdNt94sQ+ni0zfm8jLxJy3sasiqVym2ybh5wQGTkEfBp
X-Received: by 2002:a05:620a:7087:b0:93f:633b:ee1f with SMTP id af79cd13be357-949ba9c6b95mr1649011285a.28.1795364102707;
        Sun, 22 Nov 2026 08:15:02 -0800 (PST)
X-Received: by 2002:a05:620a:7087:b0:93f:633b:ee1f with SMTP id af79cd13be357-949ba9c6b95mr1649005285a.28.1795364102165;
        Sun, 22 Nov 2026 08:15:02 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:01 -0800 (PST)
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
Subject: [PATCH v2 08/24] ASoC: codecs: wsa884x: register the die temperature as a thermal zone
Date: Sun, 22 Nov 2026 16:14:21 +0000
Message-ID: <20261122161437.5994-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b031507 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=51jdShTR6rvD-JhUMxgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX1VKXmUpFYmRu
 lMNppFshz/OTDftXlWy69TN/CS0WeCQageFM1Di3WUWr6sKfMC5RxO4HlEQjdMT10J6pzy2tpqC
 JmnyqlX4Wsz1RZY8kca/e8UMOQ+OV6s=
X-Proofpoint-GUID: moe0pqw6S6-vsSZvvT1jXieZtTkAOPtc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXwkM7+AslNCxp
 EdoU+ug2MTtqpRJiSglU1XRU1tFFtVUuFiWhhJupJSbBMCcy1tpsUjjvALhhIl7tGSPHtDE/qgO
 Rr94IASmtazFCWtChRflfcrbu6RohFmHW2BajrWpEbwrwwvSxPStFv6f/7WHRodQNF7uONOm7Bh
 rRgrpcxfYa4rlr2ArGz+QyDG3i/C/oETB4b3ijy0ABSRApTtpSVs9awg86TxlgJDcy+id2gOuqO
 +S4/W8D8bzk7fpzNQtBDhrt7w8a7z7bvxGFR+VlMJVQAjx1xHJSzyLzDRth8xsoXNPHMO0jGfHT
 IJwAA9U3SfXQPxrVt2lOwuInjC3bvoAgpBQ0YeDuoFKZbQgk7VBkZXbBJlpp7i0BF/n2DisXzQQ
 YMNxwxSDwIIXRG3JfifNHarGGUiGqNOWoetX3qGq8vjVxo5OaBOfbSqaHTc6yDGgeJYnXtovdM3
 PM1zEkmx5AvKZaze6tw==
X-Proofpoint-ORIG-GUID: moe0pqw6S6-vsSZvvT1jXieZtTkAOPtc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Speaker protection pairs each speaker's calibrated resistance with the
amplifier die temperature (T0) at the time, but an in-kernel user has
no way to read that temperature.

Register a tripless thermal zone over the existing temperature read,
named "wsa-<bus id>-<unique id>" so a user holding the codec's device
can find it with thermal_zone_get_zone_by_name(). Until the codec is
initialised, and while the PA is on with nothing cached yet, return
-EAGAIN to hwmon and no valid temperature to the thermal zone, instead
of a plausible looking zero. -EAGAIN would make the thermal core re-read
the zone every 250 ms and keep the codec awake.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 70 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 91aa004d7137..e56c848cbfce 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -23,6 +23,7 @@
 #include <linux/soundwire/sdw_type.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <linux/thermal.h>
 #include <sound/soc-dapm.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
@@ -1935,8 +1936,10 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 	if (wsa884x->pa_on) {
 		/*
 		 * Reading temperature is possible only when Power Amplifier is
-		 * off. Report last cached data.
+		 * off. Report last cached data if we have one, -EAGAIN otherwise.
 		 */
+		if (!wsa884x->temperature)
+			return -EAGAIN;
 		*temp = wsa884x->temperature * 1000;
 		return 0;
 	}
@@ -2058,6 +2061,42 @@ static const struct hwmon_chip_info wsa884x_hwmon_chip_info = {
 	.info	= wsa884x_hwmon_info,
 };
 
+static int wsa884x_tz_get_temp(struct thermal_zone_device *tz, int *temp_mdeg)
+{
+	struct wsa884x_priv *wsa884x = thermal_zone_device_priv(tz);
+	long mdeg;
+	int ret;
+
+	/*
+	 * OTP trims read back as zero until the codec is initialised. Report
+	 * no reading rather than -EAGAIN, which makes the core poll the zone.
+	 */
+	if (!wsa884x->hw_init) {
+		*temp_mdeg = THERMAL_TEMP_INVALID;
+		return 0;
+	}
+
+	ret = wsa884x_get_temp(wsa884x, &mdeg);
+	if (ret == -EAGAIN) {
+		*temp_mdeg = THERMAL_TEMP_INVALID;
+		return 0;
+	}
+	if (ret)
+		return ret;
+
+	*temp_mdeg = (int)mdeg;
+	return 0;
+}
+
+static const struct thermal_zone_device_ops wsa884x_tz_ops = {
+	.get_temp = wsa884x_tz_get_temp,
+};
+
+static void wsa884x_tz_unregister(void *data)
+{
+	thermal_zone_device_unregister(data);
+}
+
 static void wsa884x_reset_powerdown(void *data)
 {
 	struct wsa884x_priv *wsa884x = data;
@@ -2194,6 +2233,35 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return ret;
 
+	if (IS_REACHABLE(CONFIG_THERMAL)) {
+		char tz_name[THERMAL_NAME_LENGTH];
+		struct thermal_zone_device *tz;
+
+		/*
+		 * Register after runtime PM is enabled, as the zone is read
+		 * right away. dev_name() is too long for a zone name.
+		 */
+		scnprintf(tz_name, sizeof(tz_name), "wsa-%d-%u",
+			  pdev->bus->id, pdev->id.unique_id);
+		tz = thermal_tripless_zone_device_register(tz_name,
+							   wsa884x,
+							   &wsa884x_tz_ops,
+							   NULL);
+		if (IS_ERR(tz)) {
+			dev_warn(dev,
+				 "thermal zone '%s' registration failed (%ld); SP T0 kcontrol will read 0 for this codec\n",
+				 tz_name, PTR_ERR(tz));
+		} else {
+			ret = devm_add_action_or_reset(dev,
+						       wsa884x_tz_unregister,
+						       tz);
+			if (ret)
+				return ret;
+
+			thermal_zone_device_enable(tz);
+		}
+	}
+
 	return devm_snd_soc_register_component(dev,
 					       &wsa884x_component_drv,
 					       wsa884x_dais,
-- 
2.53.0

