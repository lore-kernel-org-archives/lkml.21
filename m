Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413060;
	b=jbE0Bgy4Xfe06H6OxVMSoRr8JsYo/E14HgRMTs+GZcfZgPZPDDmxIEVZ85Wrk9QaN69q
	 +CuUSCExq+24yZO/YozvEIi3ZNoveZj6pgcidmPGBaHdkp1YdVrF/+FKY56L7sDrvlhj4
	 b2yAxDlf6Tm1VrsWn3Uo+kGLY8ThBZPRWllNvFAiWf1ina32AVERzfHgiLDeoYOX/GH4o
	 j0JsEG1MRmitr6/HjLCuiyFLkV1DWoXSXOTMi16Corls+CXoQ+FntCchWJwwlJ1nqVA4K
	 0C7Kk1UQl6ZFX1Xa3UddpjykQScnPcaIJrISqZp5vZ/pNCXWY0mwiNtHP7S2/GOlz5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9LoY+tSrJ7sCY7J8WM2VzCr5CZRhhaYuqwIge0vQDCY=;
	b=2RJO4ABiCTUONHhZAaRgnsmdYyTYd8jcs9mJe2Bytb9a4RU+W4V1TCFIwvv3Okaa85nJ
	 uJPJQ3pslxgepNhTs5kVu0GG1I7UXyRXMxi7WQN1xCibhWh3d1RoDziMvkmd0o//cpxIS
	 CRxTzeybiUdwzNhDgtbOAmZPaulNpIFYewaWlQWeieAO0zAlnH37AomUkk5yjFOWodJiT
	 DYIBpzZjZ8/lPILHnC8X4ZybigIV3p/qijtuKQ5e9hbETbvXdidTjFtULR818Atma8Qs8
	 c86M+/qXaaGfzzZXtiOwibW3xIpAgyTjLCCbkxhQiuSoIe74sQrDo9WIaP0nWURQEHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvjIcASe;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4051606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4051606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvjIcASe
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso18943275ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413059; x=1796017859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9LoY+tSrJ7sCY7J8WM2VzCr5CZRhhaYuqwIge0vQDCY=;
        b=XvjIcASeTgKe9e5ade3hM3frgV/MMng5fKenY2jQ4tSlBOsEKPuhzT1wdrKKvLKoyl
         k8DWdkvA4QqRQAv7cxLrx1Pu5fTVb2mIMPIwvF5EVtRgDaeLcOPGTVpCqAJ5wOv9kooP
         Ee6r6xvFpuaCie1ocL/TKwLC3hPxCu7g0LQzurOUbJq+vWt2a3D0I+pkYGf2Jci5nmhB
         S1x1h9IDNFxJmWjzH15NVdee2epTbkgMH7vKSP/EgOXwC0oyacyQbABAx/m5ipqnTcyx
         8gFl0ImVIwM4UzzB9RVRSYH8mPsaO1eGzALNCrHzMSWTtMmw+j1mjWMs7hUtVVyqHMOe
         LjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413059; x=1796017859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LoY+tSrJ7sCY7J8WM2VzCr5CZRhhaYuqwIge0vQDCY=;
        b=cIo0ITRzqR0h+QX6LLdZhLV1MjecuMdSGz//EmdsHJSRP8SJQaJZj09YyZ9AZFjVPk
         85LWFhYIcEpbjRVLd1DS6doyRFvBP7/eCWRu/TAYPbGmckuPHwdNCLYDQoV8aJnGa7RA
         z2nnM0dpFIDmFcSZhvM3Gbza2zn9dlikTNdSCEy7XmVUA9vPseWIVdOP/DAkWc+UoZ4F
         rYICqfLQRF2y96iLAHW2KiwJ+hoBWgPWYSehhqsLDM2LnVIWVyPP0CJvVxz/nIkxDIqL
         EFjHOVYyhMcOR7ppoH2Jfo0ksbM9gi1XebzCv13pgwMSlflKpb2Sf6P5t5wrRjOVCBoI
         NJ4A==
X-Forwarded-Encrypted: i=1; AL+hErEtKo+f+W0RMvkCfeWupU2/zy06G7Wxm6+9bsr59y5fvs9FdWvjAXQocoiYdqmnmYGVoLC2a/sU6Nts4Js=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4M0pZbuah6MQ8AKiaE/JdA2p/9ZKM+0/oFoiNObDEG64N0Vad
	V+mXyxN7JzHkggmWe5YfMJJ5VMtIUoMkzbzF9104XZ0bGRTEHjfJsEuB
