Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.234
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158650;
	b=AaGkniKJ//HjIW0R3C8Vp0Q+MO5JfncIzW5sBUJjdKJ90wJj74E5UZ1kk59kjmMjCQqP
	 O7ByKpe8fjr21J9RI07s2mMa2cOtKeURrt5bjTbH7wyKpBoKXETxFdaDRuAr1ICqIP+Bt
	 4/EifcdYncU1TQX3nM9m3722h1wcAj1+YNJPIMyuUBYPFHfKVYjh6Epz6fCZaEwQMdjpd
	 EseDkSvH9xAqdhMkFBzv4DwSGCchry1RJWz56SCfzcOaAijiBrVYiCHWpsrGZdMnDqeiS
	 /3nsCV3BG7C0EyFv5LWK+C0LlLN9MdVt35M5Mz//D8IYrg0kD7V1ig5+4lbAPGlscSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158650;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rrVjR0ldF5os90khgV8tI+gBuMvnvIaz6fwAZEMSvyY=;
	b=i95A9QxBKTNU2oLvlnky8Inke7Qb62zehscZpOm0sJDJJEbc6b82jufb3GatnbmMl5MF
	 1/GyHJcc36pAmZXfd+68M+m5S59vxjCPO1OtZlUrOMXjexRSs6XUFwb7ZN9UTdpQVavV1
	 4gNIph/AteDM86vdFQnMxypWzhBlrkx3P62fTWFqAgtJJqYk1wLyIBpPeI2oxcbW1ZdRz
	 yPu0v5RF0Q96hjAPgjyxzR4Sz8xbiW6FKl8rv90hs6rZ/brUOs4BCTm92Ry9NfHrzQQPH
	 /6q57f89Myq4wzBjAkrUbHvwm2VEIhbxH4+RuRfUfPmEE1yIifa73x7P8oGejJRwkjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QMGPSX+H;
	arc=none smtp.remote-ip=95.215.58.234
