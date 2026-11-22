Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364103;
	b=AljKrvywC+4fLmeHzzFxYeoGprnBoCpRz8JRfoayY4NWGr0lK0D8oYlJglQ5A93necEM
	 zLw8LZd8Ia2gboYPWFdNCtpV3UZ+IG70I/bSRaS9IMMeSEvrHnvin4/BtjDho8WgnvcrR
	 XtFoI7RiNCHdkUNCfrMRGoY4BujbXIfq5dJyggoptsUQdcUMATNVGRf/H3HdiEI3veafx
	 tLdPBu0V6jxSW4F87mtgfB4aqE7Kn7jE3PQ6dD8opCVNRFHQiJ1dIg8pfcbcujXm0NyAA
	 ilYfqwMNHJZjyuNlTkimll0zHStgcKGCVErpN3Oqv/x9vz70MJsMPz5/H1/wF60rQFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VGMpmYFw4UfnxcucMFcKMjnTRYxX2/t+/qg0TbI8UdM=;
	b=HQxehPusGTI2YJfTotfW7L1wG2UQ1laYQ+lRZsXK9tSKtSHevI7MU4VC73hDQBMvgmsr
	 YDqs/DMCJ6R4QwwJAcFRWtXgSNvE8Yv0jzADjCGogbwepqukJ5PL8v39/NxirRBOWfRiD
	 ez0YiFosXcsvkqT+dg5091K+St5cqPQ5ldiFdTX0LYDUMKZrv09QFSIKjxD9bib18PGzv
	 n9nNc14BGqNycj0z6pQHVIIr6E7u8QuTK2w3h+QtuAYtkaxML5LewqsylZmFy5DWUHy9Q
	 JloBVFjc3X7ZpTxI7wrYlDV0+qqiDdpUIrp9+XMM72BR8dlXiRI4sCMZViCgdxKN66Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jAXM7EUN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hq+v6HYv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E2760A2636
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E2760A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jAXM7EUN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hq+v6HYv
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQ8Xt1854206
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VGMpmYFw4Uf
	nxcucMFcKMjnTRYxX2/t+/qg0TbI8UdM=; b=jAXM7EUNyUC/5RdkM1csfu0uccO
	vfu4XxecAxr1IPBRoSFxSC4vhkYqcfSOQG5dnxxX/zk8GJRj1xtY0q81lsCLnIgy
	DOFNLMPHR9P+tuHG2ure/uE4B6O3HeryilLtzuC70u0KL97ckH0Ts6o/MLh/BNl7
	OpaNO/HlCifutfgxIy5RFjV8BDdGq8HOMEC6qlQijqqlJLNz1a9qgOyTin++dqi2
	mg8qsm1MEPepFNWu7CzgCE+i7NV0TodujOub+TsgLJnfiR66bt2qfWqF7eE/FsJm
	XLpuXDI9ZKMQWJVU/f0B7yiZYGEIDeQOt4cFWwcuVkHqzV/jcHtDp0B+mfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv3yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a1f5e47so431799685a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364101; x=1795968901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGMpmYFw4UfnxcucMFcKMjnTRYxX2/t+/qg0TbI8UdM=;
        b=hq+v6HYvrjQsUFjhdcCvHn2X7bjLGv170fv7dD3/hHp8DsA+cJ1U3+LIMGvmEWdLNN
         P9ArtuDPceDVqK0ht99s+zz8avMJRaJ7ojnZyOSjal42jL7lTkhV2GcTC7UHrgJIx8uA
         idKxJI9wrRpTu7vOZ0DwBCfvk5Mv+Iwno72nQQ/I39SjJ86ycTZIOvXWGX9UBlLcB5Cw
         tS85XHmypTXBy2WbEHnHyJmW3Ndj9nSfqYz69MjupFkU8fydX1GvWT0fBoob0H/qFDVi
         cGP5fT4FLlxiwlPL3OSsHvVzsaCq9QdGQZAkOdLwVHn7GywEKXigciWuaP8VvtyUUepf
         Jgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364101; x=1795968901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VGMpmYFw4UfnxcucMFcKMjnTRYxX2/t+/qg0TbI8UdM=;
        b=J6pWcR+4epB0B7F8YHPbxdrFZcRPDvYW/NhCUkdn0rD3iK4zCb3E4srbplRciHRyX7
         SLlbZGpp6fLUFvTpCb95MwyCAQtDMF994Rdnybe2CRBu+2rXKnkTUxA/qs27uC0O10YN
         JjYT8y2E593HpV7gYNIuF9nObX2vQ3ArI3fkpPx73iH+vsd8IY1BNDGR8ofZf2xxbH2k
         k7CwrU3z7ew/Sdjd+y8aAxYaNMnfRaZlGRSzG+1v0AiPX0kuWWkY40Z20T03BLr5v4sg
         8FUJHr1k9NrqHkqINrdipAzsETLHHtuxCpjwPI6LF+5K75+3mrLO7OcdYNS1qH6JbEki
         UW3A==
