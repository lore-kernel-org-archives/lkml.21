Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530002;
	b=TgqgnhR7ZECQ4x4eEfWkmhJ393BtoP5nXoHfOU7xyZESn95kF+FcNiR0Z3HJDUGonhtr
	 L5Z8N36sVQxaOrs+gQN8Eqawyg+NVBxjoQMDhHPupPWNVJWBFGNMmiCvuP6cpG4+bTZcj
	 T6VepjYCAmClnnucRanSmIWv4Joxo4LVZuyIDa07DJmVy0hq9OTLbVHe6o1WtDcWuPxnt
	 qqTyhXz1JxzP2fygt9LpjZ+WIlKQslXhadXJ7QhZjvm706WL3unS8urEEbYS3AvosZjHV
	 NYUua0kTeDjAMsZW90bqQ2/pUVo17+GuRSIsaOld+iMBbk91hQ8Yp9C46HU1NjZ6qbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7+zJ9wEzRWTT/HcA8h9WG5wBBTJExWPk/UTv1pPJ3a0=;
	b=3+uVC46OBKgxdOfy1vIEKvhmASVlmi3fL0fxhVmP705P/r+hp9ngWpGLRQha6jUzNHfK
	 Bg01ko2+TpE8Flcwre4Z6c3GtnoeiiP79jZS04467HSP5kK5mK4wC5QhyknbcTVwbtvNl
	 VysgPhPhp5jd508NkDgzNT3x0FDLvwWzDz/TINK8pDAEuSB8/QbRwhUnf2wpD7Rw650w3
	 h8bkQ9DLIGzrF3i6/nBsDxgzSUsQ/ln/LYn7OD9gIAXnVdwZ6AKGAzgPNATN9nHqWLLhZ
	 HBIc+PB2hgznkjRUZ91uu9vFFm0oZXD/jHeAlEK94UhAa5zkgc8cwq00bao3XudZP/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZ7y3J9H;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A880B606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A880B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZ7y3J9H
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so4344096f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530000; x=1796134800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+zJ9wEzRWTT/HcA8h9WG5wBBTJExWPk/UTv1pPJ3a0=;
        b=IZ7y3J9H93IKqopZTq2ipF3e9s9TFYfJrLsd7BOXZRROtROjngdzYrcxanU8HCuZOA
         Vkl+OUtO4ikHhIxZiqvGiJuxspFZSu7uIjYM7Uwxn735WIPF7w6DBUcRdP7uv4m+46jH
         yPCcyA3HM3mtJK9sfDrUQIxu6UiLj1lsOLAXwwzhk+pWXKwu+hCJPD+FHpB9ThwehL7t
         UBOgA0lc29OCJQId/wjvBVjRDqN/7wq7ipxDR0B+2Ve/5AJG2jiyF1Ykym9MmS2qrGH7
         ORNuwljXAdyQAqLZLGDq/EVqjwumbG5fIoGYC2nRkT4MgKByvfsH/s6/P+921XwToQbx
         5mkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530000; x=1796134800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+zJ9wEzRWTT/HcA8h9WG5wBBTJExWPk/UTv1pPJ3a0=;
        b=eGIB7Rpig8n1QA1cY1Z8cBDVllsSenDaDYlzNHIMAKlQ2kOSOFpHeQ48XMNbol5hxD
         wwwY8OYcIQiJqou8vmOoi+ANF4lwlRWfF+prKZjiPgHPQjajPLqRYbdq4ncZYnNq283x
         e0hw39+8X75njl3cSF/yYBaMd8Dic3CFCqRL0724rLLrly6QnyTqi3b9y61dv+2JLDVh
         ey5ixMmX65MkX/mv+cs44fNdL87c9UzJcKPjWzeceFD6VrlONK/veu9WMKi5/rhi4TLz
         F1dzVtT0FryDQx+RhpaM4ESLbPiGl3NHEHyRLKQXJ8FvxwHATw9CvnlsZKeKyTRVTPwB
         TdeQ==
X-Forwarded-Encrypted: i=1; AL+hErGoLZgUZ2KYWQAQpVBP0tOKrvPONKSnuaUB5dmP8/qn7NYI+LJyzVLTJDi6j+Pd2QIWEkoWd7A/7oWlEA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+njc56L59hETlRF6nqID0cs6YZCpgVrVeQdNH99UNUx/2wpmpO
	SnjNrryBV9uRma8wG2050p8uFx1JAC50VNImlLpAkHCLfxbg/N7IbkM6
