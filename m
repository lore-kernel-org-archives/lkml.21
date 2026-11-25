Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627129;
	b=QDfJSIUUCyYOuHEIeR72rIAg/y0hEEvGnfqS9CKDmNrxttEJlQX0+67UhC3d9o30Jp16
	 5RHnDcGHb3tATYEWDc6gx0FL2ibiP7N8tiYCD5wgfNk1+h8YTnQkh3ieF4tJyCFRv9yRB
	 vgdlk+FMrkHx0nT9qsJlEnaEZ2Nzh1IWDJjqNUyFRGgy4dWVDcg2iz9q1DYk0faVQdsGN
	 6IxUDSYVqU55m5HDSRlVIWVwZQjISBJQC6gOjWTXEPXZ6xtcJVON5C3bu+zdE13X6mw7g
	 FlFqiuzKmm7ikM6JNahc8xKN3kCUMx6H2AB+wEPVHtOZJnhIyi+ELbL5J3CpH8Vyexg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627129;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jaDldssiLH8yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=;
	b=ETAKM/ACpXoiu8xDf79dYzTxSqj4D/bCR52umCdeLw4EHM0HNIldQJTfVth0W440kbTF
	 8zQhp/BwE/lMcKppYvANT9Jwq4gLVTw96050Mbzo1VqUTEEyPaDcGnLH/8YZHG+zQ/Q7d
	 tleWu1j4YrjeVwYySF40W+p8kX8Vvz+NV74MEMUQOg6Iw5pCTUulWzZ9mMDx7PzBirtid
	 IKonyaRB8CpIbU307dQBFBpE43PaJqlflTQgpUbCgbyQy7/LfMsYsOOTpbtbVZnkq1G1e
	 uZJrdTZsYOw7fXy7fTec9q/rDJ/IgF2nn6qeE/pIfozBtdAVRxG6Fm243FbISLD8v2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h63YnrRU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PbRmn1os;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0728606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0728606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h63YnrRU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PbRmn1os
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQNpf3008296
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jaDldssiLH8
	yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=; b=h63YnrRUqhEJZoKuXYZ3r5Bxath
	h3/Fq8hWcUGRv1f7STKGPr1C3+acLo48wxLfgYbp/4MNbEMeS4GzCY4JXhG7RtV4
	SfhSN2EhxJ52dcE9xrXVMlASOPBFBUOs9GEuSeLiRxq+4pwUQESSPk6dFgQpxsuy
	Mo7zrRtdurFKjh5YYVVnYrhqsYDSEIxLY8sIMnA5XF3h2x23iMADbPyH0VtDZzFV
	w0HHPeaEX1tqK3E6Q0PRA1rVYd1gy4y6wIHbp0wD6G8dxU7nPgR1PLKwuB9x9EmB
	pq1J56cpnnVT0hS2cxRIYp4xQhRnq9pT16ieLCXq974z/J7uSZX8tg0LeBA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukt0en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:18:47 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4d9d2e261so91386197b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627127; x=1796231927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jaDldssiLH8yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=;
        b=PbRmn1os8HBDadEK1RWhU29c1VOgNVcrsrOSBGWhJklsnfUz253XCJ+YkvMbuYgeuE
         e0ZkwJn7h831ffM84BklshjenUta243oXDbZm19kFaGykc9gaU3Pd4vbsBSLkq0qn7Zu
         zr4eKvqnYvioVql9tHEV1IeALA4ykI2d94hS1LUUlJmG45+jz7gpVPHN0A2tK587ONeS
         5rUNWl2FjCQWRliZp+mC4ia/JOfW2K67VX2U2768Ncfx2I6+oTJ5wMjbYkwcLBJydoT3
         jRPCHENwEei5z+VtLFpv9rYhO957pU5leqO+a5EApjIg3klkOYVhhvcW4PByJ0urFOul
         kPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627127; x=1796231927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jaDldssiLH8yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=;
        b=m3ujwnxqZdq4l0o9UZSDhW6gA0IJH24feTBtRmtwQZj2VM5juI6YC6bE5ArThlsv4+
         PqsA1oVa+2SmEe1elWx49NS6T9Z83hpJTcbmCkKx4X7E562qp60ZcHuCI/kwho/SafPD
         RWixq0mtWXgceAQQAX+0UzDkxWF7jUpTxgrWkoHp7ztO88VaQxe85q3hirl1Bn3Y1vpy
         CIU61UGxbHvQ8+ps95R2YhB2hgOzwJk8cSmkWzrt5zWuPWBQpnluZV7JzC7dL1dGdHLO
         +RHIqOre0lkl5gCr+qTYu10vtBDhtI89EsjqFVF4RZ8qaSa+y5CUFvr0Czq8tvi78CTg
         l8zQ==
