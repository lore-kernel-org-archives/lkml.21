Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615091;
	b=pnAQKHobuWEmAtTQylBz2Yb4sdrFL4i/Ynv2zkyMzQO7MvyjQiiN2KTQNb0GLd9BDgqF
	 hRxbxS0qa30jAaV2+0uo/aJjyAky8I6Oilg8WT0RP11KX84GQEtRCz5dofwHQaXPeNTZT
	 Et5nTeQtft6qO/POkddbcb8uxZU8uRka7BiOXLvv9ZVdRKt4O9L2qHbwEI/IwVE1rYmfo
	 BRlbYGiGYxQxooEOqkc492NTGT99Kf0lrrubaZDO3hRbIdaefu630iZKQOuyZ2oUrYwYz
	 ncpY9pfdd0wlBxTDdc+q0g4H7zZFurIPQMwlrjriVMCwbgTpAczIU0nIACkajLXnoqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615091;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JY41AbFjJt9FKuxn9PivDuklHDyfv269Y+Nc373H9sQ=;
	b=emdKYglyOt9ZJs3C6H9wf+0tYaXWaUIsVtiXrZYLtGhat46mllG7vQCweW/xYORmJzNo
	 KZVn0EeIkA9ayq5ZfdkhqMTSp0Kp+nqmc94PZF3tbeiEMysR75nyJwCjV4twbJon9EFu/
	 2geDMSLkGhx+QpR3k0QhWgY+YRnA2poE2vXHlhm6Eaj/RzhB5WZDaXrQ9BAErs3q11EcN
	 e619KhmEJdbyxbfRhoTvdB4NRbLYoQgHWn0Y7zZWWJGVss2j5Y0lKvJScEov3+yCasdGh
	 xwt2baAkoXAczDMOZevq4hpLjvVi67E7rWjkBkmSEU1TexeETENLKIbUP2DJfmnsKnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="Ud5c/r1j";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBB8606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBB8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ud5c/r1j
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEDA31762;
	Wed, 25 Nov 2026 05:58:07 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 291303F86F;
	Wed, 25 Nov 2026 05:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615090; bh=g6yDIGheZOSV9BwSKe++njM/qPQOvfexIPSYSeOYw9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ud5c/r1jM0kLPTmnZmXJ5gCPJ66qrynzJlpvsIMkws+BMLS4oJi9QcDWYyWIeDcv6
	 u57icOp1B/QzMGoSKo7tsosT/Fq2f6mWPAwF4nYTj1WDoSZly3r0z+SYjc43oMUPxd
	 FB3VOw+MRwiVyNmzcDKDzP/xPBay24ibDbTmzyMc=
Message-ID: <65f3844e-6a5c-4b2b-b678-907115da47ad@arm.com>
Date: Wed, 25 Nov 2026 13:58:07 +0000
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
Subject: Re: [PATCH v3 03/14] irqchip/gic-v5: Serialise IRS synchronisation
 requests
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-3-13c1859e8aa3@arm.com>
 <CA+EHjTwoP36opJYeZ6Ba4aLE8f5igZzW9+LSbuZkztr51bRdxg@mail.gmail.com>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTwoP36opJYeZ6Ba4aLE8f5igZzW9+LSbuZkztr51bRdxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 19/11/2026 11:53, Fuad Tabba wrote:
> Hi Sascha,
> 
> On Wed, 18 Nov 2026 17:35:32 +0000, Sascha Bischoff
> <sascha.bischoff@arm.com> wrote:
>> IRS_SYNCR writes are ignored while IRS_SYNC_STATUSR.IDLE is clear.
>> Concurrent calls to gicv5_irs_syncr() can overlap, causing a request
>> to be dropped. A caller can then observe the earlier request
>> completing and assume that its own events have been processed.
>>
>> gicv5_irs_syncr() may need to be called in atomic context. Serialise
>> the request and completion poll with a raw spinlock, and use atomic
>> polling.
>>
>> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Cc: stable@vger.kernel.org
> 
> I don't think two calls can overlap in the host driver today. The only
> caller is gicv5_its_irq_domain_free(), and since the LPI domain is the
> parent of every ITS domain, irq_domain_free_irqs() holds the LPI
> domain's mutex around that call. Do we need the Fixes: and Cc: stable
> tags then?

Good point. I don't think that this is really an issue until we have the 
KVM patches to trigger this in place. I'd not quite realised this when 
adding those tags. I've dropped the fixes and Cc: stable trailers from 
the next version.

> 
> That said:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad

Thanks,
Sascha
