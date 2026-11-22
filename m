Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372940;
	b=xLLjRQbxbdWrOiZuKaR3SRVqNw7gcgfGI6k7yZxUc4ZV+8Zl2m3FfRQTlx1txuZWvA9g
	 4gZVTETOQqlho3bEtThkgG2303n1sqTTqaxU2Qf0DVvi9oPKOPrnbUp/Qeb+rkyun0A9S
	 ovPjLOiK8Auw4GehNwU85RQvz1DW/c/EHyD0pYmY1QJF7fGCv6G762PSY7iszjNlABhLf
	 ixLHVNk9ZzK5CzMQnSclFH3gkVNZ6kyTvdmY6ewCgJWJDY0XGvo3zUxxJZDqwk22kYRyy
	 QtsSacOn8BzK1/xVs8k+y/FxQjcFr8iALmvEsj/PaYtjrIKk3e9xK6A48kE+ZwDO8fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=59CyyZ7KTp2r+Fk+eJiQnwlQ7yad7V4jdhwwbFVQh9k=;
	b=RQzNpe5OgbLDuL7AnGnU4LTGUyjYqS6smFELp/HpYpWmpvKUimIzqPqxmE4Hldh9Cqi8
	 ou0kXrUlJy8gUGG5o76eIBuQ4KDaIFlLlrnfzrrmKjCdQNeHzYQgpKuk4TfOmm9OSkWcV
	 h4nI/Cetf843jxk5nnX/bcoVzEmU7Akr6iSS5UV0xSo3gsydw6M5Jkjug/2qiECPmp32S
	 4mSj/CsiFKFzxvXaRqTqRC4KIxogS15hUiY4ze4rsih7wuKWADMBvJE/S2uPAR6JdfPp2
	 SADbeDeTI7ZFWhrPFaTex/4JB6zHrA/0QxvrkG6foKt6MXKWGX+uhH49G96kNS2u1jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kyC6nUmn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iBmilLJD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27666606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27666606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kyC6nUmn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iBmilLJD
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGV7Zj2242793
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	59CyyZ7KTp2r+Fk+eJiQnwlQ7yad7V4jdhwwbFVQh9k=; b=kyC6nUmnybneNqzv
	K54Zcxxc7XOXsABRpsavU6OriytFsZfBG34F9Hreu3zyqt+zzY60fTlYDd3yHnm6
	4dS2vbuvi09S2cs/Vl7eeR5vJkNn7sbbq3GprCUsST08DCn5PiIAzt6P3AzEGZom
	2VJJSyWhlJ11fdkNm5raY+QkwC0hyTiGU8NYh+mF0oERwJBCL0d4Hs/ljBhrDMSm
	UXFUAh+wkhXPrvuXS3arxZxNK4JmoFGiTPTC97SGeaDqRHlUnKckECm/Q0WN5eDU
	+MnP8aS3oqs8RuxVDWoK2R5YUrTFzmYdpl7ENZk7NvPDR8OVOOaFaGyCaHtG2c0S
	6vyILg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk3uy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:42:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386ad819860so1019025eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372938; x=1795977738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59CyyZ7KTp2r+Fk+eJiQnwlQ7yad7V4jdhwwbFVQh9k=;
        b=iBmilLJD/2ohrjdg64uH0J1E+0FjbBfRn0DebppcbAFquQoOZqYR/5bqSD69rm0XQX
         cnZf2fnsZolUQxq/mNAmISqT0J2hIdLC4MDu+5sYTTQTftAoIyLGgkKC3WxgfLvG3gSn
         MmG6Avhiqw2j4g0ikEEy0fRn8Tk+gNrpLhF/ZAXmnSnWPsQtx3WR7Un4bPPCXb34qdK5
         8XcBfR64a1sRAdJLSt1tk7OliKaNgBBNGNdS/W1kAMP/0SOhlaINL045DNGJjeL+dLhv
         PonEXdBvWQHi3v4DC/K9kag+iw6rKQhesXWDuISo5twoi23u72v3QHuPyoV1a34/Mx80
         A8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372938; x=1795977738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59CyyZ7KTp2r+Fk+eJiQnwlQ7yad7V4jdhwwbFVQh9k=;
        b=0bwWJci9h5ypYZnHstVCNruo2trISxc81mZ4FNc3yj3Odo+lKVv47nlUeywvCcB6Qs
         m3NkLzPqCJVHMUHLwTgFRQ5sRj/me12RdHk6yQa/3VgjbHJfM7jyV9z5Prz3tFbLCIO8
         HchD8v18H2Pd0lNGg65qlv5qV33KyNw1ATEMXcLN1PveRw0mvSHkYORx5wz/HOAwdFRF
         yXFvIvQI1Y8/DokZk49GZG12eJArCVXuEJhaS4jEiqOUzu7riHh13TC2Aw9edf1qJE9W
         JwwELxwYJNSDXKHzN1aRgB5A4+i7O5kgAxue46BJnDlWk/5V3FP873KmZxQBuPV3LsFx
         2Z4g==
