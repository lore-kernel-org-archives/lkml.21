Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376497;
	b=hIzYmMrvdWWtNw/kce8teJCuzrP893XDTVCI8YDxrYScyChltPajnU5EOo5yWexEj3Pg
	 F5tVhLeVSi2Et1kdkLIyMDetsnW4oIw2TaR3yWsHEAJDen3aQyQGMlNQ9Uap64oSBHASU
	 BrnQo6XBYn4rbC4sxlwLBnEBlx9Q8gZAnFGGBG3tFtkPGtjTEujSw4xqy8bR73mJMvf7L
	 uiePuZwIChoQnQpTrRt2TR4KcdSQkicGHMnHGgs2JVHdeey+nbPhGhJD/J3NrqMzsa42c
	 FSFq1fx/IQc9QErPu9aem0ZXTsiNn76MQjnOLSPUoxWkgncX4ImTAOWQnTo9+eMfw4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZTyZfh2vpkguWMlHu7iQNp2bVhFcR2C7lr2zyFVmITc=;
	b=RDZawk8BTuaO0Ur9eHtnWdQVq/JZ7OAKDKeIvVjJvPMubDBOksZZCBuWAOFrQvmfZuAn
	 n4otZ3JczGU8CRV0iiFtueViUpTvo4BOFpLyPH2sdqXMAqD2+MBVVfdkO/N7nwZ1lKGVx
	 8t4o1on2MoMWOY2Q+iM9JVKfoY6lHIg4V3D4JT9B+QHJMBQES60M5Kj8ZnmjiPyVzmlfT
	 wS7HoL//gMCj6EjGGi4J2rcUOaM6ypTxqLJrUva6lzYZSxQdVab+szffdi4GbqoBcnHUS
	 XmZSNi42zYVYn7HS0nMIky3zsfL14pvp3Rd6Aq69ATR+OHESP0wNgYFVSxtDB4ANtow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pznymhil;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ILV/6SOY";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39BC606A33F
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C39BC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pznymhil;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ILV/6SOY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVulL3629880
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZTyZfh2vpkguWMlHu7iQNp2bVhFcR2C7lr2zyFVmITc=; b=Pznymhil7qOIumbz
	nZbrB9lhsptGjgcMYzQY5uAmT/V/6eaUXZpghNUTB7U+izXm4cY4/fqGN1s8HmR0
	JCxmMJFmAmvnaDOFlHzTlIf7cirgBuS6ycUm4RA5O+oonVXR9DDavagU8o/29kZO
	vksSDnHUJ39jU/RJ3aU//DRLvmRwqvc9sU7hIfgCM/CokDYKlS6u8avSyIQ/WUIq
	LMcXPvVGmEVHq1vPhWjOD/wEodUrWgRLKiPLurpRZu2AljUheDM8J3aSLFL6PUFa
	iFAf1bOe/eslvKwvjIA8/VhFr8Ak88Z5Yfp1Cet61PBp5e68UmWFYTdFi3w5cU2r
	sOz9iA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgc6er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:41:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so3048960eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376495; x=1795981295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTyZfh2vpkguWMlHu7iQNp2bVhFcR2C7lr2zyFVmITc=;
        b=ILV/6SOYE7PN1AAGndLx4hbBk1HC/fbw6WfYaW+H7UR95CgwgpfwAq6teqssOgrtWK
         bqMT4pxbIpXOy2mJ5HV3QljSvQBqPr4GBPSHaBbHF22PAH5DqHuwJOZ0uLbKQ0M8pmfa
         x1Vcv0nqqB757WBxrGMVRsY/05r5LKt5LTxiaugUAQ3Z2SxXYVb6/d/GN55RwwOACXcd
         +NUf1Uks5f5nCTKwxOMVdlRkQZv4+ldNSUWoOnfyXkDHN6iS5txFSxytMmvJCqzszrsd
         UB5iGSEf3Dz3ZACl7MPYxSFkT0vspotm4HCXCb6ICOLuVbazhy/CMniJAwOGRzRa670e
         si3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376495; x=1795981295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTyZfh2vpkguWMlHu7iQNp2bVhFcR2C7lr2zyFVmITc=;
        b=GTKEqC/0QsZgOF0eh3Ca5J1KJxSfBzQsmsMJf2F55+yMbZzAW0aycKvK1D3uM4KlrV
         z5s7sJmMPCz7aR8Q8ckutbzGeRL7pd38tmVHiKFLEZRBitgsChTBYPDfQg5j5VbZgwH6
         /ocaavKeb1VYM79bZlH/fhInNi+f/FsAuLfCB0Z2vwQ1bQSfhrLlukr/GaUWbIv7bMek
         aumHFw1RZTXQEvkkHwK0JmmdqRXioWOKmL8bBe1oICTKa6rYohI8f526m5HUS4YJAfxA
         SrFOfwiE1ZSDj4V8hqoE+iUhVw2odw8wXkesdGeiEQgE9VEpm+uwOG7vVhzYDGC5SUFs
         YowQ==
X-Forwarded-Encrypted: i=1; AL+hErHf1NHl//YxKWW5oLt/tsJHB/h4DJnbJY1qE1ET0A7EPN0/nZVTD9c9lZAYlAEBsyqKUM72PuGAV0oyjZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hkwVYxWst1HaYrHe8SNQFtEly+nHWhR5xw/oaxapYaSii1HIO
	MaX0EBqm7Xawnu+aDGV7E5sHm2ahYsALc63ai3kwSAvDik5uBGdq1PxcXPBrv+s4hLw8ds/qNmS
	3rpmL4aQ099hnIIdMrwCtgohFadsErrQFd+gHHRadnt55zUkrhmIVac7/QupTX2Dk/wE=
