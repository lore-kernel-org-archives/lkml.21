Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675404;
	b=lJtpRgImQKToVtAiaIqcXvxlXMYXJxOQJurcOjNJPjmEMABsJbvmiYCZ21gvJ9ercUOg
	 TjAZQHbtA+R9ZS+UV64rkK4+9JljT7+Rou3C92S9Pt/g85oq2BbGNf+kCkin0xN9OHFCK
	 r5NaBUc0i1qFOAgWaRg4Fuagq1dMLqXU33ZI6qjiOX+rnS7ui4/b5kPascqCr4FdXD2JN
	 iGDGNn6Y8jbyMAFfk48xZSiKHh+4dqPVupdKBvnHXQKA+fzb15p/7N5OJjSSqjOjMldKN
	 6gc0mZlE+ByehM/K047zmLmVa/3ts5TjNsFt5EPauKwVBQSQPMSj/9XyWA9+uBeJWgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675404;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=hyYv8jsheMChRIlTPySvEzCqXb+bzoALYrzIuClqamI=;
	b=1K9tvZiOveoC2RTGVrrRXEfLD5hLdFsRjoA9xXiiq84YU1RrAL6T1gqi94E7lvHXxoPH
	 VIuOgxB44SS2p88YClefy0gEMexyJsu+Qgtgyoh18TTfcv5mC3jd3DxmqrOCwAM8pNNJK
	 nwj/4uEewsdMZN5YZkfLO+dRAa8ymtJNlQQGvdgdRdhQTQSllB1UY+ZAlBMz03HxHSM/W
	 HB1ztH+kqmVgRu0TooSAH3Uu62zPy9IovkUpoTEHnsiOzCJlJed9lOQZnLKMuiudKBDkI
	 Luh95A/MiKiMr/qWRU/FTLtvee0TnKPyqwtE41lepNs8jpg+mxcTYrqFjkmR31iPirA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=HJkYipD0;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F94606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F94606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=HJkYipD0
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hyYv8jsheMChRIlTPySvEzCqXb+bzoALYrzIuClqamI=;
	b=HJkYipD00CKbqYItgxqmvIT7KCsM/QkT+yE3xbmqiitsLy4IDepWMxrlVHh/7RXdvSbOoW7RU
	TwCYlYIdI9dYA/JRRws8jgx1cdjaz/VhavRdRRJyC/lO6E6naRG8snIanb9Z4PzkmLai3R6Iwfs
	9SW+l8wVXn5EyzQcy0KZ/ck=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jZn6D5Lkkz1T4Fv;
	Thu, 26 Nov 2026 14:42:28 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BC07E40561;
	Thu, 26 Nov 2026 14:43:19 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 14:43:18 +0800
Message-ID: <4f28008c-d5a1-41eb-9066-ee368ebdc96d@huawei.com>
Date: Thu, 26 Nov 2026 14:43:18 +0800
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
Subject: Re: [PATCH v3 2/3] fs/resctrl: Allocate the arrays in struct
 rdt_l3_mon_domain using kvzalloc_objs()
To: Ben Horgan <ben.horgan@arm.com>
CC: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <x86@kernel.org>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<fenghuay@nvidia.com>, <bp@alien8.de>, <linux-kernel@vger.kernel.org>
References: <20261125164753.3759904-1-ben.horgan@arm.com>
 <20261125164753.3759904-3-ben.horgan@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261125164753.3759904-3-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/26 0:47, Ben Horgan 写道:
> Each element of rdt_l3_mon_domain::mbm_states[] has
> resctrl_arch_system_num_rmid_idx() entries.  On an MPAM system this is the
> number of PARTIDs multiplied by the number of PMGs. The maximum possible number
> of PARTIDs is 0x10000 and the maximum number of PMGs is 0x100. On a system
> approaching these limits the kmalloc() based allocation will consistently fail
> and hence fail to bring the monitor domain online.
> 
> The number of entries of rdt_l3_mon_domain::cntr_cfg is equal to the number of
> counters. On an MPAM system the maximum number of counters is 0x1000 and so
> potentially larger than a 4K page. Allocations of this size can benefit from the
> fallback to vmalloc() in kvmalloc().
> 
> Switch to allocating cntr_cfg and the elements of mbm_states[] using
> kvzalloc_objs() so that large allocations fall back to vmalloc().
> 
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  fs/resctrl/rdtgroup.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 57ab090072c2..c55f125ce9a1 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4502,10 +4502,10 @@ static void domain_destroy_l3_mon_state(struct rdt_l3_mon_domain *d)
>  {
>  	int idx;
>  
> -	kfree(d->cntr_cfg);
> +	kvfree(d->cntr_cfg);
>  	bitmap_free(d->rmid_busy_llc);
>  	for_each_mbm_idx(idx) {
> -		kfree(d->mbm_states[idx]);
> +		kvfree(d->mbm_states[idx]);
>  		d->mbm_states[idx] = NULL;
>  	}
>  }
> @@ -4620,7 +4620,6 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
>  static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_domain *d)
>  {
>  	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
> -	size_t tsize = sizeof(*d->mbm_states[0]);
>  	enum resctrl_event_id eventid;
>  	int idx;
>  
> @@ -4634,14 +4633,13 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
>  		if (!resctrl_is_mon_event_enabled(eventid))
>  			continue;
>  		idx = MBM_STATE_IDX(eventid);
> -		d->mbm_states[idx] = kcalloc(idx_limit, tsize, GFP_KERNEL);
> +		d->mbm_states[idx] = kvzalloc_objs(struct mbm_state, idx_limit);
>  		if (!d->mbm_states[idx])
>  			goto cleanup;
>  	}
>  
>  	if (resctrl_is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
> -		tsize = sizeof(*d->cntr_cfg);
> -		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
> +		d->cntr_cfg = kvzalloc_objs(struct mbm_cntr_cfg, r->mon.num_mbm_cntrs);

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  		if (!d->cntr_cfg)
>  			goto cleanup;
>  	}
> @@ -4650,7 +4648,7 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
>  cleanup:
>  	bitmap_free(d->rmid_busy_llc);
>  	for_each_mbm_idx(idx) {
> -		kfree(d->mbm_states[idx]);
> +		kvfree(d->mbm_states[idx]);
>  		d->mbm_states[idx] = NULL;
>  	}
>  

