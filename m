Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782460;
	b=GK7jVkuJ3ZOcfmzK98TscTzdIjrxQah11MoJP4fuZuJQvP99vLHy53qdOR7SNuo3Unsx
	 kzyyj7cuNmtZzaTxX3BpvbfEsDeYAJJLbGYehlSRDRUKUi4M5lsYr6MyJDRDWKRB/V3Q1
	 ytm+/y9T32XqAYRLKQq4iFLPFGTtxhzvoci59a1bj+CSVBu5lwhVLlswAWvU3A/+HRfMT
	 xjDJdLSQubS/ST1UV40Hqmrlkhf3sK+Skp0a1JzEZ/Pf9flRHHtvO51wbtvyTdTWM6dIY
	 vKPjVsVnDy11MHD6P+ZWddJEsur80ajghDtTE5e8G58zE/vwUya6NCSG3XEuAUEVTiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
	b=fisEfflVZY561l7g2dOXoktazGnRSjcnrrUpqyGXbWEr8/TKk3d+U1AA5iEdMHsHZ5nk
	 ZId6dfQqN5K05U0FvB4lsRIVcu9HEUuzchshgEd309BYrROkB2j1CfCLTj70MNMV1F+Hx
	 BXJkR9Colyo8bU4Zn7ZeEZZgxT+coefRygzQC+WKUWNqmo09u7M0zFbAJvr0ZMUmujzNY
	 jBwXkg6/61vh01D4tOBsP6bkWtkiK65tNmnIp7uXVYJntPjHHYngPS0kFTjL8cdTEjv4w
	 i16v4FVJlXWiNGs8+rfF8yXz8qi6e2XnACuExtamZA7a5tWRB3WuqiJv8onK4zPQmDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjKDdGF7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brLOI2dl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F9606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0F9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjKDdGF7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brLOI2dl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApqBE053030
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=; b=FjKDdGF7X+XkRq9/
	MXyrQkko/PPi4y8oYop6EuxujwZUSXM6+dGJa/2bPE+BBUlPn9xFIImt4pYelgrP
	UDqemhTPiX/2tiOnRI9gMsYib3VWGheswEuCpHEN1RSJ1T4LnCOPfAG9p9cSdoGh
	TgL597+3q0WmLfIt4N8C4Rby7zInxKJqxfROs9Smsmx272Yod/JtvvVgsFrZIpSC
	SX5RwWNxLIop4hbUW2kL1T7DHts1GZvtpyByMs1Mpb+Dv/FtpbH5Xw3dDFoWy+Xc
	DJ78loK5RgPiPvobQMvh0mKhT1wwKHSmh+FfNSP/T3ZtAIexCaOg2z/lfpJRKB/J
	rtdUTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6sdab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:27:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac5877bso109346385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782458; x=1796387258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
        b=brLOI2dlMBcvSa0oj4XrWcI49biEwBn/hxERcZUpXyz3eGr5mkBwTXAnG1XzG/gMCh
         9oJl+AM+vkwVdtglbC7efEaZwdLdh5C2C2Sf1LcFxFtd82WCiGKvWeTxJl461bH7Ayzd
         7Y3J0kU4c7GA89yE8DLPYc3RPOTQwy3PeMtoiIphfVF56F6KVPQPCydS0wkn47030BpM
         9mP39vjxQkz2HxnBIMtgnkfg0BHEk/AKH2SX8zmUSoE9iHOAK9W1j6sJccT5h2bLofzH
         5dGrZ2OAKmoHVmUSgZjmJNa9jNdCbAulFAYmZIwmjT/Ndv3c5ixyuWCqubcrUSYYZb6f
         EHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782458; x=1796387258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
        b=Y8EwpNIF09BM8YgRkAtlJ/W2I5zvSvwjX1HiWxeBQ8AALZi3B6mgGLvh0QcQysFW5F
         OcDFC/dk78H0wrGLgLHfMheLz0PdPBKXJQ6Ylf6k2a0XyJDDQom70uDulYmONi4ZO8yb
         MQRfJJdaxEl2BaWb8SjEFLizPakK/EBZMl5Zm54853iWPe7X0aY+27b0Mi/woOy9VmNo
         QxHuZ17keuvtY7e76FvHeneW/dwwc7jBTayvEKtM+ug5tNYm1OvLcOWE6VEr0bBcJowf
         qhe0CqZaVyHoN9m+roena1njMTfYKtFAc70rhq16nfYTJ6dTrI9YWbB/wA0mcD+K4sx4
         wU/w==
