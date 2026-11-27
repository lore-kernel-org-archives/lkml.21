Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773063;
	b=nAgZD26dQejqXydFRkuyqTKoO+6WE70TNit71LTnptuMY3Q/c4u1zd54GbN6Yy0kFH4I
	 eLzbiUrfr1FXCRK6wChwyXWw/qsrIk8g89dIulJRdjELgcVLBx//soEWvCSzTrJu52GAE
	 zpFPH+mLnWJj6QgbmiMf109rMSzmFJcpO7/I1y1LC1GeCGKuMHHcCwwlkp0GTT/MVKjBu
	 4PxjDMCwxh9y169cadhKqLX2JT2XmjpihBrhe9hCXYeG0MW+IW0ebAsp6gjldflaeJknm
	 d0t2fZFdMD0Xc8Cbl7qaL4h9OPNv/hb+KtyXISwtsqoq3aPaX/pajyx3yPGgARfKHng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773063;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A81/evmtXSXLzvLuiLw8StiMfkySlbyx4fD1Kh2PSYI=;
	b=sDFzm2OVVdnQjXzBgNfzCEaZBR3i0pAzAqiwGnEJXZ/uMEIcLqUEAccdrUO0dRGXCemB
	 iHJWNOmOfMvJGTHAGT9YzCp+wZWC4Uv/F8YL2XjtJb3QSBQK3nPdWdeo6kO6UaAOxEbeI
	 bbmDmzTIoFmvrLyz07aBFJ8KVva9IKo2blafQnvjOrbg4EOnNgGLWoQqeRoOD8cQ3+my3
	 YpvUMNixdzTqXn/mcYX2WaEJNlaupQUdss+9dhX60BjfYU6H4Qkgfc6N7dWRwqLaKid1X
	 9o8ATlJkPV/zKF4b+zJh/njSrac09thnIT2GwP+VOubKerqENgzWXlASTcacuhN1mgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ae64XGVr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpXlsv+v;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95DD606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D95DD606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ae64XGVr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpXlsv+v
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GbuB3759035
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A81/evmtXSXLzvLuiLw8StiMfkySlbyx4fD1Kh2PSYI=; b=ae64XGVrDFdsC2dL
	t1qoaEHuj4sOmQrjztuSDgEtSAmiED4B/yJbpt4LmD/I2QKxe3JCAwjsBAbPQxgF
	BDFSjsmgcY1Js8BISsFGMrJ+WoMCFF0eN7a6ib28gMNobVKVse9odgvqrDPhu2KJ
	MmdeOcCS4TGPOj/dDhUUtLvFFt07ZwwUgjtvTA+xle+97EQ8TMed4z3nXgsePb6I
	XAXsIsW9YVokD/lg3Qcw3abpRLZCo84j20aEoF6dtMQHT7qBwu7B7alZ7e1YUieH
	GYq4Yb//Crc9urwpT0nIjHWPBwR7V/MUOn2tpKjI2UsH8xiUJC+C1KThXb73oD1i
	fFIy+A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6rt2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:50:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so4789489a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773059; x=1796377859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A81/evmtXSXLzvLuiLw8StiMfkySlbyx4fD1Kh2PSYI=;
        b=jpXlsv+vMpOTJEguY99AhFXxNHoJ83C6PYEobd0QjtKeZIPZmYRVNE4v8EBZvRbUB5
         ckATbqDwUDiM9JuE7PR0kRPPgZHU+jY3PwGASJq8wEwm0vxOSvAlwdQI7VdTc2zOuDTP
         cHRXVG38YDBruA9S/8Q6+kw/lbCZEkILBtTCkhEhY4YS72CKjeCi15hB6SKXnjpuXE3E
         Epo8iznUpdDEtmMlrZEQBAcqYADVkHOpdQCBY53mJYnSGOqrnGBu7D55yhuQ9OEOt2vN
         x6Lb/uCu9gn6GFdimJ1cOHgvfpqNSRPWf0VAEA2GjOnuGw7cFyOfhKX3s8tk2v6URm+v
         5DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773059; x=1796377859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A81/evmtXSXLzvLuiLw8StiMfkySlbyx4fD1Kh2PSYI=;
        b=b1yUW5PwFv8ZfZdqi1uEqzEVH1Yq1GIxvf7fmqiOUY+CrEjML3qKD24Pd4Iy8BOZ5o
         kNkkALLHTCqrC6A7tpw6Qpb+YcozfB8eB4wYPi0R7r7BSSw7n2vEVLWcQEEhE3HmkP6I
         Wn30IPuM6YYHyq2ss8S/mYkTdOvwM9YjudQGYwhkrRpvA2cfM/oIX4101L0Xhf3lQ3YM
         G0El54nXbTLzZPL0ByjRPnt/7xPs482w3SGulEFDQc3AAcCyj/DiP9HHsp0Dy5JYAdbP
         HPTAJkeJPHCeYpystl6hxqcPPCy/fU7Qb34jN8CMft1Be8lcILgC35fAnvq9HAZ5nRC4
         0wbA==
X-Forwarded-Encrypted: i=1; AL+hErHNTWRW+xxMeqLY8PKzIPMKxCuUAzM2CTNYG6l4gVQJZuwdfszhFjuiMfw2aw9pig73oagOuf0n0qbBsHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gqK7gDZEnTrx6B4HtIOXE+l7aXT+JDztU+/Km8ofrT9yAx5wT
	BsjcMDxhpy9M3Uyr6UZCGSfnjQWkFnt9f6pAJuo0bhzBeqDBsLyIIJDtNxiPMSSDbOyJHsFSUaW
	gvAfldsEtWiPny0cc97YpuqXbPoOPUx8uKAlJSKJITfpf5XOp1et78Rohh6iXmn0VuUc=
