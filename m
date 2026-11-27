Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777022;
	b=cHLZ4qWpcyzS92a9/dusqEBEUAdnEr4K8q/8/WAsWRrbaFS7l9/Yx/B5FpCbBzDNvGwE
	 hU7vMYzgMJ/vS50injKOUiAyf6MSKTislnQazZGoNbN2leUixkeqkmF1UhEOqEPlz49rX
	 NBLLyacTiaSQyYLCRDcZoDQtka5mFaJGNoIf70Jd/PyO8g3F4bvLix9ZTTKpHcLLgUBg4
	 rsDuobrGPKZcNPs7UtDlk5v4diTP1pabjneGCrntGzdmvQ05NBiVCg5GJ+oio45KKqwkw
	 YH/l7Z5Mh2tWw9xtrhqMVFQfqYtqs/PUKDU8/KTl+Nkj5Uy1Q3ar7xNj41Uf6+E0WhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SrR+taCSYKOy0V34lVNOUOBJDJI1/m+bArOv03O8lxI=;
	b=pErTZ2RzWkyp4XwOQNNcnNmRiTPaKczrHdAQOxYYcY59XhwC1SfTvcvXqPeMJuASvSAg
	 b4BJMU68AX6ficb+zpoZr3F7jcCq4KnphQZUv8+LoXPKMfC4Ql6YeSMm5taDWozj+b1w9
	 v2hmE75gj+JnZr2WC/34ZSlc2LskombLbBhvZpKktc69DSzIbcY8+VggxegV9xq9u1Cz+
	 NBKLp+Rv/Om8c/GNmesDIPajQoABbXoyJBBNnmWA5SSnF6QFaJhYcswCKGWlXFUo1Ojcw
	 CFmH2kmcTCY4q8Gb54esCH6H/6TJOw51Jg6W+cAeaK3M/qnwrboBsO4EcECU2TeWjng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uKoUtz9e;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A473C606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A473C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uKoUtz9e
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5375725f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795777020; x=1796381820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrR+taCSYKOy0V34lVNOUOBJDJI1/m+bArOv03O8lxI=;
        b=uKoUtz9exeCtT/J0MSQPWgKYzoqnghWgPHR6RZKb0OlBDMgOpv9wU7GcWOajaySaQB
         3D+NEuj5+2gaKkr5zM8FsiR8swBbOluzol4gjepNpc7N2SehB3AxrNCf3g72md+7nw7z
         SJdx159tA5ouvrWReL5wvUu0ihLsMnJsRiE3+PC7vk1Ln9iW/87tPDQCAc9SBdGoK8y6
         tf6SnKemDvo2VJsXLGmZEkXEeD7st33nOYFUSMF4+/sGrOY1Ntl8tLH71ikp4pmJF7Vl
         hVW8ehIz/zqQ8dlJHeSNB2JmMi0v76jYphOAqwMoP3Y5FX9ttIEnaIqsKrtU5oCX+oTo
         j2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777020; x=1796381820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrR+taCSYKOy0V34lVNOUOBJDJI1/m+bArOv03O8lxI=;
        b=B3bm4TOL8567yXdGk0LLN8xKXX6kWguForMju1w9IzztWdJvJgWbe/lk//Drd6kJZs
         aLixFqOUmwmndP2pEeyxmHtTaGpwhT1gWz1Er+/UtBiMKZb52x90+KuF0HPwxN9MgCUE
         uWX7DitX6+Ws37tE15iDPV4kCvPuC/DuGRQRl+XWJFBO6sh2M6w5RrDOU9D8SLudMHlv
         BDZYsUmJslqc6tnMf33ON4UUQ13pS4cJdhjQBSsmNIbh2L8+LYHnExdEnvjkfiQsbgFc
         v6eGRkWUm2uq+RqNtz/ZgukO+/gyL0YvVd9qPQWOkYacy9kiRpK1zfeBoay3D0bXTbsJ
         tWpQ==
X-Forwarded-Encrypted: i=1; AL+hErEl8/mx4knSjbi2rluekaAf5nBq/fi+kaithGCmbmXD9ghpgDxD0f7KVPkdBwk0KBKe6IEr+NOEw8kItS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z909GdhtA4gJU2+wOi2UXmBOAdBiICR8Uwrb9wr08Hb6+R/fdWn
	O64MRmWfBiW8ZBX8s6YNNXRP6zoINST2Dsyd60koKT0XW3iEkBpuxW4pr8nBnpdKGEk=
