Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795716896;
	b=YsVcpJiEzbtrwWk+cTfU6jcKtwSTXHursNfPJtVXOq7Kcszvw8r6MsN3+my40Pof3BLJ
	 SDlMdvgZcr3R9Dua9YAlSbFhZsckob1sLOmeWwTttkyZt9BoZGgF2i4KldAtTXnv8czwb
	 QVn8KhZsBVC+Gvnv/Qs/4RmZgpkna7J5lC9ueX5bsGuNUQMIvkqI8iKKb6WNmrqFPv2gk
	 NX9+XeHriorBFIhxXdOSgYFP9fMSPwd548rsgSL0c01caXjIln7gTWe0DNtFGvhgYJE8h
	 6JpdgraMUujJ0fxJAyMVKa5WpvhEblfsd1/J7YH24a/euJgh8P4qZW5ls9+iztUvX7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JJcgIq/HDSRd39VYibYL7fowv//3d+fQ3P9cW/IGDlk=;
	b=oM6lD/ehJuoG5+cFzPG1QLdxK7mjoQHqIgHp3Gc0w2bZs4fyLepr/WbYHsi7fETqse7K
	 iO09yd0uYpUqSPQIsea7xOvPmrf0R08BvKEkuXETkS1ZHo1zCGt5BKacyzbxpoi/RNP14
	 SucIjDnPksGRG2AzRJ+kaKdPQCCOeq3frnQE/j8kXo/UIuGzPGQ64zYeIRKouCqY4ziNQ
	 Az7BozPbBACr5lY+QDtp2TOMcNcSboS/FOdpuqTtJJETEY3I8PVvKWnx6vKAqAEABcMhQ
	 eFRxNEw4fHimuCvoH8/f7Omds+QEwEt2CBYh3fK7riY3BB0CVYTNOu8EZyJ9O8NawPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MlUgjrx6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52183606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52183606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MlUgjrx6
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a9be758734so4646511f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795716895; cv=none;
        d=google.com; s=arc-20260327;
        b=MZgpivjVGvrmj13YwvYriQV+irXIkocpG7dnHlh3/9zDlloNao2ULRX7D1mIRocYpW
         hXhjT15ura3sZta2+2nV7i+vRc8UC0Ziw7uj1XiQK5NtbpZHiBS0Z/KB5qxuuSWXtvol
         ygBVVvp5rruNxe1HQ2J9n/6m/HoWlNfEdOIbRHQ+9ynCyJkofctYrE4ctGgG/FSEGdQu
         QjVk//oEnidBJStdUcn1PhrFgAI3oF28ZYVvEo/0Rn69GAQGJaEVlcKw58T5Pp6WbPE3
         HeGT39TVqF2NoqIPXxaKumVItOq6D28c/6EOU66NvXEx05JbvQpipUvSXMIeyGBvUSzT
         YmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JJcgIq/HDSRd39VYibYL7fowv//3d+fQ3P9cW/IGDlk=;
        fh=IYsfocJU65KC4FZPhTYIzs7zZMvHBbpoqGIklSzYGOA=;
        b=QUuZ7oWFATM5q6AwdG7vrkketO+rOX2e6RPeQWHuLtsbdTezKn+0mae5kwp98DYvNW
         7dKtsxir7S8rhLUGSxfsp7U41XFHWXrGEPg22iJCXEHXS4uHa/iUCtFybj3bHi9XtQBZ
         KbmtPKsWdECx0mKmmeeYWq1MWR1jr3FR3yYxS9qObaT0m17Tmk8RhvN6kXme8mT27aiY
         OGWAYKVV96RqEQpdSkEOmUQYhWJwMhBx9NwV6gZR3/P5/xKziXB7i/JhfeVtlq9SUOHx
         I5v+4L1MvwCSoCP4Npk5oPMX7fg9CnX+u6iftZgFP7LEJm4RdBfsIjYCm0MpXMEJAOVu
         D/YA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716894; x=1796321694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JJcgIq/HDSRd39VYibYL7fowv//3d+fQ3P9cW/IGDlk=;
        b=MlUgjrx6HIxQo6Zy2rU4PecYNGG3HQXdBSUsGvQ7dkAKM84Deq/DjVoAfNkjuN7Hqg
         gN/DJWxpzfghfuaWXMj4qNaTvTJ4INmDDAY4e79VRMyH14gHC+YHiJSP7F/QpEJlMC7k
         lcIM1R2fmULs1wqukLj1bPlpBImhrKbvqMfHp8yEm2+GSB3weKNRq8CFKY0NsKo7J/5Z
         SaY/tDDq1r7HNn2+BEdEVBI+j+DYUKpgiNzCVqbPsgKarsvSfCixwoQyrmmrEGPE2o5x
         LaGc/gKG8y4dPsfX65A7F4VYzmoClgInKVSnSBmImtQ5Z2fqp1lw8Yhp3T+p6AsrGlXD
         pApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716894; x=1796321694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJcgIq/HDSRd39VYibYL7fowv//3d+fQ3P9cW/IGDlk=;
        b=R0biHUnjX+9RAuGlokhVxfW6NXPtYFOR5AM1uzuYGc8wfB4KTj/O36zoZwvIekNPDl
         BbPSIzM0qngXkT0Cp1P4IqpeeTyAAIRTzLsDFTfmIAaaC7gvGnXzNXrdcYRZ/iAoU3bz
         evV4/GVKbfqfVpjXmcCL0IOckv3/xg0bcrvC+XTWfetn5lAMgJMPPCetBkhQlgb9q8En
         SNt6BMl3NvAp6Mm7BUKZytQ8bAnlcrDve6cwor8cKzklLZ1s0LfCnRBTEMeugDQfgfXK
         XDB30rrW+GzJUVCUZ6poJSchwqBjyDLj4JUZhUx2rj2ClR4sC8B9fPzLyHD8PKkZfter
         0T1A==
