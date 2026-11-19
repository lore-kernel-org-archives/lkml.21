Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127637;
	b=envn0CwwQ1g7fNbbuoG28pXoaTIlKEjCe+CdzCwtFd8u8J7RsTIkX1RSNMlPHhpix7V/
	 5KxZCuQ9LjbpftMSCVQ7mqjn0lHtspDOGRxn2jynp7tZu7Mqop1rkTNV0dFq6dnliy2qZ
	 SrcD599eXI4hLBhTPXLbvg8j6LS/5Xzt8FPfpq/KlY2dDX4jdmkjy30WXBG0NtAC8r/Os
	 kOJulY6058l9dNoYxcR+IHF5eT5YAKzsrCPpxZ4sOafBtSTzrL5b85AC5Jf2pcBXTHV+o
	 gCsbf4s/qsQzFeOy3zfFnEpZOYEY/nb1EnuPdGxfqP0x7zhpBHsOtVv2vvo+c2SBINg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TqtffM57zvX6UlLcj7lzeRGmatYnNlYBqbsaibjXQQ4=;
	b=ZtUDSSplNNMhWVU3X0stjoFYUubzLJgR/foHlor0A4o68ze0W5DgyTeGoZ9Gm2CZsWsL
	 T1t9tP1nczAPlhmkwJVeTjHjVo/84Qzv4FYsxBu170H/4IZFN4+lywQ3llAfnZFKY+V+v
	 zP6ntXN0HRVTxW2js5BUQk7G8P0JVMWf08tIq88cbwz3bfu3bT2kwCHGsmaAwCGW1s9VK
	 8+SkusaqVZwVB+QmutV2cTKWigi8xYP7BUqEz90X1uGa+AYG5VgAKZUbyHTkG/rC82ZV6
	 1OieahlubSpgb6v7AbyKOuxxfipze+kGfHn4jjBasZ9wSkDfZ+yz9gtiVSs/0bQsJBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Krr+KBJq;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D502606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D502606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Krr+KBJq
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so278042a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795127635; x=1795732435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TqtffM57zvX6UlLcj7lzeRGmatYnNlYBqbsaibjXQQ4=;
        b=Krr+KBJqsMNJ0vQW1c9prsoB8VUi5WCBjtHLhdetjpIrVyDTS799eOCPPvwSftr/UZ
         1CBoMm25sVfjP7wYI7IwZY8WUMdlJz7p03t3gMP8NihJ4NdtQtMQ4Nn+HXdmbslDADmu
         rPJLOrAU40LKN/hBZ+9g9bVQ6KjYgtxEE4tagI+Eu3Awozf+3lEqoMZzX6yj27CXXGaY
         njqRlpEfZ2mh8hC7Ugy8BsBq6auGZxbvxjvMv9UBiDN1BHaLsx7xTSvBecT28wQ7OaY9
         dkdqOkJ0t8MRgTJD1IiZifD8qqeqLsEK2U/41kpseDsmrVkh/2wUcrgpzBAHnnd49v8p
         HnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795127635; x=1795732435;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqtffM57zvX6UlLcj7lzeRGmatYnNlYBqbsaibjXQQ4=;
        b=OGIoupi4g4moxe3dtVTjYH+pd3neppCO/QXTyRoujrOb2dTcyKlvsQjvcsOzQ1VMSK
         IyqwAuh44jmpRj3A/SuH+iFAlu08/QMcNsE/uc/+a/QVKUHZcFguKXjo2aqaOWoEy47J
         SRdynjCSDUtQCfSy8+afiLYg7UY66Vvy88lcqrj9gGOzndwrk9q5uO9yJAA4223RfwYA
         uytGDNAPequjyLojHKxXy+2dSna+KikvND3/dzUHH4+IAsXGK+DY1vngD0iX9GDSD9C4
         EnptiRsAvspCM+TKRNMRm2z2g0YQ5ctFkoC3qBD0Hl1RJYNwRN25rHgPhkDh/9N70N41
         /CtQ==
X-Forwarded-Encrypted: i=1; AL+hErFKa6yskHvkS89k4DLym2HLGWJz/aDLCMqBWgJp/9cs07UyclRff+udAWmP1RMaOi4mkyGvHhimbCD7aJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bdIfAsHcre5gl9ubZrbOY/E7v/NjHA4wgc38Zrg3IErPkio4r
	ygljgbmMff/t90W97HVz15/ZimvJC9M/hWDPiYlEinPBaDwhl8TobcxZpMPhfbPPzVU=
X-Gm-Gg: AZFdTZfSSvq4uj3R0cMSXNEe/iPJPmb1Qzqz510eguDSKZUijTLtpUUKgEDMmxJiIQb
	INTYnQl2EtEONxUp+2pb7aNOMFx7rzEAExo6szHIKqEnJXaliSjdBuhK8lV9mCByylL3/Vai6BZ
	tVOBOc/oBx2Gx8JpzrZgfWc9d0+HTeLktT4/vbDIq4b+PduV2Syx5SYLMu2cRdmd1/hhxq8Oj3Z
	9utZiz+vtzuIpvuz/3NY4qK+HZ59M+GulEvLO9nY/E6BqMzXctpwU39dTLokX7U9AkphjBbO75Y
	PipY7UXvyi2FTnxEZzGRbE1+RXWHE9oVxRpqouSdS3YygnMcUxo0Lo93obxC7i2FJNmAVWjYtr1
	nIIgmTteJsLst/oahiSdvku+15VF+YfMLpIeOND9E1nMW0TW6YRODOiP3g2rOzgYNRltmys4QzB
	SW7o4+V4Cts6xUPrb5lTh0xN9RECFzyP6PSl4OFl4MQGXepYdXd8ENekNQi9fTTTSQWzPyasDWS
	MOaOjgGFPREC37XdDFOxK0BSv+OTDo+si5Aeueea3XLbz4FLI5jN9RRfeiY7vJLlRtKaMhAOzL/
	8Pd3mPpcdZjDNY8hwmWntQ==
X-Received: by 2002:a05:6402:4048:20b0:6b6:e857:19d8 with SMTP id 4fb4d7f45d1cf-6ba37e69801mr465617a12.10.1795127635298;
        Thu, 19 Nov 2026 14:33:55 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d2253d0sm436064a91.3.2026.11.19.14.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:33:52 -0800 (PST)
Message-ID: <237c8b88-4ce9-4cbc-932b-dd1fdff3f66b@suse.com>
Date: Fri, 20 Nov 2026 09:03:45 +1030
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
Subject: Re: [PATCH] btrfs: scrub: don't count zoned repairs as corrected on a
 degraded mount
To: Miroslav Cimerman <mc@raidlab.org>, Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: linux-btrfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org
References: <20261118175637.60283-1-mc@raidlab.org>
 <ee3cc2d0-6991-4d7a-bbd6-a84972d44b37@suse.com>
 <HLy1GbxoNDmZhdhuxdyatdLIiWG6jabGJiSOxke3u7mRd-njBgBiRytg1IKO1S2E6xNXQw75eH4SPWLLXC6TC0BNXXcz0SV3FsdSOQUQLdg=@raidlab.org>
 <f944d77c-4c66-4dec-acb8-985d4288afc6@gmx.com>
 <RSMUZ1EIRwrw4g1uzc9_4FR9RoxzCzSBf9_b06-ovgxC7CsQ5GfC-E6b2vyTIE5l_FTRt-s8hlvskCD_gaf4UQePuf2tR6x011MGUO9nJO8=@raidlab.org>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <RSMUZ1EIRwrw4g1uzc9_4FR9RoxzCzSBf9_b06-ovgxC7CsQ5GfC-E6b2vyTIE5l_FTRt-s8hlvskCD_gaf4UQePuf2tR6x011MGUO9nJO8=@raidlab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/20 08:19, Miroslav Cimerman 写道:
> Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
>> If it's a workaround for the well known new-SINGLE chunks during
>> degraded writes, it may be a little over-killed.
> 
> True, balance and block group reclaim already relocate block groups on
> degraded mounts with no such check.
> 
>> I'm more concerned if it's some extra requirement for zoned RAID
>> profiles, e.g. to keep the writer pointers in sync etc.
> 
> None that the repair would break: a regular mount needs equal write
> pointers, but a missing device falls behind on every degraded write
> anyway, not only on a repair. The problem is when that device comes
> back stale: two days ago my tester found that a degraded mount could
> then allocate over committed extents, which aborted the transaction or
> crashed. The series "btrfs: zoned: RAID1 block groups with missing or
> stale stripes" fixes that:
> https://lore.kernel.org/linux-btrfs/20261119213835.103131-1-mc@raidlab.org/
> 
> In testing with the skip removed, the relocation with a device really
> missing works: RAID1 on three devices stays RAID1, RAID1C3 on three
> devices gets single block groups, a second scrub is clean, and the
> missing device mounts normally when it comes back.
> 
> One thing it needs: without the skip, a degraded mount that reads a bad
> copy starts the relocation during mount. In testing, it raced with the
> mount, which failed and hit the uncommitted transaction ASSERT on its
> error path. "btrfs: zoned: wait for the relocating repair kthread
> during unmount" prevents that: with it, no repair starts before
> BTRFS_FS_OPEN is set:
> https://lore.kernel.org/linux-btrfs/20261118004808.201460-1-mc@raidlab.org/
> 
>> And I'd prefer if you can get some helper to know if this block group
>> can be repaired, so that no duplicated checks between repair and scrub.
> 
> With that repair kthread patch, the skip can be dropped completely,
> so no check is left to share, and scrub needs no change for degraded
> mounts. It still counts errors as corrected when a repair is not
> started, e.g. while another one runs, just as on a regular mount.
> 
> In testing, with the series and the repair kthread patch applied and
> the skip removed, a stale device came back. A few scrubs on the
> degraded mount relocated the block groups it was behind on, and then a
> regular mount worked again, without a balance. Only a block group where
> scrub finds no error still needs a balance, e.g. when the missed range
> holds only nodatasum data.
> 
> One downside: when fewer devices are left than the profile needs, the
> repair relocates the block group as single, without the missing
> device's copy. A RAID1C3 or RAID1C4 block group then keeps one copy
> until a balance. Without the repair, it would get its copies back when
> the device returns.
> 
> Are you OK with a v2 that drops the skip completely, on top of that
> repair kthread patch?

I'm fine dropping that check, but it would be better to be a dedicated 
patch for extra review from zoned experts.

Thanks,
Qu

> 
> Thanks,
> Miroslav

