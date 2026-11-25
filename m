Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598016;
	b=SSYdpoKARMYUKvGXRFH0J7q52X9erwEtKXL2nAlDI19Ic37uqXu3hT+rfGy5Hs7Xg17W
	 atgbneckme6Nr4kCSzo48EIc0/7isZyG0RztHNMisz2TU9pUk/jW0lXWkJHG70Wxwx5ul
	 qMTcJWYIonb728Ipa9lIflRn1/kw782+yQ9D/QgmGXUfD8ZGnMyHdCRGLs/2TNou1Yodz
	 fVrx9lt5BwD3LwU9E+TYUtB2vB/Z8VVtqmD1u6xAFTqs4OF74aVHE4Zh/Yv2F4vPAznLn
	 N/9yrxuTYeuaIExlHfm43Dk2V0QGc/C6uDf0co/I/Vn23J8SsHtX4plILgQN51lP4pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598016;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=;
	b=r6YiRnVDGKm26ITvg6OVoNYfqQP7cWGBnrUZcqGqVPMiPc1pNhRwQNIPZ2zWkuV/43GG
	 ZnmtDJsxTBYke48wKmCXVP7hcK58WEeu4hJouKgdPPJfbXPPfcdnPO2Bu6qTnAhWyu+gr
	 Wymz/no20uHT7XMR+8Zb6PPy8C/eBcS6ImHzVib4dU1wHzizo60KW0Dz1GqByqOXHCmJh
	 cFlV8QDUYr/MS15WK8FvOrruStm1kpxoyAqhLP00e+lGMwB6duHMBm2SWEW4ZOmc+DMfk
	 lCh63oxWxdmWaZECQ45TMulnTDTlyMDxcMfFuUU4DmbDl9/WxFrrc9GShGqF2lvIv7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fKbpflYN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GxVzTbwK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB30606A687
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB30606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fKbpflYN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GxVzTbwK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68gKM057268
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=; b=fKbpflYN2Li6SwsW
	x+0dVOscZ6J/P88HrREvH7MGuODuqPalnXAOpCuBvPZ59ShYGzNDBtRLAOJmjRQV
	53NMD+0JkdIne0+qz6/U4VXo5SlyMzCC0FOTbWMmz8wR21AhwmHk+AdUBGKiFqa9
	pf3+PWllITR6Z/IVb7E30EDoXgrDACWfusmEbECbkjR0l06FRmRoYIHe/cW3tBwv
	/6B0GJDa6W+SoJ0lCYczbd2nrrwJ6BzAdx8wJBiAQJJzsh2jjLu4Ov5Xcso9jhDA
	RoTpwZGAZd7VI0B4qsDJlCS2BkLJNp59fqLsqlTVog/JiyyCSsKqHoxmbIAfb2JW
	fUF1Tw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnfasrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:13:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94965dfec53so67634885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598013; x=1796202813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=;
        b=GxVzTbwKEYU7Sie033naFSlQk2rFjQ1OnmiKB9AH0oSaD87NloYwolaT6Yij5gcYjg
         238x8Hg6E6PEuqIN5zcTEb8gSW+GSlAY5Wg9D8WrtwQgUM0jpatT5Irzj7dgcL2AJZFD
         wxXfvAl/S1MFbXcMKFesxXwhVsRvyoi2Wl6J+r6AVbqr6hetO4C3c+d61vx7aD3Qdli+
         dp4xTkdfDbxUr2wqsBb+0KZBE9uuMcIfRWiKJ7UK05D2qnFpmSTgY58FflHR4FY/Ru2Q
         HJIj7xgRyZT1hHFIMRT9uQlzGuuopNKLhya0n9f0nn4ie7E0csPmuYXfHUgYhuyc1/po
         dAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598013; x=1796202813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=;
        b=lK9lHwLuwKAUaxjsW6wr8khm0PCG+pA37WvLSc1A8iXmu8t+hFuKMITwqwdjwMprOK
         uGA0HRCcKpMJeSmNGHwZLKsgSpdlPwd82jcCUc7K9Lk6SdUi2gor6HWFQ1Fwn3HUqIpk
         eNN+iUUNDAxPZQABUPcWhAdIqCviTIMl2CZHC+u004bCGlFzjRTAtgwPGg1XbL9mQtRI
         bPrJRCQROv51aC9QZW2zQcCAK7U9vHE+vwl2jok+/cxNvQ+xNrOhHReYjHM0rg16sq2K
         rCWqSvNUpYHU1SAIM1D1+VQXx8aopniyM5U6JDvpqtigeRc0GXO99UY4n73xtaSsRUbp
         ICQQ==
