Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795746084;
	b=4P/6fUkQny/tXPSRZyjMVWs34DvcVYZdaIiMDq4OuW9KLmulArp0Jz6V4LwneTIXNS4N
	 68o+ZHRtdAuY4z6EOyNIa0Kku+LDXxMiRiN/OG75uwHhfKsBkKiJ/+rEQv5bntan7Kj+N
	 5GEAJL3h2FY8DulznsvGScLCpVx1JO/QAjem1o73qQwMBhMTYgSkL9R59hBaufBCNf4Cv
	 vDV//Rl0cHpFJXGpRTETvieOIz8um+WsKZiKrbfUCwbxGr0Ccl9EMw0xFXK/VrA0epXxx
	 59SvJeyOmNjXRLYawghgZr5Rv0ESPO4Kp8QI1PNUPb++ds84bLGaIIsqsZZzZetiPQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=q9O/QDigxPlmqtrzg+lI27H9LnqU5X97nUid93qpMQw=;
	b=Cj7fAPcOJsK2Hkany14YItJ/4x5iYk2G92Oz3bpfUJVLGrlF3xEQzjctBF1GgWUyGm37
	 KzxMwH+NGFUm5GiCkj0P19XsOvtfskNzETlNoRhpFanBIIgenBBFlWYyeAVsRKcFuoYFE
	 t+8Ggk3wS3skYY+GhZqJxovmmqwduh+n13Y/Z6kcjs/tCqJuKwrq36nRgjrgqetRISz6L
	 IK8mTqsoiXDUCWh7HLej5BDM+Jd9JnrYs66e0IEKwHm7CNroxg8KUHc7w5UsoJuVNBaKR
	 013nnvWdaOZYgRlyfXC3FmnPZMzBnJt9C7uV36cltA9EX9ti6jEvgKeVVqGemhZ56jQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FWvGpcG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855E7606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855E7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FWvGpcG
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso1128095866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:21:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795746082; cv=none;
        d=google.com; s=arc-20260327;
        b=Ntg/kLTMZ6mB4yalWWcB85u0p4fbGt9OnE5OJAZziRPCcwc+NDuO255adgI17OImBr
         qAplN553QaUScH28i9H55f9IjCNi5OLuLGf/khuzC8M93hPIk+4Ukic4u+DoArL9L/Di
         g+u+1WOcgKC9jN5EhZi1IjwGrzQf2yNPKUBlJVls81sG7Riu2BtanBR1jXa09J8hQtXq
         SKqgxfvKrePf/kbmkpEfTH7rbM3qi8MJk4/79gQDASvrEFwYk6utIIpYTIX+zU68ovP1
         3tFTm/4bmWt/npUer5+7f32wX7sLOBDT9FdzZAAwSZNKY7tzLgjXze+bn//npGscAKXt
         0ZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q9O/QDigxPlmqtrzg+lI27H9LnqU5X97nUid93qpMQw=;
        fh=OopD6xxre5Q7BzTR712IML+KA0et8gNowaVb3u3eetg=;
        b=hFQjbtpeo35qRUNbShybiTAIZbhKh60nXCpx6SWvn66XjeFWInj/xXa9FdzICpCEEr
         sApym00L4E7ynsDZQsRWcn8FekK1KTqESlmfdWGhSH9gyA0ENsv7Y4Vfslb2v5wedLr5
         ixkfpm+vsXZbjeNMS8OxWRNzlz5EdbngBZ13E02DGQzrLK1CfTMzJ4EskSQqT24xt9k0
         4YIeO4m17uuO5cjG1Vr56fa+E9E9FXTHwHDjc7dbjeWJWUY4rVOaEFchJKLJ9kRj3F3z
         ti7jXVGHEP9uK2tBRW3Rm+qyYEEwBER3hTtFFd8FLYs2KL5DXm9h2NkpfjyuENcO1ueN
         nKXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746082; x=1796350882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q9O/QDigxPlmqtrzg+lI27H9LnqU5X97nUid93qpMQw=;
        b=0FWvGpcG4vDiq1BQ0yF0zevamqdmKs/j+v/PVUhNyK37DBPcD9iEoxA1/+vZ4mHWzx
         Tc/2FGEgF/C6jyVdq4daBqXhiOYifhI0Zptu3Yml5aBkoiJrtYpsgKTyAWm+uGc89Fnc
         moVwp9I2LIWP+aU/oyWzwTN9RYWxlxKqfPWe9xeaWLVp8saZ/F0x717HOYAq+EJhqcaj
         HKSJiRNaHwYwDzdL0yd8Nf2ledym4BeEllWt4ZcBe48cnzDSXDorjXouk+vkLbWhFoq2
         4Hm11iCK90tHoBpkiYdwrcHTMqdcXWzVv8s15mqRZUtzd5+eBNEM/PNDbWe0l5zBJkLO
         fb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746082; x=1796350882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9O/QDigxPlmqtrzg+lI27H9LnqU5X97nUid93qpMQw=;
        b=xJ9bdMY/dsYXeAFcVSLw78ywUrmoljYalgqPNKVZOlI+19oHuffnAvBtSS/iKEX9AG
         yPKDI5Q8qvmlaV3Eic1AcWQPVKQVS93hInQHudaUVSiSXOYAhyn3jR8c7cC3DhDUx9gC
         WWuHD7aFtpxHXAxCjZ/Ybqxir4Vb0NymUz6D7CfKIqTVZgFp/BgZJpHaL9Z2iYPpdLun
         TRVDipMnbplHE/sAclcp5OVJmK8mX+PfWeq68F4mZhJJLFZa4Ewmb68OdEEeQB+uo6K5
         gLR0B40JpK9hN2Ofr4HSI39QvPTeT+B3aQxyG1f8PmpqOS3zlLMzfQqXtRgDWz7ljXYr
         +jxA==