X-Forwarded-Encrypted: i=1; AL+hErFKGRroBFYeX1mtqd+Dks06z05CPnEeLYXSGrbOBvs6VARHtalPtGJoIF6oHVIn64d3mOLLZeMeg4mr0JU=@vger.kernel.org
X-Gm-Message-State: APuU4Z91qDLcsWC326QJOPW4UDxZAi/MAKll1WxHROHcFeGrbpdM6vfX
	Nd6jixaIryoivoJPoTJNMiQNdpyP9erLwZY8++ulzkx2xSYPRXGLV7kG+eSgHfgKd7XegPZ3Ytj
	5vpBDmdLdwAaumsS7ITo3m2jRA3Y2juyHpsKYayPrnFZ9zChAMsIugrtj2oIrMIupyIRazcbsl8
	o=
X-Gm-Gg: AZFdTZcmAfrpJLe/qbuJbMLEeVXxWBDFue/2pFFG20h3nRVrLmiQgmcVlY2i0w2Bcjm
	RSwvTEW/1haecLoD2LZb2jeYQmeAZsNhzZinchCDz0a1kJd7wIxQojR/lbEOUBKuL4+mYvHl4X9
	UiT1W7XJ/skZT08WZIlrIzR3nsYoSRKNGULN9KVsAop5KIZlSEVPhMPWQqjejs27fyB+kW1RwTv
	ydPR+CwVzKY3PMDu4wwkiwRbX8GmFE68lQD7tIHUJJFDuQm3nnM44AKmvJDn2tSTNb/zfITQN8Q
	mwhKcd+j7/Wy6ZNseIjswS9FaNtZicoGN6EItG9rp0K7O58ffPoytDnRMEyZPWfPJTjB7sp6xze
	oLoLuuyBQIJVyu0bMhgtXWN1CCtbKwhEgVzXjXKUUhLtf5KM+8wUCFAPOnji15YApK9daifWTi/
	g0b7pHwFlrDQ==
X-Received: by 2002:a05:7300:ce11:b0:384:fe97:8ccc with SMTP id 5a478bee46e88-3856fb58443mr10909382eec.29.1795372937429;
        Sun, 22 Nov 2026 10:42:17 -0800 (PST)
X-Received: by 2002:a05:7300:ce11:b0:384:fe97:8ccc with SMTP id 5a478bee46e88-3856fb58443mr10909360eec.29.1795372936909;
        Sun, 22 Nov 2026 10:42:16 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:16 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:35 +0530
