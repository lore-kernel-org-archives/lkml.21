Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795723202;
	b=LDQZfbc4P/MZ0Vq7Ee2goZPj2HZTd/MhLYeNZeO0X9QXLtKmXKcOcq7a6sWUVcdq9sM5
	 p8DIeqOt/G5n35PXt0oRq5ub5/vsSUbRBP3BkGJv+lc5NSKcNPFFrKbmHCJNDUAlIuvzU
	 7j2iivNPiGakFIP8NY3W5qMlEtaz/SdCydNTpk3o/TRXbM7efOlSvDjDDfK3NxdlEi8H0
	 TTuaufI0/pA8B+fdvnWYq80ekcEWIgnsAd9pD2rohl6TzD9GAIQqgpj2xdmjhDCS1hqha
	 1ukslhqJnYyv1sDZfC+vNC48wfYOWmIsZtp234spWpbawGCvVIps/KMLmeZpTTbUZPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QUQmLAInkGKTLacIVSVGPlTbjIhBu2Q0Jnfx3pxNGHE=;
	b=R/AARJ7MHAOAY2ptiCAmh6l/cdP4kAzYz4x0afjheAQ4yWJixwPcgCSeSuMFsnLIKdwT
	 UNnQRU9vj1JUUXdufW62RQSSYECvibuKzj29SdkX4tbDiwlNxACDCAmCRquavrCHNtOYz
	 rcu7z9jqC/NQ9S4TLkF+vFxoR5GToz0O6d8xH2INEfmAJx20wsyo0EHSREJUC4lHU83Zm
	 cq98wKE1EZRPDQ/J6PfGuKmS3Yn4jtNA5cGCTxdTPxss/ZxRau5UEPTAeZS7rm1oG1pqq
	 bnJ4GgPkAwA5KPYGTZU536p7HIyWXSOTEfK8L2BKwWGvWvLLrv7HBCKBJPsxowtJj2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JnpLxW4a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B528606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B528606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JnpLxW4a
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso9938195c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:00:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795723201; cv=none;
        d=google.com; s=arc-20260327;
        b=ktq3w/S7aPDSAOpgP/6cwgyhXh2b6rbgO8sWrCEkHsTTxveokQJ5IIM0Fw2AsqKuGc
         eJV4Crw3Vcld6D3Jnt52Jv3C6Qo91Kb0/XznQJXMzFwqtLsLl7QimxyyHx3c9y7PR60k
         QoGmuriHAu1/P7QiC3HMsH0xLLFE/qdJ5YDrRITejIdHuy5FYGxnu8Pmalx9HcF0oItr
         czxTHpaPPE/LW9aw7KYmFx8ugXmPX8bDqANVxhWbUNQI1BJg/4JnwCFk5nrw6Yx4X2EI
         Z6oEq7tRlrpnS5kWtIa17wZj4LpHDS09KO4BARqOfUTJ1N3nqGX0sG478fiPuITXALEU
         s0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QUQmLAInkGKTLacIVSVGPlTbjIhBu2Q0Jnfx3pxNGHE=;
        fh=9GYuKy7LhnHy4ea3sQq4zAbdpjrgAFtKLdwh/JOfCuk=;
        b=IPmCEX7vOrKssaz+yeQf74PbPFvZImQB5f7kPsfMUDUWzNniklOrDnNwVD3KiDED6O
         w1GvvN+85unzdKzxgUARoV9XAxWS/fbmolYzVAuKoHURATsrxrztGUeORo1JjOiNkN4h
         vCnUUGN+5D2/1iMCBPE5nt9JPsIwfGY3mLMCn30KovwgI3xqYs1s4sERUEY8CWaQBKso
         lWhc9jHzyW8JOiObLEv8Edw9aFf/OuOS/y4CNII2CvY1pYX3yhbYXBb8rTCely6kuIU+
         hGR5CpQS3GP8M131/htl7bTNGvZJvAsNVWxg8Y+u0q0MHKnNgD1I1cPB9QZKCEh7l63e
         A20A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795723201; x=1796328001; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUQmLAInkGKTLacIVSVGPlTbjIhBu2Q0Jnfx3pxNGHE=;
        b=JnpLxW4aZVow3fubL0tIiZmyTGOCPzwIacNTiAGbfLkkcfLiR+aimnQBF6Mbzmc4Bo
         RJWU6uCONGPnuyHlAD8OptB47YT4GPw1OYRiTMx87oZ6WVBDTWoqjhgMtWK+QJVBdHnd
         vvBeT0R7HaG1ifLL5JQAV8eEPV7Lh7kiphN39jA95ihzjSwUvOb/1HBsCB4bN57aye0V
         j5e7FtZkV6YYmtFYTzPAbmVpBQ9u+vzjNKJcXDSWw3Y2BsWRtE/U2aP9eITmAtQHGSpo
         knlSAaRpH131WYoM63pksKLKVIy37oXm11P6dCI9Aj7MoXWXL/OXgfLWaDzm5WaqzWR6
         rluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795723201; x=1796328001;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QUQmLAInkGKTLacIVSVGPlTbjIhBu2Q0Jnfx3pxNGHE=;
        b=wfK9yY7vuSTuC4SUz35Dn78+1K9xZPKMAt/tuM11Wamq7PTTKKrV420SqJ7brbUw1s
         YbU4OJ/RJtzZEChoJ2976G+bWZ5Cr6OyVOW3P2MlwrVsUMoxr5fP61ThW/+OzWpimXVX
         SR9aQUujygirBUBYbHjR2smvS1SjXwcbHViYhqj6OjdiDy/vKu37vaY8vmcLT5WrnbdU
         /tZNgbZlhn+UFkEym6kbRru7l5yeQwv1ZBfK1A39WgWMtNO2Qt5IEMV0ISbabQN9i/2A
         mRAo3Dyec16YdAw0w1u93kFDiYH7yHL7ND4bVelpjmqW4gvfSPX4GrsD0TddbAtMP5bI
         zCGQ==
