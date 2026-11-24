Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489878;
	b=45Jnj6QPuq4TYqeDb22V0l2BkLARrucgDhbM5tE2s2m577Q3QwSgyH3RAas72OP4uOcn
	 pljqZsMTAgKlT2/TBc4zolVoxLUuhy8zZBiYR5DfxmLb85oNqnALmvYYw4kG1A3x5+Hpe
	 W2Sj4/cP8qoTFjZMIm7jtr/2+HKOj+4ZZUd8xrvZMpxcdYZp1RPCa/jlzLvzvRnR+xHDm
	 7HY3EsSyfYWv5WCty3K+Hnv/FOVh1JElzNUF+MLEit/wdvo9SWNsxwT8MoHX/sehIlamL
	 jJ4t7hO2wPcqwXDD9bNY6kgX/UqUYft4YW5BnPZzSDcd1jb3vcxGtlYvVo4BAyvuazA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z5VeJnwz4/sm28InEjRBuwn7cnvfk5WFes1/QC4jAFw=;
	b=aZq8ex3DNBpIy+DmkRVZFryi6iYi0jdcNJFYyNqql4mDNM/iPWA9btEHE6mV52GyIxD0
	 nfLNo37TmVoYHcfpvZw6o2q+BxNoqOkDq4XnKNY2mhscx+nCi9PvwnhtTmGWljpD8XHWo
	 VpvL03wa9r4+7hQS8P1vaJxJv+sOOrsHDLkARXpNRJTib64Ln6GWWQ2WJZ8XkZkJAU7Kd
	 8T+4a2r8xvlKsnb1Cw51jFro+ppQbHfIx6YF7uZeE6QoCV748cfPIdXbXMu3RXvyioZ0W
	 uADinFDNb0qCPTTx1EgmxlxTh/VrLAMmuyy3BCE2h9PRE+9tdNcRdZEuuY5dUkPcMGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWOd9wlx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ikjs1Wl3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED13F606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED13F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWOd9wlx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ikjs1Wl3
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kAXI196969
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5VeJnwz4/sm28InEjRBuwn7cnvfk5WFes1/QC4jAFw=; b=WWOd9wlx+nGqB0d8
	7Uhr1RJvZCNKrfDecfAFW68iEq8eEppevbasIdWBuCOHSXpISC5Ubho4n6ZgeiWC
	jKCm72zywG+/3bXFRvEFhe4g2MvS8ndgiQTaMSFFdfZqHg+IDr1xv0RKN65Tcpt4
	Q8BmVjSMgTpkk6a1kiI6UksXe1TW9gEBQri4PSSXsAan18xUsxmXPBxlazGnQ38c
	uWZ65pDjnmU24N6xWUIzVxN8YjR266Fbw36ht/aDgS5ck68h4/Fk+JrnUr/w+r6i
	NcBUxMNqNE6REs3880Al7zGI4HhRdj7A8SEmPh6L0vnKQ/Jehxvi/vROlE+3cRxh
	zxFvvQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr9evq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:11:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b45597c7so4579410c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795489876; x=1796094676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5VeJnwz4/sm28InEjRBuwn7cnvfk5WFes1/QC4jAFw=;
        b=Ikjs1Wl3lfyXpwtAEA3LeX6fWGUpS33OMr3vVUp2PdzK+NtLs97ZBF15il+P5c53Z6
         4n2tnQKTlKZZaXr7W6W7lIPwgKqmW0dN7y6FW9/tqo8r5ZLO2hO6SfXA06gJnMInSe5Q
         2g5uzIMAYsbMtfQSl5ndWdcMLxXjG/35t9gO0xANAh7zE0V/925icKFfg+xNWeF9LbHf
         nv9jar9tYKlXzxO0/ojXBjdIlcdT7sJqWzydtnclRh6YXAdacUslpDtj0NeJ+BhNiNr7
         XcBZMcg0RyOa+mU1NOsPcAnRxcnWHWMcBjDliFORKIU3qzJKnBKN5z341xzNQAWBT+td
         cbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489876; x=1796094676;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5VeJnwz4/sm28InEjRBuwn7cnvfk5WFes1/QC4jAFw=;
        b=1JkPl6BYXojOGegijLouVUCDa7l7QWsvCPuWu5vBR1GamyMH412cfrgKQdcChKIaDN
         SXkgkMJT2CgLLctIfMFH0SIDC2UA2kXsGoGsfvkSU25HYUGF0ON/mrncrGx56KenZZ9l
         ywe4fv1DmlUaBv9b+kjlLsBzV+6im3cO2wVf9mXMJoRd6qdM/lN2jEsSbvFBSGEJmhBI
         PcBiA94u0Jy6HvsnSwcfQlAPrMJRkV/WPPNsOz96HTKxCWJX4h4jDsy6M+rEdvNpJjjx
         IQdrN426drzFfR1K6hoGeID/+egq+Ercz9OS+txn3FxbxC2UvdOQhRiLEhEqoVgGToIX
         HMAw==
