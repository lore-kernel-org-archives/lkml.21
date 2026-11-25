Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634487;
	b=5Bq7R8fByv/GONg+UwNG1+dykc4VxHKQRAJiR+cRFovOy/jnW82YCGYJ5Hdu7c7RUToT
	 ArNd+tIoFknQ9UvHStDl27qCIBtjHQHECCxZAihQEzP8zTy3w7LKLv+p2BnmF5ke7qNgp
	 unDcB3qZOo/GOMrPh9AkiZ4FiIbkkbxcEwwEC0NRjXJ/plSJKk3bEDSJkgzYcWGmcqqA3
	 nJFm/XhvSRUqjAmGVMsnKqRbR4uyeWTKsBMTxFWZT5IOk1JoxPhMI8OcdsejvqS0n2zW8
	 ykKV3bE/UKmVQ+Pso781abT7NywMEHVd8LXPYnmHDmG0UAy584hy/iT0FiMnRDD5FmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xH5JYY52XRBNO6YBobG7pjVoK4p4OwjsP6nrSUPc0dI=;
	b=ji/+Vq7b57Qc+slUu3qxZyQuAfOQ61XvP6DWWIfdUdvMzEipz4B07IAjTzZouzkJL793
	 Xm/EU7MiSE8pQgQ/2xayCp82f7OrIoCj8whGj6Uvaa6g+5LqZFNaHVMTRs9Y5k23bMQR7
	 cLGuNEMZsabli14BpNhHo5BzdV3/6N17lPDjTeuZIA8wGxxIXeaQ1pflesrL29vfdqO0R
	 UhYzceeJ+I91bfoZDaxoIhu0dBV1syeJpKrEAsoWD/dTuB9OhmH5kG7oQqZ1aVyGadal8
	 JZ/Jgyb7qpoVWb45t75CFu57JTUllHNMu2+rcFJ7fD/dzjqZg7gYqnMhSmJBo+cASUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TWdl1cId;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TvjvTO8v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7149C606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7149C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TWdl1cId;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TvjvTO8v
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAlpw2028095
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xH5JYY52XRBNO6YBobG7pjVoK4p4OwjsP6nrSUPc0dI=; b=TWdl1cId2a42XQUe
	kDf8SZ2meEmjQQK0knfI4DFzfQwLqHjIZLue7em7qeuV8PlTXDdgceQ/RkfHgTRD
	BITqp70VRHVHJsHJz+47HnyOOnHrmKXscMXpbd5rEh1c99aucKSuEvY+HRE5H5G/
	WekBMHGythfjZv+0jDNJR8Xbl03YPxcYOhAb7kwoN3Ek+5wQ8z8g0A1rRSIF8k8g
	teY9UOUpKtPxLz33okWwOZrOYooicU7KzjArJGW5jO1uFcAddMNfj5RhJDns+FTz
	eGlyMmGGF7XE4JRVGuGHm/wgpLwkOExcnY8S9CYdTqERMTHxqacQghqIWaBUoic3
	u+sgrg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62varsb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:21:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so1147568585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795634486; x=1796239286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xH5JYY52XRBNO6YBobG7pjVoK4p4OwjsP6nrSUPc0dI=;
        b=TvjvTO8vFLKdYTOJN8k2M257Bmdlkp/Wgjxa+TJv0KCeilg7MR7WopzMoQwp8B5X4F
         RFRlv1CiLU++1KswbmqTobLsAoAuMs2ptmDwtJkKlt+pwOghi3G0ElL1mymGfWqDSTDv
         hrgVCTR9RndY1oeMZUAkRP6zza4MytF9Q4J635/4AvAlxhmXjSpGnmf6YW0V2iGFEPWV
         IQZnDmrA0R4sLaVngFCmXu60707skufMalf91E+vWtYcjlnERyBDwzOge2y2wpGMRDqM
         RQT4eKSYNMMdwsp8CLIXFTFZZ2sglfHLFTYvOpZzk6rww97qe+ZkRbSE1yZSF0lb+u2K
         mong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634486; x=1796239286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xH5JYY52XRBNO6YBobG7pjVoK4p4OwjsP6nrSUPc0dI=;
        b=iBtEXgnIzixJfIR03FiyTi/HYFy/RMLFsNUNlTpKv21y3QGgCYOLg5u/+WojSnMlne
         8akkpjPCdC1GryCCk+Wz8I6RBcyoB3qRWc1/oSxxNwe+aYz33jw87eCD/w6XNvIkAFjN
         Mn5Yfj+p8IiUokbyWA0DsbXndAkkUqIAoLtqD96ZNkoNEfpwu0kZUm7UoPHT7DGwADxa
         Ym9cyIjX4pARgvE7+zrzHTUiQXWD+ZbQr0H81z5t0Texbr4OE9ft78bC0Xf4U5BCVnGr
         lINthoK+iNrRwu5OyuB3FK65lt2eN/HQoDR8e6CKjbM1KTZ7BsHFQK6nFEjwGHdwl6qy
         T1QA==
