Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119044;
	b=N3X5AhX1crwlMOZ7TmuPMXFLURoJ8/mhqRmEhvRH7lTFCdTAZkrWVFPiSK9oxXGKUgQL
	 +1gExLlHSbynRi2IBnFQKsHgFtUpgMXpGO3y4THuEUKnZ/vHjsmhc4Aw21JGfVF0jxvuY
	 KS4oLIkAz0c/v7OUvOlMyEk6WsRoE3wXrgHuTi5j0AfGE3eKOOj4UE588tdeTX/i5rEPf
	 6eFrEaesOQLAyrv9AafPRmvk9s4cvXwyKfVvbjW4EyuHtBTctoaEyUVvxDc2njDXKredy
	 BZFN4zxpykgnupBSRhs3uOEBE3xXvLb2R95DOJsKf6KIUytcYjXIlaRrodM+zx1IXLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4STxJw8apfsXksn2vhnIZYq3Je/j7gzJU23OLBgCVCw=;
	b=IzulDBWubtfukpJ+9LbQt62lfUJ9jmOB+rb7CaGtlc99dCRp4SODGSuAJdbYOeddZZfP
	 k7jPHKLeHGrj0qGOdo3CPAe1ZJ+StfhH9NJOo8mVAapqE9tzRTgNNScI/7SWKQEf6yWj0
	 FXlpPXZ9GfjqLmzH1E7Ck1vHWCXwYuOtGVv6ubT7E23gKi7Bf9YRp1Yf/2F69mxR6jCCA
	 O5J2DMEGrATLZGzX48UwJCFQ5uhJPr64O1gaEspZo3+zx88Vm84KGMsDVJUDAO0L14kK9
	 ECjzGb5Z57HmFttsAj9gifjT7FJe/ynJthfoVLaleKa1IJpzY2BfJRFCY7XrqNA88uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbOGqzl4;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50B9606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E50B9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbOGqzl4
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4cd576f2aso1536027b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795119043; x=1795723843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4STxJw8apfsXksn2vhnIZYq3Je/j7gzJU23OLBgCVCw=;
        b=jbOGqzl4pjTZnlX9CRqhGTwl7IvLx/HCGiF2R1smwd3C1xS/q5+8W6IuVixt3ofp/H
         UcDRPhnfi9vbdbCkAwL2L6B2GgmVewmfYsZXHz4rNAtL3nftLQnKP3S9AEk0k7oLIwED
         WkJLrVbc9mqKig8z//TLZvj4mk9v4eST7U+mBQKCykkKMy2zUfGyWk8m5DQlvPm8o6v2
         YaWg39KQF8X77inqQxHzMloUyf52HDB2HfTAnPXdu+rrErMGNxVat7iZ/qXNL5hj7sax
         DOLdkN/yHC/Ygm2ZtiQstlDpDGfBI2Wou+P5h5w/7Tv+ma5YWs70v4mbBxdENHUpD3xg
         MJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119043; x=1795723843;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4STxJw8apfsXksn2vhnIZYq3Je/j7gzJU23OLBgCVCw=;
        b=1BnuNL6ONwrTabSoVIbgQl3O/0zBtJu8t6oRG3bM6HQGiAMdAkcun3kblZ9F1XwNDY
         eOoCpLhHOsT3TWgj3LZCRgv3sIZkdmoD5cXDSuQ0gFIaVO3g5n3DBNNPfagOk01nrqQH
         /UyDhwDsRn63PXfPvkzNgwdi2HS474txwjCfWr2jG2vy1HgnaYxh1ENUhyYTgMHELv67
         RjfN5zThtaXAmo3t6O3XAakoBBv5hl4TVvtVW/2tfpdfMAi8a/t8bBl8sqytp2lUOMSL
         h2RB/sdrwCzoNC0mYvySchlb+o8nsjBSycWv5mg4fDiO7ZavG/d/ykhi+evu4nTX3veA
         eojw==
X-Forwarded-Encrypted: i=1; AL+hErEA2s8vhz5WZlW2+cFK/wtp6benaQAcGzK3h/drA54n8zykNkjjCKWy3X6/g99I/HOYyl8g6wpeYJyFAHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sALqKYZ4fttoeyYrZBMBbZFjk0jBTYGOl31cTIyLxvrACBhX+
	9L2kT5RZhAXiHVtBrZKuMUHVaOd2cA5Fpy4ncPPhvcdWEambMSzaSo88
