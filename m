Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615243;
	b=usvswctxzS6Z2Zf67JUm/RFUZxURSDOcHNJfTE41Xf/l35gqFSbjHFkhPSsC6/Zk8nf/
	 Zk10xBYodUQ0QoKijGLbVFZDhFeQB4XHFp6zs7fBLnNVDOwncjFCtednulfJ4EBpCSAQU
	 OF+dZrb2BjxHI8hANkB4ZSdMMJUDD0siNZhF1bwZUHOxf7voihkubVCON6rJPtKjzOvmF
	 pRbUpPiuH+ZwUKR0uMbbyhb0m69NaoqIBtAgUQetnm4V/k4ShFFMwxzGa5vyOcyvt9qOV
	 XJ6rSuQeg03gQp7e7pywVU3ju/7Z6BrN5+TuKiP7RfEdIh1NQSSsGhnsinJ2R7kzY/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615243;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yxLNMcBe3vV28hJjFBumAOLh5rRTwo44KNq9HoVYs/8=;
	b=e2nByMxva5IDSBlBN3/2bcy/pvbEGZHm8tSBWSXFX+2NxIUGm1VncHnsUfTsv/ZGCMf8
	 0b62ybITqi7kwZTFtZpg4hBlGamCoe8QkW85HTaUZs+1ExsIcWR7qwk6I5cumiP5cDVL8
	 4HwJnWIAl+0CB3EPlYRE1B5qJYrmApEFoPh6mZ0ApaFJJv4cdvuYyFINiBs6Eg1hrCHfC
	 QSNTwIYIGK///e35QahYiz3l7bt+oMMlyLQaNLYDeS1umDKoSRP3okXd/Vs8P2uX87BZr
	 FmrOK5BMloVN+3U4uFciXMCRio9/mM8n2Tr0XZb6JJd6fvok2yUc4beZ6XYyHHj4EyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QfD+DQTm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB13606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB13606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QfD+DQTm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D5C71762;
	Wed, 25 Nov 2026 06:00:38 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08CA03F86F;
	Wed, 25 Nov 2026 06:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615241; bh=sQswOH8nnBcq6IUi9XPTJ5poHVCkOKm02pa3De59Umo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QfD+DQTmVMu+9++Zu8shOBSTyVOse0QwNCCMfKtuOINaICJYtdjQiKXHNH05UArvl
	 eXKK+ciTNqJWNP2KHDZij5A1GvB7wX47fMUBnFsjnQV2IX0GlIVh5QD1yGw8ldk1N5
	 pY08N+cPLnl6q5qznXW81o1rCmHBC7NPxwYlgVls=
Message-ID: <a85c50c2-b313-4bb1-8338-95bd9fb9d4a5@arm.com>
Date: Wed, 25 Nov 2026 14:00:38 +0000
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
Subject: Re: [PATCH v3 04/14] irqchip/gic-v5: Retain the L2 IST when mapping
 times out
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
 <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 19/11/2026 12:00, Fuad Tabba wrote:
> Hi Sascha,
> 
> On Wed, 18 Nov 2026 17:35:33 +0000, Sascha Bischoff
> <sascha.bischoff@arm.com> wrote:
> [...]
>> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> [...]
>> @@ -217,6 +217,10 @@ int gicv5_irs_iste_alloc(const u32 lpi)
>>           if (FIELD_GET(GICV5_ISTL1E_VALID, le64_to_cpu(l1ist[index])))
>>                   return 0;
>>
>> +        /* A previous map timed out; do not overwrite its pending L1 entry. */
>> +        if (READ_ONCE(l1ist[index]))
>> +                return -EBUSY;
> 
> Sashiko's review [1] didn't go on the list, in case you missed it.
> Sashiko found that l1ist[index] is read twice, and that on a
> non-coherent IRS a map completing after the timeout leaves a stale
> copy of the L1 entry in the cache for later allocations. Invalidating
> the entry before it's first read would fix the latter. Invalidating it
> on the timeout path wouldn't, since a later read can refill the line
> before the map completes.

FWIW, I had missed this. Thanks for calling it out.

> 
> With those fixed:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad
> 
> [1] https://sashiko.dev/#/patchset/20261118-host_gicv5_fixes-v3-0-13c1859e8aa3%40arm.com

Thanks,
Sascha