X-Forwarded-Encrypted: i=1; AL+hErFFWC4XnTYCWJ8JjtCl9DcRYEcFMf3rWQQ0mswI5bcTh+e1BgsJH+abfnPduCDDLkpQpoQ6HLtqqqissjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dIMizZ8AiQRzwgC3eV+mQXnlqyd3zx+LtldsI59dxCb5UWeG3
	ndvez+APeYSpVhTY/k11wKQzPMFPO4JoY32hbdJ23+raqsbXQVdEqUR3xTv4X/Kv49oRWQW9kx0
	7tXo7xnBQahWrHOboQIQZZOV0vYUjsiyiheOhyd1E7Jrecbs97Zyo8Osi47e8qbgerP0TzvC9Oo
	X4Lg==
X-Gm-Gg: AZFdTZfX5HQmQbzJdtvhyTlpYkKms7WpgcV2qC11BieMi4j88w2iahJWJVIBlt+jvXF
	aiT09LdpruL2y+GdUYYEHTs9c79hqYHojuXxWy3rPewME1TIl+wjmsofUfNgrJq6uK7AsXjFlqW
	aagjKUmPeCcPwq+Y43HKPFGrkRlxMf0mxNiJUgYQX49lO5sON+EJmz5w0y0CWm1Ou2qrK8QBygW
	I9foKDX6PizgJrWJZpXQWvhabVr/bdWGFyphkRWkefOgobvrcE0A6Hae/F+5rWPfltS+gb6wQcp
	Nmyb4GWUxPfMM9oMjyeNvPZaFNsIsPqc+iHbG4Un/b+ki58MvSSmetMAqZsEXZRinxAyI5rhd5r
	APu9TSOCnsuXSyKOSf+7zZXe5Rg0bZ84QiMncMB1pyj9rCohjxvAeGNePxqDc3zCwFl1MPKx3x/
	L4cHuytjLZbuvF
X-Received: by 2002:a05:620a:17aa:b0:949:9985:e097 with SMTP id af79cd13be357-949ba96becfmr3325538785a.15.1795634485570;
        Wed, 25 Nov 2026 11:21:25 -0800 (PST)
X-Received: by 2002:a05:620a:17aa:b0:949:9985:e097 with SMTP id af79cd13be357-949ba96becfmr3325533885a.15.1795634485006;
        Wed, 25 Nov 2026 11:21:25 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm538120815e9.15.2026.11.25.11.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:21:24 -0800 (PST)
Message-ID: <b630d0cc-0321-4fed-92b2-a1a67ecbb497@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 21:21:22 +0200
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
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
 <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
 <2bac2b46-a124-4f41-8a19-7dfe1c936caf@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <2bac2b46-a124-4f41-8a19-7dfe1c936caf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3NyBTYWx0ZWRfX1Wry2bKK7HR3
 dXqc04iEXdel7or0Qe9xD9eq7tCnus1Zheh3iPH5ekYRU5Ki/DHcJPYvY5uTrbMk/paX1C6RSPs
 dcfCaJBANj8ujru7qnqWCOOz5vN3SIo=
