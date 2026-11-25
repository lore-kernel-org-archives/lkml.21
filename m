Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567230;
	b=0mXTz8mUs0SeuS8bltQpnb0I7dFPyNv49SWS+v7tDBC7XmHSd2jzpvpr4gNPH1ANWGWO
	 b2SR80tWQC67szrxvm5rFBSnAniRyvrUR99LmOUCQ63HwlyAeonlDh9A+bng3pYiRERrl
	 n4I1qI7wAFXBge178RmsXQPq4cLXzx0ARb6A3A47OtntNeOjo1fFw2nYH4G3U4srIfrqk
	 Kt3xWGQWXS6bl7AynkA7UL0ATHbIgVn8Na0sFacWXwq5O5r2Xefc/NDkve/l10ALH4z/s
	 598/4sviw0IwLsU3pUqMXV8yWRHBJGBGoaDEVGNsTcrFuBpExuIxk3PbAlHPEg12Bwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7HiI3FMI9H20gA5Y//dyix9Owae4M1FMarVKc4YzQb0=;
	b=xsMLpAm5MM2wiGIVpIJPXCcMLkec9ST8s9E0kB5r2bpNwwdDhEPFq5EVTmfY+WlTOvz9
	 UpbyLAmLOT8cNhFyywhvVBSN9ft9QlmvmCdlgugdWzbp3zmhqnMWxUrFpnloI8xWY5OmE
	 wbY29FCENWuql5QKUTWeSrDzMTP3e/qi4C8Zbp+JTfAg6XBJgsuYs0FdhnMjwIXACacUz
	 M0Rv1LHJrmylTzr/aIEbzpcibJN++S4pV+6SQqdqFwpGxf5VvzP6dx7YbiR55G7XpjoL8
	 jSbneARvsm2MK73WKUveZtWz+z0SFXBy+KGiORZTcxXWL+upIbPtLcZNBldYXW+K82g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KIQW3ubu;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6732606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6732606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KIQW3ubu
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso6957116c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567229; x=1796172029; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HiI3FMI9H20gA5Y//dyix9Owae4M1FMarVKc4YzQb0=;
        b=KIQW3ubux0cWLy0xvP/Y4srhJHZWcbz+MwQw6VUTsEMVVSAeTMb2ZPtfVyzbmMfq9T
         NAitwxwZR9BfWzeoPxGnVIJa4mqGxBCNmd23CC0f3A+jt2IK56Xbu8cIUXGQw8pBZBlK
         9WsHl3nLrozrL1+1aLdh6XgatMbuJE/Qn9etarX5ascsnyrxbhUrhuIGUsMZW761X1nK
         Yk/cnHLB/wvdTxhM6oClTviDDOkQtLjY73o/LdvxRabJLVtIo5s0cnvWcJ3hQlknKpkm
         IPz2MV2wB+7hUbHCTHxZ2ewA/luot3o7dhJhqCb61Z6OMGlS0XI3xzdqkwVkgrVnsjB9
         NYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567229; x=1796172029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HiI3FMI9H20gA5Y//dyix9Owae4M1FMarVKc4YzQb0=;
        b=NCJuXG4SSq8XRlaxa4gX4cI6zWZdNCBJTX48H2AVpGyw1RgbLUqmD0m01wIogAd4uE
         iyL4Zpi/GpMNk3OdgAgmMO70jMPFpLQyuNtSeG7eQFC27gwDhYMElj9MGpQMTVvq29YT
         Gu85fuKhGDXLBYbstku6/q23hHDvgHnjtLHUDOneOvFE/9zjlvfLcEVifZErfIpf3Zs+
         lBx2UgpYaalY9oqrXNBuqfBUInZmnU7twNMDWDqftH+exXToK3parbY5UT56Ba+63JYA
         4E891Cs2wV5yFpSQ9q+NgfYm63utHyRiPovzWvUDYbCCWOQ95m5pFBpzj2SjS8BfJylE
         h+3w==
X-Forwarded-Encrypted: i=1; AL+hErE/R9m+mU/WSavy84iKcpkLJQei56PUgpLMa7PGVDtV58g4lVD95FZFAs2dHhfpx4R08FX8A8zpjgj8OWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z97J44T2dDwGDWqfKNYDrOe3HXX9z7C7XltpjdIbX3RjbjEwJaG
	fledJr848bBXUAYIYY/GGTkMSU2NYXYe0MhImUoNesOLEN0Gnk6pDbYgANZBaVOb/Qxt6JRMDDL
	0ZNxL9ZRSqg==
X-Received: from dleb8-n1.prod.google.com ([2002:a05:701b:4248:10b0:1a4:c892:b166])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f01:b0:1b2:6a01:f55e
 with SMTP id a92af1059eb24-1b56f39c712mr7629241c88.34.1795567228466; Tue, 24
 Nov 2026 16:40:28 -0800 (PST)
Date: Tue, 24 Nov 2026 16:40:27 -0800
In-Reply-To: <179545903032.3135.12672409534586940438@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119170623.1519909-1-irogers@google.com> <179545903032.3135.12672409534586940438@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004027.1004762-1-irogers@google.com>
Subject: Re: [PATCH net] niu: write back TXC_INT_MASK in niu_txc_set_imask()
From: Ian Rogers <irogers@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, elkin@google.com, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 10:37 AM <netdev-bot+sashiko@kernel.org> wrote:
>
> [Severity: Medium]
> With this write in place, niu_init_hw() now unmasks all six TXC sources
> for the port:
>
> niu_init_hw()
>     niu_txc_set_imask(np, 0);
>
> Those sources are SF_CE, SF_UE, RO_CE, RO_UE, REORDER_ERR and PKTASM_DEAD.
> niu.h defines TXC_INT_STAT and its per-port bits, but nothing in niu.c
> reads, decodes or acknowledges that register.

Good catch. Because niu.c has no TXC_INT_STAT handler (unlike ZCP, which
masks all sources via ZCP_INT_MASK_ALL), unmasking TXC_INT_MASK = 0
would route even hardware-corrected ECC events (SF_CE / RO_CE) into
niu_device_error() -> -ENODEV and disable all interrupts on port 0.

Since I don't have Sun Neptune hardware to test TXC interrupt handling,
please drop this patch.

Thanks,
Ian

pw-bot: cr
