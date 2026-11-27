Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763245;
	b=5Mz4OTmNRjdEBL0JjKliFOKYj6IIv0/kn3f/aBk8HNCjt3qAGfx5dtj+Y7KBXqRiisrQ
	 clb6Wa1V8ZCpNbCr1mt4a5mIjSLudPkVC+IjHMWjkdf0cRslWL8vafWkqzLF/kKszksqB
	 5R6urABZOJKofVnggxEP9fEGS5IqM1e/62l1U+ZXA+ywPR0zppuowmiUid5FV+hbRxMce
	 vye4j/vnY1LI5UkJzsTON89bFbKEOMgHit/aJqeyBxIMb7hUS036EdbxfucDzyIVN6uAQ
	 mI+597ul+ZQfHMCcakfxQ6T9V+aAY+kJUnS1k5bwvr8K9+AjlX+XkkdHlP7qNS0llFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ztaD78IbltCltOsv05ym21cV76+rcFbLrBKQOvg9Tyo=;
	b=g61QOO0EXra809bmnX12wj7iSSssCiA3ZlXIKr0Qh2xDLgPnhPpvhxJiyI0g9F/pYEK4
	 jdei9VVPdK81SRXTT5Fx+UzUSbZ8WrMaE8xfRusSNUuHc6+//DpS1iSqGjBBgwrBsmOO0
	 7JD+1KcYWGO8TyzBmrtaMvcznRXMGHiIzWQihB2VYs8icYlE3eALfV4CzqoRSYXaua6ka
	 iEHsUc59AWtqUXDYHLKsdLF6DrLbb4EhPXa/tjfiJAFSvcxcm/4DsNsdkqcmcUimk6lQs
	 /kev2372Kf1LQFGzX5EuL7mv/f5nXljehyh+sdbyl2E0uBwDIETi0/TQhNOd6IPMygg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iAYRWx3q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCvbP6sR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A1B606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5A1B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iAYRWx3q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCvbP6sR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR4YkYD564796
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztaD78IbltCltOsv05ym21cV76+rcFbLrBKQOvg9Tyo=; b=iAYRWx3q/NCqP7tN
	AlumLg0BNW6qbfVUtuiscA6wNUoQYHbZEEQF378cTy0Ssjrw3bfFg1V9x0VIa4eO
	m5RUzHOlae9aSG8lWlQ7BMAYEJwpVh2h+i39RAcBMLw7ji4lRgXXfzHeeszMLkna
	0FnbrAzZMdjOK7IkbT3lNsrt9d5rO+i5VHhWpyuRSCA2TDms//JhGmLqKK+294+B
	Q/YuIHBNBErM0T9UVBC5ug5ry6g8l70dRS0swTuUgsvlLLNJm5yWcS5mipbq1lwF
	s+mGV6z69kSGqmeVcnk66Hra5E3xMpp5YoXRfnl4v7biYQr3tiLSYdVkJntgQeng
	o75J/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru39dgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:07:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so1196114785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795763242; x=1796368042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztaD78IbltCltOsv05ym21cV76+rcFbLrBKQOvg9Tyo=;
        b=HCvbP6sRtvmjdiKxlQaxZH0FqIgAbxq9K44tlLvnykEEf33o4dgVJHhJmFAOmjUseF
         Gt9xdPJB11FsDKidoItd3EVzgP88vadh6jysYPxxR0wQsAco0jNvmaDLWHxCOav7DTxb
         spK8/Uc8e44yMzYy6ZeJPMrBaqyX35/9SONTnCyKbCsQ+7nMd1JeVT5xI3cIEW+oTTdl
         rqpQ3RNH+BQuDEKN2/KyBOpKmf159e9fdpwX3qMPzHK0N8RogM1C2OstJ+l07rF50Scf
         AMYyU8aaRagGJDsocZobfpzTDdg1lDqslE3zC1ygNIduBmkPQ62qVYfQ9YrMNmJNgdxX
         rykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763242; x=1796368042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztaD78IbltCltOsv05ym21cV76+rcFbLrBKQOvg9Tyo=;
        b=N93wS7RFRH2NB5DGgf9eTfZ+OS19vTyZWhhy0fVfG3eu1jLdVF0Cy+kXZpLOr8vdft
         q+oMx33S9HtxyLBWphy+0Rdni1JaZ1meji6ekMdgjVShTD76X30sEsBTa8YX/Sa3JpC5
         JpVebR7y+f2LpZsQ6JLpXmSZwu693aNyFaS9iCTJ6zk1Bp3OWicLXueji0D3IMgUqORG
         opp2rDhfPln4fn4yv7N53Li/7e+XOHDn7pR0/646S9ufD6BNXNvEs6RVwsbNvuwVTDzI
         uTjY+F4DT4Gwl/FkqKsIDdxwPK9s+QwRpjSvkAvnH0+HjXB8X+ir4KYYeK6SC+h8wC9C
         tfXg==
