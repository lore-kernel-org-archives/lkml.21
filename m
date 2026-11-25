Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795648428;
	b=R7+KyL+cE20AlY8QPa1NAwzMul5MHWvb1fZzWup93+b3B2X19r4YM4ZkcNFoPQPM0W8/
	 SoklfcFuK1QqQaEV07L76wIBbrwbekzs0c3uu6NZplXwqyctXPnkxxtRTMpI9L+I1WnVd
	 56rEDHLptyaaMENfM12Dbo5+RiSFGxBGeKcr0wufj5fTB4OBcYi1/I+gZCMH8MAxorPXm
	 mzwopPOMLng5ktUC9PAj2o7a04tiKi4rHzJRTDYtQR7aBEGgVXcxpHMor+WCwKRRKm7w/
	 NUQFR4806Q8vDW1U15sRg1uVMx8ytrjksu47tjFnG7tV3uR/J/9COmbYj4tb03Ya4Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bmbARk3XHehA8pJF1qNbcXvK1JM9BX8FvFU7vWFVqag=;
	b=ELM4mD5QcebLVSv2uiWw2yYkr8bLYILa3Ix7ZzVgg1VOnRpMvx5Tgvn0jWFk24mqqU6j
	 rT1uV67SoDmOXmxdrrXtlSd8TJy08J1NJmZzpW3w44zp8m2z7WtgVvhlSjNBZZOhO9ATY
	 pjcxbAm7aGqtDCrgbBFguOUpyTc89GD/DrZwW0c0oVNt0SdRlofkqztqSaj3bvFYGuzbL
	 66ZEp5kb2rpJ5OIZRsnTvO40RDIvSkLY2AimkCV5ulWpeP8Xh/Z34LW/ZUw2//8LAzXRd
	 kseNQFOCTCijtopAAEiDx/Hz5hDbyN72awULvGiEquIzE6leiTB71lMXK7p1sh9cmrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SKxm+SOB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A49606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11A49606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SKxm+SOB
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a018493d57so303595e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795648426; cv=none;
        d=google.com; s=arc-20260327;
        b=im8DR4G8zo1P5TDEEqNDS3x1iV3PUFw5nXXA01ae7+0yMFO7jHwVyUIOFXAI4XN/C1
         p/l+vpl8CKUhJ/WBxjxvj9UfqayV/QnlqlleN604gGSX0PjH7wR3FqpA68RC7/n8DTpl
         gj4w84CJ3vOZTny9/F3zfpfKO6g5B8hE5z8T9oakQUMtEMJM7IxDuaR8rfzOrAfPVBzm
         tBBStY28OEodMiROpinkl4mfsy0E8WUgWJXzqa29TnY4JTyV5MWn1sq1AA1Ps6yrE+GU
         ExJyqTRHHCCSOsQ1Br9PdVZ33Yd1sr6fnIf+zlm1lfM+0RUiEfwp5aR2pKHJz9wzFgga
         UnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bmbARk3XHehA8pJF1qNbcXvK1JM9BX8FvFU7vWFVqag=;
        fh=03imqwQkgUkSXfDz1AOMd4NJtvH4m/HriFBOIjvaqDg=;
        b=hW2wb2zcJ+QR6ImYsUt95Gwi2JIfOOxl+0ouIqvJrX7gNf/Y47+gz+armCDu0N0Fzv
         6FN8Gps5WmRuLvW4ypAhC+qvUVGrxgmU2GB58ZhujcpuW9ia2zFJz10zLtSxYOdi8PCi
         KqohfJF76tFYkm56l18nUnHzoKDniqomuNpoAOZB/iXDmKPTKgNoJQYlkam0oIOaklg9
         QUubeqcETrp01fz5Yc6s3CfTXOM/OO47D6ASQT5fhIMH0IKovuWNF0/4/KSL+aZpxo7b
         BAme1Bfaw5o2nUHxo+bV1unGwu2lD2Jqqc4DsVBMqmPhq3a1Kn9b8YYvuih4WsB6eQzU
         XmIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795648426; x=1796253226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bmbARk3XHehA8pJF1qNbcXvK1JM9BX8FvFU7vWFVqag=;
        b=SKxm+SOBB2ex/3j7AvV3T8YCOiYE5m3HgMGKpVoiU7GWNsXILHhg2MYsqT8e48n447
         3niUHGYlUJjgaE8qahNqsQA9/LJvBYAY/hs8KDbDqJjbsPi2KHAzQ0WUDY1PdH9HaSHE
         6JvuRmyYaTX7TwrNM7VBtsCvx7+iTh9uSXjROu8IqxPp0KApXfhZgpjZqIkP0C4iEH5m
         duqemOKs35oQuCy4TFOu9lUoYFPtIofX1QF4ccSvT54gOpIzT5/Y2A2pEKG4q6nWxkf1
         5OBBy3+F2DbM0Y25RYM3i7eUo27n5QvgdsE9QZYyQ+SpyGWyU4w9qKWCBsIBk9spnEN4
         83lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648426; x=1796253226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmbARk3XHehA8pJF1qNbcXvK1JM9BX8FvFU7vWFVqag=;
        b=SSze8pkEy96QjKRwQBw8OMrJ+Q3MDziJl+tK/d2PpDRnTg5ZowUU7c0rFUx//8h8sF
         nd4NuYBdlHTcPSzmiXfpSE1EBue1+C3inXMTY+UA9w4F2N2TEzWhCdqSmFYqDWa8ZNrI
         y9xrDuBFYCALa6KKN+c6XKRdD7TCsULRH2eCxl8qfXJKSurQ9nHd6Nb46aFyyfPWTSBd
         sZV4iqPzu2+OjXsWUyaIXg3o2hc5egQLCow1uXie9EHng7j/251QoP7r4Yk5PFB9+fxy
         GJPiuVxqYstB9D8iDzfJwjbKjQgBslYa9n8wJG3pfXyjBUO4t3gBFShrLWeVpR/gr8Mb
         iHkQ==
