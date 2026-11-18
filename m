Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966182;
	b=X3ssnurv5NyG36IdsoVNddc6TnGGNdOjvLMuv9cRIxjBDUK6mZuOCQmDDKmlkVM5uPYe
	 cT5uyvCu0+o+vfU2aDE6x1FklNDFLMHThhXXohXo0nVQ33RObT8RPEronC4GkPFg+kftw
	 zIHf1xg5rOiO5nY/Wok1B28lAVmNgnDQcALO+TkB3dukZBPS1ixMsZ/bN5R5eSbhuJr8t
	 0ALI0Ea8bLKWe88ZK5jZAlJT61r+kCUo+dIMmJgUlnwG+qZR+djJrMz0N1Vel7fVF1KTr
	 +kIcL60UHtXXkL6S/7VG+JNXfz60In60WsGcVVPbEqFIbqFmyz2ndC2+7p77hdAtlwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966182;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=LIcpmcDcytcpUgy+i5tbQZ7OLZHF8toWlVWZAAyypqU=;
	b=NUTsmJycvkwSm/605Pma6aMvNhFpjHZVU+qS+aglPwmKezjOY9WcC1K0ttY2fgukba2s
	 QRaMRPyo0v4C+bDz2hkhoJy/rjxyEGkcUrq6jrga4kxfKgOs4uk2Coh/W0aBibO0qP6hR
	 VAKAiLKbz/mTtEtOgZ001Sxeg4wvbKnR7oHl0fvD601zyOeLb5XqeSqsVvuw6mNBtrxQi
	 7IHxDsoFOQ+CsinW8wu7jCWsyKSwIiEHFJfuoBv1mhJCtrpLg334NmMpBxmUOipsB1VQs
	 6Yh2AmctIiDYAEMOqSyx2reLdoi2HM9/cGuYEFuRJfpVAx1ju3uoCnLmcMfoy4qBt9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pgOEAJ9p;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C281606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C281606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pgOEAJ9p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=LIcpmcDcytcpUgy+i5tbQZ7OLZHF8toWlVWZAAyypqU=;
	b=pgOEAJ9pjczfO17nPzg5xfACV2Fxz02N/7E1T/JaVF5/h6X0F42PF0ppGQSL2Q
	Sp33xtS7nfKkKjDH+sKTtpZ+MDwkSVgnQJSrLrJxrPzXQFmyx9xWnTciiHFB4cMv
	vR9H+kLRY624O9dziqxnpPJXBLpAjvOFASBbQYL/zHfBM=
Message-ID: <6c6173d0-f752-453f-92b6-2a0019bec332@163.com>
Date: Wed, 18 Nov 2026 09:42:29 +0800
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
Subject: Re: [PATCH] exfat: hold s_lock for cluster-chain updates in
 exfat_cont_expand()
To: Youling Tang <youling.tang@linux.dev>, Namjae Jeon
 <linkinjeon@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Sungjong Seo <sj1557.seo@samsung.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org,
 Youling Tang <tangyouling@kylinos.cn>
References: <20261117060055.341277-1-youling.tang@linux.dev>
Content-Language: en-US
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20261117060055.341277-1-youling.tang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3H4yFAv1qwwmUIQ--.16723S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1DCF18JF45Kr1fGr4DJwb_yoWfKrb_ur
	9akrWUCw1Yqr4YqF18Ka4rJrs5Kr1UCFyjkwsxWFnrZr95AFsIqa12gFyvgw1ktay8Zwn8
	Z342vr1Iv3y29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjZ2-7UUUUU==
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3Ae7WWr9Aoc5RQAA3X

On 11/17/26 14:00, Youling Tang wrote:
> From: Youling Tang <tangyouling@kylinos.cn>
> 
> exfat_cont_expand() allocates clusters, appends them to the FAT chain
> and updates ei->start_clu, ei->flags and i_blocks without holding
> sbi->s_lock.  Readers such as writeback call exfat_map_cluster() with
> s_lock held but without inode_lock, so they are not serialized against
> cont_expand() and can observe the chain metadata mid-update.
> 
> Hold s_lock around the cluster allocation, chain append and i_blocks
> update.  i_size is published via exfat_pagecache_isize_extended(), which
> takes the straddling folio lock; since writeback takes folio lock ->
> s_lock, this must happen after s_lock is released to avoid inverting the
> lock order.  i_blocks is therefore updated first, under s_lock, which
> also ensures a reader never sees i_size beyond the allocated chain.

Please resubmit based on the latest exfat/dev code.

Thanks.