X-Forwarded-Encrypted: i=1; AL+hErFHn07Ub7QXEhWqCaa7hYV3BJPZozhKNJLtJP79QYynfwgYUqZVj41Ahl+Nl81KDrCo1OvJsJkE9ONK8KY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rxk56zx7/57gz7v9PPpYWUOvHvGOtW17lDgRsbZ+z7RIs6tT1
	L6an9FIS9ebuN8vBkLhZmeaS4VCBSocAWCoWqwKFTE/9ABceK/4x9IAl5HYOmF7OP2On/j3nIKJ
	QOK9LPbWPcCD0KEDTTtpQyZN7SdeyNGGAUf99zkPh6uwlJrXAByL+yyldqsEG7BMeYlw=
X-Gm-Gg: AZFdTZefUUvhlJz398itTf1dMsJlogMnqsDBqmqZDcgB2l5Ovh2Ljs56a/1qJBrGHJq
	8+J5EPa35bVZHyzq2uMHVsSk/fhs8BN7h0fJ4aL4GV1JbEznNW8PPKZ3tpkP48/NzemSSxkEg1I
	XjOUqH0prYXTHGXtdzwZ5RVI6BqANbkVZfjkQtmR7eIuP+pJLUhgCI4V87Cuqj31q+Ugqvb4j6S
	mJaKOPdCCW6VIx088b5qMfvjT7XN0EmEwsB/Uwj7hrarj2YGmtDPpuPInrLmFQQTPF3Atdc8Jxt
	7ne8oRqn5h1r3qz1AsVi1Vuk0AhxGZ/J71NQCHh1rEZDLXC6puIuD2v2Yd5V1sJw5RipqbPAIjL
	L1Q+UBVkk8/FC0Rxi/ONrw+QptRoVl4qQK0UQCrooPilbQilLFrya6JjhwkS5SFhuVmNCOQvnqN
	Pv03Yr
X-Received: by 2002:a05:701b:204b:10b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1b5567a6142mr15576899c88.3.1795489876289;
        Mon, 23 Nov 2026 19:11:16 -0800 (PST)
X-Received: by 2002:a05:701b:204b:10b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1b5567a6142mr15576868c88.3.1795489875573;
        Mon, 23 Nov 2026 19:11:15 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm24383285c88.11.2026.11.23.19.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:11:15 -0800 (PST)
Message-ID: <0596e698-a599-1f83-a39a-146b52569575@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:41:08 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] media: iris: Skip redundant HFI_PROP_TIER updates
Content-Language: en-US
To: bod@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
 <20261031-fix_dec_seek-v1-2-cfedf0c267ee@oss.qualcomm.com>
 <179501803041.2846709.479596500645471046.b4-reply@b4>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <179501803041.2846709.479596500645471046.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX3hrjcR8i7xMN
 axQ2CqRXQMqjHGKnzKMoIOiPrv1ix9vBoeD6dNBlwcid46dfdGE9oSIcXnbGCtk1pG2sr24/EX7
 J+SB9jThbLolOdLx9cGSUdPoTi+1nok=
X-Proofpoint-ORIG-GUID: _0u3YTwZZ9buDDiYEiFDCBuO6FsDmDuQ
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b050055 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=ZEpBKAdWhQgix3oRGUgA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX04LDScWeMLaH
 9OFzq7z7acZwJBSdfBQyulSYIVrh7LZ4q3xIByQkjWw2BxG1bamcWWtvRrEVQqthyzuLni7PAym
 5GQZO/PqPT4mmOhxENGiF2Hj7F4uabDwtTzgryxmXil5MWrz9iEor8JXTDd5cYMwQUV7nA+lW5C
 S8GGBmqoKLmZ6zR2PpBiqiC0lAw0lyabB0W5mpuI6nj/Xo5dMTCFhkMZ8jcEZwzKY8nlt2E6GWT
 67KbV3avmPw972uqWoAz4VyDsF946gCnN9/c5aI41sIPmJuy7TmnUJtOXL8GoR7N+bFgdAkZBNP
 YMY4O58CPCElva2ZZ4+m9HBAcgXGFuVExH263t0s8wzpJrKxDdNF8QMEOLAdIDY0Gqw5jaiE6TA
 S230o4ZmrUd0PSp7kNotO489m6etDGcL5rpmG2BjPQP71Oqcguv5wxy+QckjS8DtIqmrJ/cP+2Q
 X9EwjDqItiwbzLPQNcA==
X-Proofpoint-GUID: _0u3YTwZZ9buDDiYEiFDCBuO6FsDmDuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240011


On 11/18/2026 9:37 PM, bod@kernel.org wrote:
> On 2026-10-31 01:49 +0530, Vishnu Reddy wrote:
>> HFI_PROP_TIER is already programmed by iris_hfi_gen2_set_tier(), which
>> selects TIER or TIER_AV1 based on the active codec. The TIER and TIER_AV1
>> caps also define a .set callback. As a result, iris_set_properties()
>> programs HFI_PROP_TIER again through the generic cap path.
>>
>> The generic property loop sets TIER first and TIER_AV1 last. For non AV1
>> codecs, the TIER_AV1 property is programmed after the correct tier value
>> and overrides it. Remove the .set callbacks from both caps. This ensures
>> HFI_PROP_TIER is programmed only once with the value for the active codec.
> I think this commit log should list where and how these settings can be
> applied three times ? and what the sequence is exactly which leads to the
> invalid setting.
>
> It's not enomrously obvious reading the log and then the code how that
> happens and which one is so obviously wrong.

Ack, will update the commit description.

> ---
> bod
>
>
