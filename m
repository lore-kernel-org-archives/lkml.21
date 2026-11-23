Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447399;
	b=aiu80vhSJG7EzfstkXxeO4U0602Tk0lDT+EzBCsUU+vuYeAJhDjX74Il8i+4VYVMKgIj
	 JpsvnxLoa4g2Gkpsd28cOWPOg6/L46w9M4mwGJzbsKdOAjAhfGunOUQUFU1S1TL9xDPvK
	 oX24dHVAq/PffXV9QtF4bifCZHiDjtvlORHkR68ohNBjp2BloZ9ewaih28HrUgsueaYE/
	 C/eoLSe4p5LbNUEIyb0r3I9cvMQH+2+Sq+fUpyc1MTD8pYL7eJYMgHtS8AT5Jw79xRVri
	 Un0/RuYzXchmZ/H7Ous4NWCI7MUJqH1hBCycDkYacMIt21I2nF3SqtL26P6qvQ8YGhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mg+OgzQ4tpxhMat9cW58EZSWkaQSb11tNf1CS4bvl6I=;
	b=ESBxEkN/+SIibRvxBH++vZx4iCWbv4JGqIPw1AQQJc1HpCuiEE4LbPUHKwcdTw1LPzEM
	 OyJejnLrv1JSDL//fKvuduQh0rxs4fHQBxhrWoCESQS/gJt5+wmqix6becFYQCPB+0wSI
	 CL5W9RYi09bxxSfW+Y+HkB8HqntLI2Mb9bRnaukO5NpBjEWkdFFQle4UPvVCl0iGGQbC1
	 LzYjIJ3sh5y7zZSLJ8QT/lKR3v0v6xr9mFFvRj///llzA/8OifLaUlG2+Ug9hEVFY8ohf
	 Hmn4tNurhXaKef0TPnDQLaUVevUQkWITlZvnoVwGtntsmusmzfevBAFGe5JSPH4Apyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mGWlM/ip";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvMxHDmC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ED6606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74ED6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mGWlM/ip;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvMxHDmC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL0qb3072381
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mg+OgzQ4tpxhMat9cW58EZSWkaQSb11tNf1CS4bvl6I=; b=mGWlM/iphsIpsRJC
	BcX6tCQe7ZorvtRP0AOhW4gcjfHcYZ0JBdt3CEu1UQ5Cs/H3I/m+yCDNgGGuQ3nV
	k+IbOXudP9tQYOrgbY19ZVum5Y//wqcG4zmu1usxUxw8b57rPwWZLwEeOoO49qYE
	Z1XVgWDtwAT4KPk0E7tx1TE6QB+5WqnAIJiZIBLb1Kl9V80fU3Tx44/ULGrzOMQj
	rYcEiN7zRL3eVaKnHxzRIO4WTiHC8TTdp5ndTNt80y52bMyAH2R96sqvmgyPGInf
	pd5/63oRX1Qo8Hv/PUstT+kJc6rp+5dVc6aLnb4/jB+D9cX8NhoLr57lK7eRr6OD
	9EdKsg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7sp1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:23:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2c5352d1eso158249137.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447398; x=1796052198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mg+OgzQ4tpxhMat9cW58EZSWkaQSb11tNf1CS4bvl6I=;
        b=fvMxHDmCwHered/RPNTurJygkLN8Hh507+G33kgBcktZiJcYrJY1dexfGv386hlUcc
         UIlrkSdB0cum5Y5STJWHYrV88EccM6x1IF42bk90w0i2RrY8dht8YmlQ9tESPb/CQU51
         f3p9lVg9wbXDsrk5FFtJGYxNeMTzlmIRlxXrk42RpI1uhaGLAk/JZWfP7g1YuHaaYD9V
         EebOQN0skwjZA/p6aqcabjhzRRK34BIBGMbgFFS1FC12PAacZf79hYQMkAhLAGzTfeM1
         Ez0VdPdAe3g+TqTDFraeAXPtsP+tHX2+IeL+fEupRurCee+VYG6WijgiFKJAGFE01g1h
         l28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447398; x=1796052198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mg+OgzQ4tpxhMat9cW58EZSWkaQSb11tNf1CS4bvl6I=;
        b=X60FMZuSxFDYMrhRNpBGP16XT2+kPyE6HczEfFc4S3A6qdM4XB295OxQV6nntGo+Cj
         t5x+LqzGB9y9P8wVxZ7T4PIcxKf1ZptTRimIJvHRL7InNIO1ow1/9C7FEzGH00pbU3fc
         AouaL5RkqFEQmxcgOKojiyEibq9McOWSB8QmtolX/Xjh6LuanA6dyv7jGA2fI2SMsORZ
         jRybqqffr3rhxx/A0txBBXf8ZLWNayrzFGobQu9nm5udQp80egRUUq/JswrZVDjDUkCF
         d6cKsOWHk5JTkzo0BZ+jVtV0jnDUsAQTZaYYNKArFBWYw4781aKr2ymi+2tIl19a4lls
         SaDQ==
