Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109651;
	b=ddre3X9QzpJyjawiy99cR+eJ6yPilUPaUkYy+y/Awb/UAn9U+3rYpGeDoL2OPy1ZMUtt
	 8qzlyr6rolnK2UxImcsZ/hYX2ZaU4AwF9ScfAFLoWF4BCCTAJBpDIRKYnk7cOtqj9qMBc
	 7RRGTI1A20H44wzVMIp61wIORp87aUdjThLWtiijhoaR6chMKarjC9Czj+oMrj1mA851L
	 zJKH0HTSFKL1D3thtUCUHev9V9sbJzgD47wZjtLbdlVUYvvo++Jd6NR3AhMC1jrKpyXMR
	 jqF9tGdmK+gBDoLPkd/FO2jAO/Y9pvkEDo89ZU4nyunkTiK7H5JaKRZOzQJeEbsokmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GU/DHzsJXxqhMdzOYAA9Okmyib9cC+TRn+DETm5eoNw=;
	b=AIO690yjCPIj55nbZaxZtl5tRgMSkPH6CkCosZdEW5hRR6h5x563ebbSdnmWNLBQc6xg
	 P8XFkMZ/hhfu8ojVJ/Rm8Gk5eWGx4a6M/QwpoLdeyVKDefeSdMCbj3WkwrqC+34gUShSh
	 1NADgIz+ETHDphWpclFZR5dUT3YQ5k2fZ3PPqfCncFD1naAyqVBDSwIHCGrdD/ZWIctBO
	 Z/n9xByb1x6MHRB3/B9kaE79xkj+kQHdOeWyOEDpBa4/Dd1DyuNwZoTRqLsbMEYr/VeQ2
	 Gosh/B72q2Kf89SaBSWEhgRsvczNX5MTRpC9Zcv0lkeJQL2v22RqzW9SyJ3gtMA06Rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+L5h3Xy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD25606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD25606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+L5h3Xy
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5123794038so3056366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:34:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795109649; cv=none;
        d=google.com; s=arc-20260327;
        b=netzFk9NGjIHDAa76E4w2r/Oo5/OkLXUF18xT+nsHDurKFlcxtAfR/kj5FmzwTbhbW
         hDgS6eV5LHZwIMWuY1WpQk2/hFBy2OPgjsxCE3+bcu8HFLeqYoOoM2V6PSoFVZGYEb5w
         EwrPRmWw2g4D5X3AIsmuS8z1grbrJGEiEBg+hB48ElzofRG5WzVsmA5eX7l/CHvMRJ7/
         USCbO21/9gm8K1dZPRP9JyZ9+oXkf81goTUPm91itevQ6aGF01KGHN58wU/4tAeCga06
         LykBZB3+wTbBqlMS6HjEiZ64VzEiEPLRfYUJtLBaGjUoLIcRICI5FxrNq51eI2OoqxJp
         hTAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GU/DHzsJXxqhMdzOYAA9Okmyib9cC+TRn+DETm5eoNw=;
        fh=S7JyF7DF3LNBZvCS4wKyClEPJEt2T/ldBumLyr8tEE0=;
        b=oZ+wuAcqERLJRm8EJAORDl9LYNhtU7th+podybQFdmQLiTJW0BPrGW9QSJGOEZDvhO
         2jzd3UiXXTQB8HCeCpoY9Sv6jLBeXtzBXjgcvr3CThNCUVt5TDF/WlX3zRloh7+nyXeM
         R2TfpPI0T+b6lizBDnpYeZJplQv6pTjR/qyvmfD7LsHjLqTGanIJABOhPHQi3TbQH6/y
         Tmq6pKuOEf8Gfc8Wu61OQc80QlMPUsqzEAxQBGJ9bOk3IhBBqtLJOSsyaYj50Z4seVG0
         tIYWE9iVeAcnqP2bW9EV6XHTPkVwvncY9yDp2kLeu0aXjKcfD05tVX0AFLgQ4DSJIPp6
         9byg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795109649; x=1795714449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GU/DHzsJXxqhMdzOYAA9Okmyib9cC+TRn+DETm5eoNw=;
        b=O+L5h3XybYIsmgG2hb8qYCFSsW2v5laMXHxWHrF13TvzQS6m9eRprosdnH9bf3Gm95
         C/3gMIoqlYuW4gmh5lN7yxzWOD5OUmkVRv5HKYVUcLyz85Nt60YHZY2g++2ZZ4kIrvd0
         7VxZ3rFOLfIBf1K0sNt8SoWzw1EXnlzJ56k36et68eNdQPBrsMJ4cCNVumCcCA5+YYpC
         Q4MAiW/mVRQWanUfBYyq4Behcvk2xN3JDaJtdM4YowIK0w2i0reveSuWkEGCZQwGqZm8
         PWWqX1LgKq2agjIlEmwwqaNNFQpM+IgBPqtdqW+X1UuE2zOo7UZpomBsraTprjdGxjkY
         v+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795109649; x=1795714449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GU/DHzsJXxqhMdzOYAA9Okmyib9cC+TRn+DETm5eoNw=;
        b=JjRU1erBcfLIwYrgNRrprYgrZYHZ4yKseFYBvy6MkZ3WcwFHSW0sY5/ZfgdWT4M2/5
         jUW0T11QYw4X7VlmN9IR6RASAmhwlL51CeG8icqNhJv+lTJgiqZQvE7bNO2k1IIEgun4
         XJyIS2qY50slPnKmRuDbHpI7as8VnScnykvrdYtmsxBs6dLOGR8dqHVjxDvh/vNECFIq
         QJwuTMCzaJ9Xb4c5MMnyCB1rRiJgdESqDWPsppZtl/u0s5crDn1PcMOwqAB1o0Kl4bNW
         2AvuF7ys14fmUtyqhojaPYaz+XdnqhLy9ypFIq3CEcumc8dYHvGRZbXlj3aQ3PjJS9oX
         S7dA==