X-Forwarded-Encrypted: i=1; AL+hErF3vtZTqvXzH5TpkWL8Trpz3/dcm8A80RsRoZl2Y9swLpAMezR+7NsI10QFww27KldiliFK7GWifWOcSG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rm3ptveNl0pmy/hREfAjTqYK2Ua42PRnmLlbMpc4t7FmRRtkp
	fEb0f6nqh9VaWFc+JIrPd+Ox9/0lmqmMRf5d3AOixfl4jDE5K4ndx+kNjQQLPtOfMNNdu12WfFm
	ssiqD1YtNw8asSvHFS3aIpGE5DBQynVhN0XEsbGjs/KCTw0+lir5eQl286iVwgUmHYF8=
X-Gm-Gg: AZFdTZeyTfajDOHG2HFifCDA4t8CbmBRp1oGszRdDoNJdpwkr/Qx+Utrx41bQEK4NEG
	8HHJSM6XBtkRIFfCfP0+p4WCP73+rwgTxZeFTYZE88rk5EbNzpKWs/nSocXyweiBFKmk/7wsByi
	6cI3rsXU5tA3tfr+4ojI8SZFWpxDoztJAARy1cNPpySDvnzOBCO1Ge8AdOfg98btQTejiWM/7Ft
	rPz+0xF3v6KbOzQE9CMD/xeI1U2RxoIWMjAbv8dui0nisMc0+d2qP/71l9SheDS9fCeMVYMwSrY
	GRBNYfKWXSAIsLkNSegK6iu6L3kbTvu85Faiw8o8gPrOaEaWvTcZG9/xK9yDfJVfyQjVVFdyyA4
	Paxgpf5ukIe+Au205uKKZB1akMA5YpMMVY/7LbBNhI41asNuEZQqJKUMCld/VIAUL
X-Received: by 2002:a05:620a:f10:b0:949:5ee9:ab27 with SMTP id af79cd13be357-949bab4dee9mr1480046985a.83.1795364101196;
        Sun, 22 Nov 2026 08:15:01 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:949:5ee9:ab27 with SMTP id af79cd13be357-949bab4dee9mr1480041785a.83.1795364100743;
        Sun, 22 Nov 2026 08:15:00 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:00 -0800 (PST)
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
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 07/24] ASoC: codecs: wsa883x: add VI sense capture DAI
Date: Sun, 22 Nov 2026 16:14:20 +0000
Message-ID: <20261122161437.5994-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXwGU9GZKsvNZ6
 Wk8RoZKk8KGKIfs6Gf4d3+5cp7QxzodFoOjOpsQEFIiblxjbTsNzjlFGehplYKVaQSRFXJ9H1QL
 p6VCGL/JMixaLF6Myiooq93uvpkyFrdQfwdTuNjXvWCRGa9YY3QGOxwd7wiKMKokj1rndHZRqFC
 3GK4g5tKz9+bdW+N+6C933d09gPyyj+P6cVnPQ3DrbZXE/OsufCVx53oiE53S/5RRR81MXCBMYD
 QG25JLly5MKML8dTxKaL8v/NyVwJ64ARg4sf8N+dGTfyk27zjCxABcWVlroIeX4Mj2rsjPnKgrf
 zWebWZoPLMxzMLpZIN+GcgDY0FDV3sYAGJ17FviGHkoWfrlk8oVQ8blxuS8hHfwQ0p0n4gKPYE3
 sH7IQfXq7VqlXiAtexAAqmvRer9sZ8TZY6/qfkkCPXA70uGwQOx5ErkfL4/Zt60L6GiTjaKKvy+
 71qhgFTUqj8+bltwjsA==