X-Forwarded-Encrypted: i=1; AL+hErGVriUiPhfV1/MbV92dYlYjehTtmGGBFHMegQpgqBrMnE3RjU2I4GErN8SAYhRCETE3Hj+01k2REi1A26E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gLYkNk8bHk4X2GzlSc7BZFzp+B8KvbornZ7xn8CnC6T3Pw93H
	h0jNcoh7xM4+OqypE2VVu64EFDo0mV6MGRMRTh8RUOnuLcMAN6UQ2r/T6lYpmnze6GXhmBpPm9Z
	QvSBgldOLGPTu3JOHJ+FLlATtSFNBmAH4WRNQEHwD
X-Gm-Gg: AZFdTZfQCiNQal2ZBcdPV8NVPi0dBP3T13QlG84x+KR2fJ9pN0DReH9faIGZ7YtP/Ae
	w0HoG9wRfkGFZ3jLnRPjHGN9sF6GvXK1V0Ujmdbj/WxoWWkGG4rlkBhF9wHJbSnVy5bT+fG4Axh
	0+tTC8m0Hhj2RIlyg5arYcX6XN3tiacCCqDwkAbCbcho/449TMblO5P8FgreAKCr9IJ9flo6z6H
	Jx5/b5wRJqG5PGzz6DE4YWWN/j0VRiuQoB6qRXmhXHJTQE8dUWgP0A+RP5WDJzAZKyrNIbwlU6O
	aeO9yEp21VG0sU/igo97TWmJCFm0VUp9cdUqjHMLZ0P9TnHgpHZZCof6NbaZ3CPApVmF5w4SEuF
	Wu2UqMUmNj16pnKX+L6zzXAjnkdEU8Us40vdGJiYgkuoHhNViQVCTWtdV58SGCkD5omsFcA==
X-Received: by 2002:a05:600c:26cb:b0:4a1:fb0b:1c9c with SMTP id
 5b1f17b1804b1-4bb9169f045mr2044145e9.10.1795648425836; Wed, 25 Nov 2026
 15:13:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-hugetlb_fixes_2-v1-0-db27fd2f71a8@kernel.org> <20261125-hugetlb_fixes_2-v1-7-db27fd2f71a8@kernel.org>
