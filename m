Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635561;
	b=baWjhL7JGS3ffAnUKsWQrL37aRuLV3jr7Txn+8juQvvyZ+4KyAAyROD+g+cBoJXe4Lb3
	 OXr5oxQzxKoV3m0AR/ae+eANd4LdohAZYvX4/TMIUjCUAFzGYXUilbHBRUIA+gAa742Uu
	 iaOAdEw9oyy1S9D6eoHyOfDQ2m554oqQS90DtBIbvC1pe8rNzNzbpiwqtSF40yQdw9hAI
	 S5vkwEf8TSjaBrznvVqP2SHQEbm94jzjSPF8mfn2LdY7N3d+0G0CdSasm89vZl0JzFeeq
	 yI+z2zEdF+cPEUPci5zsy3ouDSx2qre5UvyzBEo7mKpUgokrO287etR1ywMr3ReVRNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WVx5Gqftnjtyz2vbbCDAxrIo5XSl3YV5aN07+6VrgUU=;
	b=guySdLQvTyoOp4nn8aoWXpJyjubzMSxa+qnUBSeJs/gV4ejk1Hr4GorcrMkqkq6MmmYE
	 prKvsZawdMWMD4zTL8hPsIAf8IRYmSJiblSQxOCwVeueX1iXukMoFcbGDKtilU1pjcVYB
	 yaNNAAGpCdX0lPcJ/ozWFtO6MxJ+zHZbdzxa/TrjUWgb48eZkvqjbVPAubUb8xy5yMpIr
	 N+IVE9lggRlaZJ2PZohKHIA3lY1MFHYSmmSpNtgEScJ5u7SHwjuoCatw+M+iRYks3CGsj
	 C8TbbbHBgtb6AY7J+ABw2GN4Q8ufNVdM28/9Hh6NJ9bASkL+bMjEcw/w/Wt85tUyd6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pZbTuoUd;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F19B606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F19B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pZbTuoUd
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so4305461fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795635559; x=1796240359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WVx5Gqftnjtyz2vbbCDAxrIo5XSl3YV5aN07+6VrgUU=;
        b=pZbTuoUdSAJLh2Oer9e2HrWRgMZr5zDSucwcrZtOXNa6DID1VfY6xiJQp5apWyc00Y
         VWI/5GbqOnnPIg7XU4zeJqme1N0+sRi7RY1Les3CkolXNezn121ARAiuPAba8ACYA8Zv
         S1GFWiDvULRpDNMuIKILBNBRZitruRtqf9JwsagYcrOQiAsDTuIL6ew6WlJi9CrEvuzS
         p7ufqcekp1JSrjgj1TChFnTakdZ11cS68khCZ2LxiVxrJUOiXF63bmaY9Li1k0ZFG21M
         pyRXQtfFHhp4tyvI+Q8BCCMkY5j7PIyMsmmiZv8pmIn7EYwQRX+0VjaC5aw0g74yLNXU
         RIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635559; x=1796240359;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVx5Gqftnjtyz2vbbCDAxrIo5XSl3YV5aN07+6VrgUU=;
        b=Ba9y9X+GTqtZTwYjYBZuP4CvqZouI1G8jghIHTeYLZuwhYZISnvRHjdrzT140m4gCA
         xgqOcXM5zSp445rrYquDl9a0hWPVRLdZz3iijbaCoOnt7Po2BB5umJnyfUzR9FwcquSs
         jMcxGhzT2SEoYzD9RaX3CNOpmNrdrZh55XeWasrQctO0OF8UD0UxZR3lQmMqiKoMGgE8
         BU/UQyqJbChbsxTDhHD1E53wRsWQUM+7Ad0Vc07/SvIoI4RfZ+DMXy6zh2K8qZUMhyt0
         GSGeoByWmPYv7QL7KKUk2F88f/eCBJQx6NxJCKAiHRH1mN2ThkAiBJDThA1zm4sSf11R
         ES2Q==
