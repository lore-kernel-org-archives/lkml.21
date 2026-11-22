Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795361523;
	b=teNKDKwpXPbb50RHW/diEsxOYHPT4W+Fv30JqV3aMGyxM6VwIW0Ru8y/wAvSY657oTUJ
	 UPUOpFuff1zE9vwZf1TvA2afDp3se5Y6E6mHeDkJFAob3yV0wAW0jeqTEMv1vMZV/6bdY
	 zwHBQF4gKJXjUm8RVgtkVjR2ywQTJr9McHPCRE9d5SxvoZ8FCmDsxVGB5XWdyWYM2cs62
	 aya/P6U/Fj8gM1jI1lW+tZvCRYAaJzHHfS37e/CyPVlugMi1W/B1k6IA0KPQwh2Ma13Bu
	 Qn7Uf2dGJwaH918CxLg25phollNjWP3fsvedhX5sI5VLdmntem2nd3vA4jdN0f3BivA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type:Content-Transfer-Encoding;
	bh=NYFpjmsPtm5tW7G6832pWObwECaMPmu2sWxAUpoI3jk=;
	b=NSItJNmL8wKp7twsKh1kCHBL3F/2cvQgpA+Mtl24hmaF3dHDKJxoQxui9aX/wZ5upnjH
	 0kErZHgxNJfPwlIOZv2lmofKkN5aq8QmlZOLFFiO9sRm7OSEYqM3uS7AHpTzI3e3c6ufy
	 A69atY5YM1XZos4rhaO1XPb7mo5MOsawRXV48FCgJJkuLavOEFnOodYcOztFrdKY1scE9
	 GwmO+2NsiiUSpRZIsrj58YnK1tX0wHlLHkKlDZuTYH9C2BU0hIz7qnzqwN+e19CDf/Tit
	 KM6ohwegWVIFKx8kTbXQmGb0G8nvcKOuBZdIuya6t9q88Ug9sUuO33BBl+FBrpttp2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GDgqyqH0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00AA606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A00AA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GDgqyqH0
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso22510085e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:32:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795361521; cv=none;
        d=google.com; s=arc-20260327;
        b=m3WcA7uA/ydK6m+MRMCLQNSmN8rW9H+MAt1Vu/jwYEap7zpc2DoDkkzvKqkgmy1Vya
         sQ7yGYdT7m7zdAXqxiTxs+5wvwmrZNr03CfTOKuX9GrBkJTKOFp6pultQnL8EXgrxC9V
         lHSfct6X0JheJVHoCjrJP5Fq3Jy18dBrLmt4nwkGH03NtqtZuNs2WJDiyF2PoD+nv11c
         uQfzwHIjh8coZmGJOFL+9nrU0CX+yXNX1XwmZCUCqMu3rmInngc51TjgPjPaDTSSKHdu
         Nsa8j66eXzNjKfX3QpD6F8LR+qDnkyCgG4a34j5IVYs8SXETIMBncW9CAIje1lRCrzau
         SeJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NYFpjmsPtm5tW7G6832pWObwECaMPmu2sWxAUpoI3jk=;
        fh=+lkPvUKg+rA667iRp0CjQ2rir79Rnc61P2aCKR/Bx/0=;
        b=OOL/vK1WsPRQcFQ5h6mmFWpjU5Bi1pSraFsCGz4NhzB6O4Dmf4o3tCoB2RCbJj9Hkj
         i4jM7CzKrJcX0PaSkeVh8SE80uwNfZOkiuxhYmeRcKQK/4z2rq9J3p1Mx5+57S6dabmz
         b6+RbU1qzus9okg3rUoI2nyW6UpjDcKcQ6fZExM9vnuIowKKy326mJt+Un7+bWL+Epxo
         6zaOHi8QtiyD4Z4TjE0V8XPn8szaGB36lCnXfnaLZthL/48QmpSo1Tf8XTUYLOI4Do7h
         O3Bps7YRtK1Yyf1/aLqnLacD3OhItwV0YfvZeHEl6+7MDGI5vCeAzZH6IYnJw/EPO11J
         8dtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795361521; x=1795966321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYFpjmsPtm5tW7G6832pWObwECaMPmu2sWxAUpoI3jk=;
        b=GDgqyqH09Skisb0RcI0q/2Ph5kOcC9liZDmq8v+txYgdch2/nXsG3HAHDqpAVz1dln
         nhlTn+MskzGW7ddHZEYCSTLSGjYpThPI6ZEqtODp3dkhEOdUB1HogKff6nf1Yi7hrVLg
         wSkTRLhkKlJ68RLwcmpUN6JQZa1dyjgpMdBxhM7bXOO++rGgxCTeSGSyDkyysr2cP0hk
         zROFRmQaNyrzcGXrJ7wtBvrT5rgbg8NYjB3J8EP3garr0p8zRbTvnTHZfROpRvmdihzZ
         n82OVN9msNlamWkZWRQm6XaGuJeXIKo1knCakO79lN/LfUBB4cWM/hyoTlCNVohpOc4N
         FY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361521; x=1795966321;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NYFpjmsPtm5tW7G6832pWObwECaMPmu2sWxAUpoI3jk=;
        b=HneqiYqay1LZJNLFJQqIujAaj88qzVx/8o2X6HJjymGIS79ZdPMaIEudAkXwRE7gXX
         TwTNUyikzDeBQtoHnMBRvdE4yeSEIaC0qbX+WstsZvp0GA3fVucApPFoT2kBSUq6WQg/
         8vnwGJXbbd9rox0RJfkb3NKnBkQrM7sY5ph74eqdU2wx0ISBQOsSA+O4lEYDNRKqdtHN
         P6oPEkK2T/1Lr1rJqyVv6JwWIdopJAd4wZIy2DpxU13yHC4IF84u2pCPBDtMHSiFedJ0
         QJNvHNMQu+bDfB/Ew4sdYLvnWbXEvrT5tGV71lT3noVnrrCmRf1cIegSk16VP4D/gHMB
         N+iw==
