Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771274;
	b=GU2YDbCCDZTvUc1GXRayxCvmdjArwvQ9eOZHlRcsu9/RhVOPBzdEflm5UpKhAujYeId4
	 6+T4S/N2IYN+VIBHb6AIq4h5mZWeB3p6XifGCw2Hux1kqF5J5QrfCSn6Y69Yi7NB+vHIs
	 f6bV9HbUivdhaazdBwJNPOk2W3l5wST88j1r1hw1NZuOSLhVba77r6kLTxf2VEAxFXqJj
	 w6dgxC0jgAhPb58XCB1Jzu7jfos+NdnAz5kuoNGj8K4A4Pvn3fZxMbu8j34/ged6l7zsM
	 Ps7isop+Cn6D0wOWng64s0ARpN/FjaqkzVy8QyWQVzHgq0bQF6AEd7LDwJdkunygJGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=;
	b=BYG9IYTlNw+e6KY3TvpZ+0IzuwKPglllbYcIHAPJOQobajZpCfGMVJ0q9g96tefO3AWh
	 YTmX/KWUvB+D92aplxbEpyo3l60wG6xR9zDgnfxmMr+GTCakuPcdfrLc45JbckHeUFKre
	 7wA1FtgXzC7xvMm3QITw57xhvhv3/RqsSCBuJq9twlQa7Txmr7sRREH/icN6ZKA4OI1nn
	 W1e6RCFm2fVTyKCg0kRWD2y5SgkIf3Qn9USFIe5kCCwKDCKpNEDLieCCF85DWVUuNcM6b
	 IE0lxREt6C+R0yyr17BvIjI7X+YzdPyiP3sSXdNyvfycJthGAsYqMyY6He+QMAhUFXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2eT4WID;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmIeleTM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82629606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82629606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2eT4WID;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmIeleTM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GeHP905194
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=; b=D2eT4WIDJ1W9AyvF
	iqDjQTZkazX7hjX5tvxXGGUQwOODekepDblkgQKW8sHjN//bLgfVAg3Z97vTS2sA
	LCtaFSK3zELURNRphpjw+L45D7aCVQBNVc3hkdkaF/0nuhcNMzrQ2j6CnXUCso3X
	A1wq7SIr9JXJntAlDUanesYofwhjSrWrqQRvBaZUdF4JPO6E25y/Q22+fM5OLLZg
	Ss7I8bwy5+2ADToMXku4bM7L1CYTszhhnJoqLXOJYLv5BJ9j4hRTIUhHTMEnseLo
	wbUo15deJ5qpVIvaZGpbphIm1xqEmmszpS8r3hWAdJIvjUpLJdBgFbv17XMpjaEc
	2dRLiw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru39u7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:21:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d3ad11f50so9813401cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795771271; x=1796376071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=;
        b=RmIeleTMV22FW6ke2EZjVjsuG+B6c24ZqlvL8uFK+RPDoQIzddBOky3U095Q7nrqwd
         zLtCcdcchYbm5mDfg9Tg+uCbGk0HgC2GW1Hex5XgUOiv5Vbu6mlTINUT6XRR9mEvj54B
         ePJAux0Efvte4iNudklB3ahkt7o0OcdjvI2OVY8hUOiq6vpD7sfh10ayytSwQpMjdkqw
         pHk5I8h4hs2gbyWkBbuqKmU8TT+2LUDr5KmOBIgBINBBfG34kD/ccnOBTbje3l0a8Zu+
         rwidaB6g2N2gvDGNlUWbkkA1fZHVf2PB63hBA0xFtzSsRQAZKnzdhNbIAD74rRHD/CmN
         Mraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771271; x=1796376071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=;
        b=Vsi2iyn34w5xPHFygK6xRkmL+msN8A8nUtnLCYS4EOagiTYr+DciatOaaZSbsafPC/
         TnY8unxK+U3vDuTZwKvbU45Vlg/5EuSAY3tNf323OEiyaoyy8iva3FeUzpFdFRdKGJ1f
         qB9aaHnkBnrOthdbcCrnCqTJOlFPRH7+avTKDhgD6PGwJIzwVNm0twNajhN5RYjq1oJR
         3OGz7GJIcouzKMtKLXpNxADeror+l6wa+w2JIkCmMnVWdKF6fktcgJxV/Hi7wSIQxKoj
         vCV42OEZ+Rj7AYe+PHhxo8dRbZ7PbFPxlmmfEeWNiaJeDkWhMTaLMae9OpaBXhGjI9mZ
         UrKQ==
