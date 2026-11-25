Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621722;
	b=Ys5wl0i3L34uENJtKO9nju/9moa87+2XEcJZLg7mIqvExQS2we1v21bx4OvwLvF4WaeN
	 VYQlKJiZwohKfaf9Df+YYYvqB8G1Ei7putbR9NaNC61MQKFAEjN0jyMNTrmUKMW3WD3n+
	 uPouza5aLXsXX+Xkoq1Wse4Y8Vn1FapPtPGnIGl1CgNwokwg7TtQvBxfSORfpXQts1rV/
	 LcN8m0x6ako/NSeql2vUXzV7oeYzKqhdJ/fGkTnrG/cRwB5pbIZ5IP1JxRgclVUa/LWTH
	 zDU2Pv2Wwi+S8O9xG6xWCV3mBDpu1JK56ci+SCGbNQWB6p+X7q3A0L4vrHYxFz7SEuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621722;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JBmfc2TJahlGMnvUMErDpl5CqbKG2TSTACsgzVeGXC8=;
	b=5lZ4YUijDIJMiKXjApXCvHY/mLzeo5/3FdTViWc2J0TMkkPQ7WJaL/bOoC3NGiYPYMYn
	 5K8lAgoPjmL3FAA/vxkWaTkWPDozk+xpS9aoA60pia7LbGvR5zWwc2GshXsHrxv0F+Xvm
	 11tKto5n55TY5iO9b/6GROsVQet2r7+SYqNJHuALMm5PrPJyNXQDqOJJQXAZ/rgYM1Kid
	 Is0TEyHuQ3I3b5QGm4MK2xETdJH+TohTSJsMfTMt1T8WIeAW2aqY82fsqrzwSsxUxAUJh
	 1iyBdvrdnfc5m2ENkZwSt3y+ku5HjDGiTEz/9TVq7fedtAYnPsC7E7R30RLxMZc+Htg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nmep5Zxi;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gLHHS+Fv;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1441D606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1441D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nmep5Zxi;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gLHHS+Fv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795621721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBmfc2TJahlGMnvUMErDpl5CqbKG2TSTACsgzVeGXC8=;
	b=Nmep5ZxiA356MmdZh/F+FnCO5DUcWucQaKTQMfWh+jwh2ss4Vvt365J+ud6lrRXOTMi2eZ
	QfTSRnBp3Sugjn8qgOIBC+oRLT4Z/t3DQQrYsLEWeYAGy3vWdO0SJExiHqxNAEZQrdmPGT
	7ePeITzGS56D564iMeEixEyWlrjuYF8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-bLFMF6AYOpuxMEt_7GHKzw-1; Wed, 25 Nov 2026 15:48:39 +0000
X-MC-Unique: bLFMF6AYOpuxMEt_7GHKzw-1
X-Mimecast-MFC-AGG-ID: bLFMF6AYOpuxMEt_7GHKzw_1795621718
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a7c864000eso3552116f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795621718; x=1796226518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBmfc2TJahlGMnvUMErDpl5CqbKG2TSTACsgzVeGXC8=;
        b=gLHHS+Fv1RbxSf8Dzzd7I4sRIeioXwhbo0vdNSA25I/oyZU2TS5G7uH5jmlJa/f0BD
         nQP6ScNpXk5GMW2cvt321N5XZlHJf5EqckTBlalO/Dn9Wk2t/To2hny106zdknzoEtNV
         BJwOQFCHOkzL/MOCqyQbSVw35whFOtHGYW43P1uoK7hQhWClTR0CacHmuTC9O3oMXjw2
         bED1hnj+6oGeQfabHavy5TnVYiKx1oHbyV6jzPRDDCTTft2OAzyt+G24WOBrcbRixJYE
         F1784m+o4eEL0ocnUHWabYK84SywzPlB5Z+QdQ0CCDblpGVam//QvIwOojSIn34/er8n
         nGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621718; x=1796226518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBmfc2TJahlGMnvUMErDpl5CqbKG2TSTACsgzVeGXC8=;
        b=uQsuOpoY4isM5Z+i6NEQRTZzjzr+4pJ26+zNfV5TAcO9TdoWMSpVFnB8DEc+1j6T8H
         6pZO8e2t/mO+a7vHWrh2KzB5aEDbgar0u9ryOq1AjVQLY0GaJkhMC+AAUWpbNpnwW5YU
         /kvXfuffMmNg/VaUpQ4q4Qgy7tyH1H2VgdhORy7jxL2H994DYGqZTKTgW/zIcS7b2jtE
         I21PpynBq8YieqYaN+ei23hvohWu5/0YgYd6PXD4fu15uatCrdhH5tzVeVd3N/0vbp5d
         wh8+7+kWpML018/Zd4eaD8pQcB24zcAzBeUKOoYc3jie4n/u5iolwhb1jNC6WbqnRwog
         vRsg==
