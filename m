Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779025;
	b=WLuskcwG83ZeDf5F+wfDQp771Odgq93hhGTxeixCRssK6tNBQAZ3hdX/UiIGCk0uVj9G
	 s7BcLOYgxmGK+d340iOYyHyqNaPaIDhiK3FibuonS/l6NczpmGdTGdYsSWUYRiwnnCSzM
	 AuQWhDdBSObIcdy3MyPiOLaqc3IChe2kw/a/SopK86j9fdh1U8QX8ROQVuyD8JGgkg4P8
	 KYrPxjEQiEyzKrlMNsPZXR6wS55p8wR+mVeiRDqHt7NfdMMpCgIBt0uHUV1suuYQusS89
	 93Ri06n94SLXntW3WX6q4eQq4ZqNRdSeLJ/syywoh+g4806wMJU8oqhRFlLrPX8ijfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779025;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=v/DRujHK3h9OYFJqK+Heu3tFSqlmEJ7ZaPjCgT9OJxg=;
	b=RvVQHmD7zSQfGy3eWZQt2uww4HTjRgKD/HPqr6kkq5lHSpcxRS97oNKYPufwTpFzzwXI
	 8veLBR80Hlr1t61yE7AYoh+AuzzbFnJFjIXJBr4CDQT4FAErBAz0wpAyIYSWsFknFS6sl
	 ZdMP+DQvWQYToqNsHJOv/3eodn/8ron6dgBvUbMElAKjPW+Oy4WMebgTpwIth31RWhpGy
	 JQuPzMPE/u5158PKOaZshpaFfW+hi0hGMtG+A5ezC9HxQmjr+V0+nLHDwUBFe9CMmT1W/
	 Qkxa1GEjj2KIUl2Tf74DSDSjnbGqx0NVlkIT4L8NYnCiMNZf67ANkZQldlciD6d+Uvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k2U75+Dy;
	arc=none smtp.remote-ip=91.218.175.219
Received: from mta0.migadu.com (out-219.mta0.migadu.com [91.218.175.219])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE42C606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE42C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k2U75+Dy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=REZrybfYS1Zew1thSQ+aV8V2RYKBra503CLdmEQhDsY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795779022; v=1; x=1796383822;
 b=k2U75+Dy8pOK65sTitmgY3CMEokY38yCbqpMnp9pzRCF0/ifHFZYjW4ozxILK4HXPoCSRO/z
 AHCRoP5wM22u0nuY3UYwVCqz0wrSja7R8TYxs2LeircXA7TfZLfK0NzFRPAKB9MWwFhYfAmJoVe
 rlyRVpVSp8bdbFOL3MgCTMJ0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 64e8215db0511ddf;
	Fri, 27 Nov 2026 11:30:19 +0000
X-Mizu-Trace-ID: 64e8215db0511ddf
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
Subject: Re: [PATCH] tools/mm: add a drgn script to show HugeTLB reservations
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261126-hugetlb-resv-drgn-v1-1-345a6ee7c08c@gmail.com>
Date: Fri, 27 Nov 2026 19:30:04 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 Usama Arif <usama.arif@linux.dev>,
 Karl Mehltretter <kmehltretter@gmail.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Zhao Li <enderaoelyther@gmail.com>,
 Jinmeng Zhou <zhoujinmeng@bytedance.com>,
 linux-mm@kvack.org,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>,
 linux-kernel@vger.kernel.org,
 Omar Sandoval <osandov@osandov.com>
Content-Transfer-Encoding: 7bit
Message-Id: <FDAF27F6-A5D1-4911-BB86-6645272E2BD3@linux.dev>
References: <20261126-hugetlb-resv-drgn-v1-1-345a6ee7c08c@gmail.com>
To: Aveline Noir <jm5905938@gmail.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 26, 2026, at 19:21, Aveline Noir <jm5905938@gmail.com> wrote:
> 
> Add a drgn script, show_hugetlb_resv.py, to show where HugeTLB
> reservations are held in a live kernel or vmcore.
> 
> HugePages_Rsvd in /proc/meminfo only reports the global reservation
> count for the default huge page size. It cannot show which files,
> private mappings or hugetlbfs mounts hold those reservations, or whether
> a subpool is below its minimum.
> 
> The script walks those objects per huge page size, compares their
> reservations with resv_huge_pages, and checks subpool minima separately.
> It reads internal hugetlb and hugetlbfs structures, so keeping it in
> tools/mm/ lets it be updated alongside them.
> 
> Usage:
> 
>  drgn -c vmcore -s vmlinux tools/mm/show_hugetlb_resv.py [--json]
>  drgn -k tools/mm/show_hugetlb_resv.py [--json]
> 
> Output from a vmcore taken before commit e4949a80f3b0 ("mm/hugetlb: fix
> subpool minimum reservation rollback"). All three reserved pages are
> attributed, but the mount is one page below its four-page minimum:
> 
>  source=dump status=mismatch (counts in huge pages)
> 
>  2048 KiB: nr_huge_pages=4 free_huge_pages=4 resv_huge_pages=3
>    inode_resv=3 private_resv=0 mounted_resv=0
>    attributed=3 unattributed=+0 resv_floor=4 floor_shortfall=1
>    sb=0xff11000004000000 path='/huge' min_hpages=4 rsv_hpages=0
>      min_shortfall=1 used_hpages=3
>      ino=191 name='a' resv_map_pages=3 instantiated=0 outstanding=3
> 
> With the fix applied, the same test leaves rsv_hpages=1 and no
> min_shortfall.
> 
> Signed-off-by: Aveline Noir <jm5905938@gmail.com>
> ---
> I wasn't sure where a script like this belongs, so I followed
> tools/mm/show_page_info.py for the placement and MAINTAINERS entry.
> Any feedback is welcome :)

The Dragon project itself probably belongs to this type of script? See
here:

	https://github.com/osandov/drgn/tree/main/scripts

Thanks,
Muchun