Received: from mta1.migadu.com (out-234.mta1.migadu.com [95.215.58.234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB664606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB664606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QMGPSX+H
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=iXadPTuzEyYGK17GU1F26gUUhQt7mhcJQzKvAe1cH3A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795158647; v=1; x=1795763447;
 b=QMGPSX+HicDdod/qSRxo4k02P1uQff7lv/obQSFKKcivGcs8NZiHqFJJdR4DT/77ERiNZHOO
 miGrQ6btjiKZeWbdUxbHD/tnVlEruLqsh1PkutDa6rZu3fPykELid5nXKmXHIhR38CGa5/LqV9U
 DyQcmRqdZLXabyl17V4NaiwU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8e21a47625769387;
	Fri, 20 Nov 2026 07:10:44 +0000
X-Mizu-Trace-ID: 8e21a47625769387
X-Migadu-Flow: FLOW_OUT
Message-ID: <73a452ad-4346-4f77-a2f6-4c801562c050@linux.dev>
Date: Fri, 20 Nov 2026 15:10:36 +0800
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
Subject: Re: [PATCH 1/1] mm/shmem: don't use the memcg of an uncharged folio
To: Chris Mason <mason@kernel.org>, hughd@google.com, david@kernel.org,
 baolin.wang@linux.alibaba.com, akpm@linux-foundation.org,
 qinyuntan@linux.alibaba.com, shakeel.butt@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261119193656.88678-1-mason@kernel.org>
 <20261119193656.88678-2-mason@kernel.org>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261119193656.88678-2-mason@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/26 3:36 AM, Chris Mason wrote:
> The shrinker for unused huge tmpfs folios can dereference a NULL memcg
> if it races with the migration of the folio at the end of a file.
> 
> folio_memcg_list_lru_alloc() assumes that folio_memcg() is never NULL.
> But it is NULL until the folio is charged, and a migration target can be
> in the page cache before charging.
> 
> shmem_unused_huge_shrink() looks the folio up without the folio lock,
> so we can race with migration:
> 
>      __migrate_folio()               shmem_unused_huge_shrink()
>      =================               ==========================
>      __folio_migrate_mapping()
>        xas_store(newfolio)
>                                      filemap_get_entry()
>                                        returns newfolio
>                                      folio_trylock() fails
>                                      shmem_unused_huge_requeue()
>                                        folio_memcg_list_lru_alloc()
>                                          folio_memcg() is NULL
>                                          memcg->kmemcg_id
>      folio_migrate_flags()
>        mem_cgroup_migrate()
>          commit_charge(newfolio)

Thanks for catching this!

Some nits below.

> 
> Fix it by keeping the original objcg around while the inode is isolated.
> 
> Fixes: 743e7d025d2f ("mm: shmem: make unused huge shrinker memcg aware")
> Signed-off-by: Chris Mason <mason@kernel.org>
> ---
>   mm/shmem.c | 29 ++++++++++++++++++++++-------
>   1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 10cef89b00b0..4465a43d6f74 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -758,6 +758,13 @@ shmem_unused_huge_alloc_lru(struct shmem_sb_info *sbinfo, struct folio *folio,
>   {
>   	int ret;
>   
> +	/*
> +	 * A migration target is in the page cache before it is charged. Once
> +	 * charged, its objcg can't change while we hold a folio reference.
> +	 */
> +	if (!mem_cgroup_disabled() && !folio_memcg_charged(folio))
> +		return ERR_PTR(-EAGAIN);
> +
>   	ret = folio_memcg_list_lru_alloc(folio, &sbinfo->shrinklist, gfp);
>   	if (ret)
>   		return ERR_PTR(ret);
> @@ -887,12 +894,11 @@ static enum lru_status shmem_unused_huge_isolate(struct list_head *item,
>   		return LRU_REMOVED;
>   	}
>   
> +	/* keep shrinklist_objcg, requeue may need it */
>   	list_lru_isolate(lru, item);
> -	objcg = shmem_get_and_clear_objcg(info);
>   	set_shmem_unused_huge_isolated(info);
>   	list_add_tail(&info->shrinklist, &scan->list);
>   	spin_unlock(&info->lock);
> -	obj_cgroup_put(objcg);
>   
>   	return LRU_REMOVED;
>   }
> @@ -928,32 +934,41 @@ static bool is_shmem_unused_huge_match(struct folio *folio,
>   static void shmem_unused_huge_drop(struct inode *inode)
>   {
>   	struct shmem_inode_info *info = SHMEM_I(inode);
> +	struct obj_cgroup *objcg;
>   
>   	spin_lock(&info->lock);
>   	list_del_init(&info->shrinklist);
> +	objcg = shmem_get_and_clear_objcg(info);
>   	spin_unlock(&info->lock);
> +
> +	obj_cgroup_put(objcg);
>   }
>   
>   static void shmem_unused_huge_requeue(struct inode *inode, struct folio *folio)
>   {
>   	struct shmem_inode_info *info = SHMEM_I(inode);
>   	struct shmem_sb_info *sbinfo = SHMEM_SB(inode->i_sb);
> -	struct obj_cgroup *objcg;
> +	struct obj_cgroup *objcg, *old_objcg;
>   	int nid = folio_nid(folio);
>   
>   	objcg = shmem_unused_huge_alloc_lru(sbinfo, folio, GFP_NOWAIT);
> -	if (IS_ERR(objcg)) {
> -		shmem_unused_huge_drop(inode);
> -		return;
> -	}

Maybe it's better to just return early in the failure path.

How about this:

+static void shmem_unused_huge_requeue_locked(struct shmem_inode_info *info,
+		struct shmem_sb_info *sbinfo, int nid)
+{
+	lockdep_assert_held(&info->lock);
+
+	list_del_init(&info->shrinklist);
+	shmem_unused_huge_lru_add(sbinfo, &info->shrinklist, nid,
+				  info->shrinklist_objcg);
+	info->shrinklist_nid = nid;
  }

  static void shmem_unused_huge_requeue(struct inode *inode, struct 
folio *folio)
@@ -943,17 +975,18 @@ static void shmem_unused_huge_requeue(struct inode 
*inode, struct folio *folio)

  	objcg = shmem_unused_huge_alloc_lru(sbinfo, folio, GFP_NOWAIT);
  	if (IS_ERR(objcg)) {
-		shmem_unused_huge_drop(inode);
+		spin_lock(&info->lock);
+		shmem_unused_huge_requeue_locked(info, sbinfo, nid);
+		spin_unlock(&info->lock);
  		return;
  	}

  	spin_lock(&info->lock);
-	/* Requeue the inode to shrinklist */
-	list_del_init(&info->shrinklist);
-	shmem_unused_huge_lru_add(sbinfo, &info->shrinklist, nid, objcg);
-	info->shrinklist_objcg = objcg;
-	info->shrinklist_nid = nid;
+	swap(info->shrinklist_objcg, objcg);
+	shmem_unused_huge_requeue_locked(info, sbinfo, nid);
  	spin_unlock(&info->lock);
+
+	obj_cgroup_put(objcg);
  }

Thanks,
Qi

>   
>   	spin_lock(&info->lock);
> +	old_objcg = shmem_get_and_clear_objcg(info);
> +	/* The lists for old_objcg exist, the inode was queued under it */
> +	if (IS_ERR(objcg)) {
> +		objcg = old_objcg;
> +		old_objcg = NULL;
> +	}
> +
>   	/* Requeue the inode to shrinklist */
>   	list_del_init(&info->shrinklist);
>   	shmem_unused_huge_lru_add(sbinfo, &info->shrinklist, nid, objcg);
>   	info->shrinklist_objcg = objcg;
>   	info->shrinklist_nid = nid;
>   	spin_unlock(&info->lock);
> +
> +	obj_cgroup_put(old_objcg);
>   }
>   
>   static unsigned long shmem_unused_huge_shrink(struct shmem_sb_info *sbinfo,