In-Reply-To: <20261125-hugetlb_fixes_2-v1-7-db27fd2f71a8@kernel.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Wed, 25 Nov 2026 15:13:32 -0800
X-Gm-Features: Aa3M54o0VivDc1V8RDqLgeYd6VEevBgWlfFAdGAu_CvY1Dn7_qwvILYBeMeboYQ
Message-ID: <CACw3F51O9kQut0+uOCgP4BEB6VmsmhFVLFxvLXGJPeD-dk0n5Q@mail.gmail.com>
Subject: Re: [PATCH 07/21] hugetlbfs: don't zero poisoned pages in a hole punch
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Jinmeng Zhou <jinmengzhou22@gmail.com>, 
	Hongfu Li <lihongfu@kylinos.cn>, Andrea Arcangeli <aarcange@redhat.com>, 
	Mike Kravetz <mike.kravetz@oracle.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Dave Airlie <airlied@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Mike Rapoport <rppt@kernel.org>, Mel Gorman <mel@csn.ul.ie>, 
	Dave McCracken <dave.mccracken@oracle.com>, Andy Whitcroft <apw@shadowen.org>, 
	Adam Litke <agl@us.ibm.com>, Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	James Houghton <jthoughton@google.com>, Yang Shi <shy828301@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Pedro Falcato <pfalcato@suse.de>, Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Matthew Brost <matthew.brost@intel.com>, 
	Byungchul Park <byungchul@sk.com>, Alistair Popple <apopple@nvidia.com>, 
	Wanpeng Li <liwanp@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>, 
	Kenneth W Chen <kenneth.w.chen@intel.com>, Hugh Dickins <hugh@veritas.com>, 
	Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>, Joern Engel <joern@logfs.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Michal Hocko <mhocko@suse.cz>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, 
	KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Sasha Levin <sasha.levin@oracle.com>, 
	Guillaume Morin <guillaume@morinfr.org>, Wanpeng Li <liwp.linux@gmail.com>, linux-mm@kvack.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Andrew Morton <akpm@osdl.org>, linux-doc@vger.kernel.org, stable@vger.kernel.org, 
	Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:35=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> Since commit 8625147cafaa ("hugetlbfs: don't delete error page from
> pagecache"), a poisoned hugetlb folio stays in the page cache, and we
> must not access its poisoned pages.
>
> However, hugetlbfs_zero_partial_page() zeroes the partial folio of an
> unaligned hole punch without checking for poison, which can cause
> issues like machine-checks.
>
> Let's fix it by simply not zeroing poisoned folios. We don't really care
> about their content: the folio can no longer be mapped, and read() only
> returns data up to the first poisoned page.
>
> Only zeroing the pages that are not poisoned would need more thought, as
> we cannot reliably identify the poisoned pages; that is future work.
>
> Note that a folio that gets poisoned concurrently, after we checked it,
> can still be zeroed, and sync'ing with memory failure handling is also
> left as future work.
>
> This has low urgency, as it requires a hole punch on a poisoned folio.
>
> Fixes: 8625147cafaa ("hugetlbfs: don't delete error page from pagecache")
> Cc: <stable@vger.kernel.org>
> Reported-by: Chris Mason <mason@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  fs/hugetlbfs/inode.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 2e8672ae2fd52..5437a55d14f1c 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -656,7 +656,8 @@ static void hugetlbfs_zero_partial_page(struct hstate=
 *h,
>         if (!end)
>                 end =3D huge_page_size(h);
>
> -       folio_zero_segment(folio, (size_t)start, (size_t)end);
> +       if (!folio_test_hwpoison(folio))
> +               folio_zero_segment(folio, (size_t)start, (size_t)end);

Clean fix, LGTM.

Reviewed-by: Jiaqi Yan <jiaqiyan@google.com>

>
>         folio_unlock(folio);
>         folio_put(folio);
>
> --
> 2.56.1
>
>
