Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011058;
	b=T0oNQRPWgPL8DFgFCNbxLH3eSCm6x9hX8zgiGtnETC684nHO/fPKUlxwBQFbk7KW1JuJ
	 3wx7gUM61AIEpJEAJT+5gfWqpOjy07XxS4d6IFTpFcT3gZyip/ysjA6vEjpFKLZhLC18/
	 ME9dDVxEHnZCR8ZB7fprrYXyM8JqsRUy3NG2F3CoHeI5k77sqNaWL8ZxGdealoj+dxiKb
	 uI+EwNR245E7BPXA180YAasYpT+jqrrVx4huWU1hdeT8a/048H3trY/moXH7jy78ZCWjs
	 HVOQiz7POP3R9I4qTCW5QX6o9uCg1qiqRGLQnmfuORuu+szT23Ux/Ac9uomQ2E6/WwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vVgoxX8wQpYAnqrIzdoNyOx27ZT+lPcYdylsPsy37/E=;
	b=kiuxICgq3YyOrww1C+nN/3FVfy4xHe0+F8kakzyDBkGTifxdBgMsn7EWYVj1dA/iFKfM
	 Xy2hCgRpWfsx9OoLsAXTGyf9N53PwDSnDktmTur5EHqx4PXDLs2Mkg1yLIU7z/WxzvbOW
	 TzcEEVJY171wYlLSw+YQbYluOWeEI0LegDXWVqmTyGOp2UK+kYtvq6ehJDJ/cRsGI4U9R
	 QU/k1ZJjP6gEJXRyD1bqU3Nn1aseAEzPPhdKYk+2rifiCDfDk/6tC7zLZzW+hTpU9KkIF
	 y4cwLcCbig1QnRSwgCmkJkrCzuLv6KeSXD94elOie1mIRqvedOxAfaaugJuiNdKnS9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pw0tKQz/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpwEBh3O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846B7606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 846B7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pw0tKQz/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpwEBh3O
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDoilv3501119
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vVgoxX8wQpYAnqrIzdoNyOx27ZT+lPcYdylsPsy37/E=; b=pw0tKQz/q0AmQYbp
	PcdexN8Ph2was0Tv+9jM1/I41OLhj8swhql6Qc2GMtTjngAZ+okU+XGXnBX2aLfN
	FOGF5bo5ddV9YGEQxFa4kmiGZB0m2GXRxVtdIOLLSFFc6g31oTN3Zjw8fH1pqgjv
	FpLTlm6choInrpH20Om1bztq6xYKtku02b92ks4/vCTPa16Boq09z3tMCe0EBO2r
	Ra2qhhqrBjJZElRpyR163vlXuKXR3ifxhFCwMnG/N2/IgLBmnlqFN2KTO6UsifFa
	6zgEZ7/ZgmWKN9lbM0GPG5bYKZ26AuolUc8mARbi38j5t+0Ga640Q/74n0xNCPTT
	ET9ZAg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8kbpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:10:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso1287657a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795011055; x=1795615855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVgoxX8wQpYAnqrIzdoNyOx27ZT+lPcYdylsPsy37/E=;
        b=SpwEBh3Ooc9818abou6YAoH+kcXEV+aYMyT4Xic+E8+NIAl5IkgGV2Sg2Owouw4Ki9
         sM+jRz+44Ad2Xqfud7IDcsgjLcXz1YkhgV0el14OThrubp2TXGzEwUEXoGZTxSawjmo0
         lzfUmS69CGIkgKbAn5pJ8AHZRUZruTj3LdYN2hljcHHYtPloof0PY6LWaFHXVzcOig99
         m+hALDJVtrXltAl0gMLCpEWckgaWwtTJBASQki5O+e43odJgeJ4wP4Re0poRMlvgwvu6
         xMgBGw/83eijNhkv9QzasdSYM6L9QlZvPldfh0SROWCvcUYSYjbahKxmdaCwk+K2GQz0
         nMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011055; x=1795615855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVgoxX8wQpYAnqrIzdoNyOx27ZT+lPcYdylsPsy37/E=;
        b=c6CqD/MSV5JYqESju0jzk0cWEzV/qLJOJkVDEg5VbdcU5p6wbii4MRwXJEcDBmNAUw
         V8oh74QpeVBUBQX9WCttFqqo5HO9xRPEF4Z5BSaPdmjur+mGt3hObRPfJxj10FCBmXLs
         s2TiXhGnLdXw0qPpQgZBkXY6U9y2phGl7FTVwkAE6DsBr+pcs8WcgUMooBy9p0yDmIqS
         OE9zjnTN35K5bImm2Ssukc4GhpBmeIv9wuIkFxe4L+Eh6Cws7eh4chp8iAeDizbsKHBa
         1ts7NjV7Idg7VC4cmm3y6wjxJMYdXQaIk/GNPitW5Gcnci4sYOnIRwweXJZg9lhv7t56
         zhdA==
X-Forwarded-Encrypted: i=1; AL+hErH6O2cJn9etWqja4QIvvLc9rt4Zg5AoWYE5Y3RZwnrNa6jeFC/gAokUhvu4QrgZdhFV6TfqHcJLYstTc6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XZ8dEY3HH6kPzuk/SNRYb/FuUSepjvaHIvcOO9DUVghTh/6h0
	u3NNYJYL//n/fN1GTJTjnA3DOF1Er7R6f6g/qhkU1dM9bSuHfUXcYU2Gd2EH/SonV/VIxRjbzCH
	YTPrtMWmxQpAQHWNqCwNX9A9S/bfYKNArDVjzWiNio6YlZpvnakGN5O4uCJvBxSS40Q==