Subject: [PATCH v7 5/9] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-add_shikra_support-v7-5-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=10765;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=cxe3afDENWLU1pZDov8Af2I7iwcR6ExReOz+obzWh+g=;
 b=cJqT8a5w2ZDK0TZSEsYGTatmMk/0rzKcoxxcqAEMNz/1KdxnPEkqGniAds9/Wkgjp+/VyKGL6
 r5ayWqDnjxdDbBMaaKgaWJdNpj5pyX116M0KG4yWESM4+3YtwXAreun
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: ic2SizFOvXQL43ktQr_PjhBXXqSgvM1j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX+G8nxbYtnM/3
 wM2l4UQsFvAILXQu3wfDf0jtYakohXUQ1VXLEWQJiuPNV747T8Bf2XvB0iWWpOzY1lsYcxxC/4m
 O1YkgxQPZOsHLQEkxFSY8Un9le+bMmlPTRjg9KWsCcVnEuS01HNLfqgQ26OSzTp+B+vzvDAwMhP
 a+Jzgkmfnd/D4uWoyt0sRCNLnNC1tfcl+Z7w49tgKrAT/2pmtM/x5wkfWIMuMPkGxgcV1qEFG1S
 6B0JPX4OnKiY5LPvXa2DV/v054C/4O3xzM+H5mYi6ooGf7nUHeHbt1favM1fLPn8XmhqElQ9aXb
 2bi9YK99a8FTP8bpM+bMvjUslKUjJQDYUKfNxH6FZdOR32TCEHvnEUXPnbRm/ZxFsQEAQG1sAPR
 iok4TxZIIYGxSPoijWjccP3lFf21bymkVt7e25DxwLi5fO6IF/0KRZoHl1AGME1EUDl9MiQZM4+
 FER8nPFKSuUcaO9h6hA==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b03378a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sTQlpVHRSz6GYiE9LrEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX/qUKjKpNcr2t
 eF53aHOAInW78hT5Shse8p9FZ1OOKZ+TqMmwmE+tl2atxpLOTYAmh/P1XG/oe/GTbHhApL4Q779
 Xl971HxHKLzTGXRVNkMgqGrvpdnn25w=
X-Proofpoint-GUID: ic2SizFOvXQL43ktQr_PjhBXXqSgvM1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

The VA decimators can currently capture audio only from DMIC inputs.
Add support for routing audio from SoundWire microphone (SMIC) inputs
as well.

Update the decimator source selection logic to switch between DMIC and
SMIC sources based on the active input path.

The ADC_DMIC_SEL bit of CDC_VA_TXn_TX_PATH_CFG0 is shared by the DMIC and
the SoundWire mic mux, so a mixer write to the mux that is not part of the
active path can leave it stale. Program it from the resolved mux state
when the decimator is enabled, so capture does not depend on the order in
which userspace restores the two controls.

Add a helper to detect whether a decimator is using a SoundWire microphone
input. Use this information to skip DMIC-specific HPF programming sequences
when the decimator is configured for an SMIC source.

This enables VA decimators to capture audio from either DMIC or SoundWire
microphone inputs.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 154 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 147 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 240100638744..8ed8420d7185 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -812,6 +812,16 @@ static int va_macro_mclk_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static bool is_amic_enabled(struct snd_soc_component *comp, int decimator)
+{
+	u16 adc_mux_reg;
+
+	adc_mux_reg = CDC_VA_INP_MUX_ADC_MUX0_CFG1 +
+		      VA_MACRO_ADC_MUX_CFG_OFFSET * decimator;
+
+	return snd_soc_component_read(comp, adc_mux_reg) & BIT(0);
+}
+
 static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
@@ -821,20 +831,26 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int val;
 	u16 mic_sel_reg;