X-Forwarded-Encrypted: i=1; AL+hErEI6/h65LPWZaTghbsone0tx3mZt5moEcwt9wLAaD00f813HEkAd3F2Uyru3Dc3Yibp4OhzbqwWlTyIElQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lMutJrQd2hRe0BBEOxma9qNyckFPYN5HhY1gTb25d2YfurX84
	v76lZLrPc/I2q3hD9MW8643An69SM3YAz7+dcnmzzbMKPT7fvGtQYCQkrya5BXlOtX5/20TGbGv
	9uxFdW0Tpu5aYS6Kp0B9nI39GrxScUNXt3pVInvEm5ksqXNG/cyO4+rCzIZKPbkxY3/s=
X-Gm-Gg: AZFdTZcBTkkkD4T2kiCSLgedTDcnkf3AXCsyNvxFoCfe+FXRjEOc51rL3GvwcBSUKAq
	G0ZBrWmUbvHo67yI0NBqQiTfYdS5QJ8pO5hg8WHvvhTdB11F0YZAaUK1y418Dpes0USoO8DCA1Y
	BWdKTje2P/u0d7fJGJ7n7UZFEKXjo09hidZ2XIthS3pLFM0tgmBnILRzK1ZI1jDWehjx1jNaknZ
	ReV0cQ0K48Xyq6KYTpLTgmHlw+/RxnKjf9Rv0sSH8NMEnGQi8AUdWsxm/tlhOWq9A54WO2OtChM
	JWUyP//xT4QmPVIYlrmuKvNX98IgaHJT8XNoeDllKGro1+7Bb9cjFld0G+UXKnUt9KRhKzu//RQ
	bnp0t9MM0SOwn782bOa24Dhb5ah5OuO1MFnroKgKelfalF6UJgquJV7IvFNGw1QCM4/hLvU8QAC
	44gfTW6h6wbc0LHA==
X-Received: by 2002:a05:620a:2984:b0:93e:653e:6981 with SMTP id af79cd13be357-949ba7e2b41mr4164630785a.11.1795763241631;
        Thu, 26 Nov 2026 23:07:21 -0800 (PST)
X-Received: by 2002:a05:620a:2984:b0:93e:653e:6981 with SMTP id af79cd13be357-949ba7e2b41mr4164626185a.11.1795763241145;
        Thu, 26 Nov 2026 23:07:21 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm37463632f8f.45.2026.11.26.23.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 23:07:20 -0800 (PST)
Message-ID: <cb9ab22a-50d1-4740-a88c-198b60f896d8@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:07:19 +0200
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
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
 <9b858d24-f783-44e5-a7e6-85b59e054f37@oss.qualcomm.com>
 <6ddbed80-bda4-44c4-b0a4-be2e87b278b1@oss.qualcomm.com>
 <CAFEp6-07goPSX=fEOmQziXTvSoSt7-FebXAtB9xfavTXB6-Ryg@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-07goPSX=fEOmQziXTvSoSt7-FebXAtB9xfavTXB6-Ryg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b092c2a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qHgLvb82GJEiItVYC30A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6ZASAb2jRNSfvlQzQKnLgoNssCCKjnQS