X-Forwarded-Encrypted: i=1; AL+hErGRVP1MXhD41XgAuJEfcmcpciamu8soEj/erW4W8FbV68uhlVhszRifV/AuNlUfUi/NySALlkFAKmsazSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uQHOxiE06OgbROqnkAEiDe+LU/cUdaCC6Pxhu9mZxIKaDPyWP
	JL/R9lgqP5ltrE1IBeBQn8oMlVO8CVsCEHs29J+cCiSYP/DN8DB1vMYTMeaNtYR5PtubrjDUX5w
	Zv4GoX/cZM4VilT18i9P+SBK6tGq0vAFpKOMGIPHGF3WIN6wn/ZPHJLQF3p0w9iadtTE=
X-Gm-Gg: AZFdTZe6h1vlQ7tS5/1hKEFvN+ZRcYajLsQQTUrPzD08VFLc/+6v/EFcKRJgxnWlSGr
	5VGL//FxudvVDrNTxD8Pmpoxvpf/PqJPPy2qRhizfKW5RPEIGhAb6cIMXBRHbCl/AbWBHPV7Ac4
	uDR4LUGHjwNjnYEnNIZ9163JNC45SGh2AAyZo2SXfEIHkfx6h/S4UiUdHvINjJXEvkTHi9pq9Xm
	IkUL9CMyPXOZ6M6ApCZ6E3AxzYax8dcsa7GKONSmCFrRtdi1Oc9PvNIxhILIQNmykaG7yjUxkgq
	7sAJYuuv+HtzmXmO+di7g+7PV7BPUZ+4GnhaQ4sKJeQvkLdeJbChvxnQ8X17634UeOb1LA6yrnG
	5+YiNS0cdOwsx+3yp6Oanr6RRLQAMlfTIirIYdy90LmKN0WAQx0E9+wykZo2z1FcmCGCOV5U=
X-Received: by 2002:a05:6122:6b86:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ee8adec997mr6972869e0c.1.1795447397519;
        Mon, 23 Nov 2026 07:23:17 -0800 (PST)
X-Received: by 2002:a05:6122:6b86:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ee8adec997mr6972787e0c.1.1795447396812;
        Mon, 23 Nov 2026 07:23:16 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeabdcbsm420368466b.46.2026.11.23.07.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:23:16 -0800 (PST)
Message-ID: <6b036f68-e2aa-44e8-a606-e4c334587666@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:13 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b045a66 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OlIfnwjDZ2IE61P4k3wA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXwPJImhcy4tZx
 Q+Oq5kQvGSUcWMqa2ppIYCsXSXX3DG/4tqJVu3SWWmVu3G/gtrlyN4aIUMOkuRjuqCFAqOWl568
 w5HtgExkuGEf9dfD8BKupqsdLXs8+YcsQcZro+Nez7vzVPSydhKa5p1WPK9g6AhMR2uNxc6VBUx
 1JpciehrBBYSDHYr/GIcyLo88GUsLpPXEU5OUIJJn1mV9i2+vOAwDZbZVff8AyP9eiEeTyerPKy
 yOh87MzyeVhK8G27NQpJs+QTO0+sOOmlq2pE3+9sUQypYV91Bdol2pv9BQlctvvowEjpgTsNb/I
 IOLChcyBc+lCt7qH0wzsUja4vJ83YOrKOd4lM45NoNsNXjGJbLe3EF+vdsCYh1XEDPDUMNfZ6Ap
 skCPwshk3Aa/njmKY+p+js74GAIwnmbCmfePWycB7pkEKRd/hRmhdq2ysLeLxZ2osJg1N+EWAdR
 VO9GLvV3qOIYJKY9zIg==
X-Proofpoint-GUID: rsTIfgSIcM0c8HKnar8irDavGrKb1usR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX0Y9ygynYjhxR
 OmKyOv73kP1jn3NHzZybjk8yWI9nnK5s6BUbAQx6abOeNn6lnq20ZkCX4zFSSG4R3gQ2jJKpQSn
 tdbQatbIkA7zijUvko81VaazN8BCSE0=
X-Proofpoint-ORIG-GUID: rsTIfgSIcM0c8HKnar8irDavGrKb1usR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/23/26 7:18 AM, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts and results in XPU
> violations.
> 
> The violations are seen when Linux runs at EL2 (KVM with VHE), where
> there is no stage-2 translation and the write-combined mapping takes
> effect. When Linux runs at EL1 under Gunyah, Gunyah maps this region
> as Device memory at stage-2, and the stricter stage-2 memory type
> applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