X-Gm-Gg: AZFdTZc1k0hI1bV6ofAAuTa09N6I79B+Z2+RpzVOF5w7EWy8DAnCGj7WwUE2lWLl3Gq
	jAMnJIAlIEeW1LiDijU0EEKLxOjdwR0sC/zJShdZ5gPqhohpBLUXDOnz/jmY19AS1nfOICE/vms
	WthmyZUA8/mCY9fsPaFFFVBtidMkTGeX0VeoKY7nhW8F3Sbpn4h/EDxUAvzrlS5oZbMVZ9HRwEJ
	/e89/1ecQMfCflwLYHKbHbPY3ZcSPThfKVlfudRtp3qk8AK2iz37WWyA1AyzwKEAmPzBH+gRSOF
	z9nx048rQTHOvsZNQa3ciYAbeRzv32ooTHUZYsVvebFjrc+RRR415DsydwhXKiIJudYM42Z9ETx
	+AXrmAIzrZEeCbQO6ZsngZ2tpQ7Kb5oP8vCbu9go6qKdF4zgTxJM3h/FnU900TntvMoR0T4z/mS
	rkd9dG9NvfX7xvg9Rpl8J4fUf1dwL5MQHYfX5O0c9qmUehG9X4q3Zk/UAwUjtmSxTh76tO42Yrv
	NN+0bG66wZewN3lZxoPfJ1+o4UyFvdTNawmCYwoeWltRdgS71HbpLpPN0eb7+aEmZcy4xFa07qh
	J4LyBK01RHWYUrMxdVeA1E4TML2jSSLuvR11ZYLk4NB1Roj1wLJh3QXiaQ31xp8pDZKyLq9kFXL
	SiI+ovV3F9Bvlo6s6sHGShjC78ECztF6guEQoiCMJ6B/X1ZmloXYLNdcU9Zz4MyYqz8uQn91S63
	9ms64yffqUYw==
X-Received: by 2002:a05:690c:c86:b0:8b3:4deb:7ce1 with SMTP id 00721157ae682-8b5204403c4mr5285257b3.14.1795119042818;
        Thu, 19 Nov 2026 12:10:42 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201ba5c1sm4973157b3.3.2026.11.19.12.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:10:41 -0800 (PST)
Date: Thu, 19 Nov 2026 15:10:41 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Gwanhyun Lee <gwanhyunlee@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.2124e819195d3@gmail.com>
In-Reply-To: <20261119144241.360238-2-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
 <20261119144241.360238-2-graypanda.inzag@gmail.com>
Subject: Re: [PATCH net v3 1/4] net: tun_vnet: validate hdr_len after skipping
 header padding
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Junyoung Jang wrote:
> __tun_vnet_hdr_get() checks hdr_len against iov_iter_count(from) before
> advancing past the configured virtio header padding. With a 512-byte
> header and a 14-byte Ethernet frame, hdr_len=256 passes because the
> iterator still includes header padding. After the advance, only
> 14 bytes remain. tun_get_user() and tap_get_user() can then reserve a
> linear skb area larger than the frame and transmit uncopied bytes.
> 
> Advance past the padding before comparing hdr_len with the remaining
> payload. Both callers return immediately on error and discard their
> iterator, so the cursor position on -EINVAL is not observable by them.
> 
> The problem was identified during review of the tap zero-copy fix and
> reproduced with vhost-net in an x86-64 QEMU guest: a 14-byte input
> produced a 256-byte frame on both tun and tap. After the change, both
> drivers reject that input with -EINVAL. The new tun and tap selftests
> pass on the patched kernel.
> 

If respinning, please state explicitly that this restores existing
pre 6.15 behavior.

> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Fixes: 2506251e81d1 ("tun: Decouple vnet handling")
> Fixes: 6a53fc5a8770 ("tap: Use tun's vnet-related code")
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com> 

> ---
>  drivers/net/tun_vnet.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
> index f4c652b1fa44..0b9622891681 100644
> --- a/drivers/net/tun_vnet.h
> +++ b/drivers/net/tun_vnet.h
> @@ -138,11 +138,10 @@ static inline int __tun_vnet_hdr_get(int sz, unsigned int flags,
>  		hdr->hdr_len = cpu_to_tun_vnet16(flags, hdr_len);
>  	}
>  
> +	iov_iter_advance(from, sz - parsed_size);
>  	if (hdr_len > iov_iter_count(from))
>  		return -EINVAL;
>  
> -	iov_iter_advance(from, sz - parsed_size);
> -
>  	return hdr_len;
>  }
>  
> -- 
> 2.43.0
> 


