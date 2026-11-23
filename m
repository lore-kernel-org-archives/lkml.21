Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447061;
	b=3QaVBskvHXH2wke/02g/FiFqW4d2p/QwB6sht9e09ZESWgwaeN73c4kD0P1/iheMA/+L
	 qhENn3cswoWVdEzUdNBPWn8oNvkaiImJCpsTt+mPpFHO3AkbBZ7DxEAi9bgQC7aAr7+n3
	 LwrVy/86o2HmykKaQ0aPx0jSW5HpIEJIVPm+jjCi06TAMIWe1Yt5XjKnX4231gGycMbfx
	 BdcAJdVxgm9U8XKTOU1qdD/6WXlz5xInPeq2euJoO1wgkR9w36pcDj60nvrS+5vIDs4pP
	 vfjZmQakazM/BsYI8WE5XiuUDblpUpnJlDiuU8ZRQsPX3a2KMvI/KkXBgy0IM2xyv+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vkrEv+PVcuudxd6R0af2wrFICM2sOzSUBrjd2eADlIY=;
	b=Al6YHix+y48rFmDEHgIJ04JlQt155JJ8wxxtHCMlbgXedWYHb7qH1XdNUKA7HwhsGqMd
	 qM8lU3vU467AHhiGwh56/P/Mt2yaiIyBYYS58pvA3NQYOMW1TgqlRxG90FyhYOiFOWcRC
	 bRZCPPMtMKU9OhS6ENlECSnlspas/TZwEhozQj02LcLqz1usOh0KquHIXviY9nf1jtDQX
	 df+AltK5dgS+Bd0f+FuwTk2DgDEyUV3BJ1/5SdkSY/FZ0LGIFQ7GvtfOEMCCOVxojXoNt
	 mzxSwK92i9P4E4uT8hg6wpjrUnuMsXz1qYeiDlITTwr2VE3k0U+stg5XxntoJ7BcXCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Bj+jtzy/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zx7yn2de;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D83606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D83606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bj+jtzy/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zx7yn2de
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLSEe446386
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vkrEv+PVcuudxd6R0af2wrFICM2sOzSUBrjd2eADlIY=; b=Bj+jtzy/tW5+Zv1Z
	cRybiJR+ZWrYLOqOFQtKGMxbyFu6GynHDh8jLV2d9h+PTox/EcjUYSbS2VxoMen2
	OXfbgM9SpL9kBKkC42r8AgV095FZ54A+bL8hc/YDnbHlZ3lnKaUZC8LGlvKO1XcR
	ITM8cHjmLdHbOWVUnC3x0osLeuYWQ3njziraoQ+krm+dawdLVUnpoL/oXmkJIjP9
	Bcii4gXGoXmmGsfkoyFwCbpA8vE1jLobzftEwENNfk776EyLjyC0ud/yeVAeNuN/
	6we9X0EnbjBsPyMjUx5iDXt6vZWFjM3D/0iNfAfU7TgC5YTsG4ZUc7YPcRBLUh/2
	Obs8uQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7420mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:17:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3fcce67c4so558358a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447059; x=1796051859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkrEv+PVcuudxd6R0af2wrFICM2sOzSUBrjd2eADlIY=;
        b=Zx7yn2deOWtV6BkEV/IUz8rql8RAxl0MZ+jGj6cWSSMTW9u7gVKAXqvlAqMaFQhyTc
         KyL+pQTaxkG5B1k/mmi8K525T5hKGmjS4iYq5fdy4uurXKY5hSxqoJh9bbz8b1G1HY/E
         LBBWjvikleOm0joC3ueIPqs/J/J9TN0fbFTC1SmrHb/2PSQPMTc95MXEhnVwYVbZ11BN
         7afn2/qh3mJLNP3g4LEfrl2TZJQtblUgQgAumCm7TkiKWvIUqy27AsbS7fD6mjBA7VSt
         IjNba93q9j8KY4E81FXlHKI5uM0Sbtqw8ysHOM9udFAj5HuU7QqXhPKJ4jMTV2NnFvy5
         OiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447059; x=1796051859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkrEv+PVcuudxd6R0af2wrFICM2sOzSUBrjd2eADlIY=;
        b=aJzKx7CzrVoCUpbYrg20ZEwk3qYN1r/r0by3i3fCM8elbs1PsQ9KsjdPuyu/muAs4h
         wqqaRrmeXpRpkct3HBuMWcLIoPTcIEwcXcRcMDWDXxljXjKJMP80Xbb9xiVI/j01lVBx
         Q+cpPnGsd73pk4PEcKYQReFrSX1nJ/ogsvkhEvJZKlhXnY4ruYMOVVQ1v+lmfSsx2p7D
         MWtKsMl+XnOQ7Xn60nDY3C7j0F+diGDOBeDpXGTHzqxmXXqnxzuLIV8tSh2nyAg3FMNV
         FmNomPwQYE2mUvwBPfPnHIgUfa7038VzyorpbGSxiDsr36uqEe3I5g5TSYHSAQ8ysfna
         ouIw==
X-Gm-Message-State: APuU4Z/VXwBXNYfoo3cyE/6ePfv+KhupRTLbSvMg4ou+Jd3GXOSR/lp8
	pMzoy7tTA5XM01y6C5OFkt56TsLEjj6LXGRHi8Kmcx84tLxY2mKYF3RUZ9oq44LYEdH/XcK3MR4
	pXwBItcZ/FlcOjsO0cPAnAoAy5Vh5cfTpajcITEaO8dZjNMFmYS3NgIXNhX4uWstX4DU=
X-Gm-Gg: AZFdTZe+MKcZALZPliImfapeH+K75Q72EuRp56LdJuWsETMOW84jxfOyN6Ae+5KUAck
	IGBZkkd8/D2RqdF5/hk2Ubg4c+1Q6EnO+ZKQGhrb8pw+uajejFOzycoIdvBu5SzwfiZfGrONWXk
	zy5pluyFWHkMZD1Lxp9Vn7ILb+WRYEzamx4nWoXwvTvPaOhXV8lik6YtOKXtCcrTxyxEM3hNTm2
	4a5QbWyatKoq7SxdrND0o3yOfmfbsR99r317vmRzUF3tKsBU5ST3Zfa2sUxKLWZgZ0EFHk+gq4I
	c3YHxBTKZNM2gCH7qk4KGWsOuSVzLX11SGDaYyjfqgoN4KF95c0bVPVvTB8VyCkURCIO/ftOoHT
	k+D5aOle3VBWacBIk7SjZEEoN95sloORDHIWVzENq/W3cHfzY3I9w/UWCkBGjtqdJ0ktmCcU=
X-Received: by 2002:a17:90b:388c:b0:3b4:393:453c with SMTP id 98e67ed59e1d1-3b41c96fdc2mr18071144a91.6.1795447058542;
        Mon, 23 Nov 2026 07:17:38 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3b4:393:453c with SMTP id 98e67ed59e1d1-3b41c96fdc2mr18071093a91.6.1795447057989;
        Mon, 23 Nov 2026 07:17:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea28f4sm430944366b.33.2026.11.23.07.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:17:37 -0800 (PST)
Message-ID: <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:17:34 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hzsQ50QvfZ4kxQ-XJB6WiwvU75hjvCu9
X-Proofpoint-ORIG-GUID: hzsQ50QvfZ4kxQ-XJB6WiwvU75hjvCu9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX7nk3MFMNynVW
 Gn5boo7ie4YdDqHtEUu/eItyzb23FzOMJldjxpVnXvLccFql3IH0S429OazjxAfWkyJeBz3crb9
 6zxE/OED1xJEuppGgZEYgC+2l+Ym0ts=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b045913 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JVp1Gilkp8drtUWwDXwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfXy/tkutGVTkNz
 c5YVJ7SSq6/Jxh01oYdrWEVgOsU/GQh1+7mch4M/zuVPZm6CHqCcFfkI1Se7hga3aW/51EMtLn9
 WbIbRw/D+EnvEITOvtrF1VTyDUe9aTjWEJaB9um4Cosr27De0kDgYXGl3hT8hs1zHszz/EtEqzG
 SQzu2zDe2HpmWUj2fMU2wG7z7SV7Yx9f+2S3/76db09dvCttteWYqwPGP+xpR3syMnNDd2/TPYw
 ldRLKrZmpAHxrVRKm9ZGmkZyZRwCOs0F4E1o3BwHsj0gk3J0JTxLbs/cbLU4HvgnwPIwfqiKY3p
 dB7vMll2CtowBbpMJ/qM21nxIdtcuq2bpB6l97pr9VswSoppd0hKEuBedaJweLPz3JQ0wbGPWKz
 2rakYw9XUHeO4geL9AvGTHaxDqJXI3awlLb5EIsJ2kHgJ+3rLKR1caS1kUFf5OHoVLSM8z7yado
 8roLSna8R7qS8SDSEuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230060

On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
> currently used only in the socinfo.c driver.  There should no and there
> is no in-tree DTS user of these, so none of these constants are really
> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
> that part matches the concept behind DT bindings.
> 
> Driver have local copy of these defines, thus these can be dropped.
> This has no impact on in-tree ABI, but any outside users would be
> affected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

I think we can move it altogether, to prevent a situation where one has
to take time out of their day to analyze which one of these is right..

To me, this is the same case as e.g. glymur-ipcc.h where the values are
some foreign constants that are specifically NOT bindings

Konrad