X-Gm-Gg: AZFdTZf2tEdNYSf8LTu1ICXkXgFitG2cbyOcKrnjNEY8bVnP30MgCuOciVet7GpPXNq
	eUaOA2f6zgjhe6GnyU08tSKqZf1s6marjG7qqBQP+9qlTUjgiVvy80AQlMEI31g7bLV4fWWnDEQ
	gTFbWUpSSEcPvpAewCqzCNB9RhioqEgKR7/iyXswYUXcfjXWsFDsNkKwu4jfWqueM2h7nzHkWwt
	ktTWIuabIGeHjJ+6sm+8PXsLtPBW5Ojo+A7+7wRWVrLLk7Q5HRGfyRhymI/L1uw6LpxPF3UpjQ5
	hDTBaPdzg4WruWE5StoRYXX8+LWCkWwBnaH14RqkoWjdp6JCeBc6Lp+nmo0w3OzlNxlGjXlN3u2
	n2mfDrGd740/VOJwx0DYpytf0PehG2qnU+MrsPLqJ+bm8UHPnzO6U27Qdh69hiFS4JGpnbsmUO7
	knSOXlmEHMCwaUHOf84VI5/LjDt7iFOxa0VgMdw1+25EM8qaHVAnXGuxgWS+4sHYNpjCi8XAJbM
	gD1
X-Received: by 2002:a05:6a20:b40a:b0:3e3:37ff:3797 with SMTP id adf61e73a8af0-4014bc4bcddmr22367459637.45.1795773058832;
        Fri, 27 Nov 2026 01:50:58 -0800 (PST)
X-Received: by 2002:a05:6a20:b40a:b0:3e3:37ff:3797 with SMTP id adf61e73a8af0-4014bc4bcddmr22367439637.45.1795773058397;
        Fri, 27 Nov 2026 01:50:58 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm11467784b3a.23.2026.11.27.01.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:50:58 -0800 (PST)
Message-ID: <920b2c6b-53c4-46d8-b949-9c50795ca15e@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:20:53 +0530
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
Subject: Re: [PATCH 4/4] remoteproc: qcom: Fix bounds check in
 wcnss_da_to_va()
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, sibi.sankar@oss.qualcomm.com,
        quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261106184312.100-1-atul.akella@gmail.com>
 <20261106184312.100-5-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261106184312.100-5-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Zl0SBiq-IhL2sAppDYsdpjEPpZtbPeZH
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b095283 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E4ycadI1TCjYcBWHacUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX0KuWLYaE9XE2
 IWCbMXfgJi6qkWldyKOUvgZbwAckOW494TXLPfRtxeF+27Nsi4WZODhfEwXMTKX2aa6wK9Fogur
 GspxWmNCmyK1pspeqn/VaSX8ixc8H8M=
X-Proofpoint-GUID: Zl0SBiq-IhL2sAppDYsdpjEPpZtbPeZH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfXy0YBLqSecrLk
 M0Dj79M2d30/LEIfk9tulPc+Z9/7qRSds2+Pw1X9WRzEIrPXMBufp2qAHnER7li81rgEK8xd12M
 p6vtCIyUZ0+UST3pb0br3qOARbM2M05UhYDV+yaO5VrleB0mycshRm/afTjenHIVsSSp4/5bbHy
 geCLhYh0pgw1G/8CdbcCZdpRvo/VF+YL4633U5At1p4XzSkUgMgemlqyeoDNFAOCyHzPHqVV5BB
 kUGRlOnYhcJwKhZIe6SLrjGypMxXoE3zqV7uvzEUi+C4cueQ3jhaI7EA0MM6CDgm6eAfSqINi/+
 1qZbA0hAuXDmC8LhdYdkcd8YYsg5Hi+gxPhs5JK3lUvlwXggLiUlMpeRZXlGlTKTiZ5++KYMSQ0
 tqFaPXjbU2QEpQhoOowsBq+WkL91VNP1rXkSG8MLF8aKpQCG8ZeV6KWhozABNcefAI4sU3jr6Lx
 CaIiLkGYfYHv0/KNiSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270039



On 11/7/2026 12:13 AM, Atul Akella wrote:
> offset is calculated as da - wcnss->mem_reloc and stored in a
> 32 bit signed int, while da and wcnss->mem_reloc are both u64.
> For a sufficiently small da, the 64bit difference is truncated
> into the 32 bit int, bypassing the offset < 0 underflow check
> with a small positive value. Additionally, offset + len >
> wcnss->mem_size can itself overflow when offset and len are both
> large, providing a second bypass.
> 
> da and len come from firmware's ELF program headers via
> rproc_da_to_va(), and the result is used by the ELF loader
> to write firmware segments, so a malformed firmware image can
> cause writes outside the carveout.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < wcnss->mem_reloc).
> Replace the addition based overflow check with a
> subtraction based one (len > wcnss->mem_size - offset) so no
> intermediate sum can wrap.
> 
> Fixes: aed361adca9f ("remoteproc: qcom: Introduce WCNSS peripheral image loader")
> Cc: stable@vger.kernel.org
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---

Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna
