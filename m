Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773589;
	b=aqbzIhlsEHxc1mYExNBgnT7UJJe75WkVtsCI7/90/EMHLf8lRQjYaNs++cM+Q8njHlnw
	 X1r4FOQUHeYPGc5gnuqcR4Le4LMYiQ37vwPc58uiDrxERToqwyZNS/DIgDpn0tAQ9quJR
	 xd9FJlxeqnloLFipTt7HYIsPc3jkuxbdcJZ04BbbZQ1TknmNHOoG6tCZ24qGfMN4YPaGE
	 wZQHneu/TDPvtCyfq+tI8Smh3n+fmq29QD0krFGZvyzrit0kc6MNS6ryB0XajnLSa4XXE
	 x8MXtq225U8/StRc8V4LIi1ev50+HVDjSjxetQpToFcSYGOdAYw9p9IBqczmZTxahQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0nK6oALc+naSloQwr+O6Q/o/NLhG5dNIKnSetmOiKA0=;
	b=3x6WFKgosYEPNgU0PN6PvuSaJGrq/oKEoBeipVHIaoZsoewdl8dmpK77UF5Js8ebf+Na
	 R/kht/c37xb9a4JKZr2dYFaDcxdiDRDtMzrOlnr2BKjF8x68AsIGFTCI4NPGl3qTk0b/3
	 yF2VR41VZPZvo55uKGGoi/MuMtm0MTSDOZoj+PVjXLz1SbmKFNbZ9hZ2UG5vXNJQUtEBU
	 xX9Xd/z6o91T1+z5LLTeGm4vZJRRaVaso8JqrO1T37hd/c19ymx/8smPx4frmd4Tk+NRt
	 4xbWC4mN6gDUabA6d8an8Rohjfit3xmafVWypMBAxF45dCLMHD4KnSOg3zGhPXI5URQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1yox5AY;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8163606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8163606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1yox5AY
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c51373ae637so359186666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773587; x=1796378387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nK6oALc+naSloQwr+O6Q/o/NLhG5dNIKnSetmOiKA0=;
        b=p1yox5AYNN2uipZQJnbpRMDXSaCRlxjVfqocWix9bJXh6U29ZRSWOk6AxAz2mejS5g
         Ev0B5+rw6V4ykP9QG+hqKg9XzXbvKqUQ5G51RFNj6bDS8STlvTtBldjL7ehBF7MbuhIY
         a9GqdncJIKydAShBiTz8UMqpgoo6gEsHwRL1OqblF/JTxQ7E6luqB4lwmU6tmLaotuHd
         ltuefe8RBlTO+xrsLjGDFpLYkvQ3/BAFdPYZMlYFKQToKxM0q8x+KzDNEODB4sePc4ag
         bu4bDv9TIAmAloS4bcxC7WUGLrxQGOAZBL8Hs1cBRPFatTW6X0YrKjSbcGLNTcFAYNQ9
         uPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773587; x=1796378387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nK6oALc+naSloQwr+O6Q/o/NLhG5dNIKnSetmOiKA0=;
        b=WWvdarwNA9VQTYVWBDq6lNE9hoRwcHERhDx460NyU0lEGMkMo5p8KD6eKJS6mPZeUF
         5P+QtOMZHy/iwOjT6UsTKOWr+C1V5Sdd0nAseT7lwgsKQjGzxJ0+dh21eIUw+a/PcuXt
         asKiNJeCa2f24f2VOqqPvsPmXHD/Kbv2jjIQ7XFHCqELUFjHkl2WZ+Tkk/kpa3WV7F40
         4yUsUoqRpPQPValnJWuoT5MfVBAprYJ9Aj9akFWkOdQpmn9gOtlb4/BvuxjgiOh0/OuY
         D2ZBamey5dnjLl13sxfCpRw/jYvPFlZnmSGzw1p8TBzsTVNhxJLO6fCA2Hc/gvNnDMfu
         q1ag==
