Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091981;
	b=u4YTfOE3bNgL+/9EsZDAdKnWvOLweXthPj2T9eoQNJp9rWN/pcZxqS7cd4aNC8vyBHeD
	 IxPgjY96yyqy+GIbpYY4Ay3CNuiWzg8qm5aL1++2csV9+zvH5KxPCDiKwOnh2dDSaoRGL
	 oWXU7GpbxDIyANF+2erzKTFo466wPtGUE5+JiaPjhAUF4ZQkkNRn4grqmLuAQcHtmUQdh
	 BNkmaZQ9gOOPf29VODffJK3NimSa2d6c0Eg+kZsEhPAJI/MCbe29JsjiHtZ3p286eZujO
	 2hpvZywSxqEHvEoD9bZ66ruk/eZ+VJUlUQYFDK0c5xOY4QYEGip7mgX79PIg3raWgaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091981;
	h=DMARC-Filter:DKIM-Signature:Cc:Content-Type:In-Reply-To:To:Subject:
	 X-Lms-Return-Path:Date:X-Original-From:Content-Transfer-Encoding:
	 References:User-Agent:From:Message-Id:Mime-Version;
	bh=4W1OsMgDR03Yj+4i8xbunhvfo+tmgdJUAvqJYnYTpo0=;
	b=bxUvoDn/2/d9gi1h9qYim1PD3UbXLTLIccZ11hDSp7afN5XioxdY/rG0T2DZQHpmlHHG
	 8DtvzPXRvErVI6zt3i/ez08Q3JLjpvfaAAF2jwTzsxOOcoNJZDGnIvpBmoF9ElwsreRjs
	 arI3SFlxhOFBgcEsH7hdLC+eKS1PxE5T272BarwWoFFodH6ddWQ8Y6FpaTl93w3C6plGB
	 v3DUJntReor5CSkgth5ZRxBl4wNkq6dgILQJNsTNo1ZRb3iI8xwq6SrrXT9UysLs5j5Se
	 roZpoNTQ8u/HEZ5k7H7TfjEa+7Gf3T0UQDWKCJzU5y7ELt1xkXh5PalM9TSmATc7tDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Il+Ee5Jz;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD62E606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD62E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Il+Ee5Jz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1795091975; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=4W1OsMgDR03Yj+4i8xbunhvfo+tmgdJUAvqJYnYTpo0=;
 b=Il+Ee5JzHdIl0Rp4vRxOEELJcxqGShezZymRfl6nfe5LRTGw/WMW/VPJQlDoToFk1sAawQ
 uPkx0KYamjvBO18lQJtlAEofK6RUgBYAGxlZRLq1t85fur0s3Wt4y7gwDWgUjHcL1nBHKJ
 O7e+Hi7KMwxGg3ocEf6Cb33fIQuC45+6qyNokKjQ1f0PE5Szt0kc8HdYxyL7pY0T6FPxmL
 OLyIaepLtgsF3WvZymm2Nz22Iy5BPcxmGnrSaIhcGeLhEa+abiFZjZ7kM7PLRcHr4pW70/
 7X6yJ5F1AeC+WRNsA7GOatksCB1kFIf5v/Ps1w++i6eWSk/AuHDq9j3iOnS8rQ==
Cc: "Andreas Dilger" <adilger@dilger.ca>, <linux-ext4@vger.kernel.org>, 
	<libaokun@linux.alibaba.com>, <jack@suse.cz>, <ojaswin@linux.ibm.com>, 
	<ritesh.list@gmail.com>, <yi.zhang@huawei.com>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <av5hDZzzrKNxmDBy@mit.edu>
To: "Theodore Tso" <tytso@mit.edu>
Subject: Re: [PATCH] ext4: reject impossible group free cluster counts
X-Lms-Return-Path: <lba+26afeee05+6e72a3+vger.kernel.org+zhaogongyi@bytedance.com>
Date: Thu, 19 Nov 2026 20:39:14 +0800
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Content-Transfer-Encoding: 7bit
References: <20261102042428.65204-1-zhaogongyi@bytedance.com> <F238B62D-6BED-4D64-B099-B956B820BA44@dilger.ca> <2c1663e5-fac2-4346-ab2a-b35ae652373a@bytedance.com> <av5hDZzzrKNxmDBy@mit.edu>
User-Agent: Mozilla Thunderbird
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Message-Id: <e71d2878-4647-4f3d-a390-c5fb900f4636@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

Hi Ted,

On 11/19/26 10:38 AM, Theodore Tso wrote:
> 
> Did you send out a rework of this patch series?  I don't see a v2
> version of this patch in my inbox.
> 

Yes, I sent the reworked v2 to linux-ext4 today as a two-patch series.

https://lore.kernel.org/r/20261119122601.85293-1-zhaogongyi@bytedance.com

Thanks,
Gongyi
