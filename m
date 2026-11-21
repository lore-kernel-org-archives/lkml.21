Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220548;
	b=E1JGSUMsBzVhdGPjYqBKaMcevlM0Xyte8Wa2poTSQ8MoKMacP0lO6TKmKxhrqmrNSW6d
	 VZoMZ/v7SnXmkhMTQevblFVBLR00Bb9aXtvy8/za9tk2/LlFukp/OHd/JosnF9awmKQdF
	 f2Tq127Gcm6ta5svUmySCEAqmmqH07eyakFt7Ia657Fwj6LRQ5SWRteMLgOOhSbBPaZ9T
	 1WPif9RFhriHij5ejixRW80vgpOMjvOac7zZMvWhdBnNUNZmnqD2PRPm+6R53ZFvDsHV2
	 VjSUG7dJJr+JGrwev05kaCy9hXopfryic8LrSdbwl2wdfAS95gcvLBCLh4aew9Sf4qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=q+cq+ssQ/u0JKUyyV0JW/cXW3+cfvTGKcQrSj4RU9Uo=;
	b=WvtJA42m3NpEIvvuCi9vlnLD5Q+Mv4EIjezGSHQwGrpxGZCrYvdBBEzwBWofP2kZfHHr
	 ZXfYcLXWLYQVl+N0ftnEwFjvGmmcWmkVUDbU2dgAoVmY5kSMfrdC5ljEqwHU5EllWDAbw
	 8C9qX+40iAo9x7RYlL0L5jQo+u8S3IPQ7ZoZLxtPQOH57bapnTtn/psoGgxYJNUxvntr3
	 m/9q+P/5Mtkq/YKe8Yp7yrrrQf6dfqCJdd9JqvD9UoW1h5XIUZdgncKoZbEkz3IN7+7GG
	 E+7z6+YU28mrEfyjoKskwH7Eu0qaPtTi+tjupP8vFbGnO3RXXEtYlJoMfE6YeVkOL6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTKDEd7N;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C5606A336
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E3C5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTKDEd7N
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-536c8f958d7so10597431cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220541; x=1795825341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+cq+ssQ/u0JKUyyV0JW/cXW3+cfvTGKcQrSj4RU9Uo=;
        b=JTKDEd7NwUGUSSKTexT2vvf1HfP5U7FskGUhhnOfCWczxaoyi3qgvvkWoSihJc0Fn7
         WDKKhxcnsCnr0LNRuJng5M3l6nMS9Rc3upQ5wLZF8UXRxTee/R1wC8HmwAdxY5xewwjD
         jP/JibAjl8SnOLwzkCxrnfLHlpujDXWUDQJkPyqPEcGj3AVi2pjwRO28mdQ3itFAYJZf
         Y8b+sRXF91OY2dMg05Nqk9xl03cfFzlRVoouhnBKpRuE2Af1GJTvYkM7gLb3XeWppyYU
         QKR3xlNDJbyM6tIwyY05/zjtqoZxmbj+Zq8+eGmip33ESsCfxfjEgqbrJ7sDogdYnkNO
         ENgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220541; x=1795825341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+cq+ssQ/u0JKUyyV0JW/cXW3+cfvTGKcQrSj4RU9Uo=;
        b=fGMM8fAzLC+Ge6/BAJDT/BHE6PUijLTrOUsW8Hz5hxRSXBAUo+WyBh7brWrESfMenE
         yXPvPe4O5PuHo6UpZpl3VZlm5fcvjPMyvCwpiCgQU3dn0QWeIqaBDc0ygTJrzZ/CViqR
         XIZoEBkhcRYFmrRGlXkcWUNlCTge14REKJIGPXqiZwrSuanxxjdxxLhaRKmajokziD72
         65zzlhX2OA4PyHGu804DjfnPpiMYB569OjiBSqB6YfxIwE2fNw0LHjDSpj5vyrw2nqp9
         F+IUfHmIAWyt4c3DP+6PlCeBSrcQvxTapGVQ07aCoMqwFAOvI7dWgxzcRVywEHrkdZku
         bN/g==
X-Forwarded-Encrypted: i=1; AL+hErFhFxosIiRJPGne7S/aezXvldEMpaupoJMsQyYakCSB++JZO48C3ixNTBPCA/T1s2PZziaejHsyeLFJfws=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HNcNOHowDkUMgd1/Am//+Bw8CD5cuLeKcTYmvDxz6MdB/mTrx
	8i2VpbkOLUUErw7Kj9Ho/dzR2E1dzr1cOa7TtnJVpkB5XUOuVhSj9oAg
X-Gm-Gg: AYBFou1IGa0Khl7d61AefZPcLbpGBwLJltwcdveEmwfpvZwPybAbSPKVZx1jXRQbwsX
	oC33f3eJuq79BrAQBbfOoY87vX7MfH6FNzn0ytBIUHbZV3xuz+2CsVn6Dx63gRqShciH4e2R4GC
	rxs2k74DzVfo7C+zCp1XAsQb6ZkR6wauthWosUe89Quuhb8bXplfnS4JuCvj05k63u7YWl4niNt
	j6Je+QzHTxWtfbcPS1L5ZATyI8QX8+o2j6VJO+Ig4R7yBon8mdBkk8iaAWrEMbh8/6m/NsbkvvL
	JVYDi7x/+hM4tTYFUuFdz+kBpQnkxkDCMhO9bg6vS957zD+3pEvk8GvT3CkPD1vVOlH2sStxdiG
	oM9gON/pqd1eyUBFR6ptdwghPnJ+Ys3/0IPCUqPXqkH/bQnFCKQXPdpC2C9e6qc67bvfS7SNlct
	bZUNpw8yc3azArqiCowb7pOclBDnfg8OdrQQ0RBKvIYOSnIL14oB/nA6OFftd5ALU+pspbgT9QD
	vby6dgXgaWMWKanj7NiOVk8vELCnLzL0ZDPubr2i7CCi4Nbn3V/FhRZhNLqbZNu9uw/lpfFrpe9
	RsMNw5U3XN+XuPdn5lJSbJPMaC4E3/aKC7ty9rrxgRT6XYmUxmSc2JFb