X-Proofpoint-ORIG-GUID: 6ZASAb2jRNSfvlQzQKnLgoNssCCKjnQS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyOCBTYWx0ZWRfX4Ias14kW45Cc
 IPscIf30rV35Ba2x5Rxq88kEyNI77g7X0i3PnCG/WCn9vykPcW4LXyQZqf1fWQOQsoj7f/wFPqC
 NU6PJFhV9sGOdmVGM6clQj6m6uwthhFQcOu5upCkrDGSfHGnPjxUv06fM0xNkAKboBJBk7KlEo5
 TKeZ2qZPiOfgdPAnOGnjR7rNVztxwXG8hxMJR0VZc1oS4pyR1n6Lf9TKQm+9Wtfof4C5M4WBeWn
 H3fJIOAjqIyA8nugyrNclwGE3ZOM7549Cc8+7x2QXZKE9kOo6uHmrTnU5KyNCnC6JTcBaB4spjc
 119y2c5Fn/Va7RoQ4ESTWmBZ3F0mDnCawXyRL5zY5LLA822bEKWRlIuCF+5rdrHRr2dAZcdrDZa
 +FGPHkMz5yGxmf9fujjk7+ZtUdWJq1kZePq69Zvkl6RvaFhUzbZO4IhXb4oWsK9YYBF23pErRaH
 ske7A2DDwnCmpS1F7tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyOCBTYWx0ZWRfXxluoMQ0bhVE+
 E7t8yBQRHwJpFaQATxcck6nsvXYGNwuNMAPpDJtPE3QM6yqe3IeCTnGeB8sVHehjq+SKUPokrbB
 KJwZ6u3mFJ4HfKE+yaGOGIp+8235OIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270028



