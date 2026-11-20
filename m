Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166906;
	b=Zmz98U2GZGGDBk1NK789WarIDc+aQnaGDPF26pfYEdymED4lRsXoa2DoIJz1FqPNUU2W
	 OXdPYPR680HuSjIak0QWsgDJQ1+aTykdgl1pUYCAh9ZrY5xF06yMyMP7N8lmUCwhG5DCp
	 BlIAA3FyqVHt6MQGXGRJDfXgASXzMUaX7zLm/cKNYfbL6xJqyI8p0l5ruuC8Vr0HF3Vdu
	 iQHcuGNK+TBN9BN4kaL7w6Eglc3/vqCLh89CCTyF3PSteU9HM2RUOLjzDQnjf1Dg288M4
	 P0rHFcyL8IHNRSkgHmNKeGMPUjYlKG1VFW5lhcDxghYycc7xVmudPraTSB07865Cahg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166906;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=AypJK8jzush/2wyjUMWO7Sx/CwzgE2/RuzZq5Uu52pI=;
	b=SI8fHt5QunjCNIImOCJgIiyOCljHXfe2vOV7dXuhvOk2sxwx7z3G4/gL8Z5pMA8kSsnE
	 IJI7CHPwkFn34Gj7egPl2gi7UQChxU4iwNI9LfG+wR7a0xhjgtSjhqDW2HbkwvCwZQZUN
	 l+6gpIXh3AYqjH+ccj/4BVYKAYTbFW80o4HzID6nWW9V/wyTSWX8VSKT6AvyB+RuhgaTO
	 EcOKvMKYlcHSNxc2FrXWJT46kzt1ZmwlQgwtoekyK39NxOmD8vcHmz2JIx1YIevTV5FM0
	 Mswq5xF87VL5Ivm+pboBW17WhkWSkB0jpQuB+0pQ/zTGtmI7KYxvCqVA+tBws7pYeKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Hat+smBn;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99C2606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A99C2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Hat+smBn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=AypJK8jzush/2wyjUMWO7Sx/CwzgE2/RuzZq5Uu52pI=;
	b=Hat+smBn3OAwflf/glimaCFjgHMGYMD4gHELnyjcv86rkB8FOK6tsRoOwxGTCq
	xU5rHt2/w0yGauQCKosYSRb5qfqOrOmmJfB8OVjF9MdljoCNfsA+VOQDT5PnAqdk
	Ghq6bvlTF+9ideXbZ9DKroWFXYsstlR/R8k+KQJZ0TEgc=
Received: from [IPV6:2409:8900:1e87:c681:e0d9:72d0:20c3:a0ec] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wB3Pc2eEgBrydO2Ig--.19948S2;
	Fri, 20 Nov 2026 17:28:00 +0800 (CST)
Message-ID: <bd0c0052-08d2-4eab-a9f8-da1b2bc60506@163.com>
Date: Fri, 20 Nov 2026 17:27:58 +0800
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
Subject: Re: [PATCH v1] ntfs: use kvfree when ascending an index tree
To: Dandan Wu <dand_wu@163.com>, linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dandan Wu <wudandan@kylinos.cn>
References: <20261120092015.2469284-1-dand_wu@163.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261120092015.2469284-1-dand_wu@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3Pc2eEgBrydO2Ig--.19948S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr4rCr4rXF4rKFyUJw4fXwb_yoWkAwc_Wa
	1UZrWv9r15Jr1xC3Z8C34kJryrKr4kWrykKr93Kr9Iqay5Jw4vvwsrtrs5Zan7WrW2qFn8
	Cr93Ga4Skr1agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUMUDPUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QCHUmsAEqA8EAAA3J



在 2026/11/20 17:20, Dandan Wu 写道:
> From: Dandan Wu <wudandan@kylinos.cn>
> 
> ntfs_index_walk_down() allocates the index block with kvzalloc(), which
> may return vmalloc memory. When traversal ascends back to the root,
> ntfs_index_walk_up() passes that block to kfree(), which cannot free a
> vmalloc allocation.
> 
> Use kvfree(), as the index context cleanup already does, to handle both
> allocation types.
> 
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
> ---
>   fs/ntfs/index.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
> index b4462f760e3b..d565accb05d5 100644
> --- a/fs/ntfs/index.c
> +++ b/fs/ntfs/index.c
> @@ -2274,7 +2274,7 @@ static struct index_entry *ntfs_index_walk_up(struct index_entry *ie,
>   		ictx->pindex--;
>   		if (!ictx->pindex) {
>   			/* we have reached the root */
> -			kfree(ictx->ib);
> +			kvfree(ictx->ib);
>   			ictx->ib = NULL;
>   			ictx->is_in_root = true;
>   			/* a new search context is to be allocated */

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

