Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447771;
	b=kj0eU0MCJjAxQWywTWRO/zpD14q10/Xs2yfxqGVnwmYzHUdWJnoUivMebx0fCzehDJKy
	 oA8GMLh/Pz7Nszzup/cX+exVdScbAZee9YcJxfXZYa+bHtfQjgSrARPC5GnHNVnEKb0h5
	 0aXy35lC9mUH1ZoEn4x8LI5cvyey4Mraj4SXUwQhQfjChzdt9XPrVQYHvnbZyPyEpzbEZ
	 KI4ZPm3ysyEBsgEsSaBfmjgLwCnrx9Jo6e7KMgUhlRTEoCml2mOIRD7PX8Di4L4TNBCN+
	 eowhNwCEyU6hlxD4D7CVa1Srs2wT1jDGGnJTwmZIFXlS7zT44A+q5nGEVSUaEb7WVcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447771;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=42pe+2UMicZlITyFPJxiB15+3uk5mJXNcVaAM4zz0rk=;
	b=pxWwWIZSSstSVLu/bbMcbHO2DdL2GAMfzYyLonSqarL7EzAbjOd+GkbHLggQa/lJZqPq
	 5czw6QoxdTykNcHJw9k5lfeD4Y4BtJf8RIYIaf+ZCOBfj0FsKu3hTCIXWYsdjhtI8X49a
	 gfkUbFpfdF7UT7gQ1OK/cRNhJOybX406XK0A1gsJQ6bTfLILCADf6DctM92ct0VH4+p3C
	 2MCXfiVRzWwejw6ytSjW6IuzUZQLddShBqNjIg8lOJxSjTIzCarO3zTjMa5GqhwCdCmoo
	 4f3Di7QUHyQqc+/IPLUNabR6Ovt5xI2rS3+TpHzIxrIaCR4dbKNNqLgtbLRyLSOWlqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="JY/Va0iH";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E28606A335
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E28606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JY/Va0iH
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 243B3143D;
	Mon, 23 Nov 2026 07:29:27 -0800 (PST)
