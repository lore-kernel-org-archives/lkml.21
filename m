Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942830;
	b=jn7rbMxInurLDhdGk23aqrFDsRkMOJnxoiRZLEuuZSektoEG4omO/vdB9GUSX7i+Y+BQ
	 Pkql+YOkTTC6Y38UDX0IA7VCqjcD8yIrRWku3zbez+zrTEtFi2Qc9RRrWIEOLSg+0ADFD
	 JqCQCfrCbmmru1WXd75HXHQN/hV1U2SlUfchgr7/Gy6TIETTygeV0Cc6BxAwAvXf05Vj8
	 4aG+dj8ws8fvIby/XLJGzzjn7c3fTB3lw4cd7JgzgdVMbZAhCwylCkXriPS05sm8DxSIl
	 JZJHweRfsoeOckjBiLiBlrLT5e1u0h3FHHzK94eL3ia6mSeDZRh8VlN4pHnJ0TFGEYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hQdMYvTDljPfvw3jmPwCPaTjHRLJ0bm/dZ6FPmytRE4=;
	b=X0jnwYEzP7YpjE3gIW+R4PRuwE5uJY5CegiURoTUqGGlZeDVNKrR+gVR6kOuJrYo4n4D
	 kqmMdGbiVaevWqw4maoOu7R8DqRFwdUsPXpXPdnURBh2N5XQOpj0m1RUKliRZajioZ/Nk
	 pR9O0kyEeu16WQ3kcPiMsByw2/8c9dYVsN4Y9KBqO65v01ylrUGyyz5Q5OmLXiOVJwvWY
	 WCvUojta23rXqmOmfojVd10xrb0DEoRhsOni1OaIqIpcPArHN4zjtraVCl1wEjFFTznRd
	 6qFwKExhIDoKWzIVwZB0PwkSYHiMCCst505ErcCTId6t1q8QqEoJqjw7NKvdxNgCNFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vv0qvxXF;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8351606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8351606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vv0qvxXF
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-949680e6d82so24870685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942829; x=1795547629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQdMYvTDljPfvw3jmPwCPaTjHRLJ0bm/dZ6FPmytRE4=;
        b=Vv0qvxXFVK1wzdTn6rn8Bs1smPyud6bl9bBzKLMXW8SUNGSv/cbkMpDwhf2VEuW2XA
         hITWVy5seULuYMNIQ9a5q0K4JzRvM8E8sDDdqMtZodrNJWmGIaBtvGgnjCLkOSm9NHiX
         gfX325gV1lZHcwmw+m1PuSyr7Ksb4LQ783W2dJ2yh2xSIt6uW9rLLkxMorBBcSu0PoCM
         z7JXmR3atBiN+oF5WRkICXSFaJivWMf+bsGXpx6NwZC4WiJ8LN4K5R03/DKbVYmqloM5
         qMPtAxTDu4VP/NdAY/JxR1TXqHxloWgxlNTs7MO9m8mqfn2jANmpKT1ALhnwdir5U+tm
         hhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942829; x=1795547629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQdMYvTDljPfvw3jmPwCPaTjHRLJ0bm/dZ6FPmytRE4=;
        b=UU85tgqi+yF3IVoDbSlW2aFwNUTC8mqtdaPKBS5ooO+H1tJ/oRO2sFug0lGXy5xRRI
         Dpa8HQCW64j09PjRH510NTFk9DHGBRmsKwc60oWAl+64bZ/cp7ihG4ccJKl9SudYw78y
         DAwn5Zz7wi68ueDi7o532vD6Znmtfuzf8kQl4blKhVUatX24kYPL5aSkSyILcKpcdEj/
         OAcxREXACBRb2Ly8iYb9m57a7tNMYREqQGfhCvoA7Jler/goTYdYc3Y478UgEhunZhMx
         SYDi5T+uLCGerG02lPvnIa7w3Am8DjCUCEUaVJu1/eD8kYCMybLmrF4THaU7L+onxttC
         In0Q==
X-Forwarded-Encrypted: i=1; AL+hErGkCvgvG/G6GbqRTJlR4bSTQAs7vu/0u3s2JpFS6L6wkTsUugSOMyvMSz1CxVfdXddbCmYwypLgYvjfqWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AYNxwf/igvyth8mb1BWi3YNLnzU+NF/wskMpNVJIWSxsVbcZJ
	pio1Aif9UZ48k81G3CDLnjnO0J0jKY3COKzFN+8XBO6DyLI5rnec5ySO
