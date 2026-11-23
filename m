Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425082;
	b=NKZKAmUoj9uiEKsZuz16kSlA3jWqweoUzwggz61tKQFxXy+uYdsguNQSnXBLYFZsq0KT
	 Q2SVf9aD+HOlnHYP2kA6FP4TmjjLdv3wrnnmouCz2kUi8vX3j3eRysqadnD1B3VuWtu2K
	 uC/VVzYsEUtmUMLxpIzMI80vgjfbtVRXQT6R1dNEW25AcAx5Oeotei1KdNj670Qn/Zcft
	 nS1LF4wyZvJAkWE02sRxwCB406JlqF/sx7FbPrwUm7uHVZqc1rMkQtn+DQddL4IfvKwNP
	 W/UnQfw7DyTqxmzBbCloZfYBmOOOCSeHHWA/bOM2L1zNiw+Ray0Iz62+bp5ISpfnnTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425082;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ac8gm8BAflyZQyZhhIITxaxPSlspaqUNqNNCAAWfRPo=;
	b=m2anrSgQKmzPs0FA77f5iG3/ndtNsoevNf9yJFvGGeWAaw+IwsJm+6I/rB1EfZHnOCcC
	 U/WDqe9hCbO3qnHGG03kFlgjcPOmCtoDnjjDvccORGhC3JqmfkKFbG+CVLlWR+PFBq2mN
	 dg+xG0ztrnB8mvRlVZePZVd2DPQ1Sa1D1kno8Znu+JlpUt+QX8lBRs0NXFb6AdSgclpC5
	 w7Fi0L+8X2unUYYL//czf+6qjNUbgnylXe4xFYrV0kGU2MXzXonUB0HNWX2cUAp8pxzXB
	 D6oxWwvNLCYv+6zERJ4qcrp23t35pER/HcUjdJmyp9BuUhkdcBSruWE0GEeWV/9ebYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=AH4TBgs3;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32C8606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B32C8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=AH4TBgs3
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795425077; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Ac8gm8BAflyZQyZhhIITxaxPSlspaqUNqNNCAAWfRPo=;
	b=AH4TBgs3AMx4k30rfihnV+kKEQrU7vG+r3OBhcnzGbyRit0EZXO0UPSaAjPAnggUDWWERPw/SCLnCLPF3l02iqnDaLTzTiCXNr1NjNHSvFVvCcTx64q5DzepESBhPzgW5Lvt7aP0365Dot62BQNB83ygl14W7jnIr2TI7Ose7s8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R671e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XFGA2m0_1795425076;
Received: from 30.74.144.153(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XFGA2m0_1795425076 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 23 Nov 2026 17:11:16 +0800
Message-ID: <48e3657c-d29e-44cd-a235-c93051520674@linux.alibaba.com>
Date: Mon, 23 Nov 2026 17:11:15 +0800
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
Subject: Re: [PATCH v2] mm/shmem: avoid zeroing new folios twice with
 init_on_alloc=1
To: Fnu Samridh <samridh@modal.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hugh Dickins <hughd@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261118-samridh-shmem-send-v2-1-f2ea01bfc178@modal.com>
 <e4c0fcf1-b70e-4d22-9c4a-5829e1438ce5@kernel.org>
 <CAKyepcSuZ49Nv2D3UGC++-niYtfMcPEE7sjAf2SSRx4KAy1oGA@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAKyepcSuZ49Nv2D3UGC++-niYtfMcPEE7sjAf2SSRx4KAy1oGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/21/26 5:40 AM, Fnu Samridh wrote:
> On 11/19/26 18:06, David Hildenbrand (Arm) wrote:
>> I do wonder whether that could go into the loop, because I faintly remember that
>> user_alloc_needs_zeroing() is disabled when CPUs have dcache aliasing.
> 
> Yep, it always returns true on CPUs with dcache or icache aliasing, so
> the flush only matters when we clear. I'll move it into the if block in v3.
> Thanks!

With that addressed, feel free to add:
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