X-Proofpoint-ORIG-GUID: JConm9_nKILGM9jouYOP3CM7dmogTA_s
X-Proofpoint-GUID: JConm9_nKILGM9jouYOP3CM7dmogTA_s
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b073536 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Nknuy2CBTID-iPg2oFgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3NyBTYWx0ZWRfXwze3zYkMJ7Te
 QOaayttaAbm3aACsJDUF8qYBJ9Wp1cfj+sDJZn8GsAiO4RKysGbLTJKxczhIAmuTy6YJ243MeST
 kHUYrDVf4cEhVQz+m/FMVD3neDgAs99nIy+ffPKPaq3bhnYzCTa3U+nkp8O/Wnlf/EtLINj8GNR
 nKhn16IxLC4uFiHcxbg2oKG8W8YCanSXYn1KgpcZ82cXLyHOi2KND5y+VzLjXckxVyzIMqJWBJM
 PpwPKx6xvSrrJ2X1G+tDO7ivyAE58Fdcf+ANFDgcJ1EQOaWqyEgivzddIRB8ZK0+W/n/Bl5iCt/
 a1Ieh+0X3hxVsbE4kgxIoQTObBDZY5rMMmOTUWeWvcCs5TszrPCH/igLqxBLnri+GdhzWaTCqCq
 Slui+R2XH4t6LFvcpOsbQgHIvpAMm+TBqCqv+9WslMJiZlbkLqz1uaeeMl38oRLP0/4nMeLl8Ke
 JMQz96JlNnn14c+TnEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250077



On 11/25/2026 2:58 PM, Vladimir Zapolskiy wrote:
> On 11/25/26 14:29, Gjorgji Rosikopulos (Consultant) wrote:
>> Hello,
>>
>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>>> The timestamp reported to userspace for a V4L2 event is taken when the
>>> event is queued, which for an event signalling a hardware occurrence is
>>> only as good as the latency between the two. A CSI decoder able to latch
>>> the start-of-frame against the system counter knows that time to within a
>>> few microseconds, whereas the interrupt handler that gets to queue the
>>> event can be hundreds of microseconds late and is not consistent about
>>> it.
>>>
>>> Take the timestamp from the event when the driver filled it in, falling
>>> back to the current time when the field is cleared. Drivers have had no
>>> reason to set it so far, and every in-tree caller either uses a
>>> designated initialiser or memsets the event, so the field reads as zero
>>> everywhere today.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>>   drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>>>   include/media/v4l2-event.h           |  9 ++++++++-
>>>   2 files changed, 26 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
>>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
>>> --- a/drivers/media/v4l2-core/v4l2-event.c
>>> +++ b/drivers/media/v4l2-core/v4l2-event.c
>>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>>>   	wake_up_all(&fh->wait);
>>>   }
>>>   
>>> +/*
>>> + * Hardware able to timestamp the event itself reports that time in the event,
>>> + * which is more accurate than the moment the driver gets to queue it. Fall
>>> + * back to the current time for the drivers that leave the field cleared.
>>> + */
>>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
>>> +{
>>> +	struct timespec64 ts = {
>>> +		.tv_sec = ev->timestamp.tv_sec,
>>> +		.tv_nsec = ev->timestamp.tv_nsec,
>>> +	};
>>> +	u64 ns = timespec64_to_ns(&ts);
>>> +
>>> +	return ns ? ns : ktime_get_ns();
>>> +}
>>
>> I think it makes sense to add an additional field for hardware-based timestamps.
>> Converting the timestamp to the monotonic time domain introduces precision loss,
>> so it's better to expose both to userspace and let userspace decide what to do with
>> them.
>>
> 
> I support this.

Although it seems there is a way to get the timestamp from the same clock source
introduced in following change, and convert to monotonic i still think the hw_timestamp
propagated to userspace is nice to have. But not blocker for the series.

~Gjorgji

> 