X-Gm-Gg: AZFdTZf04LY7TNalc94AKRsewCRWIOOOHJMoEL+uc3NdC3Z5la/9pC53+UBSSUNwOYz
	Jb9dJBT6xwtEenQYhq9gtpKZy4PqRExoYa9ktjbSwTPu9JfAlYJ9IJompKRe6mnD5tZnCEkPQq1
	vQks/Brw2+GK/7VOgGchHXVbgsjHr9wvmtR8WSbkywSXvEeJfexEeIbk7iQosqsoLgEi1V2xN5t
	M+XMYgSqmFGodj1v5Gk1vs9tuVNiAyHI5iVTkw8bTCtHNDdv9cUNj0yWYQFcvrHXgiKmEcKWvI0
	2PeGEeHuOiuEU+wyo/l1aRufLE98Qmm9EXQ5F9eVxpxAi+ZDABENgT8WoJ0mQPPlkEeCQ8v2l0A
	n1kNxuREwj3pEfjlZ87y0cdBLvy7n71nY43prcaSCmUTYrwDDvBHrBJCkuCPjdDMnPBzaXO7FhJ
	UdA7WVDWyFBTpPjhFNVyZF78a0u8/JeUFEZZvp8HzgxVbeRRi706zZZG90vndODoo/nerOU6N+S
	qTgg41MExwSa8hnOGGMcGy94/4vticqSy9YZy9N0hn8gjABQdAbL3gQzywY+0uoQAQH17dv4KlB
	KFzIqmwn+5dUGWFT
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr20944271f8f.47.1795529999684;
        Tue, 24 Nov 2026 06:19:59 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm28314153f8f.52.2026.11.24.06.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:19:59 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 24 Nov 2026 15:19:57 +0100
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCHv2 1/2] kprobes: Increase the kprobe hash table size
Message-ID: <awWdDfj1fknA8fuF@krava>
References: <20261122200239.1481088-1-jolsa@kernel.org>
 <20261122200239.1481088-2-jolsa@kernel.org>
 <undine-1795477745290490698-99e2fcc5c9b45beb@undined.local>
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
In-Reply-To: <undine-1795477745290490698-99e2fcc5c9b45beb@undined.local>

On Tue, Nov 24, 2026 at 08:49:05AM +0900, Masami Hiramatsu (Google) wrote:
> On Sun, 22 Nov 2026 21:02:38 +0100, Jiri Olsa <jolsa@kernel.org> wrote:
> > The kprobe hash table has 64 buckets, so with many probes registered
> > each get_kprobe() call walks a long chain. With 20000 probes that is
> > more than 300 entries per bucket on average, and every entry is a
> > separate struct kprobe, so the walk is mostly cache misses.
> > 
> > get_kprobe() is not called just once per registered probe. On x86 the
> > registration path calls it for each address it has to check around
> > the new probe: get_optimized_kprobe(), __recover_probed_insn(),
> > __recover_optprobed_insn() and arch_check_optimized_kprobe() all do
> > one lookup per byte or per decoded instruction, and most of these
> > lookups miss, which means walking the whole chain. It is also called
> > from the breakpoint and ftrace handlers on every probe hit.
> > 
> > Increase KPROBE_HASH_BITS from 6 to 12, which gives 4096 buckets and
> > cuts the chains to about 5 entries for 20000 probes and about 12
> > entries for 50000 probes.
> > 
> > Time to register the probes with the kprobe_many_example sample
> > module [1] (insmod with nr_functions=20000 and nr_functions=50000)
> > in a KVM guest, mean of 5 runs, for different KPROBE_HASH_BITS
> > values. The table memory is the size of the static kprobe_table on
> > 64-bit:
> > 
> >   bits   buckets   table memory   20000 probes   50000 probes
> >      6        64          512 B         4.71 s        29.99 s
> >      8       256           2 KB         2.05 s         9.90 s
> >     10      1024           8 KB         1.39 s         4.63 s
> >     12      4096          32 KB         1.30 s         3.64 s
> >     14     16384         128 KB         1.28 s         3.41 s
> >     16     65536         512 KB         1.28 s         3.38 s
> > 
> 
> Thank you for conducting the testing and evaluation. The results show
> a trend similar to that of a study I previously carried out[1].
> 
> [1] https://qiita.com/mhiramat/items/1bbeb309ee5dfbc979ce (Japanese
> article)
> 
> > With 12 bits the registration of 20000 probes is 3.6 times faster
> > and the registration of 50000 probes is 8.2 times faster than with
> > the current 6 bits. 12 bits is where the curve flattens: compared
> > to 10 bits it is still 21% faster for 50000 probes (6% for 20000),
> > while going further to 16 bits gains only 1.5% for 20000 probes and
> > 7% for 50000 probes, for a table 16 times bigger (512KB vs 32KB).
> > 
> 
> I personally think 6 bits is too small, maybe up until 9 bits (4KB)
> will be OK.
> 
> > The cost is the size of the static table, which grows from 64 to
> > 4096 hlist heads, that is from 512 bytes to 32KB on 64-bit. The
> > functions that walk the whole table (module notifier, arming or
> > optimizing all probes, the debugfs list) are slow paths that take
> > kprobe_mutex and now scan 4096 buckets.
> 
> What I still fail to understand is the use case for employing such a large
> number of Kprobes simultaneously. If the goal is to trace individual
> functions, Fprobes are already available and offer better scalability.
> Personally, while I might occasionally deploy around 100 probes, I cannot
> conceive of a scenario requiring 1,000 or more. Would you have actual
> usecase maybe from eBPF?