X-Forwarded-Encrypted: i=1; AL+hErHE2MYDuB+rNsB/CLUCmEW7BPiXD+0dOt4foN68dM/Gncrm3v1yPK80chum10HxUIT7U6ukaLxIbPFIsWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KaQHxAwMVCVOcISya9rOGQn92Ci9rR82eDNmAVJExsYylYUhN
	s9td+IG2pVVjFxXU0R5nNuNmh+HZko2E0Bb7N6vNKuliPcHQbZHmUDeJiJZvsvEg38Td8OrHiEG
	hMyQj6y219qouEVlrlWAbmFoGEgVf8gOVV1iGNWK6FWc63VI9wfs2JJ6q2CY3qsGzrg==
X-Gm-Gg: AZFdTZekU/Hn4aiPbWaQJzE5wp8u2oet+WXm/g0pLqk+QQ+uednQdS0FqVB1gA1G5nU
	tkCvu2URad2u46L1+jvWmP1wWUQMsP94OcBVAWzXP0mM63o1HtZviOSitk1QyCBf+m+N2M8JoHd
	eNIbEADfBnSZFBQhPeNjQCoJHFk2JvFR28v+rnZT1YUEexkhYHfY49NxqmJ6oeDQsWdH4wjk3kU
	6QxFDj8xwRZw8DWzO6iowBSUwmE6dvTRPnY+rmsqnXK+6zeyi2pUDMiS4cfmauxIqaxmIUD/jNK
	O4qJTqpECRTiMD6WB4EF3YvKrjERZ14ypvtT4mCWmCFK+kUDwrKITjF6YDZ8dXH/Z8D1mqSnahI
	5ill/jAO2LGP8BtWh44j/jMn3H4FUGf3cpmm6MhtJnlvJrnabKbPwvKGQDm3PIDcIvURrunhrRE
	jKJsENQb+isgCD5Z1Et+3GxN4ocag/g2B5kjSgxR9dkOPC
X-Received: by 2002:a05:6000:18a5:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-4abb7f3e149mr34479771f8f.50.1795621718058;
        Wed, 25 Nov 2026 07:48:38 -0800 (PST)
X-Received: by 2002:a05:6000:18a5:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-4abb7f3e149mr34479706f8f.50.1795621717500;
        Wed, 25 Nov 2026 07:48:37 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm28780389f8f.45.2026.11.25.07.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:48:37 -0800 (PST)
Message-ID: <3b3939f1-fa7e-42ed-ac74-c96c0bc930cb@redhat.com>
Date: Wed, 25 Nov 2026 16:48:36 +0100
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
Subject: Re: [PATCH net] eth: funeth: Include FEC stats in
 fun_free_stats_area() DMA free size
To: Daniel Machon <daniel.machon@microchip.com>,
 Ian Rogers <irogers@google.com>
Cc: Dimitris Michailidis <dmichail@fungible.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Elkin Cruz <elkin@google.com>
References: <20261119170613.1519353-1-irogers@google.com>
 <20261123090722.z5xcxwwdelnnjifq@DEN-DL-M70577>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261123090722.z5xcxwwdelnnjifq@DEN-DL-M70577>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 10:07, Daniel Machon wrote:
