Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400183;
	b=NKIqh+6DFUxIVvb0Vdl5bwxZMg86yTyxkpFejot8Gp5x0u961OeJ/5TnVea9rCyk7NIp
	 VcTDmLHQdFhEGRmy4yDCJ8clqvZ/3BlAG5PI8Wt7iEbHAYhFSZjL7kg0obbpgy9W/ELDY
	 wATIqnji226+uV3l8tm8bMrp6t8JDB1o75ZCBKf11Lwvx809FUYnf5ES0DVweSOBc+dZj
	 dfYf7Q5+ngGmIvcKNpGkIMm4eVdiNAmcTDaHFE4/E6MYSiQyxD26KO0PFIizcjdfdSV3F
	 DxsohUKTnG6SPLJ7P/SnwaVa5+ZbliipPTEWgZdi1bYX2AgEgv8/cKul5hnWJ35Vxfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6lRbJCOVU+DRb+wBjrdaaxkOGEdqJxji7R1nJ/0GyKk=;
	b=3FWpaKWkwo31Xbi8PDmued0nBnytPZw0aqNunxPUNDLWZGDbKwgicYcHQzz7NNCie+FU
	 NrVd/SCUVSsgMTYQVgER75T9NqcR2ShCashRjDnqkUNMY3pGgPChNSWOzAoLFd4khYeYv
	 BG1YUkFXErAOCZxMBr18q93IVUbNCQwXQfp2ujHNlAIS1mQ4+yd7UGdPdRp9CgBhBJEZD
	 0aRWWg/hN537dqYFt+PCAfMuA0eOO9RBo30IeDMLNhebiBuQuzMTQ0DcooXDspbpGWQW2
	 +AShB4MOjjiYcf8BrvZVexVBs/pa+f2GTRBtyudNjxhFUI27arxe8jYh4718AzHmOYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ktjBulC;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252A6606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252A6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ktjBulC
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38699cf08dfso2362888eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400182; x=1796004982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6lRbJCOVU+DRb+wBjrdaaxkOGEdqJxji7R1nJ/0GyKk=;
        b=0ktjBulCl7rwg6RKSCMutJ7O+ONUA5OUC4qyKwO3YoAaht/K9kCfPs/0Hxu7/vI2lW
         OSUFJHHDG0kZmNqxBklThvymoKfxKDYSM4MHL6IU+2B98dXO7gui2yzVUh9HWVcHE5b3
         ld6WiFXCvy4rTB+TySJO3YSeNAL4fVn5SzaFeaXx5mEcJ9sYm9BL4vRJVrwjnLLwlVXD
         YCyVOH5mwTysW179hutkZHT47Rneq+nV6eI77LA+OcithSNiKsAqNJqWN1tsW+CQgTf8
         t0bDYFEwhmLmbwFs/Y1KUcL3CbR1XoLuyroMuXbqiYgpBv75OimGZSrK6boIofzLfMtk
         Sr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400182; x=1796004982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lRbJCOVU+DRb+wBjrdaaxkOGEdqJxji7R1nJ/0GyKk=;
        b=PM980XAzk+QhXMWNhEHVBYWu89ap+JjbyjgONw9CIyuuaMTEi4xrK71IAONTpgYKsQ
         d8jPDNyOVdGRIMV6sekyEtG99TrF7EH2XLRmt6ELovFe6bR6IxgxHxSlLlkpVBB3j+sb
         s18h7b6tzZf5c1vw/4Cj7PK3kmmKTgpUbvWUc1hNxI29lNtQqHRTRQGwEawGQXZOIlCQ
         gQY2fv4/OoKfxhHm/4kyLj6jhZCtNLaaZiSyjduQuiIVcbRrr9B92RCXVF3Fg6UNS6nT
         6AiweZTsIJliu4GZdp7Pmk2V4OoUbwjlqbu79NHRqMEjiCQhkuZsdJeD9fN451KIMlGg
         KJEg==
X-Forwarded-Encrypted: i=1; AL+hErEda6UonI9NDArd56qglHw/V0UfB35aaBFGK1ht6F3leF6a5S9BlMx7vhSEqQXZ7JG0smJMp8QpmYE82a4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Le+SqLtZl5apLRNzHc/clm17joh4Fca2/mz1U9IGhcaty7+KP
	60nv6IjRknuxIQCejYe6Y4E/r9gOy/y6bfe9XRdlw7ArJbFc+LK97Ij8
X-Gm-Gg: AZFdTZesDLFYnkK9yD/OS/6cY9hTCyjYCFJfsnuj5ORLfqaS8n7AJLPlzeWZraiyq/g
	cR/d5igRy7X21fiG3Ws1Kq15v2VihztqVluClQdQ/MjhxcHGNDxePDQ2Xa2/BFMPT/Z5PeUuUTY
	GMEAwzKmOAAQ9BsNVZ5y9xnqHyfTzKhP1S9Z6FUAhi8ZUR34M15zE9W6jQ6uvZr2fFqJ20NViPC
	Ml2lm2QuSzCM9sWV5y7P6qgLnSNK2zLJpYWlQm2DO0DjsKl1l0xXjQJiD9kVwTqytctOV2WsWth
	uOW9uJ31g9AzPB5H0Z0PC1LVdrMIWaM2B0iVkeqdEekzoaRW5hDbRnPOdtJCIzmObOHS7P0779r
	PJfHYa762fvSa0KoNfiyldn3uvQZoknnWBDjwTwhjxDzJ5SGo6tQ0x5v2sUZbnVfMe0AT6fm9W1
	xy/mQqNZyvDn/dCziRdweEkMh4uIF+NIGxhNI7f/cy0mvIlGBSjfRRGnPBVWV7Dqku1L+rZ+EmR
	sGRNo6unN5shFgvJxAi1y4xg+mF91hW6JE1NQ2FdVRdmE+xMkjvfINdkLPAi1pBKSyW3TVnKzRS
	w35awT/qadJ1lv53yFs=
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr16658728eec.27.1795400182000;
        Sun, 22 Nov 2026 18:16:22 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm25726347eec.25.2026.11.22.18.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:16:20 -0800 (PST)