X-Received: by 2002:ac8:5753:0:b0:536:6946:748c with SMTP id d75a77b69052e-55d76a343dbmr94288361cf.53.1795220541262;
        Fri, 20 Nov 2026 16:22:21 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8absm35381331cf.27.2026.11.20.16.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:22:20 -0800 (PST)
Message-ID: <b42ab368-cb3a-485d-94f3-8f175435f532@gmail.com>
Date: Fri, 20 Nov 2026 16:22:18 -0800
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
Subject: Re: [PATCH net v3 07/10] net: au1000: restore RX buffer addresses
 when restarting the MAC
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261117193223.2795612-8-f.fainelli@gmail.com>
 <179517075795.3136.15427400757159569527@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179517075795.3136.15427400757159569527@kernel.org>
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
> - [Medium] The patch puts each RX descriptor's buffer address back to
>    rx_db_inuse[i]->dma_addr only in au1000_init()…
> 
> --
> 
> net: au1000: restore RX buffer addresses when restarting the MAC
> 
> au1000_init() now rewrites each RX descriptor with its buffer's start
> address from rx_db_inuse[] before setting RX_DMA_ENABLE. Before this,
> it only set the enable bit on whatever address the DMA engine had left
> behind. That could let a receive after close/open start partway through
> its buffer.
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index 0e9226ea05e18..cb2f3333ba9fd 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
>> @@ -724,7 +724,8 @@ static int au1000_init(struct net_device *dev)
>>
>>
>>   	for (i = 0; i < NUM_RX_DMA; i++)
>> -		aup->rx_dma_ring[i]->buff_stat |= RX_DMA_ENABLE;
>> +		writel(lower_32_bits(aup->rx_db_inuse[i]->dma_addr) |
>> +		       RX_DMA_ENABLE, &aup->rx_dma_ring[i]->buff_stat);
> 
> [Severity: Medium]
> Is au1000_init() the only place the receiver gets restarted?
> 
> au1000_adjust_link() also stops and restarts RX on every duplex change,
> and it does not go through au1000_init() or au1000_reset_mac_unlocked():
> 
> drivers/net/ethernet/amd/au1000_eth.c:au1000_adjust_link() {
>      ...
> 	if (phydev->link && (aup->old_duplex != phydev->duplex)) {
> 		/* duplex mode changed */
> 
> 		/* switching duplex mode requires to disable rx and tx! */
> 		au1000_hard_stop(dev);
> 		...
> 		au1000_enable_rx_tx(dev);
>      ...
> }
> 
> On link down, old_duplex is set to -1, so this path runs on every link-up
> after a link-down. au1000_hard_stop() only clears MAC_RX_ENABLE and
> MAC_TX_ENABLE in mac->control. It leaves rx_dma_ring[i]->buff_stat alone.
> 
> Suppose clearing RE stops a frame partway through. The descriptor would
> keep RX_DMA_ENABLE with RX_T_DONE still clear. au1000_rx() only reloads
> the address inside its while (buff_stat & RX_T_DONE) loop, so it would
> not reset this descriptor:
> 
> 	prxd->buff_stat = lower_32_bits(pDB->dma_addr) | RX_DMA_ENABLE;
> 
> Could the next frame then start at the advanced address, partway into
> the MAX_BUF_SIZE buffer? The free list is LIFO, so rx_db_inuse[0] at
> probe is the last slot of the dma_alloc_coherent() region. An overrun
> from that slot would land outside the allocation.
> 
> A later patch in this series, "net: au1000: keep the MAC stopped until
> the PHY link is ready", adds another au1000_hard_stop() on link-down in
> au1000_adjust_link(). Each link flap would then stop RX twice, and the
> restart on link-up still skips the reload.
> 
> This depends on what the MAC does when RE is cleared mid-frame. If it
> always finishes the frame and sets RX_T_DONE, au1000_rx() covers it.
> Nothing in the driver documents that behaviour.
> 
> Would it make sense to put the descriptor reload in a helper that both
> au1000_init() and the au1000_adjust_link() stop/start sequence call?
> 
>>
>>   	wmb(); /* drain writebuffer */
>>
> 

Thanks for pointing out the additional restart path. I checked it on 
MTX-1 using a temporary instrumented kernel, switching duplex modes 
under incoming traffic and recording RX descriptor state before clearing 
RE and after the existing 10 ms wait in au1000_hard_stop().

Across 11 stops and 44 descriptor snapshots, nine descriptors had 
advanced addresses with EN set and DN clear before stopping. All nine 
had DN set after the wait. No descriptor retained an advanced address 
with DN clear afterward. Those completed descriptors can therefore be 
processed and rearmed by au1000_rx().

The Au1500 databook, section 7.4.4.1, page 134 
(https://assets.sourcengine.com/datasheets/e176e7fe-d2b8-4143-8002-16670131c1ce.pdf#page=134) 
also specifies that an enabled RX address register must not be rewritten 
until DN is set. Moving an unconditional reload into the link-change 
path would need a demonstrated safe DMA quiesce point.

I have not reproduced the proposed failure on the tested hardware, so I 
am leaving this patch scoped to restoring addresses after a full MAC 
reset. This finite test does not establish the behavior of every silicon 
revision or every link-loss timing, but it provides evidence that the 
in-flight receive completes during the existing stop delay on MTX-1.

pw-bot: cr
-- 
Florian
