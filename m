Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600852;
	b=DVynb8b1eDDbpVbMbrd6mV5TSvhucMfnXczHTZ1UzZt4HGye3FmPe6ddhaZgGnqWup3q
	 GUdTm7+2abKQSHiTEM8ytnBVB32ww77x6sHtmTMoExLnaFFwrsfHMKb8BY2+07WBh0+Lu
	 E2M938lOSA4XDJJ+8QQbv4NDGeN00UU5LBEPiNeYlGLhPr/q5s1OouVAga8RuAeV2cL5F
	 Jg2Vgj+NwUvNnJ0hzU65kwcS9S3YrYCgd5hjPO6Ut+r/y1l+nMtwNvOyqoz887I5S1WVb
	 yap5ki72UPDiNUH0khFr6hV9P50gyjjUfkN+T09f1sICrjBG6wRYixE6Jxr7VtegfYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600852;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=E9AcbjjrJ2xy7jcqpCfaiWdiGho3lEa4cvynlMytnfg=;
	b=E/16z94nnBl//XEESjBfNc8w/IxohLugwRuwm3jCr0enBXhsH0j1g7F+QTNIH/OAP5d0
	 tpp2+SW5x+k/Q8/QonudRFyiCEnRp4gb8DatVrd5UPShoMPUNUlFXGEXgXdIGKSamtx7J
	 8oWEMGi/5SWDJCt8bBavMLi1br4Tb4FEVfw28u41vD09mV+CGpBm8YcGW9J4qcV0nRZ05
	 RBLVMF2YBDV7n68sla6v0GaxP19cDhat1RF5ajzU9oLJ08uGtpB9+dBWM6xan3YWc2Nvc
	 cRpyMog+mdqiYwLFPdjb/Nx+rigZ9kEdb52cF8QEWO+BXzm1yEGHBlgURUxRvDG1gug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ege24fce;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1438606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1438606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ege24fce
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 130AB339;
	Wed, 25 Nov 2026 02:00:48 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AB903F86F;
	Wed, 25 Nov 2026 02:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795600850; bh=mutwYsaLP50FCZfAjQtB9EJ9xbGNKRNXZIOvAS1wXiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ege24fcez8Fc905VMXrWRag+8JxnngOGIcTmOxNiuTgGGLd8fXJzrAbf77OTDajzN
	 uQebFB3h7m/GIAkxsOJLc/bYgbpdkeuqlzB0J+8KopdQpkAlYdnrsBfRe3XiDFtW9G
	 0NL3CXUMgD81vTR+6VVY5UGGRcx2/EueH9LMgc+I=
Date: Wed, 25 Nov 2026 10:00:48 +0000
From: Leo Yan <leo.yan@arm.com>
To: Kepplinger-Novakovic Martin <Martin.Kepplinger-Novakovic@ginzinger.com>
Cc: "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"mike.leach@arm.com" <mike.leach@arm.com>,
	"james.clark@linaro.org" <james.clark@linaro.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	Roosen Henri <Henri.Roosen@ginzinger.com>
Subject: Re: [BUG] coresight: during reboot-loop-test, boot hangs during 1st
 us
Message-ID: <20261125100048.GB7209@e132581.arm.com>
References: <f3e3c30ef76310fb6fb7d00019a8ef11e91ee1e1.camel@ginzinger.com>
 <20261119144959.GY9176@e132581.arm.com>
 <d1ca1f8533228923a400a22ce91a870f8a92369f.camel@ginzinger.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1ca1f8533228923a400a22ce91a870f8a92369f.camel@ginzinger.com>

On Wed, Nov 25, 2026 at 06:56:06AM +0000, Kepplinger-Novakovic Martin wrote:

...

> The 2 hangs differ only in 1 line! The last line here "dcss"
> was only printed in 1 of the 2. Other than that, they are identical up to the
> return of drm_display_helper_module_init:
> 
> [    7.328547] calling  arm_smmu_init+0x0/0x6c @ 1
> [    7.328935] initcall arm_smmu_init+0x0/0x6c returned 0 after 377 usecs
> [    7.328948] calling  arm_smmu_driver_init+0x0/0x2c @ 1
> [    7.329065] initcall arm_smmu_driver_init+0x0/0x2c returned 0 after 108 usecs
> [    7.329077] calling  drm_core_init+0x0/0xbc @ 1
> [    7.329131] initcall drm_core_init+0x0/0xbc returned 0 after 42 usecs
> [    7.329143] calling  drm_display_helper_module_init+0x0/0x8 @ 1
> [    7.329155] initcall drm_display_helper_module_init+0x0/0x8 returned 0 after 0 usecs
> [    7.329167] calling  dcss_platform_driver_init+0x0/0x38 @ 1

CoreSight initialization appears to have completed. One possibility is
that runtime PM then disabled a clock or power domain that a later
driver needs.

Seems to me, dcss_platform_driver_init() is suspicious. If it is
dependent on clocks used by CoreSight, this can be the cause.

> > Could you confirm what exactly CoreSight modules have been enabled?
> 
> of course:
> 
> CONFIG_CORESIGHT=y
> CONFIG_CORESIGHT_LINKS_AND_SINKS=y
> CONFIG_CORESIGHT_LINK_AND_SINK_TMC=y
> CONFIG_CORESIGHT_SOURCE_ETM4X=y

Thanks, that matches the logs.

> > As separate diagnostic tests, could you try clk_ignore_unused and
> > nohlt, one at a time, to see whether unused-clock disabling or
> > CPU idle affects reproduction?
> 
> I'll do that as a follow up later.

AI reminds on clk_ignore_unused: "if dcss_platform_driver_init() itself
hangs, the kernel never reaches the clock cleanup. Runtime PM can
disable a clock before that point. I’d first check whether the DCSS
probe reaches its first write to DCSS_BLKCTL_CONTROL0 and whether the
required clocks are enabled at that point." It makes sense to me.

Thanks,
Leo
