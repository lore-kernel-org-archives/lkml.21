Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857720;
	b=Q3rrlis9lWuHBfJPte8zVbmjVSQY8LkuCitepnCmZAKGyu/aaO1+3wnwbOxHcT4cO7Ew
	 NZVVacH3uglu7kbmjC7L5hp/kybkh/OR96jde8souTtHZS3awj/lqqUjXBQdfCkSkXLWm
	 +AOqDGxunz+LTUGMm0G50kcHXQ2NY87vHY+0wQo7ja/lBuqUWH+bk8xr9GixlsZuw4fwo
	 YJwbVPwhZ/mtUGd00ShNSJxyRnZKPDca/hqXcaDh0eH/tXkAKd0No3e/Xtsjb9CMYCUKB
	 ogVNz2UmbKSKKKyZbUCEWAWNL+FK9d8ljV98IkrAH3TTwy26RZebO9sursYqPd1j49Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=NrIoMTeuQSSKquJ/B8Dkq51X5h3zUX1txK3GWbjAlR8=;
	b=MaAx4xVlXbejU9A0+zydOm4QmG1JOUER27DJfAl9e0BC+6RkTrX53w7MZUufMukNJ+m+
	 OaQx2XYYuv6V7XQBcgdwXEoHmxmFXkhWj5yU8iszOEN8BPiHCCNQMD5ebaq5SUVb1GIsI
	 Khnfoh+QVcHbDrq6AI+UbQ7RaWEdlMiYWsqsgU40i2lCCuGIFpWhyEtUPc7X2R7IQdTRe
	 N3loZ8+zJ4KTUleelOfH0kCEscGnihnd4DhvR3M0hZ9L/O33q2/g2JJIgVuM0hpO6OhRc
	 o6KdSPjWHB9YxHy5xf2P0aPtFoXnS4AKNGg7PLTWsOf0f8roPYy8yu05aauIqJiqKmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=mQYL+8Rp;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8FA606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=mQYL+8Rp
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4b9ba815bso52090977b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795857720; x=1796462520; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NrIoMTeuQSSKquJ/B8Dkq51X5h3zUX1txK3GWbjAlR8=;
        b=mQYL+8RpajkypVy7w945436BoLb0L4UiZjabKgY9mh+ZHdvfvgQYEpwIbAFMtN/iN0
         BXYainwWNXumQkzQVyp0l7V8eebNglt78mK2/vLVl4cKDp2rkUPjj8D6Q+cxiCVkSO29
         VspZ+M7XWgekPFc0WLc8LMZhrL5tAGgMtWEh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795857720; x=1796462520;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrIoMTeuQSSKquJ/B8Dkq51X5h3zUX1txK3GWbjAlR8=;
        b=0IefgBoSiVZFG9jOEm1Epm3l7SWcpTLjflm8M0sBIU9uL0xudWNL3F2vfWhxCwd4zV
         0JBpL1Rj/EKKNJ2nJ1LqwhnbFSz9znIugGAJxsUAGj+tdyO6Vt3YvJzwwh7gykFzS58y
         BBpTpbgZQMiPU0aQBT+bdrfOUtKvTnvlmHbWrGIZIYZrZaOi6RRIRmLTSvho39IklRiu
         9XsgYO/AvOtc8RaS3WArG3xwKxOssDtkfcE/yxKwajEMv2mjXbWzz9tkcXzBAn+bnNRX
         BIuiG5qgTCBuYn2/HCJugsoAeF79MpXVbjD9o9OW46zBKK/aT+ekoTGp0MGqzr8l7QQH
         rrUg==
X-Forwarded-Encrypted: i=1; AL+hErHbBBGT6SuH3RPZBvxdaNDqkn3j1R1dJwZIo0DPDJNADXDdIvyMyJqgRwZmbpmGksEtZfmgeXUjN8xIwJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ULGiWz+1yVNepvtKVuIqfQrgYq0DiIqmPfiocwE14M1be8MVm
	GisCB1fQzDX/xbl3NdNhkU6S13WcchEdkHHjeXzf6x8AJOC0fmnIRu06oWhrohuQzPA=
