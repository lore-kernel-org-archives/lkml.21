Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658610;
	b=bC5BcSSXo5cfFHfzTbwOMn0AL1SRYiQKcKPhzM/CsQ+OoyBQrtdv5NphRzXWKev8UVxW
	 2z3vu8KEdB4OJODN+1fiKsR3F91aha8V1t1pByNVW02wXO1BF5ZN9XW9VhvGuyj1ZiIDN
	 D84/Tb3KzNp9j9EBp6JfrkiO8IN1kLbPFkuZXul5XhSgNRt/ATm/p5qB00OLEzQn4HAPE
	 yQAe/Q4YmFltEURdo/4KEXqQ1+gPREWFxIF8wqrZbhYyv0QKuafpT8xXlwjTf8QRdi/4q
	 KhU/KKj6BKjDpAd+F3leKviSq9rLYIvhYkr/rlTO7CUnYdff4SIHx5yd0TmiZ/h2pww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658610;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=mDPdURnq3OYJxD9FHhva4DbPjq66mRuiBiRc8sZ8u50=;
	b=3uWjzp3ONwIMo+uva6YBs286ULs3MTRxU0qXos3FHCR4kXoN8/Rv2cw9W34msGF3yKtS
	 POUYveIDRLtCiDfu0dsRJqjKW0T8lcMVeajGs7NPPDCybJ2xUN58XpjKclCWeakrbXT8J
	 kVHB9EP8xGJTXHNbVcDZ3NClziNu1q5pNSz5vGiMD502pxAzimkdCmz8B/cID++GDbw4z
	 bGwzkMaRQkQduJAddn0Z0JNi9eVs79XiFpv+o5DD3pw0iyPhD4peMgY4fVjsuKb5hueXl
	 L7u+b2lJ7ZAMkfwgB0U2dgvx/b1knIByG5K8vsCe/mpNiK5n7/CKT3k9/1vbETH2jaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TP8Zq9L4;
	arc=none smtp.remote-ip=91.218.175.245
Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C5D606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C5D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TP8Zq9L4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mDPdURnq3OYJxD9FHhva4DbPjq66mRuiBiRc8sZ8u50=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795658607; v=1; x=1796263407;
 b=TP8Zq9L404rStXl2YR084kJubXA7rVftKLz52T+EWaXeYLsphXJoRzEB1qquXwHMkshjGLVM
 xUsnme8XzHoQKRGymyaYNObREMMZ1OrzUz0k3ApmuLAhRVgPX2N4Tnmb41ujRB9iOdQu16ADmUI
 KKZ3Pc2bXtiwh9XF3Ffk+/AA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 99fa385bc754693e;
	Thu, 26 Nov 2026 02:03:26 +0000
X-Mizu-Trace-ID: 99fa385bc754693e
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
Subject: Re: [PATCH 02/21] mm/hugetlb: fix truncated copy result in
 UFFDIO_COPY
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261125-hugetlb_fixes_2-v1-2-db27fd2f71a8@kernel.org>
Date: Thu, 26 Nov 2026 10:03:04 +0800
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
 Chris Mason <mason@kernel.org>,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <36B2540E-D15B-4A56-88B3-2283A26B40BA@linux.dev>
References: <20261125-hugetlb_fixes_2-v1-0-db27fd2f71a8@kernel.org>
 <20261125-hugetlb_fixes_2-v1-2-db27fd2f71a8@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 26, 2026, at 06:33, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> From: Chris Mason <mason@kernel.org>
>=20
> Folios that span more bytes than can fit into an unsigned integer =
(e.g.,
> 16 GiB folios on arm64) are problematic with UFFDIO_COPY: the result
> from copy_folio_from_user() can be truncated, possibly indicating
> success instead of an error.
>=20
> We will then continue with the folio that has stale data, and make it
> accessible to user space.
>=20
> For example, if copy_folio_from_user() fails such that the number of
> bytes not copied is a multiple of 4 GiB, we'll get an effective ret =3D=3D=

> 0.
>=20
> Let's fix it by simply testing the return value directly.
>=20
> This has medium urgency, as it's an information leak.
>=20
> Fixes: 8fb5debc5fcd ("userfaultfd: hugetlbfs: add =
hugetlb_mcopy_atomic_pte for userfaultfd support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: cleanup code and description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Muchun Song (ByteDance) <muchun.song@linux.dev>


