Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794207;
	b=xGY12gFXaXq2AOGZ7R3+wn8ntCBqe0QGU2QLaPhP2rmxL56k/FNyI8oAoMBRG6A0eFak
	 8CtWqKF27pwvZJjnncv0bugBTzH+GWrvhxOu4KWlsRX+oUMpaaTEDMoeZKKTxlzbQXQdd
	 VYmpq0ABgPEnwwydDvEU86qndY3s7ZtgPl1UX3JNKeo59DAoTM5pdGENsomEBNMpOQ4U6
	 5ZGY0ihLOhMHK40GsgtynzkOHQCkrh77nmjQg9d9bokgHAAAMIL3hHGIHJbt0j5SzZAk9
	 Rj/ozi89YCBT42KqAb7oUqOyv8cfwF6smpyxZ7fFFsA4w3sJqRKnWIMf0Syua2mUMGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794207;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=iUGcyMfD19/PP1wiChCcw/RYMLO+UZqeEGCaFbl4nkI=;
	b=qNBmsUAkQeFsogyhNTeswwSFEzDzTlOx+rioSesF2uS6NP4+M58uRwwNuOcZSKVIc0fF
	 mox9j3mBBvdA4TMvmkwvX96aPoBNrrlZSMH14dqphWBtIpnfs+SdKmNh2wGCqWop6rWvP
	 rPSS3U5Az1G7H7/S/XS7Miyv87UYojYTRl6UmQIxM+lQIs9RP9+LAUGfLBP+2oeX5Zp3R
	 I0GiNeLCTZzNj6G+MipPVlbDQNSZV63+jcmVSX0TU0kEagXZxLIgzbIJXnUJhsvjs7oFp
	 ChufnUECgnQN57q/ruy8Nd1bIkLKTlslBTPUTqpZ2m8hZQ+JJk/BYsJ2PhrZcjdWEHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=q1x9ig2S;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D717606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D717606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=q1x9ig2S
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B977A2F;
	Fri, 27 Nov 2026 07:43:23 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F07213F632;
	Fri, 27 Nov 2026 07:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795794206; bh=l48j5+xVhtpBW30PApGWL3ln8k0dE99HV1bHDBj1Dvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1x9ig2SlfIy5gBXSTvTUQ/E32fDvv/Sczl0uhGpTeuazQYrQOCIgQTa/SG034aSs
	 j4icBJYzIcwd2+rdPAs5bgd1Om1X+q9xqggLYbgY5fWOpNteq1Bg/UnMDhrKQwqZhg
	 rIarodHEEEvrb3Y6jns7jr/kYgaMHb6adPdTO1aw=
Date: Fri, 27 Nov 2026 15:43:23 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v2 16/23] coresight: trbe: Always classify TRBSR when
 updating buffer
Message-ID: <20261127154323.GF861809@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-16-3f57cf3199b1@arm.com>
 <4dfed719-5f62-4ea3-8685-5dc4426ad3c9@arm.com>
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
In-Reply-To: <4dfed719-5f62-4ea3-8685-5dc4426ad3c9@arm.com>

On Thu, Nov 26, 2026 at 03:00:46PM +0000, Suzuki K Poulose wrote:

> > With classification on the no-IRQ path, a normal software stop can
> > have TRBSR.S clear and an ignored detected trigger can set TRBSR.TRG.
> > Neither should warn or discard valid trace. Mark fatal status as
> > truncated and return zero.
> 
> > Use LIMIT for a filled WRAP and TRBPTR otherwise.
> 
> This is already the case, right. Please could we remove this bit ?

Yes, I'll drop it.

> > @@ -662,8 +662,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
> >   	int ec = get_trbe_ec(trbsr);
> >   	int bsc = get_trbe_bsc(trbsr);
> > -	WARN_ON(is_trbe_running(trbsr));
> > -
> 
> Why are we removing this ?  Do we expect to be called with TRBE running ?
> Both trbe_update_buffer and the irq_handler stops the trbe. So this
> must be held valid ?

Both paths disable the TRBE by clearing TRBLIMITR_EL1.E. With this patch,
arm_trbe_update_buffer() can call trbe_get_fault_act() when no
maintenance IRQ is pending. If no management event stopped collection,
TRBSR_EL1.S can still be clear.

Arm ARM DDI 0487 M.c, section D6.2, Table D6-1 shows:

  TRBLIMITR_EL1.E = 0, TRBSR_EL1.S = X, and Running = False.
  (X means either value of S bit)
 
Since is_trbe_running() tests only TRBSR_EL1.S, the warning would fire
on a software stop.

Thanks,
Leo
