Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396460;
	b=TsKWAhAYOPC/+z527kwWKL/TuaWc2nI2uAyJ0JWjlsmkToUaDY78RAM5KvstQ/11bjmJ
	 L2irhbGud8qqrrlOeGN9HVyubPGS7arTCrTzcZusl+7R9OMwqEmMjWKS7FQvrazHkR8AM
	 IZdabooMG5cQn+XRVRGSdbeFZU0Q20qBKYsgphlUA3eAchSUS20T3pecRP4VwKBEC6vzy
	 5JhDV+JmuiqXnSrpJMacl+ePL1rQSGG+8qC8DsKYS50q1jWqdMv5p5rjYKLgswX7R7D5L
	 uomMLmup7KdlnMnLk4vrg955jKy1cMWBzVUjCi0TMVX4EPW1UMChM3Vwd0NAF5qnV2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396460;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=beRsURI87z7ePC5UgnVhljfRVtiAk+JGSK5Yp7RQ++w=;
	b=sMZfTcFkwWJTnM0gJZTJ8Ewsn1/40BDre83FWPRsNM5E+2cYNy5MX9wnSWBj5LGhsEES
	 Ia6HBq8/CxW4t0/OwztR1OVj8cz9HLRththfbAwHTuyGv8xzEg80iazx/6YV8usin5F3s
	 nSvXPBZE0vboiToT5GeqnKDOrW/vhd2Faz3KkWL6r12WIh0g3FBJ8UtFvlnXDpdX9zMNd
	 ysQYbk4IR+2dRmN4mRvm4SaFSQUo037JX/8PyMNiDkdLpnozOCEO+SygglitKdFgtS2GL
	 6fB9qgiPFGYgVcR1yLfh4Lskx4QlOU11Ji31rzJtXJJXNezBHQL3yhh4+DnHO0ioTiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys1yFoMi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC34606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys1yFoMi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407F51F00A3E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396460;
	bh=beRsURI87z7ePC5UgnVhljfRVtiAk+JGSK5Yp7RQ++w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ys1yFoMi3EImki+984yKCe81INtZaQHTXOXdANgrHv9/I07zvlyD2nTpoYX/tGYqd
	 yc6+SySpdaII+pw8XgsrTCpM3A66tynOC/z8F1MdwNB3kNHswhMNS41AJQhEFJWboD
	 kiNSWkHXDArtd5kB8OIQ2CkeuPtd6BJI9R6GnvHBzCI9uDnu81zIxw13OUZ/mEDBWs
	 ZuCk07qi0/QolXdTFeDPWAVBeP5vGK4IVAd16QuexIaRJjVoKX9uD5yUHroorHerxs
	 ih8ab7EmuB5sbtxCgrx7uzM8MHnDn47aasBHwVh/E9KhwdGLxIAV2dlKcpxcdV+/9F
	 FjfZHMSnH4gMw==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9495f083657so334590985a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:14:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH5VwC7TOcj9fPvXX5cWZU5JUFPetZPbJ/aq7eWXXG0HcdbFxvxFREiAtVEEJCPR9h7ozkiuPr0J8G/ZNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gKkoTGvnpsXxxpfSKoBiykTw79t3jt6aEItOKwSRYo0ldfWdT
	Rczx03EFjOGJSJ/gQ/EkgRKXYOLNdoq9UY5CzDTc/mqmkKPkkDCOonMI7iIb00hzk5vuuNLirri
	6bxUKtIKe+XtKGtsioz6EZcRStq/5H2o=
X-Received: by 2002:a05:620a:450e:b0:949:5c62:e785 with SMTP id
 af79cd13be357-949ba9b7429mr1776786785a.21.1795396459175; Sun, 22 Nov 2026
 17:14:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-migrate_reclaim_deadlock-v1-0-83c56185b0fb@kernel.org>
 <20261122-migrate_reclaim_deadlock-v1-1-83c56185b0fb@kernel.org> <179537313704.412063.6683001223228002260.b4-reply@b4>