X-Gm-Gg: AZFdTZf2S0ech39sQgO75iJlBhLEyqenr6Q8FFKunKrSlmxsv3TI1caTTfLX7o/c93A
	6mlke/J8w42slAYkNuP1BWlJiXjvEm/+lc92vwBNEx7ZFwwW8fz6rM9pIt1ufjXlFUtfAfH7X5c
	Hwy4r/ClN3tUtb2rYdhCV+S1sVeywqsRnLSZuHjBkcGGsnFzbs2rtqAJyYDog+fxHj/RnRlfNEm
	TZ4/wS/56j/eRiH3LuCDbaIa8yBqALMahilJBRN6XleKx2v1OTk2vAqhU5HzePpMLqvTTZpbD7L
	vQK7+tv768Y/INzG5dWIr9MWOEozLUgyHKKNY+z2TbjZjQrgAF0Kk1Wjbk2AzFj0z62Co/RS/Ia
	O9r5Pfdwy2eyNaMle5b2o5ALbzX0IzkhQ0YbLGXl+RTq8HbI9bNot3taPwLUgf/fUDk+Pq9bArY
	jZ29VCNcen2g==
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr1994522eec.27.1795376494783;
        Sun, 22 Nov 2026 11:41:34 -0800 (PST)
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr1994497eec.27.1795376494258;
        Sun, 22 Nov 2026 11:41:34 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:33 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:50 +0530
Subject: [PATCH v3 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-evk compatible
 support
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
Message-Id: <20261123-shikra-machine-v3-5-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=3030;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=4SN6i2HTiPaf0z6YipTowuymHZB7HSO+hD8naOMtrSs=;
 b=yCNiyJCyxUQpouVGL6b4NFUw7GuuO8QG1jSu8cZ/elffQaehHG3tdrSoCb+hi6/wdgoM2ph2d
 Hr3QxhcWZ7SDyR31777E+s/zGlAqNLFhUgaTwmZ/NBjvSnrW0IXWIHJ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX4VjZ2NtsI+ve
 eK+2GCv7eOwdHquxTk3/7bf8F2oD0X6qaytD24ee/YCYVmnx52o+wuynIQ3JjoyJgdfehu7OCsL
 bLUcQiXy+S6oWQMuAJmOKG0u24lI3cyq+me8teUemGKwr2ZDgGRF5intDT2C2nmgPcY81fjj24B
 z0iVRAxIWABNnuSwrXAsu/dNzwwaJyEPFDFBMw9bQa6QE7W7dMFJ+urNReD2bRzut7zSRxoki2G
 Vy5VBalx6XV5npuHlUDSkmG8nVvueEVa9R4mV7QR7Nw7YVfEGE8nx+MkrK6HnXf85L1S8WawONr
 LNb3H9B6FWPK2UFhrS7ji9vOHsrIUIrkYXMl8q9xoaDZVUgknsGRv+u7MNBgJxqQ314Ocbv5o0W
 QBH4sk3ESwPRmFPLFT87rEJjjwYj3xsXVRSHni+TiYhgcjjX+fFBokOs51rcSbxXruw51MXxqMl
 gCfoBlHYjcPfC6gxOWg==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b03456f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fMRYn1g1GmHmK2_E4s8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX+pCjkXLAShx0
 B3kfuscirMd4pSjfULR8zgeQh0dP2cAOJRWOhS4gS1mfAhwbgFLn2nHbbmsEwT5bv564jpIpc92
 KqutkHb4gwks5XwfS6mwdDDHQ6k6deE=
X-Proofpoint-GUID: 0rXIWfeXofUu-snIQtkunvjoAjutSLHS
X-Proofpoint-ORIG-GUID: 0rXIWfeXofUu-snIQtkunvjoAjutSLHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add machine driver support for the Qualcomm Shikra IQS EVK board. The
Shikra IQS platform uses a third-party MAX98091 codec with modem-DSP
support.

IQS requires board-level DAPM widgets and pin-switch kcontrols because
the MAX98091 codec driver does not expose its own endpoint topology,
unlike the Qualcomm WSA885x/Rouleur codecs used on the CQM/CQS
variants.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index bf62e8330276..a380c82afefa 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -45,6 +45,7 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 static const struct snd_kcontrol_new max98090_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic12"),
 	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic34"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic56"),
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 	SOC_DAPM_PIN_SWITCH("Receiver"),
@@ -56,6 +57,7 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic12", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic34", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic56", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 	SND_SOC_DAPM_SPK("Receiver", NULL),
@@ -755,6 +757,26 @@ static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
 	),
 };
 
+static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = max98090_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(max98090_dapm_widgets),
+	.controls = max98090_controls,
+	.num_controls = ARRAY_SIZE(max98090_controls),
+	.codec_dai_fmt = SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC,
+	SC8280XP_DAI_DATA({
+			.id = AIF_MI2S_RX_0,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+			.jack_setup = SC8280XP_JACK_SETUP_CODEC,
+		}, {
+			.id = AIF_MI2S_TX_0,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+		}
+	),
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -826,6 +848,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
 	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
+	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

