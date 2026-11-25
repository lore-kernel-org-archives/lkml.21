Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614929;
	b=neGkXu8uFLNIJPlG+3Xa9sZjy2+KzsBl1Cc/AxAKDSMZThoYGNDHQ37E7uDptv0iyuF4
	 q3u/rUGnnvT3zC/NO1SNnTb37GAu3glOWnjl6Q+tXXsbCYjNAPiK9WmBcRKOTw1SuckEV
	 oevMmWFC0+71qcfvrTrdoGO+CANyufGlA4N3ehQYxP+pUHtl2CX90uavVn2BOKmSqxh/V
	 QOtJGnK1GpeAo1uIGgsazPCM0RTAQJ66u3jY+xlEi+BgN1h21aXxe3Xd8l4jTZ8VieT99
	 63Xm03DVENRCr9XQoAeBo7/AI1fOJgvKL46RYbHvI57abERHXRq0RUrmX+toJkYWB3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614929;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9mLR3ReibMxxaJSoED1PK69ne/VAm1etiDTIP2zYucc=;
	b=kfA9SxvDVULH9fzLomwChPfDL2AOarhWMFNHaw7atZLXzzQuQNWHjj6QzCIGrxkM0EiN
	 Sojl0MFT19uiKn1Z9f+Z6nBQy6Mm+o890AddX4dxuYmZBeMYvHR20Es/32ee4mNT5Gtsh
	 DzqDG7gnNaPTv4dMIKYWpMyEShB4apgxMmNHbelvkJ90r/ST/sLZwzy22/nEQAzTJkpEt
	 8AXo/E13g82jA1efND8jutRnom654LdS1gkmY7FK+J9lvxqKl9NuK8grr+Y+IFOOyE/KB
	 VQjpSYfbjDKdhCUC+o33Qb7FCkcoP1zhk0Ywrw8KHgmGk3qVVXocjZcMS+Bwffl3z1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=c9ngxlxr;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F62F606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F62F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=c9ngxlxr
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72F541762;
	Wed, 25 Nov 2026 05:55:25 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3F7E3F86F;
	Wed, 25 Nov 2026 05:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795614928; bh=lFlXR/nWHqMhCzMVQ0vM9REkBLQ/I9uQbkx3Vlgppws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c9ngxlxrtG85+E9yWt9tDY6wd6LRRaRetZ8uuB6D7Wv9kcS25/YiGJMhK85uAwedQ
	 Z4yXmCwSWlV2AB7x4mSHpgXpVmEiPVL0mUJ+Q+qcpnQ08mG6uKy+6TSlrizJgmvJJC
	 nbgOnGvrKalGZkL4RxKobag2CWKvkuPIPTJvxo3M=
Message-ID: <3fe28416-f24d-4c43-81c8-4c49a8ec913a@arm.com>
Date: Wed, 25 Nov 2026 13:55:25 +0000
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
Subject: Re: [PATCH v3 02/14] irqchip/gic-v5: Only set IRS DPS when 1ofN
 routing is supported
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-2-13c1859e8aa3@arm.com>
 <CA+EHjTxyzmrs_MmyR+mgd2i3o+WsCJXUDeFYMazx90HcMsRpcw@mail.gmail.com>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTxyzmrs_MmyR+mgd2i3o+WsCJXUDeFYMazx90HcMsRpcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 19/11/2026 11:50, Fuad Tabba wrote:
> Hi Sascha,
> 
> On Wed, 18 Nov 2026 17:35:31 +0000, Sascha Bischoff
> <sascha.bischoff@arm.com> wrote:
>> IRS_PE_CR0.DPS is RES0 when the IRS does not support 1ofN routing.
>> Read the capability from IRS_IDR0 and skip programming DPS on systems
>> without support for 1ofN routing, rather than blindly writing it.
> 
> vgic_v5_irs_set_up_vpe() in KVM writes IRS_VPE_CR0.DPS unconditionally
> too, and that bit is RES0 when IRS_IDR0.VIRT_ONE_N is clear. Worth a
> separate KVM patch for that one?

Yes, absolutely. That doesn't belong in this series though, and from the 
looks of it I have a few things to fix up there, so I'll be sending a 
series that way in due course. Thanks for flagging it.

> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad

Thanks,
Sascha