+	int decimator;
+	bool smic_mux;
 
 	val = ucontrol->value.enumerated.item[0];
 
 	switch (e->reg) {
 	case CDC_VA_INP_MUX_ADC_MUX0_CFG0:
+		decimator = 0;
 		mic_sel_reg = CDC_VA_TX0_TX_PATH_CFG0;
 		break;
 	case CDC_VA_INP_MUX_ADC_MUX1_CFG0:
+		decimator = 1;
 		mic_sel_reg = CDC_VA_TX1_TX_PATH_CFG0;
 		break;
 	case CDC_VA_INP_MUX_ADC_MUX2_CFG0:
+		decimator = 2;
 		mic_sel_reg = CDC_VA_TX2_TX_PATH_CFG0;
 		break;
 	case CDC_VA_INP_MUX_ADC_MUX3_CFG0:
+		decimator = 3;
 		mic_sel_reg = CDC_VA_TX3_TX_PATH_CFG0;
 		break;
 	default:
@@ -843,10 +859,24 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	if (val != 0)
+	/*
+	 * SMIC enums use shift 0 (lower nibble of CFG0), DMIC enums use
+	 * shift 4 (upper nibble of CFG0). Use e->shift_l to distinguish them
+	 * without relying on widget name comparisons.
+	 */
+	smic_mux = (e->shift_l == 0);
+
+	/*
+	 * Both muxes feed the same decimator and share ADC_DMIC_SEL, so only
+	 * the one the decimator is routed through may program it. A write to
+	 * the mux that is not part of the active path would otherwise switch
+	 * the input domain of a running capture.
+	 */
+	if (val != 0 && smic_mux == is_amic_enabled(component, decimator))
 		snd_soc_component_update_bits(component, mic_sel_reg,
 					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
-					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
+					      smic_mux ? CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
+							 CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
 
 	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
 }
@@ -1036,7 +1066,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	u16 tx_gain_ctl_reg;
 	u16 adpt_ctrl_reg;
 	u8 hpf_cut_off_freq;
-
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
 
 	decimator = w->shift;
@@ -1053,6 +1082,18 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		/*
+		 * ADC_DMIC_SEL is shared by the DMIC and the SoundWire mic
+		 * mux, so its value depends on the order in which userspace
+		 * restores the two controls. Program it from the resolved
+		 * mux state of this decimator, which is what selects the
+		 * input domain.
+		 */
+		snd_soc_component_update_bits(comp, dec_cfg_reg,
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
+					      is_amic_enabled(comp, decimator) ?
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
 		snd_soc_component_update_bits(comp,
 			dec_cfg_reg, CDC_VA_ADC_MODE_MASK,
 			va->dec_mode[decimator] << CDC_VA_ADC_MODE_SHIFT);
@@ -1067,9 +1108,15 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
 					      CDC_VA_TX_PATH_CLK_EN_MASK,
 					      CDC_VA_TX_PATH_CLK_EN);
-		snd_soc_component_update_bits(comp, hpf_gate_reg,
-					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
-					      CDC_VA_TX_HPF_ZERO_GATE);
+		/*
+		 * Only the HPF zero gate assertion is specific to the DMIC
+		 * path; the cutoff programming and the gate release below
+		 * apply to both input domains.
+		 */
+		if (!is_amic_enabled(comp, decimator))
+			snd_soc_component_update_bits(comp, hpf_gate_reg,
+						      CDC_VA_TX_HPF_ZERO_GATE_MASK,
+						      CDC_VA_TX_HPF_ZERO_GATE);
 
 		usleep_range(1000, 1010);
 		hpf_cut_off_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
@@ -1095,7 +1142,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 				0x0);
 		}
 