X-Gm-Gg: AZFdTZc1UBrBTuFUjLYZihqIlD4PUhgkDO+cfmEmUF6W43en944je5FRd6pMzGz7FP2
	neDB86P/mvqlzo6mc7MEj6eF8tEY092E5QtwWw8tJNeK60xH+2RVYO70OVO+VYZ6wgo/dp6vn+s
	U50yUd5BSuxLxBVEiIRZgsYHh0fDNDn2rwpeTSyKOPaojkNp2OtnmlyCu8M37J3Nwr6WkuLuelr
	peFDze4xNNxBM/fBu/KBdLI2dvSRrjJH/PPwu1NpAev7M79u5pcDoV2oghrMNM50zm02Ar9ctO5
	1R3XvLE8a/DtBuRQV90Z6bFrbkoUYo8vz/BmQA00SUPYzDzvcMMmTQcmSpzCG7vXS4D86x3tLg3
	kqz1FQ65+WyoVwUedCe1qdgN66eYNs6NtrD0YhjqgMe7qVoceYH6Y2Tqb0bRL6GI3UrZNGdsjEd
	gI2PwW7ArBj9Ri4KZLD/IFuzCeeBWqq2Xkni7bRsKlAZ4iKJcpOnAlXieymfchv+RHu2i5ZbSug
	aJY/+9sbTxjEx1h08LczMdHJe93RK82zTv4VAwx0ZqgPl/jhQb+e3cIlr54tIKizs8YWfjfuwHa
	QDNEF1FfIfIQC0meO98f2UCUMLvGzMCvLZoshMXBnvjACtq/dMzOj6F02Gxs/dPPq1mxIl750NC
	426wzgiZ7BpwEmihxjtMfgQe2Fm5rQZx+EsSaBPau8caOIqW3I6xTtHrgQjkSH7aXR3N+JnJmn9
	KUw5QQZgcuVx7uj/cvfDKvSS7RSc5EebFxWlKScTX3DUPDiBvDkP1C6316qPE5D8Ec5/IIuUpcP
	t/8O/m1YRg2xy8D4LmFGqrS
X-Received: by 2002:a05:690c:29a:b0:8b3:361f:5d77 with SMTP id 00721157ae682-8b5204a9ea2mr142715807b3.26.1795857719761;
        Sat, 28 Nov 2026 01:21:59 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202fb08csm102460237b3.24.2026.11.28.01.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:21:58 -0800 (PST)
Date: Sat, 28 Nov 2026 01:21:55 -0800
From: Chris Down <chris@chrisdown.name>
To: Mike Rapoport <rppt@kernel.org>
Cc: pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com,
	kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] kho: Don't release incoming bootmem areas when kho_init()
	fails
In-Reply-To: <avGb2Trm-C3_YC-7@kernel.org>
References: <au_vQhHAcJbkryXN@chrisdown.name> <avGb2Trm-C3_YC-7@kernel.org>
Message-ID: <awqdM6WBmcGak0UV@chrisdown.name>
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Mike,

Mike Rapoport writes:
>On Sat, Nov 07, 2026 at 07:40:50PM -0800, Chris Down wrote:
>> kho_populate() adds the incoming bootmem areas without reserving
>> them. memblock_free_all() then hands the remainder to the buddy
>> allocator.
>
>This paragraph is confusing.
>It reads like kho_populate() should have reserved bootmem areas, but it
>didn't.

Yeah, I can see how it reads that way. v2 will say who reserves the
areas on each kind of boot instead.

>> Unfortunately however, if kho_init() fails, err_free_bootmem
>> currently frees every area with free_reserved_area(). This can free
>> pages still backing early allocations or free buddy pages a second
>> time.
>
>Is this an issue you hit in practice or it was reported by a code analysis?

Just from reading the code, same as the reservation failure one.

Actually, I did find an amusingly simple way to trigger it to
demonstrate :-) With CONFIG_KEXEC_HANDOVER_DEBUGFS=y, kho_init() fails
when debugfs is disabled, so a KHO kexec into a kernel with debugfs=off
added to its command line is enough. From a quick check I did, the new
kernel then crashes in free_pcppages_bulk() under free_reserved_area()
and never gets to userspace. I'll add the trace to the v2 changelog.

kho_init() shouldn't really fail just because debugfs is off, so let me
fix that in v2 as well.

>> +	if (!fdt) {
>
>I think using !is_kho_boot() makes this clearer.

Agreed, will do in v2.

Once the reservation failure v2 lets kho_mem_retrieve() fail and drop
the handover, is_kho_boot() will be false even though the bootmem was
inherited, so both this and the bootmem setup above it will have to
check for that instead. I'll change both in that series.

Thanks!

Chris