X-Forwarded-Encrypted: i=1; AL+hErHebs7UeQeit6jV39eOy5tvI1lsaCr1ZRws71fDEyL9PzZMCX+kOhpdvrnq+pNLVngQZ1sJrs+3fS50DHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z912z0CjipfidzQN5X/hONEuAuZ7/j4L+kxPR5qSI3bnuPmGW0A
	vjTow9OsF5yz5fMin9jM0K5W/tZqCOnoUt/n/rndWvJo6FlsaTFZ5b5o
X-Gm-Gg: AZFdTZfpS7H8+0Uv9jfGbwKxte3CmiMtIils11oeSVYUUYZxrsAzzfckyHYp6F24a4l
	L4GkSUqeaxM2T+zd+MzR7NH9R4RdnTBDJhgIuSsJ/C92CSpbD90lIucajPnZcDWDNSTDyPrxxE3
	+oWTUUkK5T3iBP4j2kQPLmddVkWZGkrR2AxtcmnDNFlP1XNKGd6YhChW8ASPHNm9x6D18y8+CM1
	tsNy7acTqcW22I3xtOhgHXYzgnKKWMbZ/ba9Wj+8dy0n+9qNCR2H4mm8MsjZfx7dRqr/WATDeb4
	c9h0to5SrV5qdfXryKWq2Ngwyj+y4bCMlL1UZioviIxSIcq8X/wtpvBKwHVN0rxYct45uVRFVRE
	XJWcmFSWrtv+6fYqzwPW2w7wX0FA+iY3zghoAPogTORnOFctXgXCXnc7MrMePZTmR/rJK6RTQ28
	hunsTtFNg1aj/gXwTyQ/68RzUf5NCqLE3icVD8hNH90juQk0/dw9webSU+ueyyfRXJ8ICizUDpT
	sCFMKS5bDiroqRvuV187nu6TkMODhvyqIyVADQ3v3Z7C9uyV9b9FnBVNxOltUjxq9RZLeaOAWPb
	ZWJhOpgs0Ycx2dl8pY9pSWw4w0UKFvZ6iLjZQ4Ihc/GRCHod
X-Received: by 2002:a17:906:7944:b0:c41:8e21:4d58 with SMTP id a640c23a62f3a-c513a41edc0mr2010416766b.5.1795773587030;
        Fri, 27 Nov 2026 01:59:47 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm841249266b.37.2026.11.27.01.59.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 01:59:46 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] wireguard: peer: free packets left on the per-peer queues on removal
Date: Fri, 27 Nov 2026 11:59:43 +0200
Message-ID: <20261127095944.17844-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179577288773.3135.10772290029017294104@kernel.org>
References: <20261126094722.73025-2-apasichnik9@gmail.com> <179577288773.3135.10772290029017294104@kernel.org>
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

Sashiko AI review wrote:
> [Severity: High]
> Can this purge of peer->tx_queue run while peer->transmit_packet_work is
> still pending or running on packet_crypt_wq?

Yes, it can. An encrypt worker that the second flush waits for can queue
transmit_packet_work after that flush has started, and then nothing
waits for it. Before this patch that was harmless, because the entries
on tx_queue keep the peer alive until the worker has consumed them. The
purge breaks that.

> Would a flush_work() or cancel_work_sync() on &peer->transmit_packet_work
> before purging tx_queue close this window?

It would, but the tx_queue purge is not needed at all. The leak I
reproduced is on rx_queue only: the transmit worker has no budget and
drains everything that is ready. So v3 will drop the tx_queue purge and
free only what the disabled NAPI left on rx_queue.

As far as I can see rx_queue does not have the same window: a decrypt
worker queues no further work when it is done, it only schedules the
NAPI, and napi_disable() waits for the poll.

> [Severity: Low]
> That makes the new comment the accurate one. Should the old comment be
> updated to match?

Yes. v3 updates it and says why tx_queue is left alone.

Thanks,
Andrii

pw-bot: cr