X-Forwarded-Encrypted: i=1; AL+hErET2kpvmkjHBnMVNJ6FglKLmx1OopWAzpUcz1zgPDt5LYEHU1Vm6280ssidfAhrEQF2qJAm9gl/NU6KIfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wBE+oCew8tQf2vrgj6sonq9bBQXbR8ciWKWJi1HM4kTdITtxL
	1SCiQnjIO79y9pv+TADGt4AfyVpn1ZNULyroG8MmGQvNTrEIEbDxetnHc9Kc61VjtT8k4BmOmyt
	p1mpHf3UEo+kbjHTGeEaKmX84H1I/lbifAPd7GCsbLfGlzEyZBV5tWWLUDh26oZ3OotA=
X-Gm-Gg: AZFdTZcY7EJrkkrQ7/Ow2p4Kofi+Key7rP8gasmtWwlx/gFkYGhelOUOAfmAQ7uAZCW
	FQaQN335JgBMGq/sIBe6NwvOeivmJXa18BIttK182JHT5He475UAxiwB82Vq8n6ayuX6F50g8Pn
	mRIgZUOFxk/yFXD+GPdZxtFzFEOOQsYoPw/kZ6UBL0thb3bmS9yivpRLx362BA1u/GEDtNSUg4h
	HSFftz408CNhktLHLLaWTUwEOQo7oKaX6pFKnPnbCW6lvk7FH840jkRO8Dng1xe+/ZTHUYESgEh
	avxWromZzGJXYMGoh1dfgugV+XhFJcyGaUf7cSxhkZs0MLZcjuBmnZGVIjIi3D8ig+6zBG8Anpw
	uVILOf0976atUt6lzDSmS/gzW4OqaZem+q+CUOu+Z52SfsQZHX/C6SEatcGxGsQEJlB43C6c=
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3985058985a.3.1795782457734;
        Fri, 27 Nov 2026 04:27:37 -0800 (PST)
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3985054085a.3.1795782457281;
        Fri, 27 Nov 2026 04:27:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm10501705a12.3.2026.11.27.04.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:27:36 -0800 (PST)
Message-ID: <765f3451-0f2e-4783-9a7e-893c06b2a735@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:27:34 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261111-pixel3-audio-v7-0-ecf28efc5c33@ixit.cz>
 <20261111-pixel3-audio-v7-1-ecf28efc5c33@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-pixel3-audio-v7-1-ecf28efc5c33@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _PrsXT6xU1DhfcMmaTeYKL0yAT2mb8aF
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09773a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DuBmnH7L3UKxGZjpEfMA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfXwMnR6GLL9xpo
 ZmkxGF2QfnjeBEg87keXjDKmuPvyGv8k+b/sMjirM+GZqAZtRxaaeXkv0lKHVcbPoSgBvqCjsAK
 DereEq4I/aVzKsj8m/rFGqhN/3rQDmk=
X-Proofpoint-GUID: _PrsXT6xU1DhfcMmaTeYKL0yAT2mb8aF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX4pTZZestYQ9r
 wCwxOEujoIA21XgxfrtCOx23bAWEGSDiKBCoUMDqYmTG+ihBsdR2bMADvr83MFFvh2a+RVYuC0F
 x7+eeixWpqfZ5GaOhC2845tysZsJupxLUIqcxhxjjlj5KT7LmFe2xWV/cLihLmqMs13MqnKW3Eo
 QezgBMwyK5dIi9GSvnGhb/wxHPYF5hpBJLgwCwjJ6TJibGKh+Qtu+8I+g9PqUO71NLIKxN58lv+
 2L4K+atpJIdymx1onN4m48LoZdZYgDMbMqvLaaOWBa4JCtQ/upZ/jSNnDbvIRAP9hIErrsykzjn
 dZCr3ObDvmID256Se46Q79pICtWxIHlNFT8GM9/1mko1SkEMX+dtmr6FsJKsQ8A/ccit1uXedPA
 t9a+BCNaFuf1CaBIBbjD6hiiBAs9sG3Nh8DzA953qvafQ/BtD5V5kmJ+YncQzQEcHjhjeblKWr9
 O0gotLbIWRpA9nJNKKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049

On 11/11/26 6:41 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.

[...]

> +&sound {
> +	compatible = "qcom,sdm845-sndcard";
> +	model = "Pixel 3";
> +	pinctrl-0 = <&quat_mi2s_active>, <&quat_mi2s_sd0_active>,
> +		    <&quat_mi2s_sd1_active>;
> +	pinctrl-names = "default";
> +
> +	/* mm[0-9]-dai-link nodes must be positioned first regardless of sorting */

Could you try the patch in 

https://lore.kernel.org/linux-arm-msm/655212ed-4812-4747-ba5a-f0093bf05411@oss.qualcomm.com/

?

Konrad
