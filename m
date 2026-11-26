Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658876;
	b=i+94SyZDfcyaQl6vkQsRnDSd8nh6LVm8AZcOenuTwn+9pPIDG55zBtOBO7oFsrJpWBzK
	 3DIEkZZEK2UdkF5GWT+kUxeJRJq8P35CwnapPwFAlBFVuqXWNWG8AVV51HPyT6jc8LGKh
	 nSkUxi4Zv7ls03gKp39iO5t6KeGjgVLQNrPoY5TML7wT9341vEEMN6q2wEjGBD72k/bnI
	 Jtqd+bDRu56pHBISwLBwlSME7QZcu4rpPEYFck+qq5pjnHJFDNTrF7bq+oW2Jf89+vPdj
	 yn4K0ehAlNDpYFCTDN/RY6Hz4wnxtVVxVOenNiiMrFTKX24TdZocRLCeFNtQJg3FVIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658876;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=0QLSDXfx2Y3U/9u0/2RkJvZIPOqyHoT/oK2W5AWt4wc=;
	b=xNzZ+9Wv88Z8jmgCILHQJDJpMnRTe0B7ff894bA9yXw/IgDX6PasBRPok3wdXAo5y90d
	 HNrCTEHtzapEb3fC7o8sVYsG8Ph1QQhdglYAyyRWtsFIX9D9p4jECAmDuSGyNhdK7OrVR
	 iUb+byYbMrQ2NgsRMk5ZidXxKVEdHATOGON3lRH+114i6cRgcQ2a0beK+IjA+p2ufnR/w
	 cXjJaVzI8VLTOLbsfs6lJ1mhbElkCKngx95mkyh/zUmEGl0upD6V48lkN//uchr3EPZo3
	 /mW46BAAldkj+WqLHKCwPHYPKZTEq3xkO4kog6h8Re4VLrObIJ3H+yeRVaWjUFV1vwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="uz/N4q9K";
	arc=none smtp.remote-ip=95.215.58.38
Received: from mta1.migadu.com (out-38.mta1.migadu.com [95.215.58.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01871606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01871606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uz/N4q9K
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0QLSDXfx2Y3U/9u0/2RkJvZIPOqyHoT/oK2W5AWt4wc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795658874; v=1; x=1796263674;
 b=uz/N4q9Kwga3uQDEn7wsrBLEvVTVGwzWV+3DruxjQzETN2986gyEE43cDVb2BkQwJkbSvXIN
 uonW8NthD0JSPBUdyUrCViplVAUM7P7pBf6jUnSXJm96cqllpr5OcZPeilUsO1rsv9lAFWMjSsr
 cnOWpqJudhSWSehEhZ/GUGAU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 648b555ab3881891;
	Thu, 26 Nov 2026 02:07:53 +0000
X-Mizu-Trace-ID: 648b555ab3881891
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 09/21] mm/hugetlb: don't zap non-present entries when
 unmapping a folio
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261125-hugetlb_fixes_2-v1-9-db27fd2f71a8@kernel.org>
Date: Thu, 26 Nov 2026 10:07:31 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jinmeng Zhou <jinmengzhou22@gmail.com>,
 Hongfu Li <lihongfu@kylinos.cn>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Dave Airlie <airlied@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mike Rapoport <rppt@kernel.org>,
 Mel Gorman <mel@csn.ul.ie>,
 Dave McCracken <dave.mccracken@oracle.com>,
 Andy Whitcroft <apw@shadowen.org>,
 Adam Litke <agl@us.ibm.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Rik van Riel <riel@surriel.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Harry Yoo <harry@kernel.org>,
 Jann Horn <jannh@google.com>,
 Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>,
 Yang Shi <shy828301@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Pedro Falcato <pfalcato@suse.de>,
 Gregory Price <gourry@gourry.net>,
 Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Byungchul Park <byungchul@sk.com>,
 Alistair Popple <apopple@nvidia.com>,
 Wanpeng Li <liwanp@linux.vnet.ibm.com>,
 Andi Kleen <ak@linux.intel.com>,
 Kenneth W Chen <kenneth.w.chen@intel.com>,
 Hugh Dickins <hugh@veritas.com>,
 Michal Hocko <mhocko@suse.com>,
 David Rientjes <rientjes@google.com>,
 Joern Engel <joern@logfs.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Michal Hocko <mhocko@suse.cz>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
 KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Sasha Levin <sasha.levin@oracle.com>,
 Guillaume Morin <guillaume@morinfr.org>,
 Wanpeng Li <liwp.linux@gmail.com>,
 linux-mm@kvack.org,
 Jason Gunthorpe <jgg@ziepe.ca>,
 linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@osdl.org>,
 linux-doc@vger.kernel.org,
 Chris Mason <mason@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3FBE1B4F-DD8A-49FC-844C-8E073C5B7623@linux.dev>
References: <20261125-hugetlb_fixes_2-v1-0-db27fd2f71a8@kernel.org>
 <20261125-hugetlb_fixes_2-v1-9-db27fd2f71a8@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 26, 2026, at 06:33, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> From: Chris Mason <mason@kernel.org>
>=20
> When the owner of a private hugetlb mapping fails to allocate a folio
> for COW, unmap_ref_private() unmaps the old folio from the forked
> children, and marks them with HPAGE_RESV_UNMAPPED, so they get a =
SIGBUS
> on their next access.
>=20
> hugetlb_unmap_range() is supposed to only unmap that folio, but it
> clears non-present page table entries unconditionally.
>=20
> A child can silently lose its COWed folio while it is getting =
migrated,
> or a hwpoison entry or uffd poison marker, without HPAGE_RESV_UNMAPPED
> getting set. Consequently, it would not SIGBUS on the next access.
>=20
> Let's fix it by ignoring non-present entries when unmapping a folio. =
As
> the folio is locked, migration entries of that folio do not apply.
>=20
> This has low urgency, as it requires a failing COW allocation in the
> owner racing with migration or memory failure in the child. Let's not =
CC
> stable.
>=20
> Fixes: 8c4894c6bc79 ("hwpoison, hugetlbfs: fix "bad pmd" warning in =
unmapping hwpoisoned hugepage")
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: adjust comment and description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Muchun Song (ByteDance) <muchun.song@linux.dev>


