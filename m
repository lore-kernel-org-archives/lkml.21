Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993428;
	b=tU7dJuRdOYTvyZb4GP/JYC+1lMfeCkj5RkqI3QTCeILttYIm0fJrqH7E0tRz7AFPm7VU
	 kOx5orMxnpeI5kAwPbI2V5PG9xjw/jjTqmAgR9s4N9K7BcW4ixS0iPrcjyISuUqJnEq6D
	 8SEXF6FeXZp8gqXG4Tgt4kWO9bXxGZH5eWwn6ZHsr+VP1d09tITsLUR3+CnQFYCZiIIyp
	 197PSPGXFD40sZUwblEJxS1TUa2VpSmvYr6TqCy/RTu0Am7yZPJCTYiUxh3FjqVrit8NF
	 Xky/57n766UbRyTD8Ughjo7jusaR1eKCj2etR05jqPYrcLOUHdvbH1rxmLQuNBp4ZJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993428;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=I3smdXzbgBpgrivukeP0fqIaIFjz2n/NTWdA0NUSV/Y=;
	b=r6x2CSk7Uezqkz33H2rm2w4WecIW3Z2NqZzdm2Hc1C0ujesBUefObDny6RtGmAUETKJE
	 9FNjD23lb5+KyzlwShb7QniOnc6zUkS0eoHbHp36OJc201EQ95mGOyeCvSRToTg0cTWd5
	 CCYusRSbRPKivvN/wSXW5K0S9zdz8o66qls3U6ZWaWeLd8oA0351QxY/aCF0ydpsoHrDs
	 uSj0DYx6RCJx8j3gBgg325oNGRIt0dLTvgDnWD4tc5VzCH8FrviznnbP35+tqbux3ADzy
	 Vbzo+dQMbLKqGUwuH1VW/7QhdNteKQpoqr6Mhd62dMmYivmB00Bg1ObpWluuFYPpwMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=TGHllOXg;
	arc=none smtp.remote-ip=103.209.128.93
Received: from mail-m12893.netease.com (mail-m12893.netease.com [103.209.128.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF191606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF191606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=TGHllOXg
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 551f9ad52;
	Wed, 18 Nov 2026 17:16:55 +0800 (GMT+08:00)
Message-ID: <daea6316-bf37-4b9d-92a7-945f34cd719d@rock-chips.com>
Date: Wed, 18 Nov 2026 17:16:54 +0800
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
Subject: Re: [PATCH 3/4] accel/rocket: Fix the extra iommu_group_get call in
 rocket_job_handle_irq
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Daniel Drake <ddrake@baylibre.com>, Chaoyi Chen <kernel@airkyi.com>,
 Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 LAKML <linux-arm-kernel@lists.infradead.org>
References: <20260814022453.437-1-kernel@airkyi.com>
 <20260814022453.437-4-kernel@airkyi.com>
 <0e722f43-f08c-4636-bf3e-0dbe991bf6a0@baylibre.com>
 <72957827-fde8-4f4b-80a9-050d2f112316@rock-chips.com>
 <CAPsqS2QhAortoDOt9MBizTr4RCDhChr1xLF13NNTUYjyFMakhg@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAPsqS2QhAortoDOt9MBizTr4RCDhChr1xLF13NNTUYjyFMakhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1edf1e46a03a7kunm2355c227669381
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaS0pOVkIaSUwaHU9IGB8eQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=TGHllOXgyJL+s/aCvjVJ5CotwyJ8QVPI/4twhwqsW0yPCG59Dyci1TvNZNY8uF8lkHn6iTHPcu3BYeeZYEJT9vDcaSjDLjsPIqJAta/qrMpcE3P2omQfiW8faKgRjBQWz6EtL+tRQMpKvJkTaMMD1RO2aMNdNB/oU9TNuILOP3c=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=I3smdXzbgBpgrivukeP0fqIaIFjz2n/NTWdA0NUSV/Y=;
	h=date:mime-version:subject:message-id:from;

Hi Tomeu,

On 11/18/2026 4:58 PM, Tomeu Vizoso wrote:
> Hi Chaoyi and Daniel,
> 
> On Wed, Nov 18, 2026 at 3:29 AM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>
>> Hi Daniel,
>>
>> On 11/18/2026 5:53 AM, Daniel Drake wrote:
>>> On 14/08/2026 03:24, Chaoyi Chen wrote:
>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>
>>>> The rocket attaches the IOMMU group in rocket_job_run() and detaches it
>>>> in rocket_job_handle_irq(). Calling  iommu_group_get() in
>>>> rocket_job_handle_irq() causes the reference count to increase
>>>> unexpectedly. And this causes rocket_core_fini() to fail to release the
>>>> IOMMU group, leading to a resource leak.
>>>
>>>
>>> While there is a leak here, I think sashiko correct in saying this change would introduce a crash because core->iommu_group can be set to NULL before this codepath is reached.  That might be a simple fix.
>>>
>>>> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
>>>
>>>
>>> Wrong commit mentioned here.
> 
> I fixed this one when applying.
> 
>> Thanks for you review. This is indeed a problem.
> 
> I'm sorry but I had already applied this patch to drm-misc-fixes and
> pushed when I read this. I have looked at fixing just this crash, but
> have decided against it because we anyway crash in drm_sched on core
> unbind whenever a client is active (no need to have a job in flight),
> due to the sched entities keeping a reference to the stale scheduler.
>

Oh, that's true, but it seems no merge notification email was sent out? 

https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5c4aeafcac8c46be7b08b86795baa64453eb68aa
 
>> And it has been a long time since I sent this series. :)
>>
>> During this time, I have seen a lot of similar work. For example, work
>> similar to patch1 is here[0]. And some of the issues mentioned by
>> Sashikoare also being fixed by in-flight patches like[1].
> 
> Core removal needs to be fixed as a whole: detach the open files'
> entities from the scheduler that goes away, complete or cancel the job
> in flight, and quiesce the job interrupt before the resources it uses
> are released.
> 
>> I'm not sure whether I should slow down the submission, since it seems
>> Tomeu is quite busy and hasn't gotten to some of the backlogged patches.
> 
> I'm sorry about the big backlog of patches. With Heiko and Daniel's
> help I expect to get it cleared soon and be more responsive.
> 

Thanks for your excellent work! I think patch4 could also be merged? 
That way, people on the rockchip mailing list can also conveniently help
us review these patches. :-)

-- 
Best, 
Chaoyi