X-Forwarded-Encrypted: i=1; AL+hErHYA7mhujYe06pO5zU/1feT8vJEIzc+RG/k2Gh8O2QnQTpQMhySF1ObiP5wGJSipn8dlbMxYHfZSf12F+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kwawrwup70dtNfxc6XVLyrHieOzHeF/F1UsLkixsAVu1a3P3k
	nnM3C3LYMu1gEMEfuLyQLZVESVCr+/tHxv67rkAv8XuKgqXQIRS/JCVpFiVvr0qqJxAslFXYAz1
	JHnjMBORMM2MToapXqaO1Dp8zccGnV8lr5jhj8ysXX1DieC0NNiKAQRtNM8ttC7FgWLE=
X-Gm-Gg: AZFdTZfWCTGN5pEUZogG3zKW7IgsfX71hvOMaR8B3gBlJ31Cob2Rym2RccQtcXX/2zE
	9kzfeGDqOO96euB24JzvnNncpiVaeiy+/G+dfyP5jBG6ePij4L6sFmreSxwtyFgL6kgZbOuLWVK
	ivZ3r/v3SaJaalY1MASOr/Ox2tWN5doRyou7LfbM1ELXXX2ESg22T9mA58wHJFDzZ8A5yHN+Xid
	gntJwrLpYJcubFBmF4oFgj5t8k1qM1zF2gdlLEkaCugb5y2VPk/ka6JgwBDT466kwqPGe4sD7in
	5Yf1RrfZhfU3oZMWqzf44hCrg6i8vSdr6SITXLGE0X65b96Ov7NWGSMNP91HLlRxqpbabrM5uH5
	hcE1/UDTcPZ4JA36JsYwoFlszUxJ4tX9Q0VJy1dAn1dTuKRk3rrfrrZrEolNrbtEPsbapLmk=
X-Received: by 2002:a05:620a:8f0e:b0:949:95d6:4038 with SMTP id af79cd13be357-949bab34d21mr3663492185a.5.1795771270722;
        Fri, 27 Nov 2026 01:21:10 -0800 (PST)
X-Received: by 2002:a05:620a:8f0e:b0:949:95d6:4038 with SMTP id af79cd13be357-949bab34d21mr3663489085a.5.1795771270296;
        Fri, 27 Nov 2026 01:21:10 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm820746966b.82.2026.11.27.01.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:21:09 -0800 (PST)
Message-ID: <59c63049-8996-4b07-b3b9-928c810f928c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:21:06 +0100
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
Subject: Re: [PATCH v3 4/4] clk: qcom: rpmh: Add Netrani clock resources
To: SignKirigami <prcups@krgm.moe>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125-netrani-clock-v3-v3-0-9b19d320f422@krgm.moe>
 <20261125-netrani-clock-v3-v3-4-9b19d320f422@krgm.moe>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-netrani-clock-v3-v3-4-9b19d320f422@krgm.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b094b89 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4CYXjMiqXY9n0OJUL2UA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: iBBAJdgqSgUc-lPGJKWNfk5u_jDTFVwb
X-Proofpoint-ORIG-GUID: iBBAJdgqSgUc-lPGJKWNfk5u_jDTFVwb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX0Q2JO/LH46FY
 pRo7OEpwXfaXM7nTSrvOgbS+MvyivMl4VGAdQjCUy79cGLw1tkBT74CMCEsflgc/E0OjhDATGBz
 C0vtusBWSDF5fbOxWwYgMtl7W3RX8sQ3+DmmDwxpT6lDmHxL35+um3AbyWvayl7c+TjE3lQCCt2
 oTwotJgUm8T0mjvVuW3deYa787L0IBF9BCv/VEj6sF7kqSdIY/Fn3JyKZDiCh7/y7BWJyv4oS1L
 uZzdEgBKw1zQa+lXjJKWHFY3YQWXtyz4t+mIgZ696y1S9refrW4AZfxwkwZZYtu3Hw6O399fE3U
 67Qhbs8UphdyZJZfe1UM32G+2S8f3bqp2ZumC2xBtTf8MKAxlL7jpGTD1lLKq9QN0mdYmVaV8qD
 BK3bJ/KKu16K1X/FVCDvMlONpb1NUE/rwq0S3joT4VZX5EhKXqdRl24r9AJbheaOwkhBaDtP04W
 Fj+nzu1L/7Ks3x4Aq1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX8sg+yy+1fFfa
 5HLQbsJLzYYNrPDTn0JeidCR6qIxC6RfSFfY4s1bJLNhPW4qFwADnbDpjfl9a/953OPEJJdseb1
 LHmNXLSNVqSPcmV3znOLhkEGdPGH4Og=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270037

On 11/25/26 1:59 PM, SignKirigami wrote:
> Describe the Netrani XO, line/broadband, RF and IPA resource clocks.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
