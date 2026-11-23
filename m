Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421429;
	b=CxJ8ka3TqwjOHTmdiu7/Wslj2v/klqqEA1D6W+r7YFeml+nwMDlXgszubiOwh3OIF0F3
	 no5+VJ3keAq6xwqxGY4/10an9Klounh5kSZImjNn5rWxO/vO2i48MN+vo3bFxfISaaqo7
	 pRFl7SnHONKRm2EsNo/XdQMo26SiKllyfJs8+UZ/ZPamkMVBV9TEf2vO7CfqFh5KKBL85
	 /16VOShZS28hy9Rv2iH9MWwRI7ShKM2ZYy9Z9BwkpyHrdgO0ocPz/Efx7z1OHpfqQGRfC
	 mYEyenp6wIzIutbA+3ZVLsO7oNjuqql7XqVgNe1rA1p7DO642FqiILNHki86gY9xPHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421429;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=io+R8nylQ8N0ce8qGKxvEayHLfY/AXHUCgLh+o2geRg=;
	b=Gv96ywpC9RshtNkuEyCd7ySYNPW7MmB1agr5ozSoboVndhlXNQIzvnPEan/K/aOpJlt2
	 RJhj2VLVXjQm56WsaXeA6Qntrtf2BosTeeJGiIdmldMe8dj/zFNQftIUU2SR0GYt3Nd88
	 z4ugm/rlY/Z5a1Y4IXw7aXJc4NEbPVUDDc+XrXYCJOKx1n1Z6isuNys0dSqiKKhCJgFI9
	 J90+BFlovbJVvU+88ybnJtbBrxDlh5XrfEQTpySTd1eejAbMBOQ4warp/69/T7VJrjNP/
	 MOlP1VX6j+SJ0JT/7+WtK3NFdnWzZ9CUhbxmluEdwLF+FmOLphg5+SQlviEfwIPQ7yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=IHSEhhcg;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0B6606A69D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC0B6606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=IHSEhhcg
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795421424; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=io+R8nylQ8N0ce8qGKxvEayHLfY/AXHUCgLh+o2geRg=;
	b=IHSEhhcgCZ4Bn+McOMh92hqkq0f57qEDQmFF+uqYx3hxHrWLfLYCLuU0toydHwbFeY//svnP3ijkWaIym+ln9TNgp3lPCt2DEDLHBBSZlp+nxkxlPGySsx4NSD7dNiQTVz+GRP1BoEGadgm2DsTnqSkYcOSOc9bYtEJdMwGHYPY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0XFFKcI._1795421422;
Received: from 30.74.144.153(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XFFKcI._1795421422 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 23 Nov 2026 16:10:23 +0800
Message-ID: <8ff56e5a-498e-44df-9548-604909d4b84d@linux.alibaba.com>
Date: Mon, 23 Nov 2026 16:10:22 +0800
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
Subject: Re: [PATCH v2 1/1] mm/shmem: don't use the memcg of an uncharged
 folio
To: Chris Mason <mason@kernel.org>, hughd@google.com, david@kernel.org,
 akpm@linux-foundation.org, qi.zheng@linux.dev, qinyuntan@linux.alibaba.com,
 shakeel.butt@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261120195057.50031-1-mason@kernel.org>
 <20261120195057.50031-2-mason@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261120195057.50031-2-mason@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/21/26 3:50 AM, Chris Mason wrote:
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
> 
> Fix it by keeping the original objcg around while the inode is isolated.
> 
> Fixes: 743e7d025d2f ("mm: shmem: make unused huge shrinker memcg aware")
> Suggested-by: Qi Zheng <qi.zheng@linux.dev>
> Signed-off-by: Chris Mason <mason@kernel.org>
> ---

Good catch. LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
