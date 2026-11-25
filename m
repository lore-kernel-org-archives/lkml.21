Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599935;
	b=lhWAMewEVu8nKvAnvbafAe+rHs3bCIc5B+eMl5zaJhJQapt597WgyUHmWWTYwR/vwHIu
	 FJ5dBZnR38PykzJP/M7M42XKpThKEb13E2oqrANEXqPWl3EUhhuLNP4nJoOWLBZrEzqB2
	 QSyhKpG2P0mkxplfrRWlgEQo/7878kKAG0/9CaN1LUI6BWY/h2PGRZM+SHmiCTT7cOvuK
	 InTJ+CKNdgwoOjEzwAReeQPaf3eZhx4GBKoXn5T2JF0/stfVepd2Ie2R7qxDJF4uY/ieg
	 QgY8nfDFiI0//45lRcReE3UwGA0W3JySBXDw8c79cvIfW9vOsJyGWG/vReHQfxSlb8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NvXtOvEwzZL3rVHSTXfwhOmj0sD1jdrLdqsI9n9mBj8=;
	b=VS5Ku31hNGPn5EpuqbgRDYsQ/M2sq+RfQ0YtTNiLK8eY9mLRir0+gh0TLgzCoRpHcFl3
	 QAjYKLkDhdILf2r7LPpaoQi5oAzJeoKkx/FFgnYMZhWcP9W4b+jXtFB6/4iYMDBbUpxUz
	 ES3XMnShMH+YQYBaFkQmEIu96Cr9FSvJtAa4k2MxdZ2WNLxJF0Wij+oW88tEc3EwjPssX
	 GkBOUSFaPkw41ZYEADRgJF0OzvFKPEXf0I5gvrYpprcfqRFzVSvYo3b6DuFGLzjGllkTR
	 P0QiYwQpaL4x73eIbguy2JvPMoVX8L11OjXYfWQX5Dnv60vNabWadw6PH3HAYQk7+2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfpIUnCm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dmi9y64F;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9AC606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B9AC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfpIUnCm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dmi9y64F
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68vjf2629925
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvXtOvEwzZL3rVHSTXfwhOmj0sD1jdrLdqsI9n9mBj8=; b=JfpIUnCmPGmfQ+JV
	EcOfg0YsGAxyNWnGmc6mIIkLWE3hR0i9O7/T+i5tFcd/vko5sKjQLQlTowOZA+YK
	WMTcuLpXQNqORghCPfUkJQsZ/gmc6Tmr4As493xLl1DV5ziuCxqfa4roDsLSxMLp
	PzLUxxzARgRCMbZlLA2D8RJ0EnKPiuFCRN9SqYsvwO6QHTurL/qWdOfohadEzjAe
	S43XYu8Q7ljfjWdPx1mSjD5J0NuyZYV/Hat7nl7ukoMr6fmzJVdweN9z7ztNckCo
	u0TsIxg3OoU96oTLvDSvJ+/u9EN7ZZ0Mm542NCQWiQO2UGNAu/uenMsg7S0O+4N0
	3jqXug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbgrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:45:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9460411fce4so31912385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795599934; x=1796204734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NvXtOvEwzZL3rVHSTXfwhOmj0sD1jdrLdqsI9n9mBj8=;
        b=Dmi9y64FyShY00JG8GyzK9zpbZb0WxzmhPwXm7or1c4AbM/oa2L6HnNTiNinP9oTvb
         2TZ5dlW5d0xSVBjh86zf9ksMZz+Bj+kgNq4maFkvJ8L+g9xYvMP64KjwG7rpZOab/0Bl
         bOUzKVlrx4wPVPv6A9EEaH+VgkuZ3w6Tkj49lDERKFDQHDg5rHOJH9oTYGgnQJeHeLSH
         ZHpCDk43++cQylGofvoJTNgfXiYsw8rdrzBEcmd7Xh3IsogSdsRcF4kzUhPTzAkvnv0d
         h3zT14akNPwSxFo5lL7t25mHM5RtxHhUqkO0vBG0wPvR2sf9R8DiqoKdK5mjrMuiUuEd
         yNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599934; x=1796204734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvXtOvEwzZL3rVHSTXfwhOmj0sD1jdrLdqsI9n9mBj8=;
        b=mOQ0fHkdrdbcjTS7d3HYA72ahnNx+0cHfdBH5TbvwLaMEo1MOX2B+xiF597nw5p64D
         eRa4hEpOtSVwF2Ao3afhuvmKXvzR/Q665KuyvmUUjAgfnL2IbxMrhHEOoN6JF4JlEDY1
         IWDi6odSWThQE24D8H92iUHI6tz2zupB41+H1SL2yo6WmnH9dU7qtWHyiSv7rQl97Wji
         VSMBQ0bx4G1Iuzq0tZtFCuoQ92623t3iojVv1N8kuE/COboNFDEbfZ2GUZCcjyliR1lm
         I8uV+ddXOEBXKTUZEHmYS6TD5A+PO4SiIemtYG/vJuTf7fEqi1UAP9QAwhZni34glAhl
         W+xw==