X-Forwarded-Encrypted: i=1; AL+hErH5hQxWDIK2FL3L7zN8M+9N+P/sDmo6HpDsJknzUGuczmq4BQzTrpCV/gLnB/p8Ugp42U3gayyEZv4FleU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DGctlUBLpWbkAFgzDtonDOCx/n57rsmKAJU9LC2xv1yRFAUP4
	xGNRHBQGitGMu8pBCbBkj7Fj0bDIdj68skHFH6XiAgX//JZmezJ0UwJ9bhEDq3134xuxtZWFgPD
	t983Cfp8vGYvugqW4iw6il5Dxds4lAyKkr90TM3SQUs8QMxr9vvledyAUCkHYWYBdo+Y=
X-Gm-Gg: AZFdTZeHbZTMS97jPJdzJWk3zCShAKeay+DHIURYLfyXe2r18v2sEjagMB2mDiX6tjZ
	YW2kCiOUhvmG46YyyUIXbVOnZ9yZVu4Q0lHcwPy+rmQrebVaS2eihz+8DidzRybwFRx8w2kU+A9
	6XyHC4q3zfxtfaeH4np+XfgbejKw3/nMIDZ+u3Lbtb4wdwVhrTOzApSkTUUO2YwdrT5S65hE9E6
	U3L2KWlTjNf4vlBQyf8efKzVvnErZuzSpnX0ZtYduvleYxMFMQKFz2Du0NSPy3vawoVVzXUJrJA
	0fQTkcgy6Izih+g6PA4XaFWjDtqzD9q/W8sXIiREoED7kvZBdLhG2xNg/FFmKcjEBpkMVM81rfx
	mO5i6PhC/P/QSVgr1muWju6Ad6HNJtafKYJqoKE5Fwlzji/fMEg3SwOyQSyjrXKgOG/q27Yo=
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2845921385a.6.1795598012714;
        Wed, 25 Nov 2026 01:13:32 -0800 (PST)
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2845917385a.6.1795598012173;
        Wed, 25 Nov 2026 01:13:32 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm7951603a12.27.2026.11.25.01.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:13:31 -0800 (PST)
Message-ID: <25657ef3-3bbc-4d70-bc80-e368eda447bb@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:13:27 +0100
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
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Sort the TLMM states by pin number
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
 <20261123-t14s-gen7-ec-v2-3-3420a6202366@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-t14s-gen7-ec-v2-3-3420a6202366@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX9fF54floBvNb
 BbfpPofcAypvlL/X+fvabYuSL0/v3X/g5CupdeZPvpFK7Tup++pddMRR+GCakq5n3QFuYBCld18
 vbtyJ4NTNtywHrLAvL9VD//DpNuSacY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfXxHZQriSyTSzz
 L2POJeW1yNjOY25d5Rf6NHR3Dr/vSbQEyoeV2IRJ7pRo5I/bKldmDoJwrHy48P7nrNC0nqM5SbG
 gVkxERPhtfklOVERP1x7GX16AvMOzvdPDeV0xpLDM/005vUDJkdlCgFe1Fopcb/mESEH0yu1WDg
 cN+cVbKIod0bEiLchPmfRf2ARz5CdefvIaEfIKMkltsYk/tJEk79lNVnKyxOVYTrz/uHZcIOSYj
 4tRTLzTuL2pJ/Gv96bWt2BeiXlQIoKWFEI5ByTf2ynu/RxtcT1af6S9BcKz6cltp8ZrjUdFMWpA
 6OpMRvcv85dOXeUj9qQcOUFQK7RWMOWMHR5VywNvhFhJgvbu3+T4UC+JPLQqsA2e//t+RRTENo1
 HfG6jgQrabu4gN/G+N4YEgnKWIXosucfCaTbVB7Kvgg+fkLv7f5XDy0IWUhb3eAcKBFGc6y/Y5Y
 wbpuwERWWK4HrgIZgZA==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b06a6bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IcN9rPl5bsQiho1bYRUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TFI6sRl8UQ6RWs0dFJF0qsgr-UfHZq85
X-Proofpoint-ORIG-GUID: TFI6sRl8UQ6RWs0dFJF0qsgr-UfHZq85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250036

On 11/23/26 10:35 AM, Abel Vesa wrote:
> The TLMM pin states of the T14s Gen 7 are ordered by node name, while
> Qualcomm board files order them by the GPIO they configure. Sort them
> by pin number so that new states have an obvious place to go.
> 
> No functional change.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
