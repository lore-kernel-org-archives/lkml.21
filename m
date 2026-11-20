Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157086;
	b=c+EelNEgnduU4MMWk92is6qK6ggjWK7mWCCsIlokRc3Lc3GlKjjPZUMTNbCcUpJ/S4//
	 ptA0oI4Jz0diZdFe6oJHVNqhWJbczTf9lwBXvWbE06QmWiz9JOCCsHEBBJbj9mouHPzpP
	 ik0HwAfJ/45+y7ng1SEa7TkouOaIxYvavApl4wBIBGnInJvjKl3VXRMu44yxfOX40j4zF
	 UDSXRtV7iGbu4WFdCgzf8hfDxA6BrhZ8jzIFSM5Xdb7kekICclMWVYBMiRuVuR9JTVqP6
	 jMVigCOqHg0mMws3eFwtirWX1mppnX7tNkyZf5LrrmiYKHP53dF+rfJJOdQ8wVI16Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ibHuc2Ky7x6xbIQztLyKbwCm/OGk8fLoxdPIGUt/hMM=;
	b=IWMosLEGtDStOQ1J3bHzKfzjMiSxuwmrEs2ftGdiOutKwFj+ecUBHJleSMP9jqY2arKm
	 wp2zIusNQ06GLWm1jtR0SjGJ5Cv1iuBZIMnIX6r8b+ABk6Nx0B1PnzuL4fJuI3Sh0bTyX
	 vMe45oLh9SwQ0uQwQ2PXJpulUtYgaE5fWkarn/eXGuRBg29Ei1TJZeHUfhoLm1s66bKsT
	 a6SQ2oeNe6/5jaygLfYsqKZCYpWZoNtVGBZCc6cMyNFfFIKbcsLajJlRMgucdXPh5bLTF
	 wCVRzEhoGnaBoI/1r1h9Aj/aaA/DQuUSFVj4IP8HlZigIoveDaF8w9yYhRcnHu7NEVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teIuw1f4;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DCE606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50DCE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teIuw1f4
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso257523a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795157086; x=1795761886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ibHuc2Ky7x6xbIQztLyKbwCm/OGk8fLoxdPIGUt/hMM=;
        b=teIuw1f4IVp67pH42Le/2jtpiPPxeaI4Srr6xMfrsEcES6+WJldweFTh8LR2m3CVjn
         RPGfDm9CEng2MqezE14lmoXpP/rxKKUvGg1nwLJb4QMnWRzIufguA/U9nXJm2hIFF3qm
         q5C3xdncjohNpuS1kSAzmOkZx9vD1dj+uMAsQl8Ytindk9sJJzLQzqX37NjCgyWLITZA
         rVlApmz9IRKVvZ9yL8D7v2VBQOB0KqqwSFypjZKQyJ29gKyunS5q2wsGWSjT53/E9QX8
         L53ZNV8nj06rcYHDHmUPG7m5w0SqJrZnd+T2xlSmJUzt3kFI9fhKr8Y3Zzetvq+umnef
         JwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157086; x=1795761886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibHuc2Ky7x6xbIQztLyKbwCm/OGk8fLoxdPIGUt/hMM=;
        b=aJBI1vk7npCrcYYC4W2s7GmWLaecy+4TpBx1htqyzZbVLuBKJWT60OCyAvmjtYcS4X
         iOh69+AVepb5jDdHVP86amYiztqpJVj3CVwJJdQ15f5EyBTfHMjLzORFt3ei4sTx2qsB
         lMpCVkiMAgS9buIXZdtdrKJ4NcTInXiR12W0Jcpm/mPVSEPOA/edUiIhHpcOepC5dC6U
         cWSeDXbYMXV9fmiy7XI6bj0KY/jF0K2nFtv6qqFsH74PntId3LWG5Xao6Tx/oZOOP0Ry
         n8Leq6FXSDMDgSbUestkWq5d3wLfD/cw2wL3BLcJkAbIJsusg/ZN4i7ayFZKHBccfke6
         e8rQ==
X-Forwarded-Encrypted: i=1; AL+hErF0//3eFDzoiRUPJGaFYPCAdSqEKFNDr5mqV/IuAcd94zS815XYehDsaMOSUmo51mg/3voZAQEPNerZUnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rfnUYS65W93iz6FlzwRO3gySt+ZmWKYdEN0C4dR1C9s2q2Ds5
	Zof8XtDdeSu1fb9sPJshVfMjGt1VDTlzRHSHEUwe5LymZks33O+bMEM/
