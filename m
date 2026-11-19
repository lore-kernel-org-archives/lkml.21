Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117449;
	b=k9s5N/Rb0ZbDBz91C1SFxF2Z9rWCCzqAICJl8cXlxUjzCQBvIpvnhQ5TdwrZoDaQ8UnF
	 uxlVW23vqv1UCmX1oLkNrJfwWW0tSwqMEn8f+lnoyuimC7xLSRbXqFiOnX3h704UXibnc
	 SyVmEJOdbDc9ylLrsVw7Fsy3LPC08ZnYtrtGHwzh+LYVj+vC+MqnuE2QRXSdTNcHPfT/S
	 HY3T0kOB26dDUsl1gB5hcewg6Nymzy76Jc5S4J4HXXob2EjnjDhwG69ZbJKBwxVsHXzKq
	 cORqv7Z6mWZse3fbPMAHKGchIbx2Eo8o1Egsk/IabpQXMw/6RE/V9ru/MvHG7ahALog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117449;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sB1Pq7vBNntqu94r/2oUTzxPCprX1DSImM5jhZ6L7Ys=;
	b=JnPrdxkjgqAqkvwge9oQIQuIkYbdWYF/gz04XnjXnUnpKY+hLL5RApKL0jJdMZL/malI
	 8B+62U5y2mCvtcsP/VMr+x3wVRzLUtO1csutqaoJBcAPR3sHUhezxHBITEnz5HvU8KCFT
	 ylX1BtCaCMktSSOA7zGqSGpLzhTL4Z63v8ULgn/hh209dRpJj+Ao0iVAo6q8Qkhym1WxP
	 QyHRkfMpEmps2LCP5jGK1P8CuQwAFWirEzPUlx/oeKcLbNZ+KRjsnB1TxSOWuqpVsNfan
	 cGtdz4B4GQkOXb1BDLB8xfjAgXKYj6R/2Qq0nP4jFUtRSu3vjZ9Gxf+7UQS6igQU1+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IeVLrVCS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B718D606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IeVLrVCS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927271F00923
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117449;
	bh=sB1Pq7vBNntqu94r/2oUTzxPCprX1DSImM5jhZ6L7Ys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IeVLrVCSsRPiQX0drUz2UWM7wWQUoOv9UhM9eXUGEnnoMcl+sQW+qiCun3+CTmWkV
	 mi/z8zorQ0ZxXwChyn2aP6ccRSaXE9uwamxIHeos9YGbYyFT2rbjndXO694GPBly+2
	 6KuZK6TJIwcGzxnyatmp98KHy8TPz+7rfIzZRNZp0T5Li9IYVmSLsp8gOT9puZ22bv
	 xvd0gn6xaYu+9VYtSV98kfDQkkgDxi0n63CKvmRsbGvvKr9aiBgR8OVAiNJmkLOF0O
	 2WDCxDrm02ztgXhsgGUGkmjZPeUM+3m4wl+RxhVKX+MYCKfabM6JTsL9CTVKC4O29a
	 EBOJBLo2oZtzA==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9495d543b91so10446885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:44:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG/bGQflM8cvYcCRa9C8QjmgBQLbJ2cdPluqi2NJCZ7c66iTq2PPmBdAYF+8OVy+EUpiLTO6x1X2jKNzDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vaiev+yxWwj2s1PQ16EsZCKo2KKYFy9v4q3e0bdRMkl+qUJzW
	OkJFOFk5eaKMHaAmtu0CdMMa+3597BaZF40pYxzGC/WfDqxSYq/Bvv87zHjoDG/8IpmjzJ/4Jbg
	Wp1AzcnHcdGVt5m12v8KrJWUWlhL6ogU=
X-Received: by 2002:a05:620a:130d:b0:943:f301:49b9 with SMTP id
 af79cd13be357-949bab32ac3mr114181385a.53.1795117448550; Thu, 19 Nov 2026
 11:44:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-2-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-2-9eee2fe97a2d@tencent.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 20 Nov 2026 03:43:57 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z93rWEzqAQ_sWWVKbmQ5M3qjxX4o_qYzeX3xs+=2V8yA@mail.gmail.com>
X-Gm-Features: AclHuK83S9SvqTl7DWMa7lyKfrDc7jrgO_opWySalBDGVE3ZIlzAIZT17fPF3ZA
Message-ID: <CAGsJ_4z93rWEzqAQ_sWWVKbmQ5M3qjxX4o_qYzeX3xs+=2V8yA@mail.gmail.com>
Subject: Re: [PATCH v5 02/17] mm/memcontrol: allow update of LRU statistic
 without holding LRU lock
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
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
	Kairui Song <ryncsn@gmail.com>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:03=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> To enable moving file pages in folio_mark_accessed directly and lazily
> for MGLRU, allow updating the LRU statistic atomically without holding a
> lock. It may cause temporary counter underflow, which should be fine as
> the counter is eventually consistent and only serves as an estimate.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>

LGTM,

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  include/linux/mm_inline.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
