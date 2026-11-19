Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095554;
	b=45VQ6y76ArpR1cYyFAyu5qiCxmhCrmKm8RXtKcltVrZuni+RlLkRfKnoZq6jwCgTobLz
	 CLmt4m255H27FdGfBM5x9MkHXlurmbjy+XNPGJy3fYAyb52DjuyCZlq5HHCfr3k576lYT
	 6V92E5aBnHTR843H0tZH75rodoEf3C7o6HHWu8CHLc4DlP6FGeWP6YV7sporS3mkDWT1g
	 p1/7dz1lu0o1SLL/baU3Rx0ME6ybNQO5AvEvkLKpyHz9IXtRGPP8tfMVli9VyktK1Vd5V
	 xmlbeR0KqB3+dl/f95PXlNrgR5kTIFBrDnbRs3Q4J5KNXNWXsiAj8timTWxAwOLQLzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aIKwF63+dLkhXsiETZIIUL0nQU8AYMomc2V+IHBLFfM=;
	b=m4Ps/iYi087f8uoV1eNuvEiHOlKrqIUryaCE9suMflKXhabTbOB7fciT1h0F/LJlAzlP
	 WAa8NUpcAT6fne9CQQSu4qH0Tu19BOgd7/Q56wG0jy9OIvoNWd6GkCQpO6tlO+ZtDx2y8
	 eFfdypuFa7YEYuS2sSaVvrOJOJD9ibRXh+oOb1AFo5M9GadQrsAY7ZPegNTWSBCbam2a+
	 pBsqDbIycZs4j9Mw1SpiCEUcIpTiB9q1jqzOm0LgZiC3FPyQO1xbSZ4QJMWuvKRh744S0
	 j2Oi5xOTVHqlqr/9rsZNi5ZR74iYuYu7sEYQAh3CHQeFe5TXAnAF3W6rM9XzfiRXpyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWy2jsoF;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49BA606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C49BA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWy2jsoF
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5126505cb3so143339366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095552; x=1795700352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIKwF63+dLkhXsiETZIIUL0nQU8AYMomc2V+IHBLFfM=;
        b=NWy2jsoFK1vnzUMfFEHUzWZNjmpcS4rRtIf9Ox0js20yLgBEOViEnQ9zGt0rrZwVvn
         matT/XV5SqLvzThS3SH2tcjovn2ZEUKVbiuECMxpouCtGHYTKlcPtnRdPClzHOvtKtXc
         RTAaaPmQq1I2Gr/S6jYYu3Byl4YbmlIpzMV2WUCUnTklzcYOQUDPVWJ3R5Wt3Zbuv5Zd
         lCnkzNYj15QPLBvzmKD/hcQXV/RbLE1nUsAjcMKGaoobUdYVHVXpxVxuBd8NWEs6uMtg
         8yQF/KUF3h37p4nDqmDxIE54G5vmoI8kAeWv7yeABYAgXtmuugUYiklzfpo8/idv52xX
         wVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095552; x=1795700352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aIKwF63+dLkhXsiETZIIUL0nQU8AYMomc2V+IHBLFfM=;
        b=2miQMWOUNCop0nWD8Kj7q7Qp58JOcnN19M/s046rlci+OjNfd3dSD/WXeGWCQWufRy
         wOtdX4yuenhCX73xp6y14WC3M+4npG+T9JNSqZdO8CCsjSE3Vnpjxfsdp5dByv9gC+KZ
         9QOcnl/PCp2tu7H0+JVG9xJaCh0GQqHsXCvLTEqdfQj+sA4KktgRbKKEplTLQBWGtVmV
         Zsnfr9Fu8dvaQxk1QF76xCb94tLnWDZpz8lXSYo1SPrcNJy4SIspVuukoJ/TzBP6VDXA
         gyChpcpPQYSM79im+Fu7nI4Z9pMKKFq0A7nBrFEejepd1l3YfdGd2onN7PtF5eXLvNoI
         LEWg==
X-Forwarded-Encrypted: i=1; AL+hErHX3lw/e2ie4K4uuj8LlG4zNVVcir4FjK8rfbK9//+2Zca+Vat68Tpb4bbOfAdFL3U4wBvvkt3GfJKnUnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L0xTHzzlMyKauXwMdBWPYiQ/R+T8XQmQCWTbuMeb9tkiN91px
	NuGq7C/zS5yEhDz5tgWcnHdpwnRceFeLQe0lNoSoraR4+/W2HPfuCJV/
X-Gm-Gg: AYBFou3PY4s1Dez4Kl6ewzJYoihZg5/T+Vm3kbn6/3Yp2eSaTqxQdOF5eQBNBQ67lg+
	WDkWyv38nz4f/XehStYmuoeFHkDSC8AEvkbwSzFgm0guRn/pdalp+bNTspE3guEKG8mmr7+SS2p
	f6z5Q/47uJckyY7OWdhXRVTpgF4YZU9ZYRn+zRxe2yqFR2+cM25S5J6y/vZbOIc4cot2u4iBzQs
	gqAJIQ2eKBPa4pGWsP/nBtiZDNV9YR0vGfJs2O96DESa/HXnqYKsMK8f27SYttJqbrB+rNMmanz
	djhtjn/eIGdpvLBYqZwuFuZ3iFV07avVVuDVjyhKOvI31lYryioKeHw3APVYXYhd9/l8gVBhwUY
	enUqk53wc8g/Fc+nuopDY3Pp7fvITA90a0/fo+hhNf2SvOamOXOTKslyk+Dqp874+2RRl4K4rg5
	+xkCq45Nfej/t+iJj17djrwhBaRUbPcOHvSYsBAyok8pE7Uk6PpqEosT7UVjnnafuwBy9/aDIW4
	w6fW8JGdDzOVrkOQhXf7Sr5sTfzXYVS84hFpgG/tmEen7WwCfz2fPNEILNP8Otziu5gXkX1JHmw
	hq2tLVF8U3gkXZDV0+nRgK27nZQ5sDXHG8eDF0N4WEhYj+tfRDPoo8tJnqZ4DEX7hDI5y2ZAHPT
	QX2T+OTLrsZq+M9US8uhXAQ9ARIum6cRXI/U=
X-Received: by 2002:a17:907:1b1f:b0:c50:f0f9:ad74 with SMTP id a640c23a62f3a-c510e19968bmr620873666b.9.1795095551923;
        Thu, 19 Nov 2026 05:39:11 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-31-175-182-49.play-internet.pl. [31.175.182.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123517a4asm105408766b.82.2026.11.19.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:39:11 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 4/4] net: dsa: qca8k: bound the data of a management ack frame
Date: Thu, 19 Nov 2026 14:39:08 +0100
Message-ID: <20261119133908.12428-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118104104.26684-5-kuncy7@gmail.com>
References: <20261118104104.26684-1-kuncy7@gmail.com> <20261118104104.26684-5-kuncy7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2026 at 11:41:04AM +0100, Stanislaw Pal wrote:
> +	if (data_len && !pskb_may_pull(skb, data_len))
> +		goto complete;
> +
>  	/* Make sure the seq match the requested packet */
>  	if (get_unaligned_le32(&mgmt_ethhdr->seq) == mgmt_eth_data->seq)

This is wrong: mgmt_ethhdr is taken from skb_mac_header() before the
pull, and pskb_may_pull() can move the head, so ->seq and ->mdio_data
may then be read from the old one. 3/4 takes mib_ethhdr again after
its pull; this one has to do the same. I will send v4 with that, the
rest unchanged, once v3 has been on the list for a day.

pw-bot: cr
