Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219587;
	b=hVClKNTQeax9tTi8eqxNrKh9vFgr2eec9vCkJYd6cMw4D4FPZmWaA+VwTXni8a5OnGEu
	 t/IAYF7Gd8bSDy0ICEk1sorCIjsO99GeborwBhFy9NvOyZc76g1+tNz3AefE57IwT6oX2
	 tFi4c1t6frMT8c/kmdM/jWblgTedQQOmCI+cqdsVJ9puqaAasW17EZATplAIjcaZvOzlQ
	 flug5d0SSNsi5GatWI8NQcPHi/h/Y1KET7yT48op4v9U7vIvuhLUGBkLxHqPQZfPZ9U8W
	 K4SHWmtddDYzlIu0tkAWeibupUNqKlq/X/NB3NZ+SJCcAOJ24NZBSXVOmyoYIMRfNtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=y9hC8BO0Mp4YVy4aHAIBzwFHt+H9i/iWRCKp/FODzSc=;
	b=4M+vprRNWfYjtx5psoq0faN6vc86kvUGS0YciHxULasEEk57JBtITzzbFZcYtzXcpl5M
	 7GI4JATBPcd2u6hCklTF/CJKhGex+FaODz1NdijPb8lSDNYYTcUYq45bSRUW3D57ZyreM
	 uEbO+MMcG+wNfMnx+fsv4ANPBPoCYtEpyyRTbDNBRO0gybihlDUGGXDMovN9i/zLEejn+
	 023FoYrKcLqX3K/0CsBNGTm3JDOimsNp3UtTPqBLBhkL6WYoEFQzienjl8tX28MY0NwF4
	 XmwE0EgedhPatNYY6tzmsN0/NuYlr9MiXoUZvXa/IvMvnxmrumo5uJ+j7J+U3j75HOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JaadUWo2;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E416606A699
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E416606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JaadUWo2
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3acec6677so2147836c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219577; x=1795824377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9hC8BO0Mp4YVy4aHAIBzwFHt+H9i/iWRCKp/FODzSc=;
        b=JaadUWo2BmS24mgyyOvhRl/74/Q15imQqv1UnbHQrkWb3nuNIAOoacmTmtqOyf9khn
         G7Qzcb67VMbDIlrmxjAJ1zAj/gt06pvWVi3jQpmuFzFdNC1zUw1yZF/iezgWniKkTThZ
         Hzjs0bEo/8vobfK9Siebh+iuMrVc8wgIxi2qg/tTFdxI9QJ/gz+J/Wqa9AflbQgwOg+8
         Y4Cdk3wcBRQkxGjkhEgLxX4u1uVqsTkQrXbQ++iW7ZtGhR/noEz1riZ3GAOcEkZ0hWBv
         5IxyirtUebsNywLZEwGl7WcuUsB2neRcXlxzmpyLOazwyIidSwFGGYQXG0IY0mSUmflE
         I+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219577; x=1795824377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9hC8BO0Mp4YVy4aHAIBzwFHt+H9i/iWRCKp/FODzSc=;
        b=rQ1/pQ/oNRqLlZe9KP/jqHj0fff9PQk3tN+wTNb/acyndYrAOLDfcsDXTX9cQ71os9
         /UJtEZ7YnRO81ycCBRgbuCbimPxlIAfVhif8v31S4+DAjZpxqQacw5z/2jut8q4Gves2
         5FYNUBaa3yq8tSJCiUCfGrcUnx+PbPBwt7YBrEWQOfc7K9wU2M93cSln3D945CHi//oa
         QFnEvEIYgDqLeSJFqygTS6zbp0Ch4tW4gPJc+hcZz19CZrLEj4D4yiJFZEMU4S5N3WGh
         tK6/c6SbG7+RU1IZ10nQpv7ceZfaNEIEOuEEaezhMAsKeLoFMfZQUG8PTxUJTYKiK6Lx
         jm3A==
X-Forwarded-Encrypted: i=1; AL+hErEB9AZ8Bh+XF/Qtwl2C8zJf3hhRstVPAvl3Yf50yXtSmk/zckJHMd/7XoWtRK+8h6eFFwy7QDPg9jKieAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cwGI37TdnPOCGa79iBH6SpUIRx9aIZhge58n8DbiWFPEa6ld6
	rngZMHtoCv5cMAV2EMh9kjPV0nlkxIO7ckBmH1TrzNFQUcx8P7rqEEWY
X-Gm-Gg: AYBFou3Nr1OGMut1cOCdzCsVYD/nWvYVhMW0yYo9+X8JqPPmDdK1Gnzf2qXASdDVkBc
	Yce6q6vgMEKjnEXkHIJhFxWvOiDyQmm7Ht0o+ArnKKFEbtEMwjP6PcCtREn3IWJ2vkH1U5wHrvf
	lnRkjzfeGsMHXod2e5Iv8cDXRLRr0IEms8DpNNSL8O7P08sMusiEcODjjldAzwuk7sKTdk1puxb
	4DcpRksSvk6XHd1rXKREaa2zk1OMNIzHssWdEfuzR+Ufp6qQqmdQ/NdCZYsSK6Dwukn0AxoUvCD
	fF0dOcvNSg/MHQifPJqIYQK+lTZ1AGqG29v3e9fbb2J+kyk+3UjsRMW9NyHUhezj6NiQuJ5aWhV
	HOXrfJP3VcAZaRCtzlkBegI/rF65YYC2c21yrvJDuiVK7ifkX6snVRRe8FrXuavaXrvWzoDyIBI
	YypjCcvdhUzl9AjOAfW+wMbXGOoSIYE17bUHZDMltdx3NbY0qfC4df4BskoIGEDEszvnhA+FuSg
	giog2QQhavSjc/6dYwtcDoin6+/PM18vxa2QptTBUvSeWQTQTsvz/wST1yTc+ty3M9kaeSrCotN
	uMvtDtznzNyEbFp78BnMdjvZ5rfSTuM9fLNW9ZbBr9S27qd9Dh8kvsNg
