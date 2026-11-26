Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704772;
	b=n/YiK5FBDXJRJzNCEb4uUnN7Uw9jkBWas4VFi+DEI12vp8yHDqI/9Dpe2iUKrE0tXjj+
	 Naxo7zh5cMLToL1xl3AyrftqEIdDtcVjobYeqNeKDdk0ZZpGGaXfrDBJ7SkxfW2+Ld6eG
	 q0Phi14qzTu04wFZK49aHj747RVl4h3tIs5fXcsKMxWB2BWMjxMzJ9X5ZkMRFFLB07OeP
	 /l7S0b+Qlj0EVWCbWcEVkUXMutgJjaVbICwUFOOLFkfR1T/6uUG4F3To7AYBk5XgJvB6H
	 VDCA36xi/8PLayUr1emHuw0FAqrumU/uX68YtTSY0zdE08+vV233jShCVBX5ToHCfcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tGzTYdCVsxmaWjlskvTq5xiHbCG8jSfhPOvjHrpWhpc=;
	b=1mMX29vNYO19LBYap/dI0Y1FEGkpAz2zlESTDgeH0di1GBbMabrIScZ68/cmAKG2W7TL
	 W5rK4sFJfvRoTFPC66kKeLaHt+Nw4v1DpgzfbdSJv+QFkIrgmAiqPZguCmEtCkfF7bRH2
	 2TM5SSXE3ypCWprlh4sp0L0jglSZlckwhhFxdquewB3RkaI4b0K5Mym0sVBtoVQ7HwMLd
	 J1XYz2hKaaC5XgNZvHc5isV3JEC6uR6axsjjCV7WjuJQcVhMwYIy6ILQ2kKXA7e5XiWZm
	 YGAUMmIA0LO1fxYELELHjwO7+CrIER91SRTX+9ccfhI21yk6cdnowIZ8VXfFAYU6SGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JjbJMrJT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6iM0LX+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD99A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD99A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JjbJMrJT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6iM0LX+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUlDB2649289
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGzTYdCVsxmaWjlskvTq5xiHbCG8jSfhPOvjHrpWhpc=; b=JjbJMrJT5aeDGri8
	zG33fdZozbqBvxfkvfhHBByNX8MMIU3wGoacY49uLACB423vT4lSKXvy+w+XXtxB
	fDxbo0bHVlsuByp5tr/09jjso6SPoksizMONP6xMkkowQPfQNRTNQH/eAaOaxtis
	veycPeN3CyyG5uGnQ03k3rhSk0xM2BenEZB0KRVUwyYTP51ey/Iaerbz8dTodDUK
	aYxPf7758708J+/bXrhkyb7/Z9IC1xuGFh4BmK9YfM1MLHBUFaZ6OlCOCs3SALOn
	TS6DrRLU01/EPGVHj8m4d49xLDTcdV7Tg3Z7fgS9VEWzazrkLdr7YGY0sLiYlBXu
	bjIK8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqg31s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:52:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3960dca5so65401285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704769; x=1796309569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGzTYdCVsxmaWjlskvTq5xiHbCG8jSfhPOvjHrpWhpc=;
        b=F6iM0LX+/A1pLjMl/zTVtqNcxBkgRdcl6jqELl6Z5vP8pLOsRvk3X5zBEBABa2wizz
         Xlb17lGvvaIiHkGEbSpENUFPVkySyKKSxVHX9ERKj3tuUKXtk4ZncRKHjShv9ZaRMDBq
         crYNWnXAEv4qULtR6ya+eulufk3qfhnp4cqRyIwodKyyloMi8fxBGKVFisoHgT8CdpGQ
         aH7i+iJSUR1avbST6iBipQSzr8/h7Cec+V2AI3oa2oOoTDMR/8qM88U+VWnaRyg25Bz3
         p/jC07bph5lgkLM3bZXd5aV1A++8E8+9Ku5T/3QV7nY82rStIoeyym2DldFtngGLoAX8
         t/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704769; x=1796309569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGzTYdCVsxmaWjlskvTq5xiHbCG8jSfhPOvjHrpWhpc=;
        b=H1NHocNj0EJoHIiXI6KVekDh3WkXjake0uSse1gy+dWksTxqdFoEIwSF4P7zrdJHS3
         XbPVAejhoWNkmqhuUwH+KssN9mIoXM9BmDvPVjhkx6+hNJemu41VWJ3NaQblEa4WOI1m
         6WANILGvmtels6LgxsYld99wnATSj/ByZEFh+fBkUmaDFaeSNogE3g04kunIxGK8hfX3
         cR7QLm7MZdqgY0+zFKMlH5EouRFv/klqn/ClhSwx02y0hLX8lQKelrKZOH7xFLAMi2By
         sJej+97Jz19CRDdZjqvr/7xGpQpFx5/OQUSzlW/F3tnEPByeYOHpmc5Vjrumq0rhiigO
         r0hg==