Received: from [10.57.63.212] (unknown [10.57.63.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D9073F632;
	Mon, 23 Nov 2026 07:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795447770; bh=0xbcGpMrwScqUYzspFMcy4M1QTBeI7Y5dmo8IAPpgqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JY/Va0iH6nnTm3ZCQ1P7bWW987arEPgcPp0idnNLsxO1wSYW0dvJvX7Thmdqkcx+q
	 bMbePNqN+MqqRt4ewHMzSstT+FzKDVWQibB5NCMakFs22XmyyGWpShlWFPpl2urfsP
	 a1XUe6lSzAB2MI9MvwrAa+scQhKwHN97tfT+Kbxw=
Message-ID: <a9a404e8-66fc-4595-9d14-7ab97cd08583@arm.com>
Date: Mon, 23 Nov 2026 15:29:25 +0000
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
Subject: Re: [PATCH] drm/panfrost: Gate the RK3399 GPU clock in runtime
 suspend
To: Igor Velkov <iav@iav.lv>, =?UTF-8?Q?Adri=C3=A1n_Larumbe?=
 <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20261030-panfrost-rk3399-pm-rt-v1-1-e94437159a9d@iav.lv>
 <autNWETrwrHbD2H9@sobremesa>
 <20261104-panfrost-rk3399-pm-rt-larumbe-reply-1@iav.lv>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261104-panfrost-rk3399-pm-rt-larumbe-reply-1@iav.lv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/11/2026 19:59, Igor Velkov wrote:
> Hi Adrián,
> 
> On 04.11.2026, Adrián Larumbe wrote:
>>> On ROCK Pi 4A restore from hibernation hangs in genpd_restore_noirq()
>>> of the GPU while panfrost is bound. With the clock gated in runtime
>>> suspend, as on the Allwinner H616 and the Renesas parts, it restores.
>>
>> I find the wording in the preceding paragraph a bit confusing . Would
>> you mind clarifying what 'parts' means here? I guess you refer to
>> specific SoCs.
> 
> Yes, SoCs: allwinner,sun50i-h616-mali, renesas,r9a08g046-mali and
> renesas,r9a09g047-mali already use default_pm_rt_data. v2 will name
> them.
> 
>> Also, I wonder why not disabling the clocks would forestall coming back
>> from a power suspension state. Have you raised this matter to the
>> maintainers of the RK3399 SoC subsystem?
> 
> The kernel that reads the image never binds panfrost, so after
> clk_disable_unused() aclk_gpu stays gated. The restored image still has
> it enabled in software (enable count 1 since probe), so powering the GPU
> domain back on, whose clocks include aclk_gpu, only bumps the count, and
> the QoS writes that follow in rockchip_pd_power() go to a gated block
> and hang. I traced this for rkvdec [1]; for the GPU I see the hang at
> the same spot, genpd_restore_noirq(), and gating in runtime suspend
> removes it. I haven't raised it separately; Heiko is on To.
> 
>> Would you also mind describing what you did to reproduce this
>> resume-from-suspend issue? Lately we've been getting some fixes for
>> similar SoC issues and I wonder whether mine also has it.
> 
> It is hibernation (restore from disk), not suspend to RAM. ROCK Pi 4A,
> drm-misc-next 33ed26235db9 plus [1], panfrost as a module, bound, GPU
> idle, swap file with resume= and resume_offset=: systemctl hibernate,
> power off and on. Without the patch restore hangs at "panfrost
> ff9a0000.gpu: calling genpd_restore_noirq" 2 of 2, with it restores
> 6 of 6. A quick check on another board: with panfrost bound and the GPU
> idle, its core clock keeps enable count 1 in clk_summary.
> 
>> If this patch depends on another fix being merged first, I think it's
>> best you delay sending a v2 until it's been committed to its relevant
>> subsystem tree and changes pulled into drm-misc-next.
> 
> It applies and builds without [1]; [1] only gets this board through
> restore up to the GPU. [1] goes through linux-media, so I'd rather not
> tie v2 to it, but fine either way.
> 
>> I'm not entirely sure about what patch submission guidelines say about
>> testing information, but normally commit trailers must come about
>> last. Would you mind then moving this to right before the S-o-b?
> 
> The test notes are below the "---" on purpose, so they stay out of the
> commit.
> 
>>> +	{ .compatible = "rockchip,rk3399-mali", .data = &default_pm_rt_data },
>>
>> You're effectively adding support to a whole new SoC. This made me
>> wonder, are we sure suspension resumption not working is only because of
>> GPU_PM_RT? Shouldn't we know first about its supplies and power domains,
>> and any potential GPU quirks? I think this goes beyond my knowledge, so
>> maybe Steven Price can pitch in.
> 
> The node already carries "rockchip,rk3399-mali", "arm,mali-t860" and
> binds through the fallback today. default_pm_rt_data differs from
> default_data only in GPU_PM_RT; supplies and the power domain stay as
> they are. The RK3399 GPU node has no bus clocks and no resets, so
> GPU_PM_RT changes only aclk_gpu here. Steven's view is welcome.

Sorry for the slow response, I've got quite behind on my emails.

As you say the platform will previously have been able to use the
fallback compatible. So this is such opting in this platform to use
GPU_PM_RT. If we've got a report of this working (thanks for Igor) then
I don't see why we wouldn't want to enable it. Basically we've taken the
approach of being conservative until we see that GPU_PM_RT doesn't cause
problems.

I have to admit hibernation isn't something I've tested, so it's
possible we need to look at fixing something related to that. But it's
also quite likely that hibernation is more fundamentally broken on
platform that don't have GPU_PM_RT, so it might not be something we can
usefully fix.

Other than the somewhat confusing commit message (e.g. a subject of
"Enable GPU_PM_RT for RK3399" would be clearer), this is fine:

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> [1] https://lore.kernel.org/r/20261030-rkvdec-runtime-pm-clocks-v2-1-8ff510a231de@iav.lv
> 
> --
> Igor Velkov

