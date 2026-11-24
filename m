Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534906;
	b=GfDCn2mGQEs/5WUYWPDMxFdBjcJY32EqVl7mXEYMi6WbD347ce0UmvjrGM8NPnCfYQ89
	 BkWWa03w2jsMKWR42nxJmCPVwLo+nRjv8ayC2n3qnCencOUAisunbN/OtDpVYLca1m/6L
	 A2NzLiTZqpO3zSJPT0qed7Td2aIjSZKTOrsbRqlDClxBf8sbcIqbA/AC5QA0JTCQC5skN
	 Mc/2HT3ifT1AjsnpGSSmBIAVefkcCjf9lA3Hn1paRbofS8FmlllY/YgTNL+qX6McntmAO
	 1OCqFaF7mkrqh9+JQk/2ef2T7AMxMs/dl0avtpSJWjE0aZpBgSYtlo8eUCQwhkhoKIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534906;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3DGi56HMLNIFLBNyoeh83BW+Xx055MiTn+skwng0328=;
	b=EQYT+bRU66wXuiZ6J5i9mZbP9C8zIOSdYbOjf1vX8RX/sFK1pnLNEGHczvdYRso5Jvwi
	 0SAzlv0EbzhI1K2aCS4znKv0X8G9bh9SW9n8sMLj66T7MKeEYnDSMFAg9QdGlfwNz7gCR
	 EQoaMd4lyudrsPLkpyX1b1+i6Kh0TnmZw24wGe1vXNy4z26I/PMTDzsj888tyEmbMrmfR
	 Tjx9Gxwyv2x1nFHCTkPCDXHYeAwJbm6mE3vcd+cKruOJozsuDzH9F+a4ySZV/C5XmHhkA
	 aVmc57d/vSG7d3crZ+xsh430wTOjj+7DXpFASEDERF0VT+68XihdgRNVDNNHI8vv05Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uZhWUJiW;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3E9606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3E9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uZhWUJiW
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95EC5339;
	Tue, 24 Nov 2026 07:41:41 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 042FB3F763;
	Tue, 24 Nov 2026 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795534904; bh=MYQzCGwM/6VqgmM4kCbX5dX14lne+B+ab2AMSrnJXm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uZhWUJiW36cqsPqo5/a2BprZ3dtoaLvAULpErT+33bmXJ09qyDkEBCk0Cf3xwXt16
	 ZHZ8ioV/s1oB5cMfYqa5QpIxA2UMibImXNDGqEoPHB2r6tvQEd0Zog2HB3A9Y3CrT0
	 LJfaE01plWabPoyWobZcZWg9KdwN6a2TCM3TolzA=
Message-ID: <2aad1921-9227-437a-b298-798ec1841421@arm.com>
Date: Tue, 24 Nov 2026 15:41:41 +0000
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
Subject: Re: [PATCH] coresight: perf: End AUX output when an event is
 throttled
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Vlad Poenaru <vlad.wing@gmail.com>, Amir Ayupov <aaupov@fb.com>,
 Suyash Mahar <smahar@meta.com>, Song Liu <song@kernel.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
 <09e172d0-3ef5-44ef-a966-7db3b8a4af9a@arm.com>
 <20261124153508.GA7209@e132581.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261124153508.GA7209@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 15:35, Leo Yan wrote:
> On Tue, Nov 24, 2026 at 01:06:04PM +0000, Suzuki K Poulose wrote:
> 
>>> Check AUX handle ownership before updating the buffer or ending AUX
>>> output. Drop the post-update check because the full stop runs with
>>> local IRQs disabled, which prevents the TRBE IRQ from closing the
>>> handle during the stop.
> 
> ...
> 
>>> +	if (mode & PERF_EF_UPDATE) {
>>>    		/* update trace information */
>>> -		if (!sink_ops(sink)->update_buffer)
>>> -			return;
>>> -
>>> -		size = sink_ops(sink)->update_buffer(sink, handle,
>>> -					      event_data->snk_config);
>>> -		/*
>>> -		 * Make sure the handle is still valid as the
>>> -		 * sink could have closed it from an IRQ.
>>> -		 * The sink driver must handle the race with
>>> -		 * update_buffer() and IRQ. Thus either we
>>> -		 * should get a valid handle and valid size
>>> -		 * (which may be 0).
>>> -		 *
>>> -		 * But we should never get a non-zero size with
>>> -		 * an invalid handle.
>>> -		 */
>>> -		if (READ_ONCE(handle->event))
>>> -			perf_aux_output_end(handle, size);
>>> -		else
>>> -			WARN_ON(size);
>>> +		if (sink_ops(sink)->update_buffer)
>>> +			size = sink_ops(sink)->update_buffer(sink, handle,
>>> +							     event_data->snk_config);
>>
>> Could we retain the READ_ONCE() check to handle the TRBE case here ? This
>> looks like introducing a regression. Something like :
>>
>> 		if (!READ_ONCE(handle->event)) {
>> 			WARN_ON(size);
>> 			goto out;
>> 		}
>>
>>
>>>    	}
>>
>>
>> Otherwise looks good to me
> 
> etm_event_stop() runs with local IRQ disabled, so the TRBE IRQ handler
> cannot close the AUX handle during the stop. If the handler closed it
> earlier, the ownership check before update_buffer() catches that case.
> 
> The second READ_ONCE(handle->event) check is redundant and is safe to
> be removed.

Of course, yes. agreed. Thanks for the clarification

Cheers
Suzuki

> 
> Thanks,
> Leo

