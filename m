Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578378;
	b=j5swDgwru0vQooVEaTA+W+Bdu4Pxq+UnwNdIL0xCBG66QLzkL9r9IxcaTavjIU7Dj2nH
	 p7zX8EOh5zYKv5qXPzottYJ8ZQmw4yyhlCYZtM0mtEfTcvJxF3LKI1utCmmuD0Kw7Ecaf
	 xbu3kq8uP+l8KSC3mMqKB57A4i5x0jpLTk9vV9yxJriwl0L0R0m2k9U8oqfZKg58epgjz
	 tu+InZ7rgLmtn3TmrGxRZAvu1UdhToa1cvhGpMQ3UJVjer3PbSos5ar8l9G4aGSvfTIuX
	 waSgP7vx99Cz+OYneRYF4Wln3hYQmnjzWFIC5Dpiy6EylCS5E+OGHZiXj7tPRTNyS1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bQJJxCrofGpC23ygbnJv9Goz9D/r5cCIAV9NozCmzg8=;
	b=LMqo0ASbHGTX361iHn6GaI4mtP4xMFORpKsL7xY/ve/9EE6wMVwa7CVjGYJz9ZkB77oV
	 tx4tAKhi0AfNlPG4f4sQvzjFM7limZz3mhbVNxl+nZi9v+MGD0YJXBTYkOBWeh4D+DoOH
	 QYHilWAA3Io6DIjUNEembh9bVI2b8TtqvNV2GwwmtB4L5pivJ4sHEETAB+De7f5PgvpCp
	 xwB3XRcI1nGoPa403wGh1Cq1WpkIA9fvSCVd8e07wGlT/81OZk2LS6ZfXh+Es/TKQIeMf
	 wR4RHxFabYgNxCfOHeTp8OIa/kZ89lj4fRCbOp3WZMPk4Klkgs9UFRVmhTwo0cc1lbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gfBaCMbm;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D9C606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D9C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gfBaCMbm
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so4704890eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578377; x=1796183177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQJJxCrofGpC23ygbnJv9Goz9D/r5cCIAV9NozCmzg8=;
        b=gfBaCMbm/fp+9m40d4cUAG6gCVE+9Z9SUZjyO8wQi+XcTxBe5wkmO14W6dzexi4ZFs
         QV/zE80fsDhIXyknU+Lu7BEwNilJByhMtnXsSwrud5+UOPw9FV+bVC64BNUHN+diR1uz
         bj2o/F3stORePkwDn1gOsLNsPOdcss4BUcWQHnGr0TKUIS0MM1S0X/ARpiluD2Ulo9Sc
         pRjcLF69YCkFg4UvxrUS8neyxgUnbedNMwyZTHfnthBv5Os/ckOdSD8iib33IXiqebld
         HUuyHkC6V9Pi2uXQ0CKJt5N3hipm2xElyk68UJrwPsbkAAgZ2hf1Z4mlHhax2lNoRpQC
         Jg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578377; x=1796183177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQJJxCrofGpC23ygbnJv9Goz9D/r5cCIAV9NozCmzg8=;
        b=n47AtCy4OlSha4bodtCvTQ7ac1V90VNTrnt05bFPMoXbR70VAaQC8nQ4SweAe+iVgX
         c/L4EWlpuj7R15sBzMuJvzvhYzyAtfh/+jcqGIlhYWZLK7urEIkUc1kC3SToPNOtdAac
         eoy77gFcxVg/mQf4FxX142HR/p1fVn+KcvH7Qy3LqGCo38OxiB5TF3tIOUBf9EAIqx3o
         1ATaSZk+zn/QGjZ5LnC0PCa4/UdCJrpcEbv+/i91Mp3CndMeKdY3ljPuoQbois8hMd8X
         6Ka3ImXF9KjtJcGCR+C2xWpShEXr7OGRI6O9bzAdbo+vUVstV6e3aB+BvBLORZk4F44J
         X5oA==
X-Forwarded-Encrypted: i=1; AL+hErGuY6LW+9X45EF8CFJK0bbJtbMRpZrHMIOTQ63SBjj/sua+9S/wNGkDwNfWThMeO1VxUws6i3BMgGlZR3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FzNAB4rzbcZjSdK1KYiF7CIz/vcd+3URWo8H43IefjqsyPGv0
	ljiSUu2i8q1YjfvZU6jpLUMBuCLSkwOhAryWNxWTICF9y3CjtwiG9jsq