the use case is the kprobe multi link support for inlined functions,
which I have in this branch:

  https://github.com/olsajiri/bpf/commits/inlined/

inlined instances are not function entries, so they can't be attached
through fprobe/ftrace and each instance needs a standard kprobe

number of instances gets big quickly, even for a single function, some
examples of functions that have both an out-of-line copy and inlined
instances in my x86_64 build:

  function                inlined instances
  __list_del_entry                     4144
  list_add_tail                        1196
  folio_put                             629
  put_task_struct                       373
  percpu_ref_put_many                   273
  kmemdup_noprof                        207
  fdput                                 189
  sock_put                              161
  migrate_enable                        131
  migrate_disable                       123

attaching to the list functions is not necessarily a good idea,
but other functions have a high number of inlined instances too

the goal is not to attach 20k functions, but to make the inline
attachment fast.. user specifies just a few functions by name and
has no control over the number of their inlined instances, so even
a small set of functions can end up with thousands of kprobes,
and the attach time should stay reasonable for that

> 
> If this change is intended solely to improve performance for an extremely
> unlikely use case, I would, at the very least, make the size configurable
> via Kconfig.
> 
> Since this change affects all architectures, those working with small,
> embedded-system chips might be reluctant to "pay" 32 KB for a use case
> that is highly unlikely to ever occur.

I can add CONFIG_KPROBE_HASH_BITS with range 6-16. I'd keep 6 for
CONFIG_BASE_SMALL, so small systems don't pay anything, and use
10 (8KB on 64-bit) as the default otherwise, which gets most of the
speedup from the table in the changelog

thanks,
jirka


> 
> Thank you,
> 
> > 
> > The sample module was posted as the last patch of the kprobes
> > lookup cost series [1] only to demonstrate the testing, it is not
> > merged and is not going to be.
> > 
> > [1] https://lore.kernel.org/bpf/20261109195827.1091410-1-jolsa@kernel.org/
> > 
> > Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> > ---
> >  kernel/kprobes.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> > index f14f7ff45961..47ce0bfb7298 100644
> > --- a/kernel/kprobes.c
> > +++ b/kernel/kprobes.c
> > @@ -50,7 +50,7 @@
> >  #include <asm/errno.h>
> >  #include <linux/uaccess.h>
> >  
> > -#define KPROBE_HASH_BITS 6
> > +#define KPROBE_HASH_BITS 12
> >  #define KPROBE_TABLE_SIZE (1 << KPROBE_HASH_BITS)
> >  
> >  #if !defined(CONFIG_OPTPROBES) || !defined(CONFIG_SYSCTL)
> > -- 
> > 2.56.1
> > 
> >
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
