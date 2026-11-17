Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943203;
	b=wbOxq1D7XcDAIiPnYu1WOu8em0U3kt8j507c3DKOMSeOVvSYQr0xAjOmTNEvbpqDz1FK
	 ulWlStYzX+ZRL9Tmwam4yVsNNFl5DSwuC2Oe6ipny9gVTuSwsCOLMHEqVBGQkXPw4o/aA
	 iizgoqUzbBKEYH3Q6Bk+B61yU0OFiGwz+tHuXMlUG54Kbsb8iw+X4AU47ERu1qv67c2I9
	 zLKCrkWsMlxDlwKUvIg5qsLL3zEBBi8IvUsI62lV9gvYt+z6nByGsQkUqJFY7cl411lpG
	 vlQKJrtT3e6j3OysOkVAylCQgrJpOrfVozlvTgYRIJuZc2RkpM/01vHO8rdiapbLdjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5f5C80g30fAPj/I2D0TndVTdrcqmqXcICX0m5JKKxiE=;
	b=zjAF9JawEYiqE974YK0PkSyl6aCSY6fyrx+T8ZgJoLokrGi93WsXXK9bYLu3c3XzmRzB
	 zrqkBUIz7JMXOZrAJq8udq6wOTlAyFGeIMyiUWnA4xcHYvuWH6w+FZnh0Nsybx8yREP6a
	 rm3yy/xGupvytr4bFhp8KMUYiyZiZI/iGpI4iuUidsdAjMpQbQWofAuuC35Hn5YNTpOti
	 5j4QxO4L+TEjo762DsY8xu/JNB0GNrwMr3LSTxzom5iAN3BwxZsKFpCZfI+DRiYz4XqrS
	 f0zOvtorft/XvTPI4a5hChATJaZ3gbE0RFFnTBZ7fttimnbJl1qTnUcy9hJf0N8ScuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0pAsIZa;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A940E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A940E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0pAsIZa
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2efddf749e5so6232745ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943202; x=1795548002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5f5C80g30fAPj/I2D0TndVTdrcqmqXcICX0m5JKKxiE=;
        b=U0pAsIZaKRAVwB/CUQOe98pN6l9ng4fVxpQsCNRj407Up/Y4v0ww4I2hcNpO3fi/3m
         yQLtdbkmRAuZOqeeU9+Y1zrBeTdB6KnODUVepEB0/RV3QB+80FsAC5tXjWnCt3JURD/b
         hVMvuuAnNVFdV/0zWIY5HtQGvXyybQqNBalZTkkDLyBLeaAxAalG7W0IjBVsRFn6e9Ru
         /kZRmjZXQ3hedfAxPWxC8Zl9zpLogOWnUHf7+6ETsZOyQOUZHXxapqNpMw4Vk4frTNKL
         j71EZumfZgXABGz48FHpY2/SHsX7TzhOmPO60DNgt0gM8asyMiON+0kP+DspNU7bufEg
         r2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943202; x=1795548002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5f5C80g30fAPj/I2D0TndVTdrcqmqXcICX0m5JKKxiE=;
        b=W+cmgtlSYteky/fyeEgZ1goJCjHz/bvspvmnaw5stHTFdadwn17ltiCia6c3vygez5
         552h8/k+8r3RVYVglVcOrvqTFK8nD9XUIUL82VcHy1j70LB7ybnLPUWvHWDg6l3cHcE4
         2gsVMEplWSFRhwYxi8WGiRUVkHqb+3OqbjtLqQtCDoXL3e3b3BCtxDhDWdxOd+KoUqab
         eHLff+s5L08qXwPZhchoTIs+rGLNCMt7Tm2wmlkwXMmApZIS8gRwcql4nhKv/XuTDjtv
         V7vjS+fck013oAeLJ9d3DfJnq8HLMOkHi3Kp183UAMyUmkUSHTPAP6vB2SsEcJ9ofHMT
         WMZw==