X-Forwarded-Encrypted: i=1; AL+hErEaIjsHqzSmrzsQe233m8nEt5WE9EHEIqbQUw4iwFkYmPBxpcC3DEVozcDidVSu7DJnczbysv9oSlCIjyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yBD2RhThwBFJEnxr87AFhXnn2vUWIiSOV37oLDGwiV5nfaoHz
	IoHqNAgyY3Fkr3cHsSI8xeCf/IABZujeyx2MUKMeLHE8K9+OzcF68Nyk92wBeK8GmIRO/bJSJ1Q
	2lHateeyOiwheSOVDGgnG+/OK+btHYMrfFyHts5IU03QbsyyxMyw28kqj
X-Gm-Gg: AZFdTZdxc8shBB4u5CtFRbIMiBZhYWghnLoiePvayewInnACK9P8lhFeB7CHoCRCl9g
	sFlclszozTV8x22NF5Df9TEPu6GZ9tw9nC6+yP/o6FjGGHb65l9S7IPvLoWx5QcS6yiifWPyRaA
	F2ITNvjNWp4KANPuvU/Se0bF3UVsXYm43t0fwg11gqbUZVGgRCwC7R2XVIiYfCzdAqDVTHYrLuE
	dIxrDRAYw2IX4a7GKCeFuOWMlO/26wX0Rbp7hPscm0U7jwWcq/Q+vFCtzJPTLIThOkxmA0ASrcU
	QPA/w5oC+G2RFcxzH98AAcRHcitQgHQGlLsFwKCUDC1tat3/A6h2rroFTSydghptNVQMucB41Vo
	0cvaCppzOeO5jY93uUyvU5kaO1/SpYwi7Tb69Uh57aoffU5nsH29jubGHf82Zdydpn522