X-Forwarded-Encrypted: i=1; AL+hErFg0T9KGoZSFJ7PasnVR/wxQopBgPp+LhtdYpzO7AgHLFLjUitTkZ3DMEAfJHu45D/GDvi4uUZD+kHiBOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uM89koEXM0YfSrso2HS9kUm8XoLk6Yja+WdtiRmOc5NVTujb0
	VQOYr91vncHU8TtqgMmuv4QCfnWwX4kZS0CF3xHJo7P5KG+qDKWzsgKQevhnuDHzsp8Nuo/H00j
	2nfly0W1IM3cw6tUGrq/7rBVnTdjYHeM=
X-Gm-Gg: AYBFou3o0cbHY3gTlRamXmjtS8MPXGIyIW906AbYMomjH6F3MgaXceCzKcYSpufr0Xp
	fdR0rD0kuKpbGWDiAVM5aNoh6MfoOKDIdfkLvcW5zrK7dG/wYkNMaJQsNlN6BBQzat5xEU23hgM
	egATT5G0gJ6gfP+7DXtAPIl9+QT38Hyk7H+5djw1vEfkLDa4poZP4hOl9NKBujylO9Buh4xtmoA
	UZp5Ms0Jv4Jowv8yNrc7a8A731oaJ+q0tN7SADgyzvH/W2k2CtzhYhWCXJuZghANCcQ+xbOI5CH
	4joQsWatCKLqC85YNSp4Y1zfoXO7/9IjaYwVZx7SZ290D5FtJIt8sjpwHVbKo5rTwKiby89mFfW
	EL56oRrVX5dah7lo7TOZHijlD7QzELteU/x9h6YMfmz3xp1/Qzy5ce/bs3N7ZqOMsFurL9HY=
X-Received: by 2002:a17:907:9693:b0:c4d:331c:2e97 with SMTP id
 a640c23a62f3a-c513ab47f5fmr64354966b.36.1795109649032; Thu, 19 Nov 2026
 09:34:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119112357.275352-1-hi@tychen.cc>
In-Reply-To: <20261119112357.275352-1-hi@tychen.cc>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 20 Nov 2026 01:33:32 +0800
X-Gm-Features: AclHuK_14i71TxMIEATGAgIqE0r8tCGaC_TLqpyybte_WVRWpRVBP4hHZoQKFT8
Message-ID: <CAMgjq7Dnjsq4vid7H4usOB4f5AS8XzhG75mvf4-Y=an95gBERw@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] mm/mglru: frequency guided promotion (MGLRU-FG)
To: Tianyi Chen <hi@tychen.cc>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, 
	Maxim Muzafarov <maxmuzaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 7:24=E2=80=AFPM Tianyi Chen <hi@tychen.cc> wrote:
>
> On Thu, Nov 19, 2026 at 05:03:32AM +0800, Kairui Song wrote:
> > That's because MGLRU deliberately disables hotness tracking for
> > MADV_RANDOM areas while CLRU still has refault distance.
> [...]
>
> I ran the OpenSearch k-NN test from the RFC thread [1] on this series.
> Its .vec/.vex index files are mapped with MADV_RANDOM, so from the
> paragraph above I expected no change. With FG the gap is gone in this
> test.
>
> Setup: 25fee5b1762b with and without all 17 patches (they applied
> cleanly), the same .config, and a fresh 4 vCPU / 5 GiB KVM guest per
> kernel. OpenSearch and a one-pass 96 MiB mmap scan share a 1 GiB memcg
> with no swap. 5 seeds, lru_gen enabled=3D7 vs 0. The script is unchanged
> from [1].
>
> Medians over the 5 seeds, last 1,000 queries after the scan:
>
>                   p99 (ms)   memcg file refaults   .vec resident (MiB)
>  base, MGLRU         66.18               144,387                 99.98
>  base, lru_gen=3D0      2.09                     0                117.19
>  FG, MGLRU            2.16                     0                117.19
>  FG, lru_gen=3D0        2.12                     0                117.19
>
> Right after the scan, base MGLRU had already dropped .vec from 117.2
> MiB to 54-71 MiB (median 66.3) in all 5 runs. FG kept the full 117.2
> MiB in all 5. All 5 seeds go the same way, and classic LRU is the same
> on both kernels.
>
> This is one synthetic setup and I tested the series as a whole, so I
> can't say which patch makes the difference.

Thanks! That's good news.

I think the reason is some of the hardcoded biases this series
removed: FG places purely by refs. Less hackish checks, more generic
performance :) I reproduced it locally on the base kernel too.

FG still doesn't track MADV_RANDOM accesses though, and still no
proactive workingset shift protection. Refault distance will cover the
rest including Maxim's case IIUC, as demonstrated before, it's better
to do that later as it fits much better with FG merged first.