X-Forwarded-Encrypted: i=1; AL+hErEQ3geNRBV1rnbYu+Sv95MNwA3f5LxhPGGbm+tHolIuqXMCtw3MCAfGWD2zoiQdgD4Jyr9O6ZAkYJ0REWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hss9JpN1A9Y3KI8yqZgCVqTWPLfXSG4pxqdpA5/+mcJy4JX9i
	VXAdF1HkZGH1w7yxKdPQ3lEm2vlyLFw7c9RnVrxQOH5LXkjH3dKkGRf1
X-Gm-Gg: AZFdTZd40zHnPMcylX5Fdv20v8LAMF6AmlowLHMj1P+NJ5EWgpPcUX/16lX1l6Gsx1T
	u6NajAMvsg7svPTnFII5rJm+zaGxek6MimRp91s9S287aaFAcqphT/7l+5Lmahldl9wClN48LlR
	5CDmiLKS7qHsHjLx0SnFDnYoPdvjra/sTbmVF9wWui+rag7+JDJAar7K9rDe+Uw7CeZGgc2gbPE
	5E0d9HMWSoyuEyy+GswgBlaAEg+Erv23vr4M9PXf/48kc1Rzx+AaJV8wSiyYWxz8GmS++TzXh2x
	2mCVFOtIJ7LQFhuovYVs89HMDtSkOa55dPiA2YPQKSJBkMJY9LFfknLMquACbJmVwGzEoc/oc1y
	pI4+cDkN3P5OmhXBXI18dGVGeA4GSp/FhR8Oxrrv4nyvx/zJgltZ064zEQUx9o4rB0q8SMOCFAr
	y84IvxZgK+tGRsfLVYtuqpTQxdGAggBabx2zpIc2q7SdYIQTxvz7E84jmZgjhYUn4BnPNn+Va1q
	ZFAn9Po/bSs6Ib0ktSOj+4jQesJyUvBj+C0uxbB2ARL3LXXnLbRwH91liM/P1dH5KQ8Yngmvm/H
	YtPObPB+Z/HYyJLFYeML2vi0qDV+3fd2UkciejJ4MyxmGs1Hs0EBTAUf
X-Received: by 2002:a17:90a:d2c7:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b3d0856d06mr202762a91.39.1794943201850;
        Tue, 17 Nov 2026 11:20:01 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde45sm318890a91.11.2026.11.17.11.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:20:00 -0800 (PST)
Message-ID: <78fc6217-463d-4ad7-9bc5-d737a435ec3e@gmail.com>
Date: Tue, 17 Nov 2026 11:19:58 -0800
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
Subject: Re: [PATCH net v2 12/12] net: au1000: reject frames larger than the
 TX bounce buffer
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261112045301.3669532-13-f.fainelli@gmail.com>
 <179483705182.3136.18065066878486336390@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179483705182.3136.18065066878486336390@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/26 05:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The commit message understates how the overflow can be reached.