X-Forwarded-Encrypted: i=1; AL+hErExKYutghMkS5HdoXfezGeZZKWHiVkxX8kX/te7xtcxhUYORb04mPICUM4o7PpU3B4hfX9C4WSAzvA+hRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2YFxJt4iTAAaJz07cBGm1C9KM83Z1dQBQ95+3p3MF0vZZKctk
	jkpE6BOMPJK0TsaFMJ33/dopwxi+UGS7e1RUf1UZQKHC83TaUVdpSYKfM93hIOJQiU7Po5jfQn5
	zeu5W2SnUyxN1zfOpjT9Q9+IeCvIcvBNw0aq1Td1uIn3f0eeMVkV6mhTigm2LGajWhEs=
X-Gm-Gg: AZFdTZf8JWPyraJlsX9SiYS7V2+WG1YWrRZUFR7LeVy3ZYNCUWaPu2PYDOOpfQUNTcj
	7Alc4gZ4Pr2jvi9g/sfL+tSgC9MvO1ApIMBzi9WPk2lTLrPRgIym37/kwb6WAK3aeFsEK8r9m/B
	rwHxrtC/bgsDyYO7TMHAKu6Zv+k6GWAXy/Hjbo94cEgQlgO8iM9FgpIKfMU4y3GE4+smvw2Umbw
	PbwWLUOAHacD8syUq1YOzk2+EM4A4o8OgKbXNzQySVvsJyEgfm9hYpVvVcnA6LObVIucXTqyzrZ
	Mb/hKhrXPvLTOeuQd4o9NAI9FaDL1uNfrcv2+jag+OiAOlv2e2FF/8HTYtkMQsIlvcm6K8NEBlw
	al+VOZuMNEcjweMFmFqk3lDPQkguhQUaobT/k7RamtyQnwiIDNouKVxkECS9roC3hPEFW0Go=
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3715305185a.6.1795704769179;
        Thu, 26 Nov 2026 06:52:49 -0800 (PST)
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3715302185a.6.1795704768733;
        Thu, 26 Nov 2026 06:52:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370faeeasm10019939a12.22.2026.11.26.06.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:52:48 -0800 (PST)
Message-ID: <8b7a834c-4e59-4f87-a83b-5d30aabf5269@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:52:44 +0100
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Enable
 PM8550VS-C
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-5-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-5-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nwmYO2El9jH2JOFrHNgUa74o0BqeYQW8
X-Proofpoint-ORIG-GUID: nwmYO2El9jH2JOFrHNgUa74o0BqeYQW8
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b0847c3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Mq9dOPq6Hou_Oe_0EYsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfXyMVIKDQBS9Q5
 746jFVpPORDG5sdp7WXyrlTC98nkPSDZAn8XpJFeTE8lvzFC7VCyhEWd6rDLwRWtE4mywy/WUns
 /hrCGRXxqPj+t54HJHch3czIq/VJgb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX4EUiKdcXkacC
 G6lk2OUUB88E26HOap3VH9JEPCbQzE325yZ2u03nRqduk7Sjp8/gu+6O2hqOVZoeo5qSiRDuLeQ
 RbJ9rXG9OscfbMk+64ViToek+T7ebkxA7+0CMDWpenZE8TJ29H2ohPYjyHXUJnIiCZ+GS9wt59R
 zuOI5ysTMIbcNrXGQ/fQVjEXZEoiXsjwDy6lGZTsRz0KwbH05qyHDFSKRLjWVcIEwKnfwMfrMxO
 g0rUtrVzDh0Bar9o+rI/uOA7OAyB+yS3NVyjBS8v27e18tVmudjmCHFse+ELqMY6IQMLvtS+aKe
 xV0VrFA7ZTknurQpN0KuJi43uTICi0ahx8dru1js+8K2d47lqLdtm1OE3eDEbWm4+H+MUYGmQbb
 iDwwCbOoDnyjKWMqCydtrgjYoncFp2BF6HoU3mXPwFmWeGiIsx6ax7d6VubNg6CqkrK3mWpmW2f
 myuRSZUt5zpIgFb4JZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> The board has a fourth PM8550VS, at SID 2. Enable it like the other
> three.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