X-Gm-Gg: AYBFou23FyOfxTt3xVmBszR6VZmK8flD0u9oP4gTxtyGqyf0v8VijhFD5/lwYcTbms8
	oKBDSN5nPuu1PSXfHX8C9dJFzwfBDlThi6/nI3TNEeblLTrttT6X4nV/AurtK3PRoDocAYedaIF
	zhTOLoFB/WH0RnrqJZG88pgvUBoifJESFH72+QpIQmirf+KegLMUoCf/EZkgA0Z06+peEAH6Z/R
	MJiATxCjrEzKC4Rbp3XZ7tZ47ZyKpayOyhsc1PyYsIMrq60hb/D9gt82lZ8X+iSRib/p4l3mrDe
	Vs98I7mxoNk8GA7ygTf0wbN69nkZ450NeaTReMCTcOlcb/U2YOvis6TZ8Gqse3zXqoCp9K3bZnS
	GFPRKCRguBHHjt6h51vOrOw+M38JEVQmvPmCZ4CimLTAH2LvM5stNb9rVRhdErhUnmraC2QdI40
	nZ/HZG9Uy4ayIeXHUedzWAyHLMk+hG/txiAyrcIn1EpWv5srvZi1CSthxL9nChcIdB2S+befef6
	IXTpSKosG/4wMBpOYtG4l568MCudKyyKWUr9haTh5Ew4+F2rVv9r+IgvCZL51HCilLfPrq4auZK
	j04DL7vkH5HVbCLIm/+pYKb8vQOHAuK2NILNao8GrrbRzpd4MZeHxXKxhg==
X-Received: by 2002:a05:620a:19a4:b0:949:7656:ca0a with SMTP id af79cd13be357-949995b3446mr121165385a.35.1794942828757;
        Tue, 17 Nov 2026 11:13:48 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803af0sm1138774085a.8.2026.11.17.11.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:13:42 -0800 (PST)
Message-ID: <fe73ee96-3ef2-4ec6-acb0-8e6794615ca1@gmail.com>
Date: Tue, 17 Nov 2026 11:13:37 -0800
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
Subject: Re: [PATCH net v2 07/12] net: au1000: fix buffer descriptor free list
 insertion
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261112045301.3669532-8-f.fainelli@gmail.com>
 <179483704622.3136.16694282680991633445@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179483704622.3136.16694282680991633445@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 05:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The commit message for "net: au1000: fix buffer descriptor free
>    list insertion" says the old au1000_ReleaseDB() "loses free…
> 
> --
> 
> net: au1000: fix buffer descriptor free list insertion
> 
> This patch changes au1000_ReleaseDB() so the returned descriptor's pnext
> points to the old free list head before it becomes the new head. Before
> this, the old head's pnext was set to the returned descriptor. The new
> code matches au1000_GetFreeDB() and how the list is set up in probe.
> 
>> ReleaseDB links the old head to the returned descriptor and makes the
>> returned descriptor the new head without updating its stale next
>> pointer. This loses free descriptors and can create cycles. Link the
>> returned descriptor to the old head instead, matching GetFreeDB and the
>> list initialization.
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> 
> [Severity: Low]
> The code change looks correct. Should the commit message say that the old
> behaviour had no runtime effect, though?
> 
> au1000_ReleaseDB() is only called on teardown paths: the err_out unwind
> in au1000_probe() and au1000_remove(). In both cases the descriptor
> buffers and aup are freed right afterwards:
> 
> drivers/net/ethernet/amd/au1000_eth.c:au1000_remove() {
>      ...
> 	for (i = 0; i < NUM_RX_DMA; i++)
> 		if (aup->rx_db_inuse[i])
> 			au1000_ReleaseDB(aup, aup->rx_db_inuse[i]);
> 
> 	for (i = 0; i < NUM_TX_DMA; i++)
> 		if (aup->tx_db_inuse[i])
> 			au1000_ReleaseDB(aup, aup->tx_db_inuse[i]);
> 
> 	dma_free_coherent(&pdev->dev, MAX_BUF_SIZE * (NUM_TX_BUFFS + NUM_RX_BUFFS),
> 			  aup->vaddr, aup->dma_addr);
>      ...
> 	free_netdev(dev);
> }
> 
> The err_out path in au1000_probe() also falls through to
> dma_free_coherent() and free_netdev().
> 
> au1000_GetFreeDB() is only called from au1000_probe(), before any
> au1000_ReleaseDB() call, and no RX or TX path walks aup->pDBfree. Also,
> NUM_RX_BUFFS equals NUM_RX_DMA and NUM_TX_BUFFS equals NUM_TX_DMA, so
> the free list is already empty after a successful probe.
> 
> So the lost entries or cycles only ever exist in a list that is about to
> be freed and is never read again. With the Fixes: tag, stable tooling
> could pick this up as a user-visible fix.
> 
> Could the message say the bug is latent with no functional impact, and
> either drop the Fixes: tag or explain why it is needed?
> 

Yes I dropped it from the fixes since it has no functional impact.

pw-bot: not applicable
-- 
Florian
