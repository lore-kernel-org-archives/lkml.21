Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675187;
	b=C/X2TU37mlthEXFKcft3qpoCErXdxuW1aKQY3Qfo3hPptSpKk68tZlryO0qbIOPwk9nE
	 LglmjKFXsBNhKbj6fqMCeaSSdCL5gQd4E8iIk88MiQgIKBCpmMlre3j/TkpOEqOSwVaV+
	 quk99nO8Lh24amQ9E4ux21F2fI3BDgXepfQITF8nF/fdH+SXCd7i2pyoyotgMqe4Ds6lY
	 XELwEWNq/iY9wE8zV3RrARqOXnYAOxsZaoGg69gw3iZNss3tN+vd3mEkrKqvpE5wLxoTq
	 zG1yGcTd4GxaDOHzmuDEKWf0vD2pkRj71nergglX/xiO0nsSiDK4+OeFFXbh9itAP0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675187;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=9mvYYnPqm/4gRgTe4WiNpA1tax3PUjsLe+LYnstNlcs=;
	b=B8Q43c2HHxQJam1ghd2MvOtGjLkFxrGS5f+5FxeV+xZssPaHmUf7NR0rhPQzxMblgD6M
	 1lFXPo40bSjO9lGyKIr0zlNxXuLqb/z+R/AeZO7Nb4Ev71UJ9ttzazv5/G5PYD0XZMg4d
	 vaXQWEk/UbXnjGYkolVDLGG4SfgP152AWyOFPW2Q/IfNClcYqg7Yn6d34E9XuOg+0AOX7
	 +GKS4sl7KErHwTrhAezc5wpyS2ZFkizjtYoY/Fx8V1aiIyfQbugntnOLhxuPCEYHXudfo
	 iM8jaU94tCY5o73dlquu7hr3OIZ5mcSyXQjAbDp9LMtpvnd7+uONyeW9ti486G+6NfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tOl2tVhM;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AAE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14AAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tOl2tVhM
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9mvYYnPqm/4gRgTe4WiNpA1tax3PUjsLe+LYnstNlcs=;
	b=tOl2tVhMt2k2PmBHUmLtVDIZX4DpxHLE72bacjUd3vX41CkY+8gIbap5vf9bM1PXnhCPc4Z52
	vBEtreIdkeWJlyQUGUsK+e/Den8NUpLLKJhLo9EamnwcDILHX6u3q6SL9REkQmc3DGt84WXEXhe
	Qrg2YdJ0PrDjdozJ1shjQq0=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jZn2X4kT9zLlTW;
	Thu, 26 Nov 2026 14:39:16 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 20E9440563;
	Thu, 26 Nov 2026 14:39:41 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 14:39:40 +0800
Message-ID: <70b45cc0-b888-4315-8fdd-6d6bc6a4e433@huawei.com>
Date: Thu, 26 Nov 2026 14:39:39 +0800
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
Subject: Re: [PATCH v3 1/3] fs/resctrl: Allocate rmid_ptrs[] using
 kvzalloc_objs()
To: Ben Horgan <ben.horgan@arm.com>
CC: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <x86@kernel.org>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<fenghuay@nvidia.com>, <bp@alien8.de>, <linux-kernel@vger.kernel.org>
References: <20261125164753.3759904-1-ben.horgan@arm.com>
 <20261125164753.3759904-2-ben.horgan@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261125164753.3759904-2-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/26 0:47, Ben Horgan 写道:
> On an MPAM system the number of entries in rmid_ptrs[] is the number of PARTIDs
> multiplied by the number of PMGs. The maximum possible number of PARTIDs is
> 0x10000 and the maximum number of PMGs is 0x100. On a system pushing the limits
> of the MPAM specification this can be large enough to consistently fail the
> kzalloc_objs() allocation and hence fail to mount the resctrl filesystem.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> Switch to allocating rmid_ptrs[] using kvzalloc_objs() so that large allocations
> fall back to vmalloc().
> 
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---
> I found this by testing the extremes of a software model and don't expect this
> to effect real systems.
> ---
>  fs/resctrl/monitor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 04e4ea612b7c..9c383abfbbe0 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -979,7 +979,7 @@ int setup_rmid_lru_list(void)
>  		return 0;
>  
>  	idx_limit = resctrl_arch_system_num_rmid_idx();
> -	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
> +	rmid_ptrs = kvzalloc_objs(struct rmid_entry, idx_limit);
>  	if (!rmid_ptrs)
>  		return -ENOMEM;
>  
> @@ -1010,7 +1010,7 @@ void free_rmid_lru_list(void)
>  		return;
>  
>  	mutex_lock(&rdtgroup_mutex);
> -	kfree(rmid_ptrs);
> +	kvfree(rmid_ptrs);
>  	rmid_ptrs = NULL;
>  	mutex_unlock(&rdtgroup_mutex);
>  }