X-Forwarded-Encrypted: i=1; AL+hErGGpHyfvYktolquTqxzRrwgtG+icdHKqRSy8YJB6oTyZFXZ1375J4w2VpBsC2RfFIYuYW5KE28eTCIEOoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IJR2eKc3S8Io3QIyuVimlrn9guNfBV1D9kMQKffuG2IamOHnf
	OYdAdXpriw/0qDpo8qEXg06y4gTLU5l4UC/KsLWvv2WtUpsBdTnXH1DtB6XZTnrajuguH0crW0a
	9xr4wdSYR6pwEqD9NIISb7IAHeYzliH4=
X-Gm-Gg: AZFdTZfic5tXSdGfJMOOpLoFZrQh30yczeJwBWnODEbeI5uILvFZGNI3qGy9RrtJwyv
	EDtV7k0QOLnTcq8l77PozlwiP+jE4QaZU/lO3l6jdQs++BOMmif4F+fca1Ou4bsaXyqy/TLu87i
	wvY3Zix1bV2BjeqB9vSuNuID+umwZLsnA2XRFK0GoyyvrOLvgqwQk11JFD5c37No54NLOaUS8mQ
	lmmXwPYpLCVnxVKqXe5wVKbpnJRWTfnPohT4+XGnNgku8urmV1NoAdQ8I16Gxcs6YAblLSPLCoz
	4X1OyOjJm2LqvECw47zNQUdKFpxUjwF4EYnBibAfZELbzorbfAHpClV3+AtcM/Bo6rWxxP64BXW
	o8xkCQGvm9XQGuIc4gTTYB6wOF057VeOldFJAmBHCsjNujQv9m/gRFzV6tyT8X27fBv6XwiLhIp
	imR3tyVDpA5XBSa3U0w641yaMQx/ryTq/I0aeZtEzKFSuDl9xtZu67
X-Received: by 2002:a05:600c:3511:b0:4ba:73f:ef5 with SMTP id
 5b1f17b1804b1-4bb88828304mr192354365e9.34.1795361520883; Sun, 22 Nov 2026
 07:32:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKEwX=NXSwSiuY65EV5nqFocMLd6-afsiJfgy_ahB2v_MDmcng@mail.gmail.com>