On 11/26/2026 5:15 PM, Loic Poulain wrote:
> On Thu, Nov 26, 2026 at 8:52 AM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 11/26/2026 9:00 AM, Gjorgji Rosikopulos (Consultant) wrote:
>>> Hi Loic,
>>>
>>> Apart from hw timestamp propagation some other comments.
>>>
>>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>>>> The timestamp reported to userspace for a V4L2 event is taken when the
>>>> event is queued, which for an event signalling a hardware occurrence is
>>>> only as good as the latency between the two. A CSI decoder able to latch
>>>> the start-of-frame against the system counter knows that time to within a
>>>> few microseconds, whereas the interrupt handler that gets to queue the
>>>> event can be hundreds of microseconds late and is not consistent about
>>>> it.
>>>>
>>>> Take the timestamp from the event when the driver filled it in, falling
>>>> back to the current time when the field is cleared. Drivers have had no
>>>> reason to set it so far, and every in-tree caller either uses a
>>>> designated initialiser or memsets the event, so the field reads as zero
>>>> everywhere today.
>>>>
>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>>>>  include/media/v4l2-event.h           |  9 ++++++++-
>>>>  2 files changed, 26 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
>>>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-event.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-event.c
>>>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>>>>      wake_up_all(&fh->wait);
>>>>  }
>>>>
>>>> +/*
>>>> + * Hardware able to timestamp the event itself reports that time in the event,
>>>> + * which is more accurate than the moment the driver gets to queue it. Fall
>>>> + * back to the current time for the drivers that leave the field cleared.
>>>> + */
>>>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
>>>> +{
>>>> +    struct timespec64 ts = {
>>>> +            .tv_sec = ev->timestamp.tv_sec,
>>>> +            .tv_nsec = ev->timestamp.tv_nsec,
>>>> +    };
>>>> +    u64 ns = timespec64_to_ns(&ts);
>>>> +
>>>> +    return ns ? ns : ktime_get_ns();
>>>> +}
>>>> +
>>>>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
>>>>  {
>>>>      struct v4l2_fh *fh;
>>>> @@ -159,7 +175,7 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
>>>>      if (vdev == NULL)
>>>>              return;
>>>>
>>>> -    ts = ktime_get_ns();
>>>> +    ts = v4l2_event_ts(ev);
>>>
>>> The documentation states that:
>>>
>>> "In order to queue events to video device, drivers should call:
>>>
>>> v4l2_event_queue (vdev, ev)
>>>
>>> The driver’s only responsibility is to fill in the type and the data fields.
>>> The other fields will be filled in by V4L2. All other fields are filled from the v4l2. "
>>>
>>> So here we are changing the driver-api. I am sure that there are drivers
>>> which does not set initialize the whole event struct. This will introduce new bugs with
>>> some uninitiated data send to userspace as timestamp.
> 
> No, at least none have uninitialized value, this is mentioned in the
> commit message, so this should not break anything.

Yes it does not break for the currently up-streamed drivers. But anyway
it is changing the driver API we need to be careful for this and proper
description in the driver-api documentation. So it is also not clear
whether this is the timestamp when the event is recieved by the hw
or when the event is enqueued to the event queue. So my opinion is 
that everything should be well documented.

~Gjorgji

> 
>> My opinion is that similar to frame_sequence (which is different from event.sequence)
>> to add frame_timestamp in the frame_sync data field. Whether that is monotonic timestamp
>> or specific camera hw based timestamp is yet to be specified and decided.
> 
> Yes, but we're not changing that here. The reported timestamp remains
> a monotonic system timestamp.
> 
> Linux provides a hardware abstraction layer, and in this case we're
> reporting a SOF event, which is fundamentally a hardware/bus event. If
> a driver can provide a more accurate monotonic timestamp for that
> event than the generic framework helper, I believe the API should
> allow it.
> 
> The goal is simply to give userspace a timestamp that more accurately
> reflects when the event actually occurred. If that level of accuracy
> is not required, there would be little value in providing event
> timestamps at all, as userspace could just read the event and obtain
> the current monotonic time itself.
> 
> Accurate timestamps allow downstream elements of the video pipeline to
> make better decisions. For example, they provide a more precise
> inter-frame interval and effective frame rate, and enable derived
> measurements such as object velocity or motion estimation to be
> computed more accurately.

I Agree that the real timestamp of the frame_sync event is needed,
i think there is no disagreement on that. It is actually how we provide
that to userspace.

> 
> That said, I understand this point is somewhat controversial. Since it
> is not a hard dependency, I can drop this patch from the series. We'll
> still apply the timestamp to the frame itself.

This more sense since the timestamp of the frame is well documented.
And anyways the frame is what it travels to the encoders and other elements
in the pipeline and needed a real timestamp.

~Gjorgji

> 
> Regards,
> Loic
> 
>>
>>>
>>> ~Gjorgji
>>>
>>>>
>>>>      spin_lock_irqsave(&vdev->fh_lock, flags);
>>>>
>>>> @@ -173,7 +189,7 @@ EXPORT_SYMBOL_GPL(v4l2_event_queue);
>>>>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev)
>>>>  {
>>>>      unsigned long flags;
>>>> -    u64 ts = ktime_get_ns();
>>>> +    u64 ts = v4l2_event_ts(ev);
>>>>
>>>>      spin_lock_irqsave(&fh->vdev->fh_lock, flags);
>>>>      __v4l2_event_queue_fh(fh, ev, ts);
>>>> diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
>>>> index 3a0e2588361cf451b3dbfc63dfab99550d13cf6a..076f788e0469ae4666c60344e5ea73a698352134 100644
>>>> --- a/include/media/v4l2-event.h
>>>> +++ b/include/media/v4l2-event.h
>>>> @@ -102,6 +102,11 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct v4l2_event *event,
>>>>   * .. note::
>>>>   *    The driver's only responsibility is to fill in the type and the data
>>>>   *    fields. The other fields will be filled in by V4L2.
>>>> + *
>>>> + *    Drivers whose hardware timestamps the event more accurately than the
>>>> + *    moment the driver gets to handle it may also fill in the timestamp
>>>> + *    field, as a CLOCK_MONOTONIC time. It is left alone if non-zero, so such
>>>> + *    drivers must zero-initialize the whole &struct v4l2_event.
>>>>   */
>>>>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
>>>>
>>>> @@ -116,7 +121,9 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
>>>>   *
>>>>   * .. note::
>>>>   *    The driver's only responsibility is to fill in the type and the data
>>>> - *    fields. The other fields will be filled in by V4L2.
>>>> + *    fields. The other fields will be filled in by V4L2. As for
>>>> + *    v4l2_event_queue(), a non-zero timestamp field is taken as the
>>>> + *    CLOCK_MONOTONIC time of the event.
>>>>   */
>>>>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev);
>>>>
>>>>
>>>
>>

