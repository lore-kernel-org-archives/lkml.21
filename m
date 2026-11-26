Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675561;
	b=ilpBVj1RxFei/71lmpr6HoImgte4S+Jtlwa2WTO6nAX2ssdXXyG5XXWEiPv4P+oN28UF
	 oiT43IEzuqZmKRRL1STmVsCch00iQd9Xd5N9SDfsqinGiTPLOPCYk9v8S9pbtJ1d5jLEY
	 QYxIl3cSS3/FsjvVTG+DXa/GUBWM4mjqgJ7/g6O35SeBZVxOWWyglAkKKgpnH4C9KoeCG
	 ER8zJozVV+2CfNPU/BtJE//Jn6dr5nvP+nHCr0PzPXqj7UHEOdkP67RwbTSqlu2i9qm99
	 RhDl+//U3zEp3OuwtEYBNKu48hoJ2OCV2TgXcDCSNCJMkyUVQ7NhclfxG/4v/ZB38xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675561;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=+b7d3jVJ5W7Nxl0PqQTy3RSOU74Z82xEac1ynjpgAMw=;
	b=YUKnoTwchgfzLhee2ljBoN0qYH1h4f/NtjWf+Yblv686cJVgV2Q2ZPr5rP8/ydkSlEcS
	 Byhba/Nu4ZYqMya+TOGptD/ovYFFRrAWNMjZJgtS3qhRXqQYUGTGSCXu+yaQmTjHJn/8P
	 Ax/VT7T5m7WLXyoNQKpbqfOXEXBKZE/p0u4Hu3jNBUMYs9RFWwPsMJ64MCdim1NDFWRvl
	 WU0mORSZqradFQtvw4u0QmnYbCrvIia/X9/gh6h9VEF1zTQ6I49gTvSkaHWtWSbwLEWiW
	 RsA6lFDnAQtr/1IAhCO4w3jvnsF8WwTp88UoOzqvroO4cBPLZ3ongXUe0Rw/gDZ9PTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=eahZGV4n;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C100606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C100606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=eahZGV4n
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+b7d3jVJ5W7Nxl0PqQTy3RSOU74Z82xEac1ynjpgAMw=;
	b=eahZGV4n8rqGAn5XdtRwzvENxShQaPxCzdbRQvsMPhSY5h4M5ip6/l3NWTDRYq28rGl1fWEf3
	4f1KZE18N/48S5wnghtS9YGCoVDqYP6GNjyfW+Fje+/K62DVykmIQfWub1J+MystJIzcMK1aOYf
	grajgcECOhGCt6xvTJd9fH4=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jZn9l4ScJz1ps90;
	Thu, 26 Nov 2026 14:45:31 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 313F14057D;
	Thu, 26 Nov 2026 14:45:49 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 14:45:48 +0800
Message-ID: <12c5bdb8-6d80-4d4b-9c40-14fabb7e4874@huawei.com>
Date: Thu, 26 Nov 2026 14:45:47 +0800
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
Subject: Re: [PATCH v3 3/3] fs/resctrl: Allocate
 rdt_l3_mon_domain::rmid_busy_llc using kvzalloc_objs()
To: Ben Horgan <ben.horgan@arm.com>
CC: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <x86@kernel.org>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<fenghuay@nvidia.com>, <bp@alien8.de>, <linux-kernel@vger.kernel.org>
References: <20261125164753.3759904-1-ben.horgan@arm.com>
 <20261125164753.3759904-4-ben.horgan@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261125164753.3759904-4-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/26 0:47, Ben Horgan 写道:
> The bitmap rdt_l3_mon_domain::rmid_busy_llc has
> resctrl_arch_system_num_rmid_idx() entries.  On an MPAM system this is the
> number of PARTIDs multiplied by the number of PMGs. The maximum possible number
> of PARTIDs is 0x10000 and the maximum number of PMGs is 0x100. On a system
> approaching these limits the kmalloc() based allocation will consistently fail
> and hence fail to bring the monitor domain online.
> 
> As there is no equivalent to bitmap_zalloc() that uses kvmalloc() or vmalloc(),
> open code the allocation of rmid_busy_llc using kvzalloc_objs() so that large
> allocations fall back to vmalloc().
> 
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  fs/resctrl/rdtgroup.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index c55f125ce9a1..a8eebb5a5c4b 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4503,7 +4503,7 @@ static void domain_destroy_l3_mon_state(struct rdt_l3_mon_domain *d)
>  	int idx;
>  
>  	kvfree(d->cntr_cfg);
> -	bitmap_free(d->rmid_busy_llc);
> +	kvfree(d->rmid_busy_llc);
>  	for_each_mbm_idx(idx) {
>  		kvfree(d->mbm_states[idx]);
>  		d->mbm_states[idx] = NULL;
> @@ -4624,7 +4624,7 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
>  	int idx;
>  
>  	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
> -		d->rmid_busy_llc = bitmap_zalloc(idx_limit, GFP_KERNEL);
> +		d->rmid_busy_llc = kvzalloc_objs(unsigned long, BITS_TO_LONGS(idx_limit));


LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  		if (!d->rmid_busy_llc)
>  			return -ENOMEM;
>  	}
> @@ -4646,7 +4646,7 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
>  
>  	return 0;
>  cleanup:
> -	bitmap_free(d->rmid_busy_llc);
> +	kvfree(d->rmid_busy_llc);
>  	for_each_mbm_idx(idx) {
>  		kvfree(d->mbm_states[idx]);
>  		d->mbm_states[idx] = NULL;

