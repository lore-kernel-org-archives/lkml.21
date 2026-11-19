Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074816;
	b=o0nVNymYOO8sgm4QCPFKmGgS+fkSxNXjbtCdfexj+u5Rn8DXy1lNxp1DkSh3VjitxB6Y
	 VtMoLe0EHnyXKl9GBNR8EW28M/zQsO3Zzo1kPEcEvTnFLs9sgu70/WKXfzNo4UQeXqlHO
	 Si+iW+Gw2KVSpl78GF3nBly9AKdhtt1dfDFAyrIAMaqh/Pptp5e/iEue+54fj5AGiM0vN
	 bsAxS43lzhL6wAUJnwFZNzRlt6EeVhGuw5fBRGQ3LL8gcBpEO0zTlEIZ/6WQJADX1oKAv
	 kRwr9uI7XrZPApBhYj7LthTxvFNSpdAcHzmbdc3oIW4wWOdK3t9eng3tS5K0OFjiBZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074816;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=svCkTJmi67bGpyjTeVwrk/HAS7or2C69yn8wnZKfPBM=;
	b=02BspOi2hQw0e4tNAfRFDBYArHu/avZOmsk9vHK6de+1Md7zhlDspZA0Jm8MRVwlXaDh
	 +aZ8Cr/Lusd2vBwGQ0BkVeExK7TF1G65F0pApsA7OM/jAXbXsUC2Qaie2zZUQ0kmGWpDu
	 6byH9MTx4kY4nCWKFszhbYSvbcLkbfUupKj9orjCr+iIu1AX5LUKpifqu397M/OltxIo9
	 PoJIf4yjU13FNIUKRHO7nLLiXawAU8th2wievTUcFWujGIX7Lakg8inrcSpcYUJLM6ncC
	 yhXYcD9q3SWfSEML+PU2MSJNIRFBTkZWX/9eJgBZxE6ZTFe5SsV9OWzBJpMVCRkg9Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RTJ0O5zM;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4911606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4911606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RTJ0O5zM
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=svCkTJmi67bGpyjTeVwrk/HAS7or2C69yn8wnZKfPBM=;
	b=RTJ0O5zMW6HPvK1dS0HZx3L10zxY1HuHoVLQNdx14WC4rsgm6sifTS2wBV/sAD9VPWj5yPijX
	fEsUBBRADC3768jbOYi0SLo19doEpJjmfHpseZgYm7GOadm8SB32YPe4zYqfQpGle1QBJUycVQi
	KG5i8Mk2I21S77Zsb2IhKYw=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jVW145W43zLlX8;
	Thu, 19 Nov 2026 15:53:12 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E624840563;
	Thu, 19 Nov 2026 15:53:32 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 15:53:32 +0800
Message-ID: <2f42e904-c295-4243-a714-d0767477819b@huawei.com>
Date: Thu, 19 Nov 2026 15:53:31 +0800
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
Subject: Re: [PATCH v3] irqchip/gic-v3-its: Size the collection table for all
 possible CPUs
To: Marc Zyngier <maz@kernel.org>, Zenghui Yu <zenghui.yu@linux.dev>
CC: <tglx@kernel.org>, <radu@rendec.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261118025106.623070-1-ruanjinjie@huawei.com>
 <9751bd2c-897c-433c-a4da-5ec420ced322@linux.dev>
 <861p8i12gr.wl-maz@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <861p8i12gr.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/19 1:20, Marc Zyngier 写道:
> On Wed, 18 Nov 2026 16:44:11 +0000,
> Zenghui Yu <zenghui.yu@linux.dev> wrote:
>>
>> On 11/18/26 10:51 AM, Jinjie Ruan wrote:
>>> The collection table is currently sized at a single ITS page size,
>>> and the driver's allocation policy is to allocate a single collection
>>> per CPU. On systems with more CPUs that the ITS can fit in a single
>>> page, no LPI can be routed to the CPUs that don't have an allocated
>>> collection, and the system grinds to a halt.
>>
>> The issue on the reported hardware ("384-CPU HiSilicon HIP12 system", as
>> described in v1) is fixed by allocating 2 pages for the flat collection
>> table. That is fine.
>>
>>>
>>> Change the allocation policy to allow two-level tables, similarly to
>>> the other tables.
>>
>> But I'm afraid that the two-level CT is still not supported: nothing in the
>> driver allocates the level-2 CTs.
> 
> Hmmm. You're are absolutely right.
> 
> It should only be a matter of plugging its_alloc_table_entry() in
> its_alloc_collections() and getting the error handling right (which
> is, I reckon, the hardest part).
>

OK，I Will fix this issue and the AI review issue.

> Thanks,
> 
> 	M.
> 