> 
> Pre-existing issues:
> - [High] Several other drivers in drivers/net/ethernet/amd/ have the same
>    unchecked copy of skb->len bytes into a fixed-size TX buffer.
> 
> --
> 
> net: au1000: reject frames larger than the TX bounce buffer
> 
> This patch adds a length check to au1000_tx(). Frames larger than
> MAX_BUF_SIZE are now dropped and counted in tx_dropped instead of being
> copied past the end of the TX bounce buffer.
> 
>> au1000_tx() copies skb->len bytes into a MAX_BUF_SIZE coherent buffer
>> without checking the length. Oversized non-GSO packets can reach this
>> path through AF_PACKET with PACKET_VNET_HDR and PACKET_TX_RING, whose
>> MTU checks are skipped when a virtio header is present.
> 
> [Severity: Low]
> Is this description narrower than the real exposure? It reads as though
> PACKET_TX_RING is required. The plain sendmsg path through packet_snd()
> seems to get to the same place:
> 
> net/packet/af_packet.c:packet_snd() {
>      ...
> 	if (!vnet_hdr.gso_type &&
> 	    (len > dev->mtu + reserve + VLAN_HLEN + extra_len))
> 		goto out_unlock;
>      ...
> }
> 
> After that, __virtio_net_hdr_to_skb() only marks the skb as GSO when the
> payload is larger than gso_size:
> 
> 	/* Too small packets are not really GSO ones. */
> 	if (skb->len - nh_off > gso_size) {
> 
> Take a 4000-byte frame sent with gso_type=TCPV4 and gso_size=65000. It
> would skip the MTU check and reach au1000_tx() as an ordinary non-GSO skb.
> 
> Real GSO skbs also get through, because gso_size is never checked against
> dev->mtu. au1000 has no TSO, so validate_xmit_skb() segments them in
> software into frames that can be larger than 2048 bytes.
> 
> The new check in au1000_tx() catches all of these paths, so the code
> looks right. Could the commit message also mention the packet_snd() and
> GSO routes?
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index d60430a3795ed..d8855ccf87aa1 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
>> @@ -1008,6 +1008,12 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
>>   	int i;
>>   	unsigned long flags;
>>   
>> +	if (unlikely(skb->len > MAX_BUF_SIZE)) {
>> +		dev->stats.tx_dropped++;
>> +		dev_kfree_skb_any(skb);
>> +		return NETDEV_TX_OK;
>> +	}
> 
> [Severity: High]
> This is a pre-existing issue that this patch did not introduce. Do other
> drivers in drivers/net/ethernet/amd/ need the same check?
> 
> Several lance_start_xmit() implementations copy skb->len bytes into
> fixed-size TX slots with no upper bound. Their slots are smaller than
> au1000's 2048-byte MAX_BUF_SIZE, so a frame one byte over the limit
> already overruns the slot:
> 
> 7990.c:lance_start_xmit()
>      skb_copy_from_linear_data(skb, (void *)&ib->tx_buf[entry][0], skblen);
>      (skblen = skb->len, tx_buf slots are 1544 bytes)
> 
> a2065.c:lance_start_xmit()
>      skb_copy_from_linear_data(skb, (void *)&ib->tx_buf[entry][0], skblen);
>      (skblen = max(skb->len, ETH_ZLEN), tx_buf slots are 1544 bytes)
> 
> sunlance.c:lance_start_xmit()
>      PIO path: lance_piocopy_from_skb()
>      DMA path: skb_copy_from_linear_data(skb, &ib->tx_buf [entry][0], skblen);
>      (TX_BUFF_SIZE is 1544)
> 
> sun3lance.c:lance_start_xmit()
>      skb_copy_from_linear_data(skb, PKTBUF_ADDR(head), skb->len);
>      (PKT_BUF_SZ is 1544)
> 
> atarilance.c:lance_start_xmit()
>      lp->memcpy_f( PKTBUF_ADDR(head), (void *)skb->data, skb->len );
>      (PKT_BUF_SZ is 1544)
> 
> declance.c:lance_start_xmit()
>      cp_to_buf(lp->type, lp->tx_buf_ptr_cpu[entry], skb->data, len);
>      (len = skb->len, TX buffers are 1536 bytes)
> 
> Using the AF_PACKET route from the commit message, can an oversized frame
> in these drivers overwrite the next TX slot and then the RX buffers?
> 
> For frames near 64KB, the copy also looks like it would run past the end
> of the lance_init_block or shared memory area.
> 
> Triggering this needs CAP_NET_RAW in the device's netns. The hardware is
> legacy: Amiga, Sun, Atari, DEC and HP300/MVME.
> 

Agreed. I have expanded the commit message to cover both packet_snd() 
and TX_RING, including packets left non-GSO after virtio-header 
conversion and oversized segments produced by software GSO. The existing 
length check covers these cases.

The other AMD drivers require separate validation and fixes; they are 
outside this au1000 series.

pw-bot: cr
-- 
Florian
