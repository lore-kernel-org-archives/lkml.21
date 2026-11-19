Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099802;
	b=bJQyiC6/ldDyoRXKPtb4MaRwP+OKQLYM/phcj0OCXxN5CMhQAdvGm+GVifvNhToXErmk
	 dkItSNPa27YUqXnPwWCh0T50wj/l7bZNkqdzK2QQ9kMFXgiBo09pYXaqITUHJE3cZ8yJn
	 kFRudn2ur8mmvo8lLQpVgqaLDEDuNCkjIr2jE9npvW+xC1mIgPBKPRruWEjwVTrnS5TNW
	 zpy4T99gbm6YbPes3QjUuNLADmVVob3sdLUkeZikmMNit46NLa9TevOYSkF0dJZwQeG0c
	 AUlo5pJw1Nsd4WJmPqSw32nCWEcMz21fSD3d41qf9kuD3v30dAm/hOzWuGK+sOAffSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099802;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=yv1N0djmZyEGMIYg7VXKeF/ldKuiOCcGdsOrrzCOVrk=;
	b=kj63xqvfU8I7XlOdlL2bP6xWSWumUP+4YZ40sOxMeIJIYJp36RkhR7hFsDclVjZh6sMQ
	 jM6bQyVfeFFvXmKrO1+0qZ1Vsla6pP9Ck6guglNm2MPZgHTfiN8+Vbffa+uryQ0jz39e0
	 /+VuUuOkz6azu55CvnBRGX7ZQI+QJMXvFj/stHird5HNfp2F2p4rp8YfiX/WD8l4VEsAc
	 PP4urSxrSgLPGmlitS6Ugw6oo5nNb+ZpU2U+/Dydv0hlTsbUMalxcldfpdY9Sf3/SYVNY
	 GoUq0owrxU01vhZoqIeNZ4oCWKudwDsKSGtEIlE1lP/uBxBU/CT8dCdUoCp8vkAvYwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ppl3Ddsr;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512E3606B05E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512E3606B05E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ppl3Ddsr
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98A5C19F0;
	Thu, 19 Nov 2026 06:49:58 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 328963F673;
	Thu, 19 Nov 2026 06:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795099801; bh=Fnun0mKomugL954yD61XjX3IYKj8R0xQ7sSqlxsYi10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ppl3DdsrKLxJa9EorrCawTo3PVOa+dqBTLIDO1g1YaqKxXwd3exOmLETdTJmmm38/
	 6gBdrHM0rGvCqo3SM8Ws3CEPUhmynHWyrc8SvQZUuQI7tw3OD1VmdwTSrGczBUoVuA
	 R5FeC/DY4BmgofCQIcXJcFSVConvO6G/Ku6WYPFc=
Date: Thu, 19 Nov 2026 14:49:59 +0000
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
Message-ID: <20261119144959.GY9176@e132581.arm.com>
References: <f3e3c30ef76310fb6fb7d00019a8ef11e91ee1e1.camel@ginzinger.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3e3c30ef76310fb6fb7d00019a8ef11e91ee1e1.camel@ginzinger.com>

Hi,

On Thu, Nov 19, 2026 at 11:10:50AM +0000, Kepplinger-Novakovic Martin wrote:
> hi Suzuki, Mike and others,
> 
> I don't really know the coresight hardware but with CORESIGHT enabled, when I do
> "reboot tests" on imx8mp, I see the kernel hang after (randomly) 200 to 2000 (sometimes
> a hang was seen even later) reboots at *about* the line below. But indeed not exactly
> that line. sometimes it stops 4-7 lines earlier!

Could you enable earlycon together with ignore_loglevel and initcall_debug?
So far, the info is too limited to give any useful hints.

> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 6.18.63-ge-26.10+-ge_bep4-eta-1-00195-gb8bebc692f96 (root@ginzinger) (aarch64-buildroot-linux-gnu-gcc.br_real (Buildroot
> -gf002287f) 13.4.0, GNU ld (GNU Binutils) 2.43.1) #41 SMP PREEMPT Thu Nov 12 09:08:03 CET 2026
> [    0.000000] KASLR disabled due to lack of seed
> [    0.000000] Machine model: BE-P4 i.MX8MPlus in NDM
> [    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000] NODE_DATA(0) allocated [mem 0x7fdb6e80-0x7fdb9b7f]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000] cma: Reserved 32 MiB at 0x000000007cc00000
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
> 
> The kernel does not panic. It hangs. The problem goes away and it reboots indefinitely
> when I disable coresight in the config.

Could you confirm what exactly CoreSight modules have been enabled?

> I sometimes need to run an old v5.10-imx based kernel, where I've *not* reproduced
> this hang with coresight enabled.
> 
> Was there a regression in mainline or does NXP have a fix in their tree? Have you see
> something like this before?

I am not aware of a CoreSight regression. I cannot comment on NXP
board as I don't have it.

As separate diagnostic tests, could you try clk_ignore_unused and
nohlt, one at a time, to see whether unused-clock disabling or
CPU idle affects reproduction?

Thanks,
Leo
