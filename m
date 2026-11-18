Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971359;
	b=iGs3i1rAWdgOB3unWOFH3thTzbkX9zjoTmzw1nFY/uL7jMb0SdZWwvXO5CHgK8o66wMG
	 sqFlrvHYKdAQ1RF+ynjxweS+TDs6ZwQz0s3DF/12sKhZNeamEAxy0UnjhlNqJv5eqiufI
	 ZMZ9pvFzeAEN6e2+I7gStw79sKSIeNB9aychjLPbJMBmlkO3CNBWjnLSMqkUSJnW3Rncv
	 nM3hPoC7f20En0laq9gajOQ8M6NaFosaOFRE/FCH//lQrQDB8BbyDrmnPnuPl+gvD6VOk
	 0lXMzgvEiuOFFhf9lKJkvk9DIO1QxEmzsVnvpCHE40Ua8Zt+VhBQ/7AIXN/srTkxvcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=pitsyVb1clMqV2L4ssVlVlqFN6fptjFrrSXbJnVEGtU=;
	b=QC7Angllzal+VhFW4hE/lEboj5B42a8zB6d7isy3PZzSnOJM8qv+BKoAHwnucOyyx4kv
	 KDXzzKkwGfRV4Vu9SYDA3KPzJQUllDwYM6uqFM3bXwvDuUW5yHcrLytd/G+O0go9IvEuM
	 XSvm+sFMGW4aAQEqRVnpdVDENgoPUWoi4CoSaIWw+CNH/xQ5NASFZIUV/QLsO2xMxOYYm
	 Qhjn+RvYNlq9D6mtN3+MZEfo72jatKgF/N+UmkFfyvAN/vOn3+OLWygHQIn/bpNldXjf/
	 /6XFPEsrcKJyTfmoW7zxeXpQ32ecUTWdTFN0FqQv8EGK1XZeeQxnWJtTx6t2RfGoOsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=DnriVk9D;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1939F606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1939F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=DnriVk9D
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-945e6d9ceeaso49830585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794971356; x=1795576156; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pitsyVb1clMqV2L4ssVlVlqFN6fptjFrrSXbJnVEGtU=;
        b=DnriVk9DfTUS181w66seZNegYFfAnO7mb4fFvUcc4ZFQ2uHxB+1rrqUCiJ9R8//FSa
         kgFGoS/ehLk7tqP6keyGdj0ZSpONl5G/0OUwEz+bNDsbWIKeO09MbveRsU/80hUtXEum
         ftI3mO+tx56UezX+C9JV6cYE4Gdqeoks+dpVlbGgrA1SRMyTJ+MZOqKJ3W/mFvvH87LG
         uBZGqyALFWIsDQeNscH3zD09p7t4ozf7MqZ6YV9rhrdwxujPoRnUZ8MNm+rbiDqqx2QF
         shQEdWhzinsG4Nz0s3XH2k89ZX19Ari7PYeSWxHQHK0N1TtnkYERBQIO3ujjLYg8nN9M
         n3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794971356; x=1795576156;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pitsyVb1clMqV2L4ssVlVlqFN6fptjFrrSXbJnVEGtU=;
        b=cbdLK5WtlVzXMM9DnYLcen4jtlQwlfdUPT/kiDWW7jKepBdMUy6nMfi8IhsqjkGrd6
         6l/hMq5pdz5lP3INZf/FhYu3rBj9lI48x83HCHmf70aOxenyb4QwXfxWAWZLwBc+Db6H
         jsgmAhC8SDwIj37w21RJlFN1XBWFNCVD7vY4C0Di3mYreOTA1KmXfS+A8NO9LFfOVe5r
         uVYiIKidPp3ShKSQ0PGKBsL70937DdC4iqpZ6iBCOdkPTIeFtyNvQrMU9uqVsafBCo0x
         jeh8RrYeCYEIV1wuunfVccJMHYFtC7VvmmereuOFxt3JcGjLRVPPu6q2V2bmq+3uFwLA
         /yhA==
X-Forwarded-Encrypted: i=1; AL+hErEDeEY2wWK6ixQbldceiSTC4gIzAM//5lFlcui+p8OwtrFnxElINYo+jT2rKC0mxe3yaGKP8Ec1cZYmMLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hE7vjQu+Yxqyx5dw29WziGALv57BPYTDaDHlrzWDhX8oQsWTA
	XDarD/ceASi0L2hddeospyAGpG2utLTrowpVlx04KQ9oih9xUFvS2auNpuQMzC4GHTg=
