Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968981;
	b=3NVinRor1E6lw2Ej0bA0CfWMR6R+5yPYHOFGoPKQj/nO7qgIxaEbeS8+FiwDmADcEQEV
	 xs6toqq8+qtwvOCeDURiTxt6ru2mGb7zeq0u2mHrgdH/fw5svl030gdZ+PP6LICCvwyqe
	 tylNqG/A3PAbCFKnwn9e6SgXrHPB0IzAEJiEtdh+iDZuwO4HxJZZT/B8qvUufhobXxII0
	 qIoe4xOc3WAdHG0xyuqQkZ5PgZo+LsaPB3qE7vNn5eYe3yzLqPGx7Jl8cqJsjdZNMry/g
	 xNoxNEwFaFRHkUeM+4WkfIRCmOSZGm4M3ZWo01aLR4/JMRjN7MC72tTW77/KXOnhZgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968981;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=YqKHThxqhV+Nx5LE0AW1AJg3y+A6AtDJSvDAZKmD6X0=;
	b=nhLla5aozBNYZt3PbPGhK5m8UIa9c+pl+CitgMVRwT9ZuHhr8UQrggNlDI9S10IkY8iu
	 udBHa2dpolucqcLgrsGo/SO4Tiy6IqCqhTL4+1iEMOFIacqRg9+AKPpWjko7+yucexvy2
	 21PlvoJecqIfx8OrJAPD6E9VstxV78Hzzbsp1JDmi9VnzP/rfUIl6A8nRf1oQqGKdbvrR
	 GWO2Lak0kKKf7Sr2usxEW/vWELKdoYMI8I7sF9XCAM2lizJ2Q2Oi0aNg+LbP3WqYD6hvW
	 8+rGUGc7E9xdxBPdn9J4LcI7C2XoFxtD8THLfIYmryhEK/7GGhdexGrf3yKRtqnbKjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="ef/WcXmR";
	arc=none smtp.remote-ip=210.79.60.93
Received: from mail-m6093.netease.com (mail-m6093.netease.com [210.79.60.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A809B606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A809B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ef/WcXmR
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 551083689;
	Wed, 18 Nov 2026 10:29:28 +0800 (GMT+08:00)
Message-ID: <72957827-fde8-4f4b-80a9-050d2f112316@rock-chips.com>
Date: Wed, 18 Nov 2026 10:29:26 +0800
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
To: Daniel Drake <ddrake@baylibre.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260814022453.437-1-kernel@airkyi.com>
 <20260814022453.437-4-kernel@airkyi.com>
 <0e722f43-f08c-4636-bf3e-0dbe991bf6a0@baylibre.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <0e722f43-f08c-4636-bf3e-0dbe991bf6a0@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1ec7cde4b03a7kunm8a7c13a3602732
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0lCVh4YGUseSkwZSEoeTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ef/WcXmRp3/JbdOl57cgcDsCjcrruOWIRVodPFUgqkBMQqGs1kxCk0jmzFrzuctBz/6RlanWo3XJ1Cv0IwLohI21kkIj7ZIDhYhpR0KgqQxS4A6eoDGr/XCwY6y1812V19zHiluIVZLBRYmffrSRlcepE1R4QcMPncOQLR5Fd4o=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=YqKHThxqhV+Nx5LE0AW1AJg3y+A6AtDJSvDAZKmD6X0=;
	h=date:mime-version:subject:message-id:from;

Hi Daniel,

On 11/18/2026 5:53 AM, Daniel Drake wrote:
> On 14/08/2026 03:24, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The rocket attaches the IOMMU group in rocket_job_run() and detaches it
>> in rocket_job_handle_irq(). Calling  iommu_group_get() in
>> rocket_job_handle_irq() causes the reference count to increase
>> unexpectedly. And this causes rocket_core_fini() to fail to release the
>> IOMMU group, leading to a resource leak.
> 
> 
> While there is a leak here, I think sashiko correct in saying this change would introduce a crash because core->iommu_group can be set to NULL before this codepath is reached.  That might be a simple fix.
> 
>> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
> 
> 
> Wrong commit mentioned here.

Thanks for you review. This is indeed a problem.

And it has been a long time since I sent this series. :)

During this time, I have seen a lot of similar work. For example, work
similar to patch1 is here[0]. And some of the issues mentioned by 
Sashikoare also being fixed by in-flight patches like[1].

I'm not sure whether I should slow down the submission, since it seems
Tomeu is quite busy and hasn't gotten to some of the backlogged patches.

[0]: https://lore.kernel.org/all/20260915041152.1725014-1-vulab@iscas.ac.cn/
[1]: https://lore.kernel.org/all/18667b2afdcaae217fa1038f5348ab23ed756bdc.1794615323.git.gahing@gahingwoo.com/

-- 
Best, 
Chaoyi