Date: Mon, 23 Nov 2026 11:16:17 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: ernest.borowski.git@proton.me
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Baolin Liu <liubaolin12138@163.com>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng1024@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/7] ntfs: release delalloc reservations cut off by
 truncate
Message-ID: <awOh8Zxdmg_-wKPg@hyunchul-PC02>
References: <20261122-b4-ntfs-delalloc-fixes-v1-0-0726f0dce403@proton.me>
 <20261122-b4-ntfs-delalloc-fixes-v1-1-0726f0dce403@proton.me>
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
In-Reply-To: <20261122-b4-ntfs-delalloc-fixes-v1-1-0726f0dce403@proton.me>

Hi Ernest,

On Sun, Nov 22, 2026 at 07:19:37PM +0100, Ernest Borowski via B4 Relay wrote:
> From: Ernest Borowski <ernest.borowski.git@proton.me>
> 
> A buffered write into a hole turns the hole into an LCN_DELALLOC run and
> reserves its clusters in vol->dirty_clusters
> (ntfs_write_simple_iomap_begin_non_resident()).  Writeback hands the
> reservation back when ntfs_cluster_alloc() allocates the run.
> 
> A truncate that cuts off delalloc runs before writeback drops their
> dirty folios, frees the clusters of the attribute with
> ntfs_cluster_free(), which skips everything that is not a real cluster,
> and removes the runs with ntfs_rl_truncate_nolock().  Nothing gives the
> reservation back, so the free space reported by statfs() and used by
> ntfs_available_clusters_count() shrinks by that many clusters until the
> volume is unmounted.  $Bitmap is not affected.
> 
> Workloads that rewrite files (open(O_TRUNC) + write) or truncate freshly
> written data lose free space quickly: a test that writes, truncates and
> punches holes in six 400 KiB files on a 128 MiB volume sees statfs()
> free space drop from 79 MB to zero in 80 seconds, after which writes
> fail with ENOSPC or come back short.  A 1 MiB buffered write followed by
> ftruncate(fd, 0) and sync leaves 256 (4 KiB) clusters reserved.
> 
> Release the reservation of the delalloc runs that the shrink cuts off,
> before the runlist is truncated.
> 
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ernest Borowski <ernest.borowski.git@proton.me>
> ---
>  fs/ntfs/attrib.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 6ee6b6bcac..4028c310fc 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -4383,6 +4383,37 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
>  	return 0;
>  }
>  
> +/*
> + * ntfs_release_delalloc_from - give back the reservation of delalloc runs
> + * @ni:		non-resident ntfs attribute whose runlist is about to be truncated
> + * @start_vcn:	first vcn that is cut off
> + *
> + * Delayed allocation reserves vol->dirty_clusters for every LCN_DELALLOC
> + * cluster when the buffered write is done and only gives it back when
> + * writeback allocates the clusters.  Runs cut off by a truncate never reach
> + * writeback (their dirty folios are dropped from the page cache), so their
> + * reservation has to be released here or it is lost until unmount.
> + *
> + * The runlist must be mapped completely and locked for writing.
> + */
> +static void ntfs_release_delalloc_from(struct ntfs_inode *ni, s64 start_vcn)
> +{
> +	struct runlist_element *rl = ni->runlist.rl;
> +	s64 nr = 0;
> +
> +	lockdep_assert_held_write(&ni->runlist.lock);
> +
> +	for (; rl && rl->length; rl++) {
> +		if (rl->lcn != LCN_DELALLOC || rl->vcn + rl->length <= start_vcn)
> +			continue;
> +		nr += rl->vcn + rl->length - max(rl->vcn, start_vcn);
> +	}
> +	if (!nr)
> +		return;
> +	ntfs_release_dirty_clusters(ni->vol, nr);
> +	ni->i_dealloc_clusters -= min_t(s64, nr, ni->i_dealloc_clusters);
> +}

If ntfs_cluster_alloc() succeeds for a LCN_DEALLOC run but the
subsequent kmemdup() in ntfs_attr_map_cluster() fails, the reservation
has already been substracted from dirty_clusters but LCN_DELLOC run
remains.

Is this planned to be addressed in part 2?

> +
>  /*
>   * ntfs_non_resident_attr_shrink - shrink a non-resident, open ntfs attribute
>   * @ni:		non-resident ntfs attribute to shrink
> @@ -4479,6 +4510,8 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
>  		}
>  		ntfs_attr_put_search_ctx(ctx);
>  
> +		ntfs_release_delalloc_from(ni, first_free_vcn);
> +
>  		/* Truncate the runlist itself. */
>  		if (ntfs_rl_truncate_nolock(vol, &ni->runlist, first_free_vcn)) {
>  			/*
> 
> -- 
> 2.56.1
> 
> 

-- 
Thanks,
Hyunchul