X-Gm-Gg: AYBFou3Q5H0RNU5NTemjUNlHjYoUNqRF5iLBbtUy8a0a/dCi7ZuLLygR4ZUVdpCJEC2
	9SQvWOeZak3s4czwhL4DixUlTg58FDrVN5DIz7RY0HHAYXeDWOAsWTL6DptYpwMBTB6qrP/p0Lo
	mWADb47Sbr49SYwKFbHbHb+RsKIKhxJvU/u68yaSF2Jpj2MQixoj5NEWv/gQeiLsUvd/av+z+By
	aoc9eOPGzTeTD2cC+RDytifN4zTNhJiH2oACa4ks2uvdFA8GbJii2CsSiCfhic78S80T13E00o7
	f5OPMSyr+MXfSjfz9Ddu3y5sAJmqQ2if/IYO/hOREOBi/QppiIiQWFk+5chBEYzsVMVO+/+6Q65
	ZQF2UPkzjlnnybQxYNUCiDLxJjoojTMTnIlB4bOqqTZD4LmRKCai57CG9+PaFFf7TVgvnO2Cyv5
	XHbdKYalCzpNJKGPAQb7LJcMtpqO9vXLncDJN04l4cU103Y3v4p12haWtLLHxtUVtwIMeU8egcx
	tMXtBh5QXvKPyEucjHD3QY+v5rtB0sDi9fzT8PsD9ZaJnCCSoQoLNBhSuJ8BVKFLZ7noucTbldc
	f+hAi8am3dqyBagXi/S0ZX5V0SNo8Ag7hl9WGaejB1DI5OpD0c5mWz5bZDEV3a5rBQ57VI2WTPS
	W0xWV6yYH
X-Received: by 2002:a05:620a:1714:b0:949:73f3:83c with SMTP id af79cd13be357-94999572b95mr323060585a.21.1794971356503;
        Tue, 17 Nov 2026 19:09:16 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b74dd0asm76329585a.19.2026.11.17.19.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:09:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] [v2] mm/mempolicy: fix copy_nodes_to_user() for
 odd inputs
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Gregory Price <gourry@gourry.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 larips <larips950@gmail.com>, stable@vger.kernel.org, 
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Jackie Liu <liuyun01@kylinos.cn>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261117211635.2472067-1-arnd@kernel.org>
References: <20261117211635.2472067-1-arnd@kernel.org>
Date: Tue, 17 Nov 2026 22:09:15 -0500
Message-Id: <179497135500.1538916.14761148206849685975.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-17 22:14 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The compat_put_bitmap() argument has an off-by-one error that leads to
> copying an extra 32-bit word from the kernel stack to userspace when
> called with an argument that is one larger than a 64-bit number.
> 
> In addition, the size calculation rounds up to multiples of 64 bits
> instead of multiples of word size as documented in the man page and
> expected by numactl.
> 
> Fix the calculation where needed to use the correct -1 offset
> and pad as needed.
> 
> Reported-by: larips <larips950@gmail.com>
> Reported-by: Gregory Price (Meta) <gourry@gourry.net>
> Fixes: e130242dc351 ("mm: simplify compat numa syscalls")
> Link: https://lore.kernel.org/all/20261117101910.1820066-1-gourry@gourry.net/
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: as Lorenzo pointed out, the off-by-one mistake is part of the ABI
>     and cannot change, we just have to use it consistently.
> ---
>  mm/mempolicy.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 6d662a9a8c74..e471ce615691 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -1749,12 +1749,12 @@ static int get_nodes(nodemask_t *nodes, const unsigned long __user *nmask,
>  static int copy_nodes_to_user(unsigned long __user *mask, unsigned long maxnode,
>  			      nodemask_t *nodes)
>  {
> -	unsigned long copy = ALIGN(maxnode-1, 64) / 8;
> +	unsigned long copy = ALIGN(maxnode-1, BITS_PER_LONG) / 8;
>  	unsigned int nbytes = BITS_TO_LONGS(nr_node_ids) * sizeof(long);
>  	bool compat = in_compat_syscall();
>  
>  	if (compat)
> -		nbytes = BITS_TO_COMPAT_LONGS(nr_node_ids) * sizeof(compat_long_t);
> +		copy = ALIGN(maxnode-1, BITS_PER_COMPAT_LONG) / 8;

bleh this is such a mess to reason about.

Pretty sure you need to keep both of these lines: 

      if (compat) {
         copy = ALIGN(maxnode, BITS_PER_COMPAT_LONG) / 8;
         nbytes = BITS_TO_COMPAT_LONGS(nr_node_ids) * sizeof(compat_long_t);
      }

Otherwise now we can get the opposite problem.  If the buffer is longer
than nbytes, we'll write too few.

Test:
```
   /* 32-bit get_mempolicy() leaves nodemask word 1 stale (needs <= 32 nodes). */
   #include <stdio.h>
   #include <string.h>
   #include <sys/mman.h>

   int main(void)
   {
      /* int $0x80 is a compat syscall: pointers must be below 4G */
      unsigned int *m = mmap(0, 4096, PROT_READ | PROT_WRITE,
                   MAP_PRIVATE | MAP_ANONYMOUS | MAP_32BIT, -1, 0);
      long ret;

      memset(m, 0xa5, 4096);
      /* i386 get_mempolicy(275)(&policy, mask, maxnode=1025, 0, MPOL_F_MEMS_ALLOWED) */
      asm volatile("int $0x80" : "=a"(ret)
              : "a"(275), "b"(m + 512), "c"(m), "d"(1025), "S"(0), "D"(4)
              : "memory");
      printf("ret=%ld word0=%08x word1=%08x -> %s\n", ret, m[0], m[1],
             m[1] == 0xa5a5a5a5 ? "FAIL: word 1 stale" : "ok");
      return m[1] == 0xa5a5a5a5;
   }
```

base       -  word0=00000003 word1=00000000 -> ok
this patch -  word0=00000003 word1=a5a5a5a5 -> FAIL
fix above  -  word0=00000003 word1=00000000 -> ok

-- 
~Gregory