X-Forwarded-Encrypted: i=1; AL+hErHgo4ISPIkskZWlRbsBZ8gJmzm2kmPSy9+zI2zIEvY6OTPFKf5J7ba4RmQkgox45w84MYo1pkW9It0SVmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KUG9ShoQLbl2c1v8afIRnLfYK2/XiRWGejn/6HrcaJxdeoE7M
	VUm77zMz9K4g47UrrFpQ6s1C44RXtZMRrP5RHcI2vgjLdvJud6cu8dZ+duramDPDwvJb/5/++kd
	lfHIEAhMNgzCkowNoH3yKRJyWQaqt2mo=
X-Gm-Gg: AZFdTZf8Q26lDrw0jKJ3OuZ4fKCjJ0z2RZgrZzFSC0NifqkPFdbUSVO0Y9oShsVcLvT
	A9EjqjIMAgK0nK+0CynDyAdH/I6zxytuAZq6c10eksehNC/GoEYflbXgW9HMDjdGiKq6jtcVZaj
	b7DwyJfOuJnngvLGzO7YlZcUXGaCCwhbKTh2HB/xBDN2iJnpeCRLXL2R6FGlWGKjbr5jcjYGpub
	i/9+RsPmqxQc7KsnMU7EzT2KZEr7U2Sp0F6Xdpuco72RG2uzwVFPX404R9OjW8avvqrp0jq8UfI
	dL3mebxxf8JkTBSDdUZOcqEM6F6sa7t+LtVn152Y06m1xIMQnUu+4QyNYixnqZxbaFvNmSBqX5D
	8sUNgfNEMx15TyWkNY8sd3Dy8AM/3Z36j7ngRs2Zl5sCnBAQFAAMDNnKbYJvSetUSuEsobl2Vvb
	jWISe96T26+KPPvNw=
X-Received: by 2002:a17:907:9693:b0:c4c:ddd1:d006 with SMTP id
 a640c23a62f3a-c513ab47f40mr1740039266b.38.1795746081722; Thu, 26 Nov 2026
 18:21:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-8-8ffea39934a6@tencent.com> <e85a2666-9722-420b-9a60-9d4251fc3d4c@kernel.org>
 <awa30hwg6x82REoo@KASONG-MC4> <8ec3f3e2-5d3a-4bed-a571-88f7ba473b00@linux.dev>
 <CAMgjq7Ayu9H85wurRAUdmXEPWYi9BdLJW13BhK+LMYoBX_7fuw@mail.gmail.com>
In-Reply-To: <CAMgjq7Ayu9H85wurRAUdmXEPWYi9BdLJW13BhK+LMYoBX_7fuw@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 27 Nov 2026 10:20:45 +0800
X-Gm-Features: Aa3M54ocIHnij2wxU5gTqMYt2uMcyjdRvBBfxBalbs5FgV17e07SNTVEtRtEE6E
Message-ID: <CAMgjq7DwCNbke2G25Bxfj3bi5aRp3_qkGeYmCTGVGv+Y5XzKTw@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] mm/mglru: make folio lru referenced times count
 a generic API