X-Gm-Gg: AZFdTZfM2h+NlanRVk/GEafUHFFZAHDxu4dw7YphvRWfjyshFc8rF4MSOLWtELEji1H
	AWb7W+320mQjPEWbRosD4ERC0mxQ5dmWdYhJKRYPSY5WAUltxaxtUKB0vksFFPEy0zCDtnTCU9N
	jPBfdoNZuotKhCsmut/IdT845sz/eGvrGCc1z6zUYd9Z7dWxdUO395edrW0vDjozagAZXPVBRiC
	tMVI9uKVfXdJ/0WczNPmSjg1doeXp0PwPLyd1xxYyUHfAVpAiC/DKZUncnn6xQ1ZxK15Ba+lhVo
	PYJQWl1Ap2F60vscWPTYQnnnbIiLGRL002/W7UwqcOBC1dUFqyELFWFbza8UtIJmTE3Eb08hHbY
	vEUgmvd+8Dp9D4T+SHFuTqyZpDzSK9I5jsN7isqfkKKGXZdVhtPqRWh+BgcKUYyPdFXeciJ7dIM
	wjklQW2hJxcLJoEQfQ4gQNvImHeD7kE5h8GQ3P19qR3+6zq5EDcX7xegu9p1edW5/Dencqd+3LI
	PkANmXdX1MjRlb8J4lgDeYn+bUB7mNS24NdiqLpKnYQP2bXEma55VEq6R0oD1aHT1EjAahKc2qO
	owqtSgYb6TX3N94GLwD7eGqt0dahshJQgw==
X-Received: by 2002:a05:6000:2309:b0:4a7:45a2:ec26 with SMTP id ffacd0b85a97d-4abb0f3bc89mr49275277f8f.16.1795777020031;
        Fri, 27 Nov 2026 02:57:00 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm46346149f8f.4.2026.11.27.02.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:56:59 -0800 (PST)
Message-ID: <167b3016-4881-4ef4-9c1c-100ba96b50bd@linaro.org>
Date: Fri, 27 Nov 2026 10:56:58 +0000
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
Subject: Re: [PATCH v6 2/3] perf/arm64: Add BRBE support for
 bpf_get_branch_snapshot()
To: Leo Yan <leo.yan@arm.com>, Puranjay Mohan <puranjay@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Rob Herring <robh@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>,
 Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Stephane Eranian <eranian@google.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif
 <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20260810164622.1829843-1-puranjay@kernel.org>
 <20260810164622.1829843-3-puranjay@kernel.org>
 <20261126171904.GA809232@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261126171904.GA809232@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/11/2026 17:19, Leo Yan wrote:
> On Mon, Aug 10, 2026 at 09:46:19AM -0700, Puranjay Mohan wrote:
> 
> [...]
> 
>> +int brbe_snapshot_branch_stack(struct perf_branch_entry *entries, unsigned int cnt)
>> +{
>> +	u64 brbidr, brbfcr, brbcr, pmcr;
>> +	int nr_hw, nr_copied = 0;
>> +	bool paused_here = false;
>> +	unsigned long flags;
>> +
>> +	/* Called with migration disabled, so this is the CPU read below. */
>> +	if (!valid_brbe_version())
>> +		return 0;
>> +
>> +	flags = raw_local_daif_save();
>> +
>> +	brbcr = read_sysreg_s(SYS_BRBCR_EL1);
>> +	brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
>> +
>> +	/*
>> +	 * PAUSED is only ever set behind our back, so finding it set is final.
>> +	 * likely() keeps this inline; a taken branch costs a record.
>> +	 */
>> +	if (likely(brbcr && !(brbfcr & BRBFCR_EL1_PAUSED))) {
>> +		/*
>> +		 * Stop the counters so a freeze cannot set PAUSED behind the
>> +		 * value read below; the D19.3 conditions need a PMOVSCLR_EL0
>> +		 * bit, which a stopped counter cannot set.
>> +		 */
>> +		pmcr = read_pmcr();
>> +		write_pmcr(pmcr & ~ARMV8_PMU_PMCR_E);
>> +		isb();
>> +
>> +		brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
>> +		paused_here = !(brbfcr & BRBFCR_EL1_PAUSED);
>> +
>> +		write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
>> +		isb();
>> +	}
> 
> AI pointed out a edge case:
> 
>   1) The PMU is enabled (PMCR_EL0.E=1). The first BRBFCR_EL1 read
>      observes PAUSED=0.
>   2) A counter overflows and hardware freezes BRBE before the helper
>      stops the counters. This can happen while interrupt is masked.
>   3) The helper saves PMCR_EL0 and clears PMCR_E. Its second BRBFCR_EL1
>      read observes PAUSED=1, so paused_here becomes false.
>   4) The only write restoring the saved PMCR_EL0 is inside
>      "if (paused_here)". The helper therefore returns with PMCR_EL0.E=0.
> 
> This can happen with a normal PMU IRQ because hardware can freeze BRBE
> while local IRQs are masked.
> 

Nice catch. This can be fixed by adding 'pmcr_saved' in addition to 
'paused_here'. So 'pmcr_saved' would always always be set if the 
likely-not-paused branch is true, and then 'paused_here' is still set 
from the second read of BRBFCR.

Then on exit they are both treated separately. 'paused_here' invalidates 
and unpauses again but 'pmcr_saved' can control restoring PMCR.

>> +	trace_hardirqs_off();
> 
> The irqsoff tracer misses the time between raw_local_daif_save() and
> this call. Other callers could introduce similar gaps by using the raw
> helper.
> 
> I'll reply separately on the pNMI / NMI cases with an approach that
> may avoid adding the raw helpers.

And that other approach also avoids having to disable the PMU counters 
so avoids the edge case above.

> 
> Thanks,
> Leo

