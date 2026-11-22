Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373140;
	b=lcfDvKo+gFC9qjMyq089DA3CxQcmjC8fDN8vsBhXzl1oi3IFtaHysiXk6pKFA+c7R+ow
	 S17G2K/XA7h3yndYpTCs/DNg0P7o+eRLL8iX8Qq2L3y9IhmgXJmW5CYl46wouGesCj/nn
	 jk7UQQoxPpZWD0SCgKiObtVmp6w8r+FLoj3c9WMTbg6IhyxrFxW9mVZeZ0CefrjlwKhGo
	 OhmF6nwwLDqOLLe2LOCfDozh+ffuEzH4+er25PABYTu7ZgkKMDUJT/iAOB4R24ACA5W1s
	 aNjtX0iQME0SM02fKbKdZoHfx/Mx6V55cHC8bE02c3SzXtKWOABZoqLPFTBQ8Jwhtug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=QIe+i9eK2zr3QCsqOe2BUenoQBuWEgVrfsYe7q090kc=;
	b=YxJX0IZ9N3qNu/jtHEX/bPMiBAdSnzyhgI9gMWyWxO9ho0d9OI6vzrgo0OPk9hbzERJ+
	 3iiqod1EYc+SLx3NhdzDu/9f35HeEyYyYbWREhuBQPaaAFQ8lyqcEFxbOG4gShVsCThNH
	 UUcFjuLaZbds2UbGrhDlzpTsDGBBggBhIiCMJ+tXLXx1u37M51u43lzKOdEtyok5SR8Uf
	 Dv3WDjn0Sv1ZcwyNQvBa7Cee3AVOdyPyJGax+F2ose03OrguFBTPVnOovBdDbc1dIZbqf
	 bIp0pxtBMA/PqVVKmIALV3o4PmRDq6lSYaP8/HtN2BUusF8ISkL6KkWcQD/phVR1f0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=SKt6GUBb;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE643606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE643606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=SKt6GUBb
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-92107df3f13so26783986d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795373138; x=1795977938; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QIe+i9eK2zr3QCsqOe2BUenoQBuWEgVrfsYe7q090kc=;
        b=SKt6GUBbJZTKooquJ6nfl9arvRO8GXxSLDi8p6QeT0+hMYxpuhQH6lLhqmmDEs+Mf/
         PE7vo/iGTFHiCj2jd93g3ynRWxftNOKCrcM2nHhrKRiPeifteLIv+XrymmEIOVA6VRRO
         4JBXBnMQpZyaPkdBHLHgSAQJn4uc8+CHf66g9QOcOUDqJH+268QwCjELLpnrIuLS1QSo
         v11XUhcERxLox7wrQWp4pM2ifd1uI2RfHBZI8d+nZDcL5fiPH0xziABlsNxg71wpq1a/
         YxU15i2OR82XnWu/GNUYbzoIxjsvR2f1VHl30hsnjFziVUz3lKLrxb8l94Ix8I7Gph8u
         BuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373138; x=1795977938;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIe+i9eK2zr3QCsqOe2BUenoQBuWEgVrfsYe7q090kc=;
        b=M5IvIv6aLvAgi9+yzrqY3nXQxUdbLmUePDUlIl8gAk6UTr/q3gaMtY4k5yX3jrXFQB
         yiNK0CmWO8q7ekN0gc7lvUh1qJn3yMUusZ19dfbv31Jyiao7erYY9wTpDQsTVwRfjGTW
         fApbcwNGRMU6wKDT3EC5RQGOmjmapBxL7oSrrfL/caZ4M4XRyi7oOVFr4LNpM3WwfoCB
         Wxs/XWZCvgLGW7RDCHoKOOu26VhussSu1qbbJ4GaMcoHrUrp94kPd0MdGY1c90eEIqLZ
         1LsnrTVD8Ve33D2T2VX0DawQB/v9BEy425k7ivuB541c1aXWKIqZ0At7OyzxrG07Qblq
         Zmmg==
X-Forwarded-Encrypted: i=1; AL+hErEg6JHmYFTtlc3tio51U7bknmNU6x/W2a/yAixwiuEyGd53P6raSIq+oHxmfsFq8CCic5yje3EHPxbW7NQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XFjbrq1UFdjeJQyryP5Qs8pfrVsWeYyznAFINWYvUjTAgMMRy
	y3uDY6VSaESauizYzzHwzgV8BB3PEfvysiolUXTCGIeTTjxkK+Ml7A6rGWdiqtZFumo=