X-Forwarded-Encrypted: i=1; AL+hErHAu1ihLJhgkB5poqfWdU/p2w2wNumSUu2ZRERl5aIH1qNCuVHCMRf3akGkQDbnD5hRi9cRpDq8KUg2WvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zv69l5+8spVXKMx4tW+2/gh3LROmhcFSBuFMNqmXwTgIjlyXA
	7wxqxNMmylTx5yC+pk4DhHRnX2pAu9LaHHEd/hwT2qdR9l34YBLVM+tL6NcwEIbw760=
X-Gm-Gg: AZFdTZdMLm3h/e5/rRatjFtqGCisJPnTLs/Hs4/GWxRE1ZYEsCTykSLxfZhGC5NZGwE
	uKVkcWzFtzERQOdh5PmIWAYYQA3kL8VJ5lfr0bPVukh7C6H9OeyIhs4Pw6JS4GPfiY8QIQt2eao
	FraNMh3xdrm/Twyjt2/iiySF0BTw2aMhtH15TMkrw0fQyzMrm5dIU1sLu/x92uU6BqcJN7Of1xZ
	LpAlpK8rjUfiwL4vIDGEXq3Nat/Ej6tdBApzAMs+9KU58eDDDUrFrqtyRGyljwFPbeVbeiYn9mb
	SrJVJNzrZaT8aS/DaFuX2D8QyEItHkinQr/JYzIvD3qNUaW3zbkEL6UHzCY0ODj5KzgqV+N6dC4
	bx7tUpr5YT70h321jXoc+U5Tld/HDczbBwVCtD0i9N3PlEvQuvnZNLODAap4zNOi4YYgYsrnmEi
	QmlmdFpxKYfE8sNTb/gV7XTJPUNtK9ICkJd9xIkanzeB6wP1xIdm1J6FQV2CvvKtYJh2Z/IdsFm
	rRM+5cx+gUaJ3NrBdojXRWZpO/1rUC0BvoxzBQXfmAGBKeeJsRDG+ZMwxZCQ0/+PWag7ZWkmNRa
	VqDNhsQD1ZMaS2c2K79Q0Z9gZIIkLNBfj9t8g79rPN+OUpx/qPvMRcxgKahEGtz4yOMKxbDcEhJ
	/6ZftRx+U
X-Received: by 2002:a05:6512:1048:b0:5c1:4e17:1ed6 with SMTP id 2adb3069b0e04-5c1bc80fd9cmr5765974e87.6.1795635558529;
        Wed, 25 Nov 2026 11:39:18 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm52215571fa.12.2026.11.25.11.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:39:18 -0800 (PST)
Message-ID: <ff986bbe-7cb6-4733-9f95-bf788f4f1f07@linaro.org>
Date: Wed, 25 Nov 2026 21:39:17 +0200
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
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
 <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
 <CAFEp6-35qT9Ow8SOWWBxf75geq6s169+SPJmw27TnkkD3o0wow@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAFEp6-35qT9Ow8SOWWBxf75geq6s169+SPJmw27TnkkD3o0wow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/25/26 15:21, Loic Poulain wrote:
> Hi Gjorgji,
> 
> On Wed, Nov 25, 2026 at 1:29 PM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
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
>>>        wake_up_all(&fh->wait);
>>>   }
>>>
>>> +/*
>>> + * Hardware able to timestamp the event itself reports that time in the event,
>>> + * which is more accurate than the moment the driver gets to queue it. Fall
>>> + * back to the current time for the drivers that leave the field cleared.
>>> + */
>>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
>>> +{
>>> +     struct timespec64 ts = {
>>> +             .tv_sec = ev->timestamp.tv_sec,
>>> +             .tv_nsec = ev->timestamp.tv_nsec,
>>> +     };
>>> +     u64 ns = timespec64_to_ns(&ts);
>>> +
>>> +     return ns ? ns : ktime_get_ns();
>>> +}
>>
>> I think it makes sense to add an additional field for hardware-based timestamps.
>> Converting the timestamp to the monotonic time domain introduces precision loss,
>> so it's better to expose both to userspace and let userspace decide what to do with
>> them.
> 
> There is no loss of precision. The timestamp is actually more tightly
> aligned with the actual event. So I don't see the point of having two
> values, with one being less precise than the other.

The hardware produced timestamp may serve as another unique id associated
with a data buffer, under the circumstances it might be helpful to receive
and rely on this kind of information.

-- 
Best wishes,
Vladimir
