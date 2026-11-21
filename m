Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795269464;
	b=D1DYazMEDaq4hmc+71KdPJ1+e69pn2TVZ0NjNdpy6LXdOcMROWVDu9sQqjRjj3m3+xGe
	 b8jqSNT+hNS4Ne+zm2sZKNLft/Iwq5ydLTpXhZOizwz37mhxsuNd3nsurinYCYaOi/URZ
	 rWbmqxrfO4KZcgGLcfhI+5+PYlr0Frm45FS+4NUoxKA5YsW4u+y08tho2H1ma/F8oxP84
	 f3XEGQ+K3vaq5mCUJMZIP8eLe4C7lScXWzFI8b9cHkoTGyYUWW+fk6sWnmykEAYS6gGmS
	 W0r3CEzwuguUlObE4JjDi3VhBEc6F1n07ys2Bd0pl5Y6w3wGGnJ+N8oQJde4erUz4og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795269464;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=18/Vs9GqpUyKpNSmHJAMt/cDQkuDqfrI75+lCyBsTo0=;
	b=hMnvsHRo3T539LbxPDMrmeo+8/fV7tmqYNC8N7YPez+WdvcHG6WrAiODTtVx+L4PGSBG
	 gYJ2pE78uWB71FMvrn5bFhrf7wQRQZGEr4NlNOa8b4aSvdwUGBVfiSIYyOMwP+fC+7t1M
	 4bxA4DrjLXl4RjEMatBVuEWFLpvshaNts6N2Oto+TsNJaNamraUE3JWXnVXjuwjh028e+
	 zoVOrqHo1t1cZL1+Ld0H0b3eoF0RxooMAav5S/JIroe2yAikfqqUNq6mGKsHKEqmvyBwS
	 dGfBLFzVJ7ZmsHPnXFVGZmdXgZ7gHJYSxaOBo6rxZBj3Ib4XvC+CSj6yyh68wrItoRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="w/uS1uJG";
	arc=none smtp.remote-ip=91.218.175.239
Received: from mta0.migadu.com (out-239.mta0.migadu.com [91.218.175.239])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58367606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58367606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=w/uS1uJG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2dvE1j/J7GOZSLNpwQfYKuzbzCKoIpTpgn7v4dkyvXc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795269461; v=1; x=1795874261;
 b=w/uS1uJGXlgVzwAbgvs47kIIknHR2IigKYDN9/OMhSBKszCBKBoajtWDm00P4Fjt/scwk1fc
 LrEXhsgGwTvaCgGVXqOjNa78PcB9tyeS48yy9BVZPoU/VpQqAqgqVoCXRshDpOPhjI92u2DvzAu
 gWRt25czL6xEtmRYJanz/PME=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2e59e907da1d8a68;
	Sat, 21 Nov 2026 13:57:41 +0000
X-Mizu-Trace-ID: 2e59e907da1d8a68
X-Migadu-Flow: FLOW_OUT
Message-ID: <ee4847f9-53ba-4f0a-9297-7ca8b6408f7f@linux.dev>
Date: Sat, 21 Nov 2026 13:57:39 +0000
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
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack fills
To: David Laight <david.laight.linux@gmail.com>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org, hpa@zytor.com,
 gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com,
 atish.patra@linux.dev, dgreid@meta.com
References: <20261119213147.1094488-1-usama.arif@linux.dev>
 <20261119213147.1094488-3-usama.arif@linux.dev>
 <20261120185513.0445f0b1@pumpkin>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20261120185513.0445f0b1@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20/11/2026 10:55, David Laight wrote:
> On Thu, 19 Nov 2026 13:31:08 -0800
> Usama Arif <usama.arif@linux.dev> wrote:
> 
>> With KSTACK_ERASE, every return to user space poisons the part of the
>> task stack that was used since the previous return. The generic
>> __stackleak_poison() does that one word per loop iteration, so a syscall
>> that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hosts
>> running many small VMs, stackleak_erase() accounts for about 1.5% of
>> non-idle host kernel cycles.
>>
>> Override __stackleak_poison() on x86-64, as s390 already does, through
>> the hook added by commit 491a78663e03 ("stackleak: allow to specify arch
>> specific stackleak poison function"). Fill spans larger than 512 bytes
>> with REP STOSQ and keep the word loop for shorter ones, where the fixed
>> startup cost of REP STOSQ does not pay off. REP STOSQ starts to win at
>> about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span gets
>> slower.
> 
> As a matter of interest (and separately from the exact code) how did you
> measure the performance to get the 300-400 byte gain point?
> 

With a userspace benchmark pinned to one CPU. Each sample is one fill of
a stack buffer straight after a getppid() syscall, with
lfence;rdtsc;lfence around the fill only, an empty call subtracted, and
the mean of 15 times taken. The size stayed fixed for a whole run,
so the branches were well predicted. The plain loop and REP STOSQ
cost the same at about 430 bytes on Zen 5c and 320 bytes on
Cooper Lake.

> If the count is variable - likely in real life, you'll get a branch
> misprediction penalty (about 20 clocks on zen5) every time you change
> between the two choices.
> The copy loop will have another mispredict penalty for the loop itself.
> 
> So you are likely to get an overall improvement if you use 'rep stos'
> for all lengths - even the ones for with it is slightly slower.
> Unless, that is, you know at compile time that most of the length
> will be short.


I timed every stackleak_erase() in a Zen 5c guest running a
futex, epoll, procfs and unix socket mix, with the variants switchable
at runtime and alternated over 15 rounds:

  Unpatched                     68.3 ns per erase
  REP STOSQ for all lengths     47.3 ns
  v1 / v2.1 (loop up to 512 B)  46.6 ns
  v2.2 (4 stores/iteration)     43.7 ns

The spans aren't random. Unix socket and /proc/self/stat exits were over
1 KiB every time, while getppid(), epoll_wait(), read() and write() exits
were under 128 bytes almost everytime.

My preference still is v2.1 because of the simplicity.

> 
> David
> 
>>
>> The fill is inline asm, so the noinstr function still makes no calls.
>> memset64() would be the same instruction, but it is only static inline,
>> and with KMSAN it is an out-of-line function.
>>
>> In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per return
>> to user space (71 ns to 46 ns, scan included) over a futex, epoll, procfs
>> and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix socket
>> sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.
>>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>>  arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
>> index 77488ff5eb8c7c..049231d484ad0e 100644
>> --- a/arch/x86/include/asm/processor.h
>> +++ b/arch/x86/include/asm/processor.h
>> @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(void)
>>  			       current_stack_pointer) < THREAD_SIZE;
>>  }
>>  
>> +#ifdef CONFIG_X86_64
>> +#define __stackleak_poison __stackleak_poison
>> +static __always_inline void __stackleak_poison(unsigned long erase_low,
>> +					       unsigned long erase_high,
>> +					       unsigned long poison)
>> +{
>> +	unsigned long count;
>> +
>> +	/* Short spans do not amortize the startup cost of REP STOSQ. */
>> +	if (erase_high <= erase_low + 512) {
>> +		while (erase_low < erase_high) {
>> +			*(unsigned long *)erase_low = poison;
>> +			erase_low += sizeof(unsigned long);
>> +		}
>> +		return;
>> +	}
>> +
>> +	count = (erase_high - erase_low) / sizeof(unsigned long);
>> +	asm volatile("rep stosq"
>> +		     : "+D" (erase_low), "+c" (count)
>> +		     : "a" (poison)
>> +		     : "memory");
>> +}
>> +#endif
>> +
>>  #ifdef CONFIG_PARAVIRT_XXL
>>  #include <asm/paravirt.h>
>>  #else
> 