>> fun_init_stats_area() allocates coherent DMA memory for
>> (PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX)
>> 64-bit counters (632 bytes), whereas fun_free_stats_area() omits
>> PORT_MAC_FEC_STATS_MAX and passes 616 bytes to dma_free_coherent(),
>> triggering DMA-API debug size-mismatch warnings on teardown.
>>
>> Extract a shared fun_stats_area_size() helper used by both allocation and
>> deallocation paths, and cast the leading enum constant to unsigned int to
>> avoid cross-enum arithmetic.
>>
>> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
>> -Wenum-enum-conversion enabled; fix and changelog drafted with an AI
>> coding assistant. Build-tested under LLVM=1 W=1 and
>> -Wenum-enum-conversion; not tested on Fungible Ethernet hardware.
>>
>> Fixes: ee6373ddf3a9 ("net/funeth: probing and netdev ops")
>> Signed-off-by: Ian Rogers <irogers@google.com>
>> ---
>>   .../ethernet/fungible/funeth/funeth_main.c    | 20 +++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/fungible/funeth/funeth_main.c b/drivers/net/ethernet/fungible/funeth/funeth_main.c
>> index bad8276d26b0..e0d4e69abfa4 100644
>> --- a/drivers/net/ethernet/fungible/funeth/funeth_main.c
>> +++ b/drivers/net/ethernet/fungible/funeth/funeth_main.c
>> @@ -1457,17 +1457,20 @@ void fun_set_ring_count(struct net_device *netdev, unsigned int ntx,
>>   	}
>>   }
>>   
>> -static int fun_init_stats_area(struct funeth_priv *fp)
>> +static size_t fun_stats_area_size(void)
>>   {
>> -	unsigned int nstats;
>> +	unsigned int nstats = (unsigned int)PORT_MAC_RX_STATS_MAX +
>> +			      PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX;
>> +
>> +	return nstats * sizeof(u64);
>> +}
>>   
>> +static int fun_init_stats_area(struct funeth_priv *fp)
>> +{
>>   	if (!(fp->port_caps & FUN_PORT_CAP_STATS))
>>   		return 0;
>>   
>> -	nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX +
>> -		 PORT_MAC_FEC_STATS_MAX;
>> -
>> -	fp->stats = dma_alloc_coherent(&fp->pdev->dev, nstats * sizeof(u64),
>> +	fp->stats = dma_alloc_coherent(&fp->pdev->dev, fun_stats_area_size(),
>>   				       &fp->stats_dma_addr, GFP_KERNEL);
>>   	if (!fp->stats)
>>   		return -ENOMEM;
>> @@ -1476,11 +1479,8 @@ static int fun_init_stats_area(struct funeth_priv *fp)
>>   
>>   static void fun_free_stats_area(struct funeth_priv *fp)
>>   {
>> -	unsigned int nstats;
>> -
>>   	if (fp->stats) {
>> -		nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX;
>> -		dma_free_coherent(&fp->pdev->dev, nstats * sizeof(u64),
>> +		dma_free_coherent(&fp->pdev->dev, fun_stats_area_size(),
>>   				  fp->stats, fp->stats_dma_addr);
>>   		fp->stats = NULL;
>>   	}
>> -- 
>> 2.56.1.708.g77570a6a1d-goog
>>
> 
> Fix looks good to me.
> 
> Although, I think it's more common with a compile time constant for a fixed size
> used for alloc and free. Something like:
> 
> #define FUN_PORT_NSTATS ((unsigned int)PORT_MAC_RX_STATS_MAX + \
>                           PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX)
> 
>          fp->stats = dma_alloc_coherent(&fp->pdev->dev,
>                                         FUN_PORT_NSTATS * sizeof(u64),
>                                         &fp->stats_dma_addr, GFP_KERNEL);
> 
> Not a big deal though.

Please use the macro, as suggested by Daniel. Also please wait a few
days before resubmitting.

/P