In-Reply-To: <CAKEwX=NXSwSiuY65EV5nqFocMLd6-afsiJfgy_ahB2v_MDmcng@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sun, 22 Nov 2026 08:31:49 -0700
X-Gm-Features: Aa3M54oFs-onXEgzFSCUJR6noxWe_j7pdReKnjl-3Np_FarnqLTrTWVKv1OO0fE
Message-ID: <CAKEwX=O2McF-gyqJT2a8R5q79+QABCPjULrcjC2CC0v8TnXxJw@mail.gmail.com>
Subject: Re: Virtual Swap Sync
To: "David Hildenbrand (Arm)" <david@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Gregory Price <gourry@gourry.net>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rik van Riel <riel@surriel.com>, Wei Xu <weixugc@google.com>, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:06=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote:
>
> Hi folks,
>

Hi folks - thanks everyone for attending. :)

I summarized the points we discussed below - please let me know if I
missed anything or misunderstood a point.

* Control interface: Google is interested in a knob to cease zswapping
(which already exists and will still work in vswap world). Kairui has
a use case for remapping all swapped-out pages.

Vswap currently bypassed when zswap is off; per-cgroup selection could
be added as concrete use case arises (for e.g migration/compaction).

David objected that a virtual swap abstraction should not carry a
swapoff interface per se. Folks also asked whether making vswap a
mandatory layer would make the implementation cleaner (Nhat will
explore this direction and follow up on this).

* Virtual space sizing: We discussed using vm.overcommit_ratio and
vm.overcommit_memory to limit the host's logical memory footprint. The
exact sizing formula is still unclear - Nhat will follow up with
Kairui on whether it is acceptable.

(Kairui, if possible, can you respond here for your exact use case? Do
you want to limit physical memory usage, or virtual? My understanding
is you want to gate physical + swap, which would be closer to the
latter).

* Priority and multiple swapfiles: should not be added for now.
  No good use case for swap priority was identified.
  Multiple swapfiles were used in the past to work around swapfile
lock contention, but it is unclear whether they are still needed with
Kairui's new cluster-based allocator. If contention remains a problem,
we should fix it in the kernel before putting that burden on
userspace.

* Proposed phase split and charging (from Nhat):

  - Phase 1 - initial foundation:
    - Decoupled zswap: Let zswap operate without reserving disk swap
for every virtual entry.
    - Physical backing and writeback: Keep disk swap available as a
backend, including when zswap cannot store a page or an entry needs
writeback.
    - Charging: Retain memsw charging for virtual entries; keep
virtual-slot usage out of memory.swap.max. Actual physical swap usage
keeps its resource charging.
    - Usage counter: Expose vswap usage so users can monitor
virtual-space consumption separately from physical swap usage.
Essentially this gives you a method to estimate the logical footprint
(memory.current - swapcached + vswap).

  - Subsequent phase(s) - further support and controls:
    - VM_SPARSE: Add VM_SPARSE as an optimization after the
first-phase foundation.
    - Runtime controls (added as use cases arise):
      - Host-wide runtime disablement knob (and remapping of swapped out da=
ta).
      - Per-cgroup vswap control (for e.g, if some cgroups want
migrations/physical swapfile compaction).

  - Orthogonal use cases and concerns:
    - Cgroup-level logical memory limits in cgroupv2 (memsw?) - swap
developers will follow up with memcg maintainers.
    - Static sizing: Define the host-sizing formula and decide whether
another interface is needed.
    - Swap tiering for cgroups: Explore backend selection when a
concrete workload needs it.

Folks, please comment on the summary and proposal.

Let us keep the communication line open and coordinate on the next
steps. I will schedule something again.

Also taking a step back - once we reach a consensus on vswap, maybe we
can repurpose this series of meeting for general swap alignment? There
are other swap/compressed swap developments right now (looking at the
orthogonal use cases list above for e.g), so maybe we can do this once
or twice a month. My experience in the past year or so has shown that
we clearly need better alignment :)

I will reach out to set up another round of meeting. I'm hoping we can
do it one more time in December, but I understand that holiday season
is coming :)

For folks in the U.S, I wish you all a merry and festive Thanksgiving.