X-Proofpoint-ORIG-GUID: N2cySoycv0u1-brGgduP_VAXzVQHAwMT
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b031505 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=oWCxSNl6vTUgLWVSTv0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxM/zTcY2mLC/
 Fj9sFOHJYs2XEH0rWGgd4i/b9rQi39lmK6xuYC9561Z99TR7fz2WvSIPpjYPr5EUzHE6ZrSCize
 6rEi1lq9FJKAfJ9fomugSR4sRpmgn3c=
X-Proofpoint-GUID: N2cySoycv0u1-brGgduP_VAXzVQHAwMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker's VISENSE port carries the voltage and current sense data
the ADSP speaker protection VI module needs, but it was described as
a sink port alongside the playback ports and had no DAI, so nothing
could capture from it.

Move VISENSE into the source port mask with its own dpn property,
give it a capture DAI with its own ops and stream runtime, and skip
it when wsa883x_hw_params() builds the playback port list so the two
streams are configured independently.

Each VISENSE frame word carries the voltage sense in its low half
and the current sense in its high half, so this is a two channel
port; a single channel mask would deliver only half the pair to the
DSP. Matches what Qualcomm's own driver uses for both wsa883x and
wsa884x.

Also install a bus_config handler that programs SCP_HOST_CLK_DIV2 on
the next-bank slot: wsa883x needs this to agree with the controller
on the bus clock divider once a VI stream is enabled.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 77 +++++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 64391d654a08..6de669288d6a 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -437,6 +437,8 @@
 #define WSA883X_VERSION_1_0 0
 #define WSA883X_VERSION_1_1 1
 
+#define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m)	(0xE0 + 0x10 * (m))
+
 #define WSA883X_MAX_SWR_PORTS   4
 #define WSA883X_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
@@ -468,8 +470,11 @@ struct wsa883x_priv {
 	struct regulator *vdd;
 	struct sdw_slave *slave;
 	struct sdw_stream_config sconfig;
+	struct sdw_stream_config vi_sconfig;
 	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *vi_sruntime;
 	struct sdw_port_config port_config[WSA883X_MAX_SWR_PORTS];
+	struct sdw_port_config vi_port_config;
 	struct gpio_desc *sd_n;
 	struct reset_control *sd_reset;
 	bool port_prepared[WSA883X_MAX_SWR_PORTS];
@@ -522,7 +527,7 @@ enum {
 static const struct soc_enum wsa_dev_mode_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(wsa_dev_mode_text), wsa_dev_mode_text);
 
-/* 4 ports */
+/* 3 sink ports, VISENSE is a source port */
 static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
 	[WSA883X_PORT_DAC] = {
 		.num = WSA883X_PORT_DAC + 1,
@@ -548,14 +553,17 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA883X_PORT_VISENSE] = {
+};
+
+static struct sdw_dpn_prop wsa_src_dpn_prop[] = {
+	{
 		.num = WSA883X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 2,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}
+	},
 };
 
 static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
@@ -1125,8 +1133,16 @@ static int wsa883x_port_prep(struct sdw_slave *slave,
 	return 0;
 }
 
+static int wsa883x_bus_config(struct sdw_slave *slave,
+			      struct sdw_bus_params *params)
+{
+	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank), 0x01);
+	return 0;
+}
+
 static const struct sdw_slave_ops wsa883x_slave_ops = {
 	.update_status = wsa883x_update_status,
+	.bus_config = wsa883x_bus_config,
 	.port_prep = wsa883x_port_prep,
 };
 
@@ -1335,6 +1351,25 @@ static const struct snd_soc_component_driver wsa883x_component_drv = {
 	.num_dapm_routes = ARRAY_SIZE(wsa883x_audio_map),
 };
 