X-Forwarded-Encrypted: i=1; AL+hErF+s0fuEmxuIeQ7GsAz3+d/ggYk1jDBITxyByYkJ40vxEMb5Oxvgmqqq6OfI4QI525QhqBYsV9q7j1TdAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VJqHb7Z9krh8TYRTXD9NklRX7KDLfV4q5yAq0p4NrNdZGotFk
	LpaR/0bmM5bh8DdbEmFIoK8lA29vIGuW9Jy90x2jnoPt2qNkg+DtcAQDhC1PJQQ2bgsEomUQpLN
	8p5ePxHmFdHIflgOq9t6E5lfdCQB8QXAU00rs8vsgeLrKcZ7MbM9Ot15o8D6nMqJAdIQ=
X-Gm-Gg: AZFdTZfbuyZj0ZcEAix3Z15rqNdVXyyBzr6an+0uqHLOfVE+AL3O6Lji8MT0hbRsetE
	EgxEzI9G24CPcPAIxpDtoOpzsz53jx03LhPOt9+lRJZVjm5X3CCBzhqxE5fkiU2uIjTNLz2b2+m
	zll2YDS1m+MJ++3zmOUGdw1a893WL01fuxLTREwcjKkdzkR7i59NowTJg6FxUCZFfnmWUWAuGct
	QdBiAp6ierRdkg4xYa3NVrwqPWHIUaeJO98tt5SSZ9gUGwiyClINy5fZ09WFY/lKenRR3zCvW46
	16vro1Iz9QQ5fxe5jX9Rr+dZkEXwq/gahyB/+FOo2z7LliZnMDjkur8VB1rzph/+Y0YFDN8j049
	5Tp9lU24COQB4m+EPGQwPhBz2ns0l0WEwVjIgT0jiTXyvZ4bYhBKx8P0ZNrkQyl4iC0ECYkA=
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2879603885a.1.1795599933598;
        Wed, 25 Nov 2026 01:45:33 -0800 (PST)
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2879601285a.1.1795599933086;
        Wed, 25 Nov 2026 01:45:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm1320136a12.2.2026.11.25.01.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:45:31 -0800 (PST)
Message-ID: <68573981-f9a0-480c-806a-0980cfbb6242@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:45:29 +0100
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
Subject: Re: [PATCH] interconnect: qcom: Don't read back BCMs without an RPMh
 address
To: venkat.yadlapati@yahoo.com, Georgi Djakov <djakov@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261116-icc-bcm-readback-v1-1-36b533d66a69@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-icc-bcm-readback-v1-1-36b533d66a69@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXxzTyRittYIum
 FV0L9cLELEv5QcAHHh3ncYmGpocLZKZB36bBZBC4rhgDhXWi7cmbkchTLs7MOqI2Ju2U1iidZiw
 SGuu9T0tJiCJgJ/U4QYbFJyOmpWXw/o=
X-Proofpoint-ORIG-GUID: ok-GdteQCI-9fIvkCtpmJJDF-VYa2jZV
X-Proofpoint-GUID: ok-GdteQCI-9fIvkCtpmJJDF-VYa2jZV
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06ae3e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=CjxXgO3LAAAA:8 a=CVOz8DntD0RYTBbE8LAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX2ZuU3LAQEDHA
 dbRyhcB4rMI3x/YPVqDpFjFP6R9tpbwaEJVxfjb5pdk86+iX1jPc9GU3NpZ8RMG98jDe4juWbWJ
 mePtwqqCHga8IsT3ja+UYatSzg/6eKMx3Ff8WsYp8SHdrtY/PWZ3U8EVSQ9bnI1p3DyrZSHD0fh
 +aLagUzZfsNv1wOeCuuEXF01p82Ob05+j3R4J9AoPW+ThNfIrxlAAKMzlIy9JmTSIIrrQQxvSYC
 I3xQy1SQREPqxMh9rwkLAU7/3K00sbN9FrnbvCsfRWa19AsdzVXlnebVTBUO6uQVyVfVCEm+str
 O4EoY7Dc5jGLu8XN8Jl4bNr+lXBm00jlXH+BukAGS1SFXVtpQj7/tNGMCzcIPLiC3PKwob3YnWI
 3Sm+PQ/NvtW41GfjKeBaRPPZcFqxV5JJ7Y76x0bKub6ldMrcZX24txx9Sc29BEy4OuesdQOgnTk
 XMqBbchSdyGFLv4INNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/15/26 9:19 PM, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> qcom_icc_rpmh_probe() ignores the return value of qcom_icc_bcm_init()
> and reads the initial vote of every BCM back with rpmh_read(). When the
> command DB has no entry for a BCM, qcom_icc_bcm_init() fails before
> setting the address, so the read goes to RPMh address 0. On Molokai
> (SM8845), whose command DB lacks the QPC0 BCM of the Kaanapali gem_noc,
> that read never completes and every later RPMh request times out, so the
> regulators fail to probe and the boot stalls:
> 
>   qnoc-kaanapali 31100000.interconnect: QPC0 could not find RPMh address
>   qcom-rpmh-regulator 18900000.rsc:regulators-2: failed to read ENABLE status ret = -110
>   Error sending AMC RPMH requests (-110)

Fix the driver instead, please.

Konrad
