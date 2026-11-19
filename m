Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132363;
	b=aPGW0JN1MzR9UvBvY6leLECrh+pzXewZBy8wcxJIqS994Kq004It4tEHnDsywbQqpaj8
	 uVWLtARFyuIA8x/ZCxEv0lwcIS6jVcC88oqIPp1L7Idzrxf7Mij3xMPJIPS2VpftPEy3q
	 qHzTq8NqWmYYXN7QexIOeViT+fyXCW/Xq3Brm6vmTaUCdMpQl8r8crGdbyh9ig5wQJwYb
	 yIWrtBAXm6YSBBm4Hq08WaddF8/GOoe43nKjUNX8Qa6weiYQpSZLYbTl+PSXxA1Tv1Bca
	 6HI6jmR5s5pEKoyxuuBfQ6K4/0Pko6/kqE3yVReA+orkDF34ZCJhVF7zd9k9PAo/1vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132363;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UJrHYEnQ0yy/ldYky5YEoQN9xI+McH+P9QT2Lj87958=;
	b=sZYnuQX+Z+ptfPuRnZ4UoBeKAY1uosIflNFoVvxqF9Voy/7TLNv2FfPYlNF0hjWTAt1l
	 mhLeNRDojMcO7JqYDy8pGkVDiEPH3NTtDdobNCRLpohU5Qcn1i/KJysWHICQ6fSpTnNcy
	 lO6aDUEyzwVobfrgQQMczFCeXBLbmLYf70/6SF2or89t6BrEGufNQCw0HhgLSBWlmwajk
	 p8PuhDEDXGJGtZp25e1UQyJKHNbEl0JkRdhBqJ55kr2qPsAlXwEDl/Xgd9mOJKs7VMQnG
	 QnoOd0I8R2loqNub6EHkLDOX5bGTc27BUa/S2AYnkc0mCEHKRgfh3jZs3YaDsFvF+LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mqNqzfKb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60700606A334
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mqNqzfKb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301B51F000E1
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795132363;
	bh=UJrHYEnQ0yy/ldYky5YEoQN9xI+McH+P9QT2Lj87958=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mqNqzfKbflUmz9HedM8L8+HrNGeTmPkCdEEhy9s6kuVEubXhjgVo5saokkOi0yDuz
	 GYqpQDHjqzkZ1fsR0mhbyHKNHdTo2qinC7iZC80lBVjo5yTsziyEQtSnIqWP2FWgIe
	 eJy8YsWvCHiMgEmbxQTqB43YhysP1CC+jQ/pyK4APK4XRJb18m8fpysu6EoUPNFvUj
	 nJ42wlqobV2nFSjFw4RWr24j7mM/HAAzidYXE9XLQkBrhZk4hnbJsiz8l2wFQeHDFW
	 LB/ZnDFjjqdAOIF5HvXSNKPQsRZagB4YqHdG/lTfZC03nnvxeBUtAVCkAEbrqBLaog
	 64oD3b0BWY0ag==
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-945e6d9ceeaso32385185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:52:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEea7k6qraRhdBVUgSI+VAxqW6JuageG8zegBR4PxzkLa5SQEasjOtr4AABnnEFizpBJn1zF+wVky4n7qE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YvkKkTdLBTfLzQ+16SFyADOl35LX/+ROAsQi3JRsrPL77VevL
	4VC7p35UnzxJnbXuDVh4MQmWhrjzRpSAqPw45bCYmDwhsEO1agqdVgW28YyhvgOfKBUzLMNDAVG
	ic4STa93gbv4GgGf1h+BM5pQ6aQspX68=
X-Received: by 2002:a05:620a:17a2:b0:949:6170:b78c with SMTP id
 af79cd13be357-949ba9addbbmr226598885a.39.1795132361936; Thu, 19 Nov 2026
 15:52:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119154001.9b9f953136935a09e8a50af6@linux-foundation.org>
In-Reply-To: <20261119154001.9b9f953136935a09e8a50af6@linux-foundation.org>
From: Barry Song <baohua@kernel.org>
Date: Fri, 20 Nov 2026 07:52:30 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x1bm9AoB3PJ_CM9LxiHx-f85O3qYTvomROYcmYJ-ysPw@mail.gmail.com>
X-Gm-Features: AclHuK8MXJccupEkZyLKK4OZivmndEmD7ggxoROqdAHZoRi8ilS2fyKXpz1qOWc
Message-ID: <CAGsJ_4x1bm9AoB3PJ_CM9LxiHx-f85O3qYTvomROYcmYJ-ysPw@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] mm/mglru: frequency guided promotion (MGLRU-FG)
 and flag cleanup
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org, 
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

On Fri, Nov 20, 2026 at 7:40=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 19 Nov 2026 05:03:32 +0800 Kairui Song <kasong@tencent.com> wrote=
:
>
> > This series implements MGLRU-FG following the idea proposed at LSF/MM/B=
PF
> > this year [1], based on current mm-new. Depending on the workload, it
> > improves the performance or reduces IO by roughly 10% to over 50%,
> > fixes multiple long-standing issues with MGLRU metrics, and drops one
> > page flag.
>
> This is looking really good - great stuff.
>
> Review is thin, so I'll remain in wait-and-see mode for now.  What do
> people think?

I'd prefer to see this go in together with the swappiness fixes,
as the two patchsets complement each other.

I've been rather stretched lately, but I'm doing my best to
find time to review this. Hopefully, I can finish the review
next week.

Thanks,
Barry