X-Received: by 2002:a05:701b:260e:b0:1a7:e1c6:6f33 with SMTP id
 a92af1059eb24-1b5568d3ca9mr22040002c88.30.1795723200649; Thu, 26 Nov 2026
 12:00:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-kmalloc-entry-rework-v1-0-37b1631a67b5@kernel.org>
 <20261124-kmalloc-entry-rework-v1-2-37b1631a67b5@kernel.org>
 <awg-2hrOmY5U3vzS@thinkstation> <4cb6e0ea-5e6c-4ecd-b673-70b42864c694@kernel.org>
In-Reply-To: <4cb6e0ea-5e6c-4ecd-b673-70b42864c694@kernel.org>
From: Marco Elver <elver@google.com>
Date: Thu, 26 Nov 2026 20:59:23 +0100
X-Gm-Features: Aa3M54qIRTbwIcF7QF1KtF_Buuyhe7XJlsbw6zNTzNtYRjONQTndd6cep3utZfE
Message-ID: <CANpmjNM8K=2qGb2qWGj-AnuGSRbT5KwPdu9z6e5i2JfH8_+7kg@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm/slab: add own entry points for kmem_buckets_alloc()
 family
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>, Chris Down <chris@chrisdown.name>, Kees Cook <kees@kernel.org>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 20:04, Vlastimil Babka (SUSE) <vbabka@kernel.org> wrote:
>
> On 11/26/26 15:22, Harry Yoo wrote:
> > On Tue, Nov 24, 2026 at 05:30:03PM +0100, Vlastimil Babka (SUSE) wrote:
> >> The way buckets have been implemented was to extend
> >> __kmalloc_node_noprof() and two more functions with the kmem_buckets
> >> pointer parameter, which means all kmalloc_node() callers now have to
> >> pass NULL. To avoid this extra parameter with CONFIG_SLAB_BUCKETS=n,
> >> we added macros for parameter declaring and passing.
> >>
> >> This can be avoided by creating own entry points for kmem_buckets
> >> allocations and not using the kmalloc ones. They all end up performing
> >> __do_kmalloc_node() internally.
> >>
> >> Since it's just 3 functions with few callers, do not try to do anything
> >> special to eliminate code with CONFIG_SLAB_BUCKETS=n. Only make sure the
> >> bucket parameter is changed to NULL in that case because it would be
> >> ZERO_SIZE_PTR otherwise.
> >>
> >> The removal of the now-unnecessary parameter macros is done separately
> >> next.
> >>
> >> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> >> ---
> >>  include/linux/slab.h |  16 +++++++--
> >>  mm/slub.c            | 100 +++++++++++++++++++++++++++++++++++++++++----------
> >>  2 files changed, 94 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/mm/slub.c b/mm/slub.c
> >> index 70df0a2e3876..6674caabbb6e 100644
> >> --- a/mm/slub.c
> >> +++ b/mm/slub.c
> >> @@ -5732,6 +5732,34 @@ void *__kmalloc_flags_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags,
> >>      }
> >>  }
> >>
> >> +void *__kmem_buckets_alloc_noprof(kmem_buckets *b, size_t size, gfp_t flags)
> >> +{
> >> +    const struct slab_alloc_context ac = {
> >> +            .caller_addr = _RET_IP_,
> >> +            .orig_size = size,
> >> +            .alloc_flags = SLAB_ALLOC_DEFAULT,
> >> +    };
> >> +
> >> +    if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
> >> +            b = NULL;
> >> +
> >> +    return __do_kmalloc_node(b, flags, NUMA_NO_NODE, (kmalloc_token_t){}, &ac);
> >
> > No type-based or random kmalloc partitioning w/o SLAB_BUCKETS?
>
> Hm that's right, that excludes it. I didn't realize that, but also I wonder
> if anyone would really choose to have partitioning enabled but buckets
> disabled. It should be straigtforward to add it though. But as long as
> buckets are not disabled, the token parameter will be effectively unused. Kees?

This falls back to normal kmalloc caches, right? If so, if
partitioning is enabled, it should choose one of the partitions just
like normal kmalloc. That'd be consistent, but also partitioning
without buckets is a valid combination that has different perf/memory
trade-offs that may be preferable for some deployments.