+static int wsa883x_vi_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct wsa883x_priv *wsa883x = dev_get_drvdata(dai->dev);
+
+	wsa883x->vi_port_config = wsa883x_pconfig[WSA883X_PORT_VISENSE];
+	wsa883x->vi_sconfig.frame_rate = params_rate(params);
+	/* VISENSE carries the V and I sense pair */
+	wsa883x->vi_sconfig.ch_count = 2;
+	wsa883x->vi_sconfig.bps = 1;
+	wsa883x->vi_sconfig.type = SDW_STREAM_PDM;
+	wsa883x->vi_sconfig.direction = SDW_DATA_DIR_TX;
+
+	return sdw_stream_add_slave(wsa883x->slave, &wsa883x->vi_sconfig,
+				    &wsa883x->vi_port_config, 1,
+				    wsa883x->vi_sruntime);
+}
+
 static int wsa883x_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
@@ -1344,6 +1379,9 @@ static int wsa883x_hw_params(struct snd_pcm_substream *substream,
 
 	wsa883x->active_ports = 0;
 	for (i = 0; i < WSA883X_MAX_SWR_PORTS; i++) {
+		/* VISENSE is driven by the separate VI capture DAI */
+		if (i == WSA883X_PORT_VISENSE)
+			continue;
 		if (!wsa883x->port_enable[i])
 			continue;
 
@@ -1363,7 +1401,10 @@ static int wsa883x_hw_free(struct snd_pcm_substream *substream,
 {
 	struct wsa883x_priv *wsa883x = dev_get_drvdata(dai->dev);
 
-	sdw_stream_remove_slave(wsa883x->slave, wsa883x->sruntime);
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		sdw_stream_remove_slave(wsa883x->slave, wsa883x->vi_sruntime);
+	else
+		sdw_stream_remove_slave(wsa883x->slave, wsa883x->sruntime);
 
 	return 0;
 }
@@ -1373,7 +1414,10 @@ static int wsa883x_set_sdw_stream(struct snd_soc_dai *dai,
 {
 	struct wsa883x_priv *wsa883x = dev_get_drvdata(dai->dev);
 
-	wsa883x->sruntime = stream;
+	if (direction == SNDRV_PCM_STREAM_CAPTURE)
+		wsa883x->vi_sruntime = stream;
+	else
+		wsa883x->sruntime = stream;
 
 	return 0;
 }
@@ -1401,6 +1445,12 @@ static int wsa883x_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops wsa883x_vi_dai_ops = {
+	.hw_params = wsa883x_vi_hw_params,
+	.hw_free = wsa883x_hw_free,
+	.set_stream = wsa883x_set_sdw_stream,
+};
+
 static const struct snd_soc_dai_ops wsa883x_dai_ops = {
 	.hw_params = wsa883x_hw_params,
 	.hw_free = wsa883x_hw_free,
@@ -1423,6 +1473,19 @@ static struct snd_soc_dai_driver wsa883x_dais[] = {
 		},
 		.ops = &wsa883x_dai_ops,
 	},
+	{
+		.name = "VI",
+		.capture = {
+			.stream_name = "VI Capture",
+			.rates = WSA883X_RATES | WSA883X_FRAC_RATES,
+			.formats = WSA883X_FORMATS,
+			.rate_min = 8000,
+			.rate_max = 352800,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &wsa883x_vi_dai_ops,
+	},
 };
 
 static int wsa883x_get_temp(struct wsa883x_priv *wsa883x, long *temp)
@@ -1636,9 +1699,11 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 					WSA883X_MAX_SWR_PORTS))
 		dev_dbg(dev, "Static Port mapping not specified\n");
 
-	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS - 1, 0);
+	pdev->prop.sink_ports = GENMASK(WSA883X_PORT_BOOST, 0);
+	pdev->prop.source_ports = BIT(WSA883X_PORT_VISENSE);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
+	pdev->prop.src_dpn_prop = wsa_src_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 
 	wsa883x_reset_deassert(wsa883x);
-- 
2.53.0