X-Forwarded-Encrypted: i=1; AL+hErEKbDV1i/qBGOxTkn5gw7gsm38J/TwOxxYtD4Yv+Dl0iE8J2nQxKBmXSkVfUHrvmS0DkyR+WRsvcoh8560=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pLis6I/F9ySzM4fO6Okt4+lX54vDrwvgfvN7EXoYVrUZtri2v
	L2jnTFZiTXu4jdFXbHBJFZWxsJqWWT0prHAPHGlEM67nqZDTccqxU8aLR2mgFJnRfPerN/UFrdc
	hRQnvs6Fv7pOEZju/tqzq3e7+qNj+UJ7H9FUSXcBukRYu8slo4lbY1L7hP+owBSIUYS8=
X-Gm-Gg: AZFdTZegY5jgWkFukTcEkIhpGjxvjmImXlqDXQCsuau5kd7IGAXX7wfyx/Dp95Hv6HM
	9QZ1aAGPENSv45m9WO8H4fSjciLsCZ9VCvzWphIqBhtwenrhBJRK4aDRu1SFOiRTyoUaTVjEfqy
	uC+4NnMxuRJ+N4bPTymxwzXWM9JoFn69m4gRtfuXNAekNFLpcWmkLnZtW6jtPAmBtwks8Fov8pH
	e3i3ux85oWmFZCPPkzscc4D/kUeaIZrGl8iIlujlQfSdGn2miIRClZ+AEggYMgjQA4E7tKM8Kle
	0Dq51TxwpYOih0/zW5rXOtYFRk4cH3eXtG5cLq389Q7KPt8yobXoAe+fyXi1Xxt32UEUb6G0IxO
	TC9QSOpKrCGYoD0KmcHzc9J0N9jCIKE4p+w0SCH90PZjLMw85NGxDj7s7XCmbz2sH
X-Received: by 2002:a05:690c:9984:b0:8b4:f326:c4de with SMTP id 00721157ae682-8b5204ff226mr58945157b3.87.1795627127339;
        Wed, 25 Nov 2026 09:18:47 -0800 (PST)
X-Received: by 2002:a05:690c:9984:b0:8b4:f326:c4de with SMTP id 00721157ae682-8b5204ff226mr58944987b3.87.1795627126791;
        Wed, 25 Nov 2026 09:18:46 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm42096548f8f.21.2026.11.25.09.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:18:45 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: handle LPASS_CODEC_VERSION_2_9
Date: Wed, 25 Nov 2026 17:18:30 +0000
Message-ID: <20261125171831.1458954-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b071877 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=OjCvDKFjsN1F9Zy31NAA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: yYS3nwAnf_P4bhGA0L8pWAZVDUpe7swE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX6y94qDdojbMD
 rNywAcVoC1Ccxc7IvQPKu2AT7tJud99Y/A+YorGbnz4+vjUB71n7EzeV65UPCJ2LmK6QQO/64qs
 SPYk5r9Ez9QhmyP9keRHNjdwM8STWoo=
X-Proofpoint-GUID: yYS3nwAnf_P4bhGA0L8pWAZVDUpe7swE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX8Q03ryjpfWSg
 pFXyOMvL3lUEbgGQyzUJnioFLu9gQ6gSnbjpqrtvsIUesXX/9k2iYAOFyjEr/Qm8J+gl9yhF0fx
 9c2fuhd8EkD4mRopWDKc8KP4mOWFHvyrLwnDkLxc2pxlcfLZ89tWgMuLtGc5vyjkMuRl2gkX98n
 YIPETyGk0T7svhnTJkAsLHGB8za1P48vO5KJRpi7nFYM3O7OphDXxeakDVATzYYntoYXuJBfVep
 FHjgAxL277aBK4Ndl6dD6Mb4wo5j0uHOcXrtJQ2RWrkRPMtaLHdxjdWZ3QpAZ8+ZfNb5IW24Ows
 BSdDDWqiLcb/xogzS/HnJ17kXCQbNL+RVW/VDJ1kbR9BGNdCqK+DJ2XvenQhvQmmrVEx/QqnTKs
 RbD4MwVDhACuDqDnAQIo1F9wK0nLfR8xQNretV3XUYJujRSO1UrAo0D9kWskjX7vQK4o/uAIFCq
 h23Yjur0GFGrfUm/zFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250068

LPASS_CODEC_VERSION_2_9 is reported by va-macro on Glymur-class SoCs,
but the rx-macro probe path, component probe and read-write register
check still fall through to the "Unsupported Codec version" default
arm. Version 2.9 is register-layout compatible with 2.8 (and the rest
of the 2.5 family), so add it to the same switch arms.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index eadd52ea2630..94a272916ece 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1659,6 +1659,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
@@ -3698,6 +3699,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
 		widgets = rx_macro_2_5_dapm_widgets;
@@ -3883,6 +3885,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
-- 
2.53.0