X-Gm-Gg: AZFdTZcPnIw0Wz1hVQfq1Px8QWD8l2pfBMD4hGBV52zWnvq90CFMw895gyoYzwxF0F5
	rqV0zC5+p1AnRRhMT9xrEF8jnjwA5cOk8dd4dgzcV2lxP0jG0xH5QM2whaeLWr/hrC0jhxR+AfR
	zNeV8YD7/WgjmKvVoUYwD3O2NAE7heEW5NjnBUV/shdHLAm7yNZBestNc1YNRK4Bh9Au8z81gAi
	bOj49eOPMC+MTgxNBTBZHDA+1qr6J//XdGWoXey2JJk5mUK1aDoBxcVHReF5FVt2DhkEagTnMXz
	W4WR9xdIajl7TzzbpX679y5K9SHUisyPycbozXpoT+Ml6BNtRiEx/stlYFmOBR3LuZ1qqCnMPUk
	uudFWS2nHf8rLuA6OThU3MLzzl77snkycNzKnDeV4dPohSjbNNLJc7w8tfFUjDT59TCl/DP12cW
	GIcBKvZBsIbkamUQ/3isOvDkjcPN0uHd4DLnQYJDD1HoEU+vaA4AcuS09DDj0BthageoUPWctCt
	mdhL+UcH6PwH0UDqtzeomMi+LVGLsHDs2VVfXGqwynfkgFbHUCaruX1nXYf1MingyOXXzFI2uDC
	SjAOszzcApI43hguksdE/Hn5eHZP8QqhUzQ7FGt6sEPJ07TndQwLAp55Ort+gMxDxWx5KRZCiSA
	eX7e3x/NpZce21FmwvoycbXv7
X-Received: by 2002:a05:693c:41d4:20b0:386:cedf:5e51 with SMTP id 5a478bee46e88-386cedf61efmr1230294eec.26.1795578376678;
        Tue, 24 Nov 2026 19:46:16 -0800 (PST)
Received: from [192.168.10.126] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm59900962eec.11.2026.11.24.19.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 19:46:16 -0800 (PST)
Message-ID: <b14f881d-78e2-420f-8395-6f10028fe597@gmail.com>
Date: Tue, 24 Nov 2026 19:45:54 -0800
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
Subject: Re: [PATCH net v4 07/10] net: au1000: restore RX buffer addresses
 when restarting the MAC
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261121004809.1690280-8-f.fainelli@gmail.com>
 <179557011055.3135.6140198422373932770@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179557011055.3135.6140198422373932770@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/24/2026 5:28 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] In `au1000_init()`
>    (drivers/net/ethernet/amd/au1000_eth.c:727-728), the patch writes the…
> 
> --
> 
> net: au1000: restore RX buffer addresses when restarting the MAC
> 
> The commit changes au1000_init() to reload each RX descriptor's buffer
> address from rx_db_inuse[] before setting RX_DMA_ENABLE. Before this,
> it only OR-ed in the enable bit on whatever address the DMA engine had
> left behind. That could make a receive after close/reopen start partway
> into its buffer.
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index ea2766343d518..ec28ed33bf698 100644
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
> [Severity: Low]
> This isn't a bug, but should this be a plain store, like the other
> accesses to buff_stat?
> 
> The commit message says this matches the receive completion path.
> That path does a plain C assignment, not a writel():
> 
> drivers/net/ethernet/amd/au1000_eth.c:au1000_rx() {
>      ...
> 	prxd->buff_stat = lower_32_bits(pDB->dma_addr) | RX_DMA_ENABLE;
>      ...
> }
> 
> au1000_probe() initializes the same field the same way:
> 
> 	aup->rx_dma_ring[i]->buff_stat = lower_32_bits(pDB->dma_addr);
> 
> au1000_reset_mac_unlocked() and the reads in au1000_init() and
> au1000_rx() also use plain loads and stores.
> 
> In au1000_eth.h, rx_dma_ring is declared without __iomem:
> 
> 	struct rx_dma *rx_dma_ring[NUM_RX_DMA];
> 
> Passing &aup->rx_dma_ring[i]->buff_stat to writel() therefore gives a
> sparse different-address-space warning. It also means this one
> register is now accessed in two different styles.
> 
> The driver already passes non-__iomem pointers to writel() for
> aup->mac and aup->enable. What this patch adds is the mixed accessor
> style on buff_stat.
> 
> There's no runtime difference. MIPS_AU1X00_ENET depends on
> MIPS_ALCHEMY, which only supports little-endian, so writel() and the
> plain store write the same bits.
> 
> Would a plain store match the surrounding code better, like this:
> 
> 	aup->rx_dma_ring[i]->buff_stat =
> 		lower_32_bits(aup->rx_db_inuse[i]->dma_addr) | RX_DMA_ENABLE;
> 
> The other option is to mark rx_dma_ring and tx_dma_ring as __iomem
> and convert every access to readl()/writel().

These are good suggestions as non bug fixes but for now, this will do.
-- 
Florian