In-Reply-To: <179537313704.412063.6683001223228002260.b4-reply@b4>
From: Barry Song <baohua@kernel.org>
Date: Mon, 23 Nov 2026 09:14:06 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yEeORJw8dQEH0U-JjWih3+3ZVx=1Va5F_9qsVbPzCLvQ@mail.gmail.com>
X-Gm-Features: Aa3M54qG1iauJEScw2ktzAtei45vPodUuwGuthkS3X5FKVC_OPLT-7KU2cnzR8g
Message-ID: <CAGsJ_4yEeORJw8dQEH0U-JjWih3+3ZVx=1Va5F_9qsVbPzCLvQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/huge_memory: use NOFS when allocating while
 splitting folios
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, William Kucharski <william.kucharski@oracle.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>, 
	Joanne Koong <joannelkoong@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, stable@vger.kernel.org, 
	Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:46=E2=80=AFAM Gregory Price (Meta) <gourry@gourry=
.net> wrote:
>
> On 2026-11-22 13:42 +0100, David Hildenbrand (Arm) wrote:
> > Various callers (migration, memory-failure, s390_wiggle_split_folio) sp=
lit
> > locked folios without holding a reference on the folio's inode.
> >
> > Splitting a file folio might allocate memory for the xarray and call
> > filemap_release_folio(). If either ends up in direct reclaim with
> > __GFP_FS, reclaim can evict the inode through the dcache shrinker, and
> > wait in truncate_inode_pages_final() for the folio that we hold locked:
> >
> >     try_split_folio()
> >       folio_lock(A)
> >       split_folio_to_list(A)
> >         xas_split_alloc()
> >           try_to_free_pages()
> >             super_cache_scan()
> >               prune_dcache_sb()
> >                 iput_final()
> >                   evict()
> >                     truncate_inode_pages_final()
> >                       folio_lock(A)
> >
> > This requires that nothing else holds a reference on the inode, and can
> > be triggered most easily with FUSE, which evicts inodes on the last
> > reference.
> >
> > Further, xas_split_alloc() charges the XArray nodes to the memcg, and o=
n
> > cgroup v1, memcg reclaim waits for file folios under writeback if
> > __GFP_FS is set. That can deadlock if writeback waits for a folio lock
> > that we hold, for example with ext4.
> >
> > Let's fix it by splitting folios in a NOFS scope, so callers don't have
> > to care. A NOFS scope also covers allocations that filesystems make wit=
h
> > their own gfp flags, for example in filemap_release_folio().
> >
> > On NFS, splitting folios with pending writes or ongoing writes to
> > fscache might now fail slightly more often, until these writes have
> > completed. On netfs, only folios that are being written to fscache are
> > affected. All fairly irrelevant.
> >
> > This has medium urgency.
> >
> > Fixes: 6b24ca4a1a8d ("mm: Use multi-index entries in the page cache")
> > Fixes: eef88fe45ac9 ("s390/uv: Split large folios in gmap_make_secure()=
")
> > Fixes: 789763523fb4 ("xarray: honor XA_FLAGS_ACCOUNT in xas_split_alloc=
()")
> > Cc: stable@vger.kernel.org
> > Reported-by: Chris Mason <mason@kernel.org>
> > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>
> Reproduced the hang determnistically.
> Base deadlocked.
> With patch 1: -ENOMEM (safe)

Hi Gregory,

Just curious how those -ENOMEM failures occur. With GFP_NOFS, we
should still be able to reclaim anonymous folios (except in
SWAP_OPS_F_REQUIRE_NOFS cases) and clean page cache folios, right?


> With patch 2: split succeeds
>
> Tested-by: Gregory Price (Meta) <gourry@gourry.net>
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
>

+1 for the patch itself.

Reviewed-by: Barry Song <baohua@kernel.org>

Thanks,
Barry