X-Gm-Gg: AZFdTZe9/SPHWhJZxIf4NF5X9CHU6fO9+uZL/MbWP313tpni2LyauIwq0etVV3EPCg6
	xQtb3OCK3aDqvfWQaQODrASQFKy6/+7I2IQDMquyMfu0uNvnTWlwynRdbMPMxIuR4dyMx6Q+cVj
	zYVofX1LRoqd9cH+4nUBdoHHT6Fo+eeXgfUwnw/YG9+/KI1p3YmfQf/ZpjpilpSVfFsbheW3xDB
	fNCytwlOglR+COjDm+YQo0LPukAN/kpha5/DwioqCWncc/IP8BMwnCrae7k/kxFJ/uUjoRGCZVw
	zx9jvNxouUuKL2fLQdp3HN2oAXWVRw+b7wmcGuaJdlwKGiw9x1iVEggHpXcUzKUkS2GwyCwE9Ak
	QldKTqbaSB3CU0SfiOImVjsurYjmZHGfSq72rJAMP3nxS2RPSbc9REaHkwpfiiSj7pDX+DRJL3U
	L6MDsW
X-Received: by 2002:a17:90b:4a8f:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b3d074e290mr2948076a91.11.1795011055156;
        Wed, 18 Nov 2026 06:10:55 -0800 (PST)
X-Received: by 2002:a17:90b:4a8f:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b3d074e290mr2948053a91.11.1795011054570;
        Wed, 18 Nov 2026 06:10:54 -0800 (PST)
Received: from [192.168.0.104] ([49.206.14.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm1930170a91.0.2026.11.18.06.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:10:54 -0800 (PST)
Message-ID: <d32a30ed-77b6-45f2-abf1-25ffaf4f6c4e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:40:50 +0530
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
Subject: Re: [PATCH wireless-next v4 08/21] wifi: nl80211/cfg80211: pack SMD
 dynamic context along with frame
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-8-62e39487f51a@oss.qualcomm.com>
 <db523e851beda07c6f52f3c094b5ea2bf718af03.camel@sipsolutions.net>
 <338b21e4-b23e-4cc9-930a-8f043538f881@oss.qualcomm.com>
 <cef0d4146270d9f01384129f72259f9eceb08a36.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <cef0d4146270d9f01384129f72259f9eceb08a36.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mcHvjewySLNnVbaWI_4VOIkc-FvZe0ut
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX9HxMCgJOMNJb
 ikYnOKyIInGzXMQweOEPIsGlntSEHL1JxbjO4zPCDRDmvMs2Fi63ydzuoASIq0A16NDQDC+m5yT
 XGBfk8aUZaR4/ywahPzE/v761Q5Lluk=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afdb1f0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=S4TnAKnbd+bQPtf57r7XhQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=GHX8rU4FTOl6s0DoZrYA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX4qu9io+vh2d3
 QrGjkPm6/bLXFn7bTYQEswDLyiv44SJ5UetA+n9QvYMQxffaRAK/2PDYRx+Fn/PgsqBq+yiTGOt
 C7JPPOBcHM9TCLOh1CpuxR3wffVzzb7MxmIs3aVKp4d1wSPkelNPagfRKSVEzqyEICU7u5MnSkS
 UuD00nf78k05V9IyGQFNVMgRtZWJKEWeal81wd9A10o8NtPSL+PnWd5nv/WgGG1Q4Utn13zC+M/
 Cy6fGef1R9X/B7j0qxNGrymY9tv6Zy8TTv3KZdBDpJ3GFBLc6l9bbcndhkPCaki+Kzrly8wVJ2+
 eKcnfvr2L+MtgYG40yoTXtvCmHW2AXHd8rFf765GmkmB/11c6hO8m07ZKYdbF53RM2ADYNm1Tbu
 IRfMW51dLUcK13b6PqrZpMYF87BtStLSVmOE9b5b/IwqA7vJF/q7IzMVZFAssUXADorDPmswv5e
 RuJILTqQULl52qAKBLA==
X-Proofpoint-ORIG-GUID: mcHvjewySLNnVbaWI_4VOIkc-FvZe0ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180056



On 11/16/2026 04:30 pm, Johannes Berg wrote:
> On Fri, 2026-11-13 at 23:47 +0530, Pooventhiran G wrote:
>>
>> We moved to computing the size instead of having a fixed value because we
>> transfer an almost dense context in one phase but just a very sparse one in
>> another and thought this would save space on the nlmsg skb.
>>
> 
> It saves allocation, not actual space in the message or for the
> userspace copy. I'm not sure it's worth doing.
> 
> The biggest problem with this is that it's basically not maintainable.
> We already see this in many places, with fixes to these things, if we
> have allocation and building the frame separately.
> 

Agreed.

>>  If we transfer
>> data as D2.0 says, we will transfer about 330 bytes in Prep while only about
>> 70 bytes in Exec. This assumes all 8 active data TIDs and without nlhdr
>> overhead. Is it okay to define the max size (~400 bytes + nlhdr overhead)
>> nevertheless to avoid this size computation?
> 
> If it's really that small just allocate NLMSG_GOODSIZE or whatever that
> is, which is a bit under 4k so it just takes one page? Don't think it
> matters here much, it's also short-lived (if not you have much bigger
> problems).
> 

Sure, will move it to a fixed size allocation. And yes, it is short-lived.

>> Ahh, I think I misreferred some examples (like cfg80211_net_detect_results())
>> to cancel the inner nests but are pointless to an skb that is going to be
>> freed. I will remove them.
> 
> It's also pointless to cancel inner nests when cancelling an outer, but
> I'm sure we have plenty of code like that because the mere existence of
> that API seems to make people think it should always be balanced ;)
> 

:)

> johannes