X-Forwarded-Encrypted: i=1; AL+hErGqAsLb0P9UgzUTWQ1H61NCo+ydwpwo3/nCiieVRg4R/QKVFtm0Wj3QcuXRiF1k/EM6BZ5lunjTU1f9ucM=@vger.kernel.org
X-Gm-Message-State: APuU4Z96SxCSXaG2BjwSeubh88JaEOd/6D8JzsShfPhWTrwl1kMVYUUI
	lUDj9/WLTJ396racph6HJCvIGsqnqSn8IBzcZgJSqdwV46PIB5dNjnKPxv2L3NIlFcvCjXEcnF8
	UcQoWOONWMwjQlHzcVBgPgO4C5dYI3EU=
X-Gm-Gg: AZFdTZdfRj/FCOnX/PAxzX9ZI78A2TG35vj6dt/Sk0hivDAn+QvJf5MgtJWzL5FCr3+
	Q1Ihb6xuvzCp2D655d20zcTWuKAXlOVg35eQ4VQktZIl9daQ7N8nCmLe89hTYlInsPfP3+sBlnd
	hLrMB54NrwwgA3aVGOOfCCKRPalVgZJeNYI2/DB7DEep508YkGM4/NWOone/JhZUXJacjhxfZJO
	so/nPHVWfV3QVcYdhLNFOll0Too4vX7l5mKI6koRwiXlL0//S8xzwKP2PsKchlSzBhb6xxKDvPF
	eKAe4vEYUEItOKWV3kokngmRLqzYZVrpaklW4q9J8KKrslzFdNuIbGn1tNGIKqXeYnc+v6NQD3u
	gk3K2uGlUilZKxzqMNmK/upjY9BeoQopVQG8JAnLDxUL6mCgcEgX+2eQwrRQsA+fuvf31zn6jLP
	6pFcWeRon0t6cB+8tsDQVjrQVWD5R9OXyDV9DsQy6BoHAi/GSGr7WijJPZAUtzxuqlvqDw9od0q
	g==
X-Received: by 2002:a5d:5887:0:b0:4ac:84c:70df with SMTP id
 ffacd0b85a97d-4ac085bb48dmr41879373f8f.45.1795716894481; Thu, 26 Nov 2026
 10:14:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126094318.244973-1-alex@ghiti.fr>
In-Reply-To: <20261126094318.244973-1-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 26 Nov 2026 11:14:41 -0700
X-Gm-Features: Aa3M54ocdxc6P0mj2duHnArbXItHxXS2zC57rOsuchv0wogkpi5TRPQQGAGSQyY
Message-ID: <CAKEwX=Pt1ke4MdjDB=bpQn1bBbdxVao4sx1ruTawYQUY+ROvNA@mail.gmail.com>
Subject: Re: [PATCH] mm: free the swap slot of a dirty swapin folio
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <baohua@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Kairui Song <kasong@tencent.com>, Chris Li <chrisl@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Baoquan He <baoquan.he@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Youngjun Park <youngjun.park@lge.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 2:43=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> do_swap_page() frees the swap cache of an exclusive folio on a write
> fault only. A folio loaded from zswap is dirty: zswap drops its copy on
> load, so the slot no longer holds the data and only reserves swap space
> until the folio is reclaimed again or its owner exits.
>
> Such folios add up, and they are expensive to free at exit: on a large
> production workload, the exit time doubled when zswap was enabled. A
> third of the increase comes from the folios left in the swap cache,
> each costing about 3x a resident page to tear down; the rest comes from
> freeing the zswap entries.
>
> So free the swap cache of an exclusive dirty folio as well, so that the
> slot is released at swapin, as is already done on an exclusive write
> fault. The folio is dirty, so it would get written out again anyway:
> the only cost is a new slot allocation on its next reclaim, which write
> faults already pay.
>
> On the production workload, this patch removed that third: the exit time
> decreased by about 15%. On a simple microbenchmark, 4 GiB of anonymous
> memory in a memcg pushed to swap, read back, then SIGKILLed in a QEMU
> guest (mean +- stddev of 9 runs):
>
>                      base            patched
>   exit time    989 +- 24 ms       502 +- 28 ms   (-49%)
>
> The cost is paid by folios that keep cycling between zswap and memory:
> each reclaim allocates a new slot and adds the folio to the swap cache
> again. On a kernel build in a 600 MiB memcg (-j4, defconfig), this is
> not measurable (mean +- stddev of 5 runs on bare metal):
>
>                        base            patched
>   time (s)        592.4 +- 1.1      592.4 +- 0.9    (+0.0%)
>   sys (s)         256.6 +- 1.5      257.5 +- 1.4    (+0.3%)
>
> In the worst case, random reads over 4 GiB of anonymous memory in a
> 3 GiB memcg, so that half the reads are zswap read faults and the task
> spends all its time in the kernel, throughput drops by 1.1-1.4%
> (mean +- stddev of 5 runs on bare metal):
>
>                        base            patched
>   reads/s, 1 thread   37310 +- 182     36889 +- 77     (-1.1%)
>   reads/s, 8 threads 291937 +- 802    287954 +- 373    (-1.4%)

I think this worst-case throughput drop fine.

With SSD swap, I think the number is even going to be less
significant, and furthermore it will be much rarer to hit this case.
When SSD swap IO completes, it's going to be in clean state. I guess
you need to have a reader race with a writer who wins the race and
dirties that page before the reader?