X-Gm-Gg: AZFdTZeMnl0CLCXZdP0vMuWEtIaFFuIBau0GzAyJKOBvqZejR2AWRzH1gtsxdRt4314
	kviQFGaDhsDqMbieUoQYnuVd4tB72RGI7ZScRkxfw9cmnQbcGGcQf+V2iTG1fuV28bj1iAJyrHX
	nDoVr+iFaj1I4V8dkMhKpwI8TZalfsQWk62LdtwJd2pG3mYqdtCjn22bsSC8GHJ4eVkMLwiwxor
	7uBD2yBv5tsUSTA52b9PwMTOt7pz7iwbhdMB/3WIR56rk6qQRRcMo4RCaWFTDleaKsGMmNooBlA
	LgCNslyhXHJU51ynUXT6MVQPWfTH0FlxwiolOBsq/cqEcRbOOdm+d1k3+/U35JxvaPTg3rfOOyZ
	yWpwdi/wf2hQNFEKIKZO5iK92SzE5PGP+Px5mPTMNcW74H2wJyMvyMe4cuf7dQ2D4uM0wLdy3JC
	iwMAIKAVSEkLA8PPlmcUao979qj8rDM/cBnbo3sFuorSMqMt0WHE6gG/GH1N19M6Vy0TYRNwnNw
	Sl14aVvB5s65hLVtKPILnFEgB/5Wd+nYUn0phJjpjBmmBnrIcisSpIaKzpdPwB8EyYiwCszrFJs
	e7iUagC9JVo19YetVZodztta9AaQtMhLzD7Z1UlAf2ScMm5+I632gV7Hj0ibkIfIR8uqI/wVT+Z
	FCdoULjc=
X-Received: by 2002:a05:6214:ac3:b0:921:3a0b:673f with SMTP id 6a1803df08f44-9213a0b67admr141234506d6.7.1795373138655;
        Sun, 22 Nov 2026 10:45:38 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cd592sm86571036d6.16.2026.11.22.10.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:45:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] mm/huge_memory: use NOFS when allocating while
 splitting folios
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 William Kucharski <william.kucharski@oracle.com>, 
 Heiko Carstens <hca@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org, 
 Chris Mason <mason@kernel.org>
In-Reply-To: <20261122-migrate_reclaim_deadlock-v1-1-83c56185b0fb@kernel.org>
References: <20261122-migrate_reclaim_deadlock-v1-0-83c56185b0fb@kernel.org>
 <20261122-migrate_reclaim_deadlock-v1-1-83c56185b0fb@kernel.org>
Date: Sun, 22 Nov 2026 13:45:37 -0500
Message-Id: <179537313704.412063.6683001223228002260.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-22 13:42 +0100, David Hildenbrand (Arm) wrote:
> Various callers (migration, memory-failure, s390_wiggle_split_folio) split
> locked folios without holding a reference on the folio's inode.
> 
> Splitting a file folio might allocate memory for the xarray and call
> filemap_release_folio(). If either ends up in direct reclaim with
> __GFP_FS, reclaim can evict the inode through the dcache shrinker, and
> wait in truncate_inode_pages_final() for the folio that we hold locked:
> 
>     try_split_folio()
>       folio_lock(A)
>       split_folio_to_list(A)
>         xas_split_alloc()
>           try_to_free_pages()
>             super_cache_scan()
>               prune_dcache_sb()
>                 iput_final()
>                   evict()
>                     truncate_inode_pages_final()
>                       folio_lock(A)
> 
> This requires that nothing else holds a reference on the inode, and can
> be triggered most easily with FUSE, which evicts inodes on the last
> reference.
> 
> Further, xas_split_alloc() charges the XArray nodes to the memcg, and on
> cgroup v1, memcg reclaim waits for file folios under writeback if
> __GFP_FS is set. That can deadlock if writeback waits for a folio lock
> that we hold, for example with ext4.
> 
> Let's fix it by splitting folios in a NOFS scope, so callers don't have
> to care. A NOFS scope also covers allocations that filesystems make with
> their own gfp flags, for example in filemap_release_folio().
> 
> On NFS, splitting folios with pending writes or ongoing writes to
> fscache might now fail slightly more often, until these writes have
> completed. On netfs, only folios that are being written to fscache are
> affected. All fairly irrelevant.
> 
> This has medium urgency.
> 
> Fixes: 6b24ca4a1a8d ("mm: Use multi-index entries in the page cache")
> Fixes: eef88fe45ac9 ("s390/uv: Split large folios in gmap_make_secure()")
> Fixes: 789763523fb4 ("xarray: honor XA_FLAGS_ACCOUNT in xas_split_alloc()")
> Cc: stable@vger.kernel.org
> Reported-by: Chris Mason <mason@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reproduced the hang determnistically.
Base deadlocked.
With patch 1: -ENOMEM (safe)
With patch 2: split succeeds

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