X-Received: by 2002:a05:7022:f106:b0:1b3:afa2:2d7e with SMTP id a92af1059eb24-1b5567dab3cmr3767017c88.1.1795219577218;
        Fri, 20 Nov 2026 16:06:17 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm9946452c88.12.2026.11.20.16.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:06:16 -0800 (PST)
Message-ID: <3f4424da-9244-483c-8662-2ba2d3b5eb94@gmail.com>
Date: Fri, 20 Nov 2026 16:06:15 -0800
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
Subject: Re: [PATCH net v3 05/10] net: au1000: serialize TX completion with
 packet submission
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261117193223.2795612-6-f.fainelli@gmail.com>
 <179517075632.3136.4816970691265925776@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179517075632.3136.4816970691265925776@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/26 02:32, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] au1000_tx() (drivers/net/ethernet/amd/au1000_eth.c) now holds
>    spin_lock_irqsave(&aup->lock) for the whole transmit path.
> 
> --
> 
> net: au1000: serialize TX completion with packet submission
> 
> This patch takes the IRQ-safe aup->lock in both au1000_tx_ack() and
> au1000_tx(), so TX descriptor reclamation and queue state changes are
> serialized. When au1000_tx() reclaims a completed descriptor at tx_head,
> it now also advances tx_tail. The skb is now freed with
> dev_consume_skb_any() after the lock is released.
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index 1935b1d4b1738..805aabc6721b8 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> 
> [ ... ]
> 
>> @@ -972,21 +976,25 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
>>   	u32 buff_stat;
>>   	struct db_dest *pDB;
>>   	int i;
>> +	unsigned long flags;
>>   
>>   	netif_dbg(aup, tx_queued, dev, "tx: aup %x len=%d, data=%p, head %d\n",
>>   				(unsigned)aup, skb->len,
>>   				skb->data, aup->tx_head);
>>   
>> +	spin_lock_irqsave(&aup->lock, flags);
> 
> [Severity: Medium]
> With this lock taken here, the rest of au1000_tx() runs with local hard
> IRQs disabled until the spin_unlock_irqrestore() at the end. That
> includes the packet copy and the zero padding loop:
> 
> 	pDB = aup->tx_db_inuse[aup->tx_head];
> 	skb_copy_from_linear_data(skb, (void *)pDB->vaddr, skb->len);
> 	if (skb->len < ETH_ZLEN) {
> 		for (i = skb->len; i < ETH_ZLEN; i++)
> 			((char *)pDB->vaddr)[i] = 0;
> 	...
> 
> On Au1000/Au1500/Au1100, MIPS_ALCHEMY selects DMA_NONCOHERENT. That
> makes the dma_alloc_coherent() buffer uncached, so every store into
> pDB->vaddr is an uncached bus write. A full frame is up to about 1514
> bytes.
> 
> The RX side has only NUM_RX_DMA (4) hardware buffers, and they are
> serviced only from au1000_interrupt()->au1000_rx(). Before this patch,
> the RX interrupt could preempt the copy.
> 
> Could this longer IRQ-off window on every transmit lead to more RX
> overruns (RX_MISSED_FRAME) under combined TX/RX load? It would also add
> interrupt latency for the rest of the system on these single-core
> parts.
> 
> The copy does not appear to need the lock. Suppose au1000_tx() has
> checked, under the lock, that TX_DMA_ENABLE and TX_T_DONE are clear at
> tx_head:
> 
>    - au1000_tx_ack() stops at the first descriptor without TX_T_DONE.
>    - It never touches the tx_db_inuse[] buffers or tx_head.
>    - ndo_start_xmit is already serialized by the TX queue lock.
> 
> Would it be enough to hold aup->lock only for the descriptor state
> check, the tx_tail/tx_full handling, and the final len, buff_stat and
> tx_head updates, and do the copy and padding outside it?
> 
>>   	ptxd = aup->tx_dma_ring[aup->tx_head];
>>   	buff_stat = ptxd->buff_stat;
>>   	if (buff_stat & TX_DMA_ENABLE) {
> 
> [ ... ]
> 

Agreed. I have narrowed aup->lock to descriptor reservation and final 
publication, moving the packet copy and padding outside the IRQ-disabled 
critical sections.

When submission reclaims a completed descriptor, it now clears TX_T_DONE 
and advances tx_tail before dropping the lock. The TX queue lock 
reserves that idle descriptor during the copy, while au1000_tx_ack() 
stops at it because TX_T_DONE is clear.

pw-bot: cr
-- 
Florian