X-Gm-Gg: AZFdTZfJ2qOAknDkot0O2s5mIa9znk/7Y+7eCzinjIOzPrkkxH+DXPpYGsOrqHTVZ5C
	jeJPXTqSXbXmuEyCYn123IJACRsQD/qMNiSS3WALHI4da8+kd/h05PR51JgVOTH4PHZFZgmiWIz
	Nc5LaZK8Cb7ZGK0y+lC0pefZzGCOAQIHYMc1JIzQzTSzOpJRgWW1uu8nS3f4dovDtW1cg0SR9Ly
	4Yz4p2YEfvSYSuBCNHEIrvvKoR4tgJ9wVIJDkaIavaxDA/kUav0pjSKcWtYwa95qg5N6I+hUHUa
	idiBwP/sJK2aKIiGdFQ6n0lxiXO5EzCwwCPrQ14ny+DY4Ow2QVw4t/wme4LJXzEokp4Yy1g/gmZ
	WkUWswtDdiWVg3NiwbfZkmh98dnw6WRwvXP0Shl2esbFszt35rmndJ2DagKKqsa14qXN2sKAB03
	aA/4u79Sqdoa8RCfphJyZSG7pSccmnr/uXTVknL8EPPG2dkEORUmiJTy9wjNoarZUcFp6sBNv3u
	Gb3ZsKTmmrq+cSCPLdunEDHsLZB0UiN8zBFVyH9M7k6FAzvWV1e7Fo7cq0ipRBFTwEFeCq7fLbg
	BjW77d1L9g7ET8jb/kR8BGe1a1OzRLs3SjFawHpS
X-Received: by 2002:a17:902:d550:b0:2f0:1c03:be13 with SMTP id d9443c01a7336-2f031fc8f58mr87133025ad.29.1795413059026;
        Sun, 22 Nov 2026 21:50:59 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm45533655ad.3.2026.11.22.21.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:50:58 -0800 (PST)
Date: Mon, 23 Nov 2026 14:50:56 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: ernest.borowski.git@proton.me
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Baolin Liu <liubaolin12138@163.com>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng1024@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 6/7] ntfs: zero new delalloc clusters even when writeback
 allocates them
Message-ID: <awPUQP3VxjqgW9Lf@hyunchul-PC02>
References: <20261122-b4-ntfs-delalloc-fixes-v1-0-0726f0dce403@proton.me>
 <20261122-b4-ntfs-delalloc-fixes-v1-6-0726f0dce403@proton.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261122-b4-ntfs-delalloc-fixes-v1-6-0726f0dce403@proton.me>