X-Gm-Gg: AZFdTZesjP/0BKwcXsT8jb0+bTpe7v57cyeHxDkoYo/jMCe57vjJf85db7osnhaRl4A
	yvRUz1ZwKc+mFv2syVjFsomAI8DykZaWvrG531pG91Yh3NtyaawQUFOPEptGybKWIbAB2Roqk3m
	JLeMvRiP18XhEYs2Chl613Gz3kdl0st5pifIsLmb65pm9FOs3D/mW8lZ2vPjQbQVx+1qP3jWyCE
	oni5+qKO70coFklk8T2OP052gH3sHnJybnEPeY9JOovI8Wpd+MdmRsQ5avjJiB05tpPVgz66X7h
	FPW7K0kvkv+ENj2yB5Vq94IdURW2yxuh5WGrIyBZFtxGkC/F9xdMcZK98DfkDb9mlwAeAkA384i
	+gzo4KF2I9WoKcz2QxzRfIgE2ZgmbwDr1xATEkG2PjUVWqQCjY90KZvA1lG/U3fFZrEoUSTSMaZ
	CDyQbJfvRFKsTNEWKNSS9Kij8GuTbSwQbDAYnOdnIi5JURyHhQUMvxt4f21e/NW/D3x9hy3GAkG
	8tT2fpCY5GBwWxn7C8yMPg3g4cXNN++h/iFi1ryHEUQ9u/zXrMTtxMcUfHkUN0bstFpYJ4Mijue
	FglnhZmsGGSaH4bzWEsmNQyUF5DXiXCKyy3KIxaavrvvOFEeQ2WfWQ==
X-Received: by 2002:a17:90b:5546:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b41c941f9amr1058404a91.31.1795157085609;
        Thu, 19 Nov 2026 22:44:45 -0800 (PST)
Received: from srsys1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4323bda5esm12916a91.3.2026.11.19.22.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:44:45 -0800 (PST)
Date: Fri, 20 Nov 2026 06:44:28 +0000
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: sched-ext@lists.linux.dev, tj@kernel.org, void@manifault.com,
	changwoo@igalia.com, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	haoluo@google.com, brho@google.com, joshdon@google.com,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH] sched_ext: reject oversized dispatch_max_batch
Message-ID: <av_sTGpIbkzvsp05@srsys1>
References: <20261120054913.3795562-1-rhkrqnwk98@gmail.com>
 <av_oLZQzAtFe2vTr@gpd4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <av_oLZQzAtFe2vTr@gpd4>

On Fri, Nov 20, 2026 at 07:26:53AM +0100, Andrea Righi wrote:
>Hi Sechang,
>
>On Fri, Nov 20, 2026 at 05:49:08AM +0000, Sechang Lim wrote:
>> bpf_scx_init_member() accepts dispatch_max_batch values up to INT_MAX.
>> The value determines the size of the per-CPU dispatch buffer, but
>> __alloc_percpu() rejects allocations larger than PCPU_MIN_UNIT_SIZE.
>> With BPF_F_LINK, an oversized value passes the struct_ops map update
>> and triggers an illegal-size warning during link creation before the
>> allocation fails with -ENOMEM.
>>
>> Calculate the buffer size using the effective batch count, including
>> the default used when dispatch_max_batch is zero. Reject values above
>> the per-CPU allocation limit with -E2BIG during the map update, before
>> the allocator is called.
>>
>> Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
>> Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
>> ---
>>  kernel/sched/ext/ext.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
>> index 10de6bd865e8..93128da6b126 100644
>> --- a/kernel/sched/ext/ext.c
>> +++ b/kernel/sched/ext/ext.c
>> @@ -9197,9 +9197,14 @@ static int bpf_scx_init_member(const struct btf_type *t,
>>
>>  	switch (moff) {
>>  	case offsetof(struct sched_ext_ops, dispatch_max_batch):
>> -		if (*(u32 *)(udata + moff) > INT_MAX)
>> +		u32 batch = *(u32 *)(udata + moff);
>> +		u32 nr = batch ?: SCX_DSP_DFL_MAX_BATCH;
>
>The fix makes sense, but with clang:
>
>In file included from kernel/sched/build_policy.c:71:
>kernel/sched/ext/ext.c:9214:3: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
> 9214 |                 u32 batch = *(u32 *)(udata + moff);
>      |                 ^
>1 error generated.
>
>(also reported by sashiko)
>
>Can you wrap that case in braces, matching the nearby cases?
>
>Thanks,
>-Andrea
>

Thanks for catching that. I'll wrap the case in braces and send v2
shortly.

Bests,
Sechang
>> +
>> +		if (struct_size_t(struct scx_sched_pcpu, dsp_ctx.buf, nr) >
>> +				PCPU_MIN_UNIT_SIZE)
>>  			return -E2BIG;
>> -		ops->dispatch_max_batch = *(u32 *)(udata + moff);
>> +
>> +		ops->dispatch_max_batch = batch;
>>  		return 1;
>>  	case offsetof(struct sched_ext_ops, flags):
>>  		if (*(u64 *)(udata + moff) & ~SCX_OPS_ALL_FLAGS)
>> --
>> 2.56.1
>>
