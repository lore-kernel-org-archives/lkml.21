Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789126;
	b=LCUqGvn3/iACpuGuMoEfmkjENYtnx0yDTSLtyIK1L7Gpu+o6zUA4DACZpyqPR0052RNT
	 Q7ycifvcYP4zb4NtCfT2rBDHCFwlgKMoAETAofhrYjb9PcGZnKinCfnihBWMcZsyey0fg
	 hjjUsuHqIg2OoDmZztYa6RlAw1POnE77g093ykG918tj6qCZQAd3Sb8OGF+/Rvt/XE54g
	 YRwI/rqlSBQUdXmpDj6Z7G11WzceHTFyngizEHmp3eBhdRfkWGmnyoJ2UW/eEsaf+6thI
	 wbyM6luk82GxqvXZQ1NOXSrjWWTpmaxJlX6cKoG86D7iHq5XRI34hCl5LoQyo/MvFkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hjNZ6MbjojponFD30rn+KDUfBoOJ9+Q/e4UNW91YGkY=;
	b=Yqjr+7GfCcnx6gTaWS2ksNoJhuxLEcp0CgphJbRSKJKvTpSjD6WO9wByLc52H87kXD+z
	 VNqVnQyNbm7sd4pqh6GPCNipD2Qhc+EsjW5h+LKxtVjFRWFyR4I1MTRfBLuU3AUViTF5y
	 EhjeblH05WyWz9fhPvgkxXPNPG2jJuWlUE2y2lTFX+3X5+v9GG2QrHz6+3SD83RVPVuqR
	 yHtw69nZ8LG+VFMcY58oFEKzLhtPkJOi11kPYU9H+6WEJJ50Cs5LXeLtNOS//RSj4ER7r
	 AXZL6Ums3IRxe9niFvYE7CXhHa8tw3pL/vBCBq40hhRjr6PSZkfxtcd9Fm9u6yRydPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpM2d2sQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/36J6pi";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9E5606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE9E5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpM2d2sQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/36J6pi
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Knd685982
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjNZ6MbjojponFD30rn+KDUfBoOJ9+Q/e4UNW91YGkY=; b=MpM2d2sQOjX3C0iJ
	5SFCSPvUX/RSIwDOi2p4mbqjLG10v6T1+JoVIbq4saOZxqoME7DZHOQEM4CUBKHt
	HmfJpr8k2Tu4UCON5RI+9PIgus1a6kbh/PKgxAweGTyImjN1yGZDkAu7nTKlg6n5
	20/R5GtCHKALP+yYEhCGJ4q5RLV6IPZktenLUzjTmMCHripjCNyf+dARgpNZbyJK
	ijaBLSNrkPpZKNVrgGAGATJDIBNsB+UUmscbAJUSDLsvGnaUKnFmTHLOTrMnciN/
	6bL4cBBqCDjq15sNiLj8iqJqr+xERlScDE0iSmSbh5diX0Zap0FNfUTbUfiUw3KG
	m8fucg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49bbwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:18:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c97957d83bso332883e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789124; x=1796393924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjNZ6MbjojponFD30rn+KDUfBoOJ9+Q/e4UNW91YGkY=;
        b=R/36J6piOOlMDb2xMKz4Mwuw6vOSFF/6NvYMvOGCGTcGH093N+OxfgLC5KZClDwxdu
         MOBxEGfiLzZIihwGORMSqmkib3nM4NtVzzALcItBc1Kaaaee7EVCEcLqrUZYJAZXmw0W
         2dfBukJRGQF76fN30W9tp8CFa8DdJPkmkKlTiBYX4JnfSgHhhKFiN8gaE7w4BbAjQrHK
         ARdHducKV4dehjRxyxQnqcCpJNvFH6aNtPyeToarQc2/IzpOUkFsZccrLnTfir4vawsr
         DFOal8uvMsGvTql37cFcDkNdizMRqJlDF8aDJwArIRNtJFF4FeR0bo89BGO0pKZNoTOz
         BwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789124; x=1796393924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjNZ6MbjojponFD30rn+KDUfBoOJ9+Q/e4UNW91YGkY=;
        b=L5ppVB3gC0qQ78PgKN1IryX8xXP2uQJN7Orrd2g+aysfOI/kVtR0VnWkihyXEgh6GV
         MAsKMoC7og43iaW2dVA4bFt+4cdlcXJz0xG0Bb2W9vRAKHzw3XpP++zGUwwIKrwBLwgF
         /xyv9Vzg5shLFfG2Osufd81chM/E3FyHZ10pyN+OsiVkUDsvMFaJB/34Xj0ZxaJWOB23
         BBBdaLisnZN8zzyMARskjYlrChn59NbXd11GrGp2l9l3cbNpX5mQsH6mFiRorYdMGaGm
         mEMF/+TkJGpEuUhYe2bIJUwXiHQiGxehJG1oh8vuByvpvxJ8pkgZwGxGBqZPd3Eoavr4
         LL2A==
