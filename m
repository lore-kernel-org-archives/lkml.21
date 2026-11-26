Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658959;
	b=m/e9eQEfWmSkxWG+JkJCepHCtzUYuHevDKfBLhFg5O1Pw1OuejBUpPLYRc6W5Q4rMTsn
	 KVbsIVbFjcBorTl8Yr8xDnw+qQvV7rV3Yi2TcQX1jdyLDkLD4WIVgrO5dx3kOp1zBHaUt
	 G+vFFRBGLrd7w0Vt5zKt+voTycAQAZiWSFcXXF2KyZdICoE9HEGKwb4TdtAc2rnzEAkFK
	 WYTs2UHpQW4EanWXnNCyupWca08myLkf5uJ8KdtDxoitvLcd/bevfhldRPuriWj6BdRiK
	 irP0MBdlIoyIJ1ZUm2Y6P3+Ob8MajrwtEhkOQflyDv6qHalN7HDUx1aDq6ZSfX8NeOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658959;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=CcruErW631cRyNVYcZhaTd+ooyBSWxhrtfIr60h9UBg=;
	b=pjLWPbDQ+fB1BMGax9fzB5ybFP/XHXMxM7lb0AxEtHxSCUgcy1dvZfNmxLQupdwxfWTZ
	 6RF6rOmo4HNSSQnUMoIImDey0byu0uDeetfb9IT402EITexeauxcZeuAoLc3LPZBwwwWb
	 6ipZiSmuqvx/bbKALYQWyiG7gii4JvHGgCyMi/zYl1GrTn69X8ivkEQBOt5vdaRKkNgb6
	 hWo1cGZ2Icz44THgHlTY5HiW2ROhoK8hf4N2YGCeC6tHs9OLAKzDzBHM8pj1xUXG4cj6e
	 YFBvJGKY9Bwr15Ue4XAYN8fnUy5xCZRIB0IGBVkhtv6KLwMDPJKt3I51oTE7U8YNI3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iHiygrY4;
	arc=none smtp.remote-ip=95.215.58.107
Received: from mta1.migadu.com (out-107.mta1.migadu.com [95.215.58.107])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17089606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17089606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iHiygrY4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CcruErW631cRyNVYcZhaTd+ooyBSWxhrtfIr60h9UBg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795658957; v=1; x=1796263757;
 b=iHiygrY4YdMMVg2PiVGi7WPUsuMeCiRWM6CpkTSUqvsjiB8j+BahxwGM+iwWHTN8s2d4ECK+
 rD2PKTT8rm58DkMPRcCSgEq+SLUBU5EijXFnr1RTqgFh4CWIK7gmgjY5Ho7W6XPV0ubECqn0KyG
 WbO2danQxz4doYswc8WhOKrQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e1cc9e9085ce54e2;
	Thu, 26 Nov 2026 02:09:16 +0000
X-Mizu-Trace-ID: e1cc9e9085ce54e2
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
Subject: Re: [PATCH 10/21] mm/hugetlb: only check PMD table sharing for
 PMD-sized folios
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261125-hugetlb_fixes_2-v1-10-db27fd2f71a8@kernel.org>
Date: Thu, 26 Nov 2026 10:08:45 +0800
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
 stable@vger.kernel.org,
 Chris Mason <mason@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7348490D-C5B9-4471-AFE9-CDE68FDBAFF1@linux.dev>
References: <20261125-hugetlb_fixes_2-v1-0-db27fd2f71a8@kernel.org>
 <20261125-hugetlb_fixes_2-v1-10-db27fd2f71a8@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 26, 2026, at 06:33, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> hugetlb_pmd_shared() reads "pt_share_count" from the ptdesc of the =
page
> table that maps a hugetlb folio, independent of the folio size, to =
tell
> whether that page table is shared. Only PMD tables have a valid
> "pt_share_count"; for other folio sizes, such as 1 GiB folios on x86
> that are mapped by a PUD table, we read whatever another user of the
> union left behind.
>=20
> As a result, such folios might be reported as shared in smaps and as =
not
> exclusively mapped in pagemap, and mbind(MPOL_MF_MOVE) and
> migrate_pages() might skip them.
>=20
> Let's fix it by adding hugetlb_folio_maybe_mapped_shared(), which
> combines folio_maybe_mapped_shared(), documented to not care about =
page
> table sharing, with a check for PMD table sharing only for PMD-sized
> folios, and using it in the affected callers.
>=20
> This has low urgency.
>=20
> Fixes: ca1a47cd3f5f ("mm/hugetlb: fix hugetlb_pmd_shared()")
> Cc: <stable@vger.kernel.org>
> Reported-by: Chris Mason <mason@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Muchun Song (ByteDance) <muchun.song@linux.dev>


