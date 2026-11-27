Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782434;
	b=1uNMhqG4yyNyrz4iFlLfIMUyFGm9YOgOWB9VZA6pfrM9QHkRHwPkDqbXnNCyMaftLeWA
	 o9JeqsLTsvRBfssNHp+6ejxKwqbSCHT9nwcqTOhJ2gfpMeE9lM1l32+ko13LdextNMY7c
	 ySPo3KAodwCcbhHdj7utabAVVLpVGnjfYy10pmsW3h23nhkzjsY9taW16Ye83FfGSSfVl
	 D/m8zR7+xyKNDf7DG9Pwqj/4l2ekWHL6Gk1zlfzlRe1N/U8U4QjRm7N+RXwysiXnquAlB
	 dvonKq/zMXUpLB11DkpLShhXxQ09p0H9CR2r0dzVZUZJqL0hrbDUBiOS7UaHGZCoWcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782434;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=B2fAROAP6MruPfjc+7f9HUJjQbFHniTn1Skfby8n/LY=;
	b=CBgq/6Uufzi3+LQ3HnnZOvQka7yLRQIOLRmjkCbge5JHa1kJkujQemMc+OFWO/D828n/
	 L4nkUArDIHBsdx5tH8whteQTypXHjnvteAnQIlwDLELaK5hEgy0QLtE3jEgQmWhqFChki
	 sHqMW3fICKhVuIEQsxWkso1s7PlJ9XBehh2UbFkH8QgpAli2XRgRCCRUjh13wSg5M6N79
	 xWejFqo9ixLYjNWjSKQTUOTHvWUCpB/4y4s13Tx72Qj6lHCFH71FVYyGjOCj9KmW/cFPd
	 Mmj24Zy3SXME8R7lnSrWXiAaKf0JInRBQnhTHFh39gbodTPKuIiEVZtIEW+3OmXnMPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Hg1ftMob;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75028606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75028606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Hg1ftMob
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B25A91756;
	Fri, 27 Nov 2026 04:27:09 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3215C3F86C;
	Fri, 27 Nov 2026 04:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795782432; bh=B2fAROAP6MruPfjc+7f9HUJjQbFHniTn1Skfby8n/LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hg1ftMobmuAVrlACTrjess/8tIaUF2GwLLJdpJHQCPhbUePzWOHne4HDkIJRfwYMe
	 uQ0P9wHnvQPxd2gNz0R/R2zG3NUQyENOZB87ollgIs08R9RLOAEr5VmNFISH1B5/lV
	 2vXD7npgYblCKvNX+9rXSwA7/OPMSkWyqS7xtRf0=
Date: Fri, 27 Nov 2026 12:27:10 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop
 sites
Message-ID: <20261127122710.GE861809@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
 <f8a2f477-2dc7-45a9-a2f0-f6e279ebf8f1@linaro.org>
 <06beb206-886b-4a40-a406-3d877443f5c2@linaro.org>
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
In-Reply-To: <06beb206-886b-4a40-a406-3d877443f5c2@linaro.org>

On Mon, Nov 09, 2026 at 04:51:43PM +0000, James Clark wrote:

[...]

> > > TRBSR_EL1 records the status of the buffer that just stopped. Clearing
> > > it in trbe_enable_hw() postpones cleanup until another run starts. If
> > > AUX output cannot restart, for example when AUX space is exhausted,
> > > that clear never executes. Clear the status in arm_trbe_disable()
> > > after disabling TRBE instead.

> > Why is leaving it set a problem though? That's not mentioned. Maybe
> > there is some later patch that requires it?

> I see Anshuman left a similar comment on V1 and you said there was a race
> condition. But that explanation wasn't added to the commit message, and I'm
> not sure if it exists anyway. A late IRQ after already disabling the buffer
> would just hit the check for a NULL aux handle and not run the handler.

Yes, with patch 05, the handler returns before accessing sink data if
the handle is NULL or the AUX transaction has ended. That early return
leaves TRBSR_EL1.IRQ untouched.

Status register is not only about status. It can assert IRQ singal
until software clears bits. Clearing it in arm_trbe_disable() deasserts
IRQ signal so we don't need to worry any pending interrupt even after
the TRBE buffer has been disabled.

The reported issue [1] seems a good example for why we need to do this
way. I will amend the rationale in commit log for new version.

[1] https://lore.kernel.org/linux-arm-kernel/CAPhsuW665wcpXxE8pfzRMfdxZwh9ogGsvd1aEBFREq61cz4Y5w@mail.gmail.com/
