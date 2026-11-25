Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795576893;
	b=xkZi4uOjl4UQkt8aIe2mHWs+DxRkmjgpJGXLBZaIqkS35JLSy7goNDvlm0rp3SOIl3Kz
	 u96Rivzi1nnmFT1uHGgJ7eWAfVvxyYWFOeu51y71d8W7fRn9U50lzAICGjPcj6amhEMhN
	 sNdMTpFofngdtjrxvAnIACnKFdOuGUKmwvzovDTIn0yG8oOqDr9ZBHwIys4UHjcdlLgt3
	 AHOv00DI9qHEaGchlnq7QNBEKg5QgC+ZMJZFSmGWAh6KTZo9ov0l+tTH6z0zUAhp5NlYn
	 gs4nt8DwSlHDLdNEiZlehvxH/Q9nAH06tf8DMDo4hY/ARPSWIp0+ayOeR+7WDbeDhZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795576893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x882e7OTmAYxUut6y8OPWB+mfBqKYDNjHUdHSvwO/Ow=;
	b=B3uyPb53McwcQ6BD9Tx98RxLherCDsAoQEFCI2rYoXKQ6d+W+E1sP4UMRnJyp6yS1iGH
	 Wn4dh9mLqrclZVcr+Hv4DXYpVyFU7eYrTpncrl7S2BXs7SPtnaAdC3XbHqO4+CL3/5pCN
	 DVno6sus9WYoN1MhGzq24TsVhVCUH9snQzCu41mdOGZ4cUE2Ds2lNPCxiwyroXu+G5Kg8
	 2fqIutk+hBsdrsaL61Z/rDDHvZuepkIflbQOrEZDtj3baXLNtplByp6X5V+Pm3yk7SdxP
	 5LCCOhc+YsGGewwPkcLXR/WA50PXTjbSxuPJZGAE0c9NvWq8xFf2yxiiNBBDN45qWLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0hr5G6Ci;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A21606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A21606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0hr5G6Ci
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386cf1041cdso614388eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795576892; x=1796181692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x882e7OTmAYxUut6y8OPWB+mfBqKYDNjHUdHSvwO/Ow=;
        b=0hr5G6CiYwviZ48zaFQj1P2lBE1BZI28rhQg/97jLtjNS4k+9YIzro5JBC+nnhbGi0
         TuFxd/JwRym2eyvsjKppO6aEkqIVCyMjJOue3YzcyqDqTaivIX7Z9omDLJPcjujOiHPf
         3vONMosmapHms46Za13J5qGttrAwgfX9ajcciGxnfHoyTxhjpP1tXVPEd19NP8e8GYf+
         7Brv1edZxDBWs4J3zfeM8Bsy0mX6Rnnj1B4Btj1kW0Btg1PmbpKtNsyAS7ud7BtdIEO6
         LAxNC8lQNDQBTq50pzTueurl7xU3RBBmCZWv0RzRBEtUDxlUFgVZ9O9v6dJoAjICg1HX
         kNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795576892; x=1796181692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x882e7OTmAYxUut6y8OPWB+mfBqKYDNjHUdHSvwO/Ow=;
        b=phTq5DfjLU2+Ps+rAdtcf66/jQFFI0yGHteiPtOB85iVZVMcNgrCpEqEjMVoLLVYlc
         xckpUI8JNTdYgZ6MQsJl59QxtDXB43wpIv72RtJG/YH6hnD9esQhvK99HtKBzu1rxZJk
         jVxEZYZ0bQZTH/fReBpHzZPUB4SjJ5AsY0IAeHxGRhNAD9d7NcvBwJzrrm/mcKcZkVkv
         dgJsgMnkcOyhJjJ3Gh7v+glM8D3nfB1LQgYFjS+wBOAnDStcYO7EVk+JZqQ9mxZqH3Y7
         QIDuyJ8dJEDPs5BcYs6a6HSDLm1IL6s2Sdy9GiDfvcgugn0mnkAVx8ZL7JIpFK6KEaRm
         o/RQ==
X-Forwarded-Encrypted: i=1; AL+hErH0kPCeHtgEBNZXAxzFks4Mwt7somesQCKVQa33pM9Jij57o+pEwx/c8t2riuM2utH8Cx/J69FuHQrchWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V4c1bIJOOwidyRagliF9OppCwpUhTDUhVOKUuGL8PvwB6yE14
	Q4nTysXcvekgnKgkD0pNaScQUMgNRyO6VeohyBHmiHwZSVeWRcn3KBVV
X-Gm-Gg: AZFdTZeqRWKcdU7Wex+bjbqHoxVN5hwF/eu3oVz3Fr3RytE+c4f1yeLvrElx57YenxM
	pZYlUgczpuw9JD6PuPcfADcWEZ3E/AtwPATPE0lvCxNjotGG6dh8W+6uSity1QzKYQGaettq7n8
	hHfej2KGQJTnfVbZur5fML+TKOulDspLqpX+1I1VLVBQp2ffwYVkl3qUX+s2lErDd4DyxFsfUyV
	heA6F7eSfYOTqVcyR8xDb+qtCi/C9s9cMMzcgIMp3meKjfxW2U6Es0hV9CaSk43mjff70qEeJX7
	P+6zdQEmIZm7xuUdcsY1P/+9kYY6xN5QHt8nZVOSM9On5jDZb9xpQe9oFX8WNUvz3X8DA+Y5v7y
	4gx/q2/gFpZdV5Tm2e/vffgjjg+TDYlsLYmA+yuetzjXYEJ2ZwaPBhzR8/jNZdmSqWd/khUnE1+
	HGi/q3zdh7a5OImRfZUeQ80BlBjz2kJWBkBACyrg1cQzlOBZq0emsallfQTx4K4BauTnotJDyqa
	t8ivQHSXfiiKZ/GIzet7HGXp2MGEG7u9kz4ZXWcqFi198WYHijUg+3FcMxjsBndy4Oq0jV0iZGJ
	rMGuYRJTOecAs31aeicjhcX3LVSSJXMg6+FEcBidhnH66W4j1lARupJuE1sjWfqgUB2m/KiiyV+
	VLeeqGqAP9k43n6zgUq0OA2P/69gjSyXH975Oe9FJl9ccokW+mt6k0q2mF02skwl3AsiaXAkAxX
	8=
X-Received: by 2002:a05:693c:835b:b0:386:b5ad:b719 with SMTP id 5a478bee46e88-386b5adc3cdmr7111743eec.33.1795576891727;
        Tue, 24 Nov 2026 19:21:31 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm7256012eec.17.2026.11.24.19.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:21:31 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: Re: [PATCH net v8 1/2] genetlink: Reject joining multicast groups no family owns
Date: Wed, 25 Nov 2026 03:21:23 +0000
Message-Id: <20261125032123.2664525-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <179553579407.3135.13476478403966318528@kernel.org>
References: <20261123155503.2497063-2-anilkaushikwireless@gmail.com> <179553579407.3135.13476478403966318528@kernel.org>
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

On Tue, Nov 24, 2026 at 03:56:34PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Can that window still leave a socket as a member of a group ID that no
> family owns? That is the state this patch is meant to prevent.

Yes, and the commit message says so. This window is not new: it is the
same for groups with GENL_MCAST_CAP_* today. Closing it was patch 2 of
v5, which was not accepted:
https://lore.kernel.org/netdev/20261110121831.01412fb9@kernel.org/

So this patch only covers joining an ID before its family is
registered, which an unprivileged user can do at any time. The window
needs a family unregister during the join.

The selftest issue on patch 2 is right, I will send a v9 for it.

pw-bot: cr

Thanks,
Anil
