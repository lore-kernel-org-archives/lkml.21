Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367819;
	b=ql6CN6bOqnYnaeeWF6LLEDke6y/nuUau1JB6ipmwi2nY+wdHxjGTsDm/uMr4JLj85g4b
	 Ue6bGSo5V0K4hyqT+NLLfuVFaGRp6DNoUSxmOoMiPy15Ny4H9c3g/CxrL0DGrZBY2lS3/
	 LM9eChLmZ39/YlDA38B3LsX1V3To4r0jvS21ck+KclgnIjcuJ6FGmuvoy3bvT29ufGvk1
	 AYyqBajg1I7ByJlqzhHGCa6opHbb2YpwSAgkQTdOzZeLGZniM9S7nQozOfRuoV8N/ErT7
	 EdRIQybGqoum9ku9OayTI7Uqe4IYBlcnitJ9BstyKQhykAscNGmUv2vMTmpqx1lGDJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uZBVsygS6D/XCIyZiy9rHnS3W7U40v2cBdi6mraqHsc=;
	b=AzD53nrKVMQgfiwnNoJhj7Y9BUw/KW8uRiipmG6hK+y+oS4vnkIO8B7eYeHmOvc7XZsS
	 6vTYIVuruJ8cLIwe3r+5OX9rXwo1cnGu6k5cmkJ2SisT0oKURIvqoYrlF8BjFrqXSfaDP
	 fPfZjIfg/Syl6P2Ms6TbufUt7ETLKMA3sTTLTQ6ypuauscc7dP/vc2CHY7FywEBM1hrhG
	 fsVM0DVKGHbZI95eKASvUibqIQuGq/HBku3icVidT5z55a843yIn8ZCt/yytm0DBdzo/z
	 5Lv7qGxlKehJPCNaExxVRK8LEO9ks/Q1vwkT4N45IcNGKXHKcgaTVfZfmDivtEChKKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mCUWiBBI;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05427606A6B9
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05427606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mCUWiBBI
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so13445235e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795367817; x=1795972617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZBVsygS6D/XCIyZiy9rHnS3W7U40v2cBdi6mraqHsc=;
        b=mCUWiBBIqRJAdhZb2luukoWxDreQFeot995UR88igZcIS0eYZwCiUfOG4BIu8WBURh
         Jz7I+C5KnQAK8p48KYG+i5xHtq/Erwa6N+A8cM72sf4Y9nFejquJg2I/1ckw76GjPW+y
         iS/Dlq+IYSeHrvebzDZxCmewV4Xxm8capneCg1wVXsyZnJBOOfaJmugwbDe790KhzYmF
         Btx/MyCTV7/38TA9OsUKVJvr51Z2jiG+X6f+spWGWrGenhnQt/8ErarOv3o4P29JS3B3
         e1I/8S41h1Ej++B26a8Ofo9iLAZaeRNlKnT0Y1Dlbu+vBR2j9f1lvzryGl/0OUBJZ0Gc
         BuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795367817; x=1795972617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZBVsygS6D/XCIyZiy9rHnS3W7U40v2cBdi6mraqHsc=;
        b=xisUTuGV1T4kZK3mAm2i8hqcIfNktLcLMtZtKx64Ao9uKfGuHB09zpF30dILvmYpYL
         ySa6KxxqffQI5430nnjn0+rV6TOx4H7OFskm/7Y3yf9LlW/kcbgOHfuijeFpubRT7fLh
         JBs3+LuwCI+/xiewKExowHtG+/CzJHn1x0xcKcMhKP6zWE7oDlMwUj9RzDxzWWpvYADt
         gbhWGp5Ke74irPadhomW6Hn8GpFaX4Wv5WEjIRMY9XINg08ipICp2UrME7upy/KGQrAJ
         xiTCammhqkT4UCqRmGvKiWKp2dRRg7DFPV5GW6/TQ/SFN2Ou6j0Q4g2iGr+gInNkpVy1
         3VCQ==
X-Forwarded-Encrypted: i=1; AL+hErHLA+4STLorpBnA1XLoQul6VDvmbKhX/BzFrraKP6buatJ3OjNl5Ox4bgCxUMYSMo2UoR573Mecii8Tb5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z83M9ad5x/z73jPpnOIygbdM2BAh6+QMLN9A5DZ8LlkNVkAqvWl
	20e4wiAWtFOBWWXyfHYPp1Hpj0mEsry8WZKh/tC5dS3yhrdQzeILDCoS
X-Gm-Gg: AZFdTZe5jPQXPkkIfIJQvs48DRPNkv8u5bdeYtWoZsVEzXk/mQJ4a2KRfM/iH4nZiYe
	qcm/YANNH5SkM/IfmKvZH1LCwOEp3HXsNCG94ezBcG2sZwTR4v9FZJLqDYRkabtRyVtB6bxBq4D
	sPYk8dYSiOFOk63WrUg3bu5kWnXwDansTKGicV926A6boHMt0+7jrI1/qWygsVTgY3h6x7/3luM
	yYhEjT8Kb5rmf+aNsI06SPfZagG2YO0JjPn6TiZYNQxkowI91EY8qozN+jWMDYh261fozIKjv9C
	/6A01BgDJXDgNIM3X9OR/8y1VEudeR/u9MhzW7PuNDS1IN+BCVs0Bm/8oxgAbCInHzACU8Uktac
	ES04VSwxJdOb9d1I/+59EIoBAk1OJd8r/5ryGUE1TqrAipgct7gllHLgnfbcwAaUH03gQkcjebn
	t6cmrljH4OFdRsPDUVfoZQCQvr47hj07P6C6T7DQtkDok3BeZYSA497ya4MiCdSQzZiLWSzIzsg
	pVIYqgqWUIPP6O+Pkr+x4pVUWmKrScNF37DHVTaZmS2hucvNEgMsvnBmZFxWaf+c5/bThs5Qkww
	GNz74M+Pfq3SGg19LZbbp9ko
X-Received: by 2002:a05:600c:674b:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb8892c0fcmr182147755e9.20.1795367817148;
        Sun, 22 Nov 2026 09:16:57 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm18145971f8f.16.2026.11.22.09.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:16:56 -0800 (PST)
Message-ID: <2da64337-5135-46ec-b7ef-0e1654f76238@gmail.com>
Date: Sun, 22 Nov 2026 18:16:54 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/huge_memory: use NOFS when allocating while
 splitting folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
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
 Johannes Weiner <hannes@cmpxchg.org>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
 Chris Mason <mason@kernel.org>
References: <20261122-migrate_reclaim_deadlock-v1-0-83c56185b0fb@kernel.org>
 <20261122-migrate_reclaim_deadlock-v1-1-83c56185b0fb@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261122-migrate_reclaim_deadlock-v1-1-83c56185b0fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/22/26 1:42 PM, David Hildenbrand (Arm) wrote:
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

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