On Sun, Nov 22, 2026 at 07:19:42PM +0100, Ernest Borowski via B4 Relay wrote:
> From: Ernest Borowski <ernest.borowski.git@proton.me>
> 
> When a buffered write starts or ends inside a cluster that is a hole,
> ntfs_write_simple_iomap_begin_non_resident() turns the hole into an
> LCN_DELALLOC run and then zeroes the part of the first and last cluster
> that the write does not cover, in the page cache, so that writeback
> writes whole clusters.  initialized_size already covers that part, and
> the clusters writeback allocates are not zeroed on disk.
> 
> The zeroing runs after mrec_lock and the runlist lock are dropped, and
> its ->iomap_valid() check, ntfs_iomap_valid(), calls the mapping stale
> as soon as the run is no longer delalloc.  Writeback that runs meanwhile
> (the background flusher, or FIEMAP_FLAG_SYNC and sync_file_range(),
> which do not take the inode lock) picks up the folios that were zeroed
> first, and ntfs_attr_map_cluster() allocates the whole delalloc run for
> them.  iomap_zero_range() then stops with -EPERM from
> ntfs_zero_read_iomap_end(), which the caller ignores.  The rest of the
> cluster is neither in the page cache nor on disk, so reads return what
> the reallocated clusters held before: data of deleted or truncated files.
> 
> Reproducer: fill a file, fsync, truncate it to 0 and back up, then write
> small pieces at unaligned offsets into the holes while other threads
> call FIEMAP with FIEMAP_FLAG_SYNC.  With 4 KiB and 64 KiB clusters the
> old contents show up within seconds, also without the FIEMAP threads.
> 
> The validity check was there to keep the zeroing from overwriting data
> that an mmap write put into the new cluster in that window.  Hold the
> invalidate lock across ->iomap_begin() of a buffered write instead,
> which keeps page faults out from the moment the hole becomes delalloc
> until it is zeroed, and zero with the plain seek mapping, which zeroes
> delalloc and mapped ranges alike, so that writeback allocating the run
> no longer matters.  The error path of ->iomap_begin() now runs with the
> invalidate lock held.
> 
> Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ernest Borowski <ernest.borowski.git@proton.me>
> ---
>  fs/ntfs/iomap.c | 127 ++++++++++++++++++++++++--------------------------------
>  1 file changed, 55 insertions(+), 72 deletions(-)
> 
> diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
> index 1909824c30..fd94d4b34f 100644
> --- a/fs/ntfs/iomap.c
> +++ b/fs/ntfs/iomap.c
> @@ -297,39 +297,6 @@ static int ntfs_read_iomap_end(struct inode *inode, loff_t pos, loff_t length,
>  DEFINE_IOMAP_ITER_NEXT_END(ntfs_read_iomap_next, ntfs_read_iomap_begin,
>  		ntfs_read_iomap_end);
>  
> -/*
> - * Check that the cached iomap still matches the NTFS runlist before
> - * iomap_zero_range() is called. if the runlist changes while iomap is
> - * iterating a cached iomap, iomap_zero_range() may overwrite folios
> - * that have been already written with valid data.
> - */
> -static bool ntfs_iomap_valid(struct inode *inode, const struct iomap *iomap)
> -{
> -	struct ntfs_inode *ni = NTFS_I(inode);
> -	struct runlist_element *rl;
> -	s64 vcn, lcn;
> -
> -	if (!NInoNonResident(ni))
> -		return false;
> -
> -	vcn = iomap->offset >> ni->vol->cluster_size_bits;
> -
> -	down_read(&ni->runlist.lock);
> -	rl = __ntfs_attr_find_vcn_nolock(&ni->runlist, vcn);
> -	if (IS_ERR(rl)) {
> -		up_read(&ni->runlist.lock);
> -		return false;
> -	}
> -	lcn = ntfs_rl_vcn_to_lcn(rl, vcn);
> -	up_read(&ni->runlist.lock);
> -	return lcn == LCN_DELALLOC;
> -}
> -
> -static const struct iomap_write_ops ntfs_zero_iomap_folio_ops = {
> -	.put_folio = ntfs_iomap_put_folio,
> -	.iomap_valid = ntfs_iomap_valid,
> -};
> -
>  static int ntfs_seek_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>  		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
>  {
> @@ -337,17 +304,6 @@ static int ntfs_seek_iomap_begin(struct inode *inode, loff_t offset, loff_t leng
>  			srcmap, false, false);
>  }
>  
> -static int ntfs_zero_read_iomap_end(struct inode *inode, loff_t pos, loff_t length,
> -		ssize_t written, unsigned int flags, struct iomap *iomap)
> -{
> -	if ((flags & IOMAP_ZERO) && (iomap->flags & IOMAP_F_STALE))
> -		return -EPERM;
> -	return written;
> -}
> -
> -static DEFINE_IOMAP_ITER_NEXT_END(ntfs_zero_read_iomap_next,
> -		ntfs_seek_iomap_begin, ntfs_zero_read_iomap_end);
> -
>  DEFINE_IOMAP_ITER_NEXT(ntfs_seek_iomap_next, ntfs_seek_iomap_begin);
>  
>  int ntfs_dio_zero_range(struct inode *inode, loff_t offset, loff_t length)
> @@ -362,19 +318,28 @@ int ntfs_dio_zero_range(struct inode *inode, loff_t offset, loff_t length)
>  				     BLKDEV_ZERO_NOUNMAP);
>  }
>  
> +/*
> + * Zero the part of a new delalloc cluster that the buffered write does not
> + * cover, in the page cache, so that writeback writes the whole cluster.
> + * Writeback can allocate the delalloc run while this runs (the folios
> + * zeroed first are dirty), so the zeroing must not depend on the mapping
> + * staying delalloc: iomap_zero_range() zeroes delalloc and mapped ranges
> + * alike.  The caller holds the invalidate lock, which keeps page faults
> + * from putting data into the cluster meanwhile.
> + */
>  static int ntfs_zero_range(struct inode *inode, loff_t offset, loff_t length)
>  {
> -	return iomap_zero_range(inode,
> -				offset, length,
> -				NULL,
> -				ntfs_zero_read_iomap_next,
> -				&ntfs_zero_iomap_folio_ops,
> +	lockdep_assert_held_write(&inode->i_mapping->invalidate_lock);
> +
> +	return iomap_zero_range(inode, offset, length, NULL,
> +				ntfs_seek_iomap_next, &ntfs_iomap_folio_ops,
>  				NULL);
>  }
>  
> -static void ntfs_write_delalloc_release(struct inode *inode, loff_t pos,
> -					loff_t length, ssize_t written,
> -					unsigned int flags, struct iomap *iomap);
> +static void __ntfs_write_delalloc_release(struct inode *inode, loff_t pos,
> +					  loff_t length, ssize_t written,
> +					  unsigned int flags,
> +					  struct iomap *iomap);
>  
>  static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_t offset,
>  						      loff_t length, struct iomap *iomap)
> @@ -528,8 +493,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
>  							      z_start,
>  							      z_end - z_start);
>  			}
> -			if ((!err || err == -EPERM) &&
> -			    max_clu_count > 1 &&
> +			if (!err && max_clu_count > 1 &&
>  			    (iomap->length & vol->cluster_size_mask &&
>  			     end < ni->initialized_size)) {
>  				loff_t z_start, z_end;
> @@ -544,16 +508,15 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
>  							      z_end - z_start);
>  			}
>  
> -			if (err == -EPERM)
> -				err = 0;
>  			if (err) {
>  				/*
>  				 * Nothing will be copied: drop the delalloc
>  				 * clusters that no zeroed folio covers.
>  				 */
> -				ntfs_write_delalloc_release(inode, offset,
> -							    iomap->length, 0,
> -							    IOMAP_WRITE, iomap);
> +				__ntfs_write_delalloc_release(inode, offset,
> +							      iomap->length, 0,
> +							      IOMAP_WRITE,
> +							      iomap);
>  				return err;
>  			}
>  		}
> @@ -721,16 +684,27 @@ static int ntfs_write_iomap_begin_non_resident(struct inode *inode, loff_t offse
>  	struct ntfs_inode *mrec_ni = ntfs_inode_is_named_stream(ni) ?
>  			ntfs_base_inode(ni) : ni;
>  
> -	mutex_lock(&mrec_ni->mrec_lock);
> +	if (ntfs_iomap_flags & NTFS_IOMAP_FLAGS_BEGIN) {
> +		int err;
>  
> -	if (ntfs_iomap_flags & NTFS_IOMAP_FLAGS_BEGIN)
> -		return  ntfs_write_simple_iomap_begin_non_resident(inode, offset,
> -								   length, iomap);
> -	else
> -		return ntfs_write_da_iomap_begin_non_resident(inode,
> -							      offset, length,
> -							      flags, iomap,
> -							      ntfs_iomap_flags);
> +		/*
> +		 * A hole becomes delalloc here and the rest of its partial
> +		 * clusters is zeroed after the locks below are dropped: keep
> +		 * page faults, which could write into those clusters, out
> +		 * until then.
> +		 */
> +		filemap_invalidate_lock(inode->i_mapping);
> +		mutex_lock(&mrec_ni->mrec_lock);
> +		err = ntfs_write_simple_iomap_begin_non_resident(inode, offset,
> +								 length, iomap);
> +		filemap_invalidate_unlock(inode->i_mapping);

Could the buffered-write iomap become stale after this unlock but before
the data is copied?

For example, suppose a buffered write obtains an IOMAP_DEALLOC mapping
for a hole. After the unlock, a mmap write can allocate the cluster
and write another byte in the same block. If that foilo is written back
and reclaimed before the buffered write resumes, the buffered write
still uses its old IOMAP_DEALLOC iomap. __iomap_write_begin() can zero
the rest of the block instead of reading the mmap data from disk.

> +		return err;
> +	}
> +
> +	mutex_lock(&mrec_ni->mrec_lock);
> +	return ntfs_write_da_iomap_begin_non_resident(inode, offset, length,
> +						      flags, iomap,
> +						      ntfs_iomap_flags);
>  }
>  
>  static int __ntfs_write_iomap_begin(struct inode *inode, loff_t offset,
> @@ -802,9 +776,10 @@ static void ntfs_write_delalloc_punch(struct inode *inode, loff_t offset,
>   * Punch them out again, keeping every cluster that has dirty data in the
>   * page cache.
>   */
> -static void ntfs_write_delalloc_release(struct inode *inode, loff_t pos,
> -					loff_t length, ssize_t written,
> -					unsigned int flags, struct iomap *iomap)
> +static void __ntfs_write_delalloc_release(struct inode *inode, loff_t pos,
> +					  loff_t length, ssize_t written,
> +					  unsigned int flags,
> +					  struct iomap *iomap)
>  {
>  	struct ntfs_volume *vol = NTFS_I(inode)->vol;
>  	loff_t start_byte, end_byte;
> @@ -821,9 +796,17 @@ static void ntfs_write_delalloc_release(struct inode *inode, loff_t pos,
>  	if (start_byte >= end_byte)
>  		return;
>  
> -	filemap_invalidate_lock(inode->i_mapping);
>  	iomap_write_delalloc_release(inode, start_byte, end_byte, flags, iomap,
>  				     ntfs_write_delalloc_punch);
> +}
> +
> +static void ntfs_write_delalloc_release(struct inode *inode, loff_t pos,
> +					loff_t length, ssize_t written,
> +					unsigned int flags, struct iomap *iomap)
> +{
> +	filemap_invalidate_lock(inode->i_mapping);
> +	__ntfs_write_delalloc_release(inode, pos, length, written, flags,
> +				      iomap);
>  	filemap_invalidate_unlock(inode->i_mapping);
>  }
>  
> 
> -- 
> 2.56.1
> 
> 

-- 
Thanks,
Hyunchul