To: Ridong Chen <ridong.chen@linux.dev>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
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
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 10:01=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> On Fri, Nov 27, 2026 at 9:48=E2=80=AFAM Ridong Chen <ridong.chen@linux.de=
v> wrote:
> >
> > On 11/25/2026 8:36 PM, Kairui Song wrote:
> > >> On 11/23/26 19:53, Kairui Song via B4 Relay wrote:
> > >>> From: Kairui Song<kasong@tencent.com>
> > >>>
> > >>> Pure code shuffle, no behavior change.
> > >>>
> > >>> Make the folio LRU refs helpers available regardless of CONFIG_LRU_=
GEN.
> > >>> Without MGLRU the extra bits are never set, so they are inert. Move=
 the
> > >>> lru_gen_* helpers into the CONFIG_LRU_GEN section.  This prepares f=
or
> > >>> unifying the API for checking folio referenced and workingset statu=
s.
> > >>>
> > >>> folio_migrate_lru_refs() now migrates the complete refs count,
> > >>> including PG_workingset (bit 1 of the encoding), bitwise identical =
to
> > >>> the direct copy dropped from folio_migrate_flags().
> > >>>
> > >>> lru_set_refs_flags() skips the nonexistent mask bits when
> > >>> LRU_REFS_WIDTH collapses to 0, preserving the two independent flags=
 for
> > >>> !CONFIG_LRU_GEN builds.
> > >>>
> > >>> Tested-by: Zhao Zhenzhuo<zhaozhengzhuo@uniontech.com>
> > >>> Reviewed-by: Kunwu Chan<kunwu.chan@gmail.com>
> > >>> Tested-by: Andrew Morton<akpm@linux-foundation.org>
> > >>> Signed-off-by: Kairui Song<kasong@tencent.com>
> > >>> ---
> > >>>   include/linux/mm_inline.h | 55 ++++++++++++++++++++++++----------=
-------------
> > >> I'm starting to feel like all of these mglru/reclaim thingies should=
 go into a
> > >> dedicated helper.
> > > Hi David
> > >
> > > I saw your comment on other patches too, about the header mm_inline.h=
,
> > > about ~690 / 860 lines of code in it is for MGLRU / CLRU only. The
> > > rest ~200 are for VMA / TLB / MMU.
> > >
> > >> Can you do that as a prio cleanup in this series, so we don't have t=
o mess with
> > >> mm_inline.h in later patches anymore?
> > > Perhaps we can instead move the non LRU helpers in it?
> > > These helpers:
> > >
> > >    - anon_vma_name_get
> > >    - anon_vma_name_put
> > >    - anon_vma_name_reuse
> > >    - dup_anon_vma_name
> > >    - free_anon_vma_name
> > >    - anon_vma_name_eq
> > >    - pfnmap_track_ctx_release
> > >    - init_tlb_flush_pending
> > >    - inc_tlb_flush_pending
> > >    - dec_tlb_flush_pending
> > >    - mm_tlb_flush_pending
> > >    - mm_tlb_flush_nested
> > >    - copy_pte_marker
> > >    - num_pages_contiguous
> > >
> > > All other helper in mm_inline.h are for LRU. So we rename mm_inline.h
> > > to mm_lru.h?
> >
> > Moving the VMA/TLB helpers out looks good to me as a first step.
> >
> > For the LRU part, there is already mm/vmscan.h, added by "mm/vmscan:
> > move struct scan_control to a dedicated header" in mm-new. Most LRU
> > helpers are only used inside mm/, e.g. lruvec_add_folio(),
> > lruvec_add_folio_tail(), lru_gen_add_folio() and the refs encoding
> > helpers, so they could move there instead of staying in a public
> > header. Barry also suggested moving lruvec_add_folio() and friends
> > to mm/vmscan.h in another thread.
> >
> > A few are used outside mm/ and need to stay public:
> > folio_lru_list() in include/trace/events/pagemap.h, and
> > folio_test_workingset() in fs/btrfs and fs/erofs after patch 16. So
> > maybe keep a small public header for those, and move the rest to
> > mm/vmscan.h, or to a separate mm/mglru.h if it gets too large, as
> > David mentioned.
> >
> > I can help with the mm/vmscan.h part if that works for you.
>
> Good idea! Maybe you can send a series to do that which I'll rebase on
> top of. Feel free to take the first renaming patch too since they
> should all be zero-feature-change :-D
>
> But please help keep some helpers in a public helper so when we are
> able to get rid of folio_*_referenced and folio_*_workingset, there
> wron't be some strange header inclusion issues. FS users quite often
> need to call them, especially the folio refs related ones.
>
> (Considering MGLRU even used to try to completely ignore anon reclaim
> at swappiness 200 about a year ago, maybe that isn't too much of a
> problem, but it's still a problem).

Sorry my mistake, I meant file reclaim, got it wrong in the opposite way :P