X-Gm-Message-State: APuU4Z91rPg5oxztc/mh1UkV6cSMnOMBbhl+Yn+D8/s2kzjNwsmPOdWx
	3P9LUFq2bgw/2d8cBkQPGE/Md5TcO1ZOvHsSptO9gxwRLLr8/59pSuz6+KPqptDtzX5AFmsohSW
	uzQ2rCAS5uCimRAOAZCyS7riSVyu2J/NkCXpZuJBr8fCXw1sm4yBmz48YGILLr+ZA+DY=
X-Gm-Gg: AZFdTZeVPUbp600gufyxHIoaQzveNb5gD5MzM6IcQ7CeoSzwr3nGawvIo0wi1oNDpMs
	Fa0HOiTuBtkCyYNNl3XAGNbAdhosBcXTU7N7nPPE51kr+dADUXD5itgVUOjPD4In0HLwjJ++8w5
	ry+IA4tALPgVWUeypCMpvepVpBuKvppZINQcJm744C8XTJmpO9T7y12TWk6MiWmKnfahlORvsXQ
	TZZ8tm0VWNeyyX4kPrR0YFQS/PSHvk0ZpV7UZIuUbPDiG49FiKHg9X+FiKUnE0nZ3GW43N2zMGx
	hlWcxN7100NHdXH1Z4lbA1gBrHrcSZArPVdmBuUQNh1OuDKMXl7/phDIQ8vi0biUL0CeyqqvCnz
	PCYLjpgZMNBKKS7lFVbSkzxyCUU5j7E0iEblYelg0pBJkkZtTc53m+h2BY4jmnFACZogQKjk=
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr22084644e0c.2.1795789123709;
        Fri, 27 Nov 2026 06:18:43 -0800 (PST)
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr22084556e0c.2.1795789123132;
        Fri, 27 Nov 2026 06:18:43 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6663esm876314966b.21.2026.11.27.06.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:18:42 -0800 (PST)
Message-ID: <39f263a8-f664-490c-ab25-5efb4bc606f5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:18:40 +0100
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
Subject: Re: [PATCH v4] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C
 controller support
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261123122857.2424213-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123122857.2424213-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 71C4hzezi5FBdSOYBcgMQjdXnAosc8vR
X-Proofpoint-ORIG-GUID: 71C4hzezi5FBdSOYBcgMQjdXnAosc8vR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX95uYln6mi8Ec
 LyoZdhBETOBgf98ZEDg81GUgCKIGTF9cImqPLI+P4U/xKP79kadG0UDGJPtm1KJ7N/scuevDDKd
 NU1x9r04f18e8eWibqK75lQ2gvDCBC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX9SBihNFMheRB
 1S/FxXzbZB+IoR2GDCyKl7oBLBJn13jxpEI3GdcHxM4jGkUaGj5VbB3ake1kSjzF5sj+mt5nai7
 8TdWyFxRR25mqlpdmD9RivaPYmLVILFp5rUG4bDN13Nlrf+j72CG2/KobinZn7Fs+8OhMzUzlDI
 /Zi2mMfg6c9TxanPr00+5tXAaT4zIFcuRQyH6s+EIlQSkFhOL0I51lZCr42W8aaQh5h5MmtLgpT
 rKuTj76C4zE1xbgFO1rQ+9XkqgaCSZTGmMcDXesruVHntLVEFL2pwxEJ5CfngF63fMNzRGLwKUF
 m3jS1bczUVHE+YqdOzKzeNL/df35cqh/9+M3DYy7I5Ht40/8Q09EuS1p/sfmbMb8oLL2oPUfwGN
 BzUiG3hhTwLjqjy7FzZpU1iR9jEINT2c8GLwGOW1+9MhSbMM2rUuMtiCKOZKdr7Wa1xTHWnjoTs
 jSVF8m0iAdGcqQkDAVA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b099145 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QFD2gNDBM12XyJM7r4gA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056

On 11/23/26 1:27 PM, Akash Kumar wrote:
> Add the Cypress CYPD6129/CYPD6229 Type-C PD controllers used on the
> Shikra CQM, CQS and IQS platforms, and wire up their connectors to
> the corresponding USB controllers.
> 
> CQM and CQS each expose a single USB-C port driven by a CYPD6129 on
> I2C3, connected to the HS-only usb_2 controller. IQS exposes two
> USB-C ports driven by a CYPD6229 (CYPD6129-compatible) on I2C3: the
> first port is HS-only and connects to usb_2, while the second port
> carries both the HS and SuperSpeed lanes and connects to usb_1 and
> its QMP SS PHY.
> 
> Both affected USB controllers are switched from the board-default
> peripheral-only mode to OTG, so that the role-switch framework can

Is there a real reason for keeping the peripheral override in
shikra-evk now, or was it only a convenient shortcut beforehand?

OTG is the default value, so preferably we would drop all overrides

Konrad