-
 		usleep_range(1000, 1010);
 		snd_soc_component_update_bits(comp, hpf_gate_reg,
 					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
@@ -1295,6 +1341,39 @@ static const char * const adc_mux_text[] = {
 	"VA_DMIC", "SWR_MIC"
 };
 
+static const char * const smic_mux_text[] = {
+	"ZERO", "ADC0", "ADC1", "ADC2", "ADC3", "SWR_MIC0", "SWR_MIC1",
+	"SWR_MIC2", "SWR_MIC3", "SWR_MIC4", "SWR_MIC5", "SWR_MIC6", "SWR_MIC7"
+};
+
+static SOC_ENUM_SINGLE_DECL(va_smic0_enum, CDC_VA_INP_MUX_ADC_MUX0_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(va_smic1_enum, CDC_VA_INP_MUX_ADC_MUX1_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(va_smic2_enum, CDC_VA_INP_MUX_ADC_MUX2_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(va_smic3_enum, CDC_VA_INP_MUX_ADC_MUX3_CFG0,
+			0, smic_mux_text);
+
+static const struct snd_kcontrol_new va_smic0_mux = SOC_DAPM_ENUM_EXT("va_smic0",
+			 va_smic0_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_smic1_mux = SOC_DAPM_ENUM_EXT("va_smic1",
+			 va_smic1_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_smic2_mux = SOC_DAPM_ENUM_EXT("va_smic2",
+			 va_smic2_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_smic3_mux = SOC_DAPM_ENUM_EXT("va_smic3",
+			 va_smic3_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
 static SOC_ENUM_SINGLE_DECL(va_dec0_enum, CDC_VA_INP_MUX_ADC_MUX0_CFG1,
 		   0, adc_mux_text);
 static SOC_ENUM_SINGLE_DECL(va_dec1_enum, CDC_VA_INP_MUX_ADC_MUX1_CFG1,
@@ -1430,6 +1509,11 @@ static const struct snd_soc_dapm_widget va_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("VA DMIC MUX2", SND_SOC_NOPM, 0, 0, &va_dmic2_mux),
 	SND_SOC_DAPM_MUX("VA DMIC MUX3", SND_SOC_NOPM, 0, 0, &va_dmic3_mux),
 
+	SND_SOC_DAPM_MUX("VA SMIC MUX0", SND_SOC_NOPM, 0, 0, &va_smic0_mux),
+	SND_SOC_DAPM_MUX("VA SMIC MUX1", SND_SOC_NOPM, 0, 0, &va_smic1_mux),
+	SND_SOC_DAPM_MUX("VA SMIC MUX2", SND_SOC_NOPM, 0, 0, &va_smic2_mux),
+	SND_SOC_DAPM_MUX("VA SMIC MUX3", SND_SOC_NOPM, 0, 0, &va_smic3_mux),
+
 	SND_SOC_DAPM_REGULATOR_SUPPLY("vdd-micb", 0, 0),
 	SND_SOC_DAPM_INPUT("DMIC0 Pin"),
 	SND_SOC_DAPM_INPUT("DMIC1 Pin"),
@@ -1574,6 +1658,62 @@ static const struct snd_soc_dapm_route va_audio_map[] = {
 	{"VA DMIC MUX3", "DMIC6", "VA DMIC6"},
 	{"VA DMIC MUX3", "DMIC7", "VA DMIC7"},
 
+	{"VA DEC0 MUX", "SWR_MIC", "VA SMIC MUX0"},
+	{"VA SMIC MUX0", "ADC0", "VA SWR_ADC0"},
+	{"VA SMIC MUX0", "ADC1", "VA SWR_ADC1"},
+	{"VA SMIC MUX0", "ADC2", "VA SWR_ADC2"},
+	{"VA SMIC MUX0", "ADC3", "VA SWR_ADC3"},
+	{"VA SMIC MUX0", "SWR_MIC0", "VA SWR_MIC0"},
+	{"VA SMIC MUX0", "SWR_MIC1", "VA SWR_MIC1"},
+	{"VA SMIC MUX0", "SWR_MIC2", "VA SWR_MIC2"},
+	{"VA SMIC MUX0", "SWR_MIC3", "VA SWR_MIC3"},
+	{"VA SMIC MUX0", "SWR_MIC4", "VA SWR_MIC4"},
+	{"VA SMIC MUX0", "SWR_MIC5", "VA SWR_MIC5"},
+	{"VA SMIC MUX0", "SWR_MIC6", "VA SWR_MIC6"},
+	{"VA SMIC MUX0", "SWR_MIC7", "VA SWR_MIC7"},
+
+	{"VA DEC1 MUX", "SWR_MIC", "VA SMIC MUX1"},
+	{"VA SMIC MUX1", "ADC0", "VA SWR_ADC0"},
+	{"VA SMIC MUX1", "ADC1", "VA SWR_ADC1"},
+	{"VA SMIC MUX1", "ADC2", "VA SWR_ADC2"},
+	{"VA SMIC MUX1", "ADC3", "VA SWR_ADC3"},
+	{"VA SMIC MUX1", "SWR_MIC0", "VA SWR_MIC0"},
+	{"VA SMIC MUX1", "SWR_MIC1", "VA SWR_MIC1"},
+	{"VA SMIC MUX1", "SWR_MIC2", "VA SWR_MIC2"},
+	{"VA SMIC MUX1", "SWR_MIC3", "VA SWR_MIC3"},
+	{"VA SMIC MUX1", "SWR_MIC4", "VA SWR_MIC4"},
+	{"VA SMIC MUX1", "SWR_MIC5", "VA SWR_MIC5"},
+	{"VA SMIC MUX1", "SWR_MIC6", "VA SWR_MIC6"},
+	{"VA SMIC MUX1", "SWR_MIC7", "VA SWR_MIC7"},
+
+	{"VA DEC2 MUX", "SWR_MIC", "VA SMIC MUX2"},
+	{"VA SMIC MUX2", "ADC0", "VA SWR_ADC0"},
+	{"VA SMIC MUX2", "ADC1", "VA SWR_ADC1"},
+	{"VA SMIC MUX2", "ADC2", "VA SWR_ADC2"},
+	{"VA SMIC MUX2", "ADC3", "VA SWR_ADC3"},
+	{"VA SMIC MUX2", "SWR_MIC0", "VA SWR_MIC0"},
+	{"VA SMIC MUX2", "SWR_MIC1", "VA SWR_MIC1"},
+	{"VA SMIC MUX2", "SWR_MIC2", "VA SWR_MIC2"},
+	{"VA SMIC MUX2", "SWR_MIC3", "VA SWR_MIC3"},
+	{"VA SMIC MUX2", "SWR_MIC4", "VA SWR_MIC4"},
+	{"VA SMIC MUX2", "SWR_MIC5", "VA SWR_MIC5"},
+	{"VA SMIC MUX2", "SWR_MIC6", "VA SWR_MIC6"},
+	{"VA SMIC MUX2", "SWR_MIC7", "VA SWR_MIC7"},
+
+	{"VA DEC3 MUX", "SWR_MIC", "VA SMIC MUX3"},
+	{"VA SMIC MUX3", "ADC0", "VA SWR_ADC0"},
+	{"VA SMIC MUX3", "ADC1", "VA SWR_ADC1"},
+	{"VA SMIC MUX3", "ADC2", "VA SWR_ADC2"},
+	{"VA SMIC MUX3", "ADC3", "VA SWR_ADC3"},
+	{"VA SMIC MUX3", "SWR_MIC0", "VA SWR_MIC0"},
+	{"VA SMIC MUX3", "SWR_MIC1", "VA SWR_MIC1"},
+	{"VA SMIC MUX3", "SWR_MIC2", "VA SWR_MIC2"},
+	{"VA SMIC MUX3", "SWR_MIC3", "VA SWR_MIC3"},
+	{"VA SMIC MUX3", "SWR_MIC4", "VA SWR_MIC4"},
+	{"VA SMIC MUX3", "SWR_MIC5", "VA SWR_MIC5"},
+	{"VA SMIC MUX3", "SWR_MIC6", "VA SWR_MIC6"},
+	{"VA SMIC MUX3", "SWR_MIC7", "VA SWR_MIC7"},
+
 	{ "VA DMIC0", NULL, "DMIC0 Pin" },
 	{ "VA DMIC1", NULL, "DMIC1 Pin" },
 	{ "VA DMIC2", NULL, "DMIC2 Pin" },

-- 
2.34.1

