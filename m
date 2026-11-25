Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795574742;
	b=5r8RC9m0QHonp154Um3YPQwUlnD4K4bC/TUNF6svM0ZhQwUuahx115IgNEln4c2IBTxv
	 h0ZR6W4KAMn91XVJQbnC07yOw/KLz299VnobzvJrkt4mI/w6jPf+82rIpVwxLRij+2sTb
	 L982d7eDzaeYCiVgAFAvrJ28zbnqPtYHDU9V/NgHSjxoJfyfzCd5R1GbvjAQhru7u0NeY
	 DnkywL/pZCvY27kBeVj8vQhi0PL7Dx3uoljALrlAXLAL1w01ekDjrPcweVLdX7KVX4hsq
	 PoQdiUBBHPWpfSaawOP8SXVOT9+dWsnMvtoBuTXHbEhPbpTEzwRpYD51Y1fUYBN1Xjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AQCcMnbUCSPazYuo3oxbreAE4KxuxDo2jrYeTun1EiM=;
	b=Bp3KOV7yp4eL3KBecm9T0crC+bq9ZncLI5Aub9F5IzEweirX/G33WW1cYAEFoYyx733a
	 q1s3GFtH5InDn/GQAt6PhDWifoPFjyvYvIxKG6clV70dEtNqA5VZcQtKci+42ML41NS+7
	 e62WC9xDSUnfLa14B6XbIp+1TDExsWnSN8dzzIiOqp/ei9pgXN3L9Cxnm5GJHYEwG7LIy
	 a2bMnoZJa+2uVALTlP482XLXVI33e5hKsDrtlaPH0q25S8Vtp6frwakYPzRH0evi6C+s/
	 ryRexeOm2CINrlEJEwnMp9GOZecQkLNOjGmMZLg5kqMfdGO8xy9FbnzfU7kCH/KXXbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVe9P4f7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1177606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1177606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVe9P4f7
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6767d92cde6so5754140d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795574741; cv=none;
        d=google.com; s=arc-20260327;
        b=JrVBQwRRVmzDsJ16VPhe/jW0q6ZGWkbmCncFXkBXv4HALGt9wWfHhGu9xNU+QAH8i2
         QhckahLY1Q42VUPERmtDZHD026b2BVLIfCaVjHEttMAIkdiLT/ezgkJJQZDpwP9zqznf
         xB81FeN5IkYf3vuYGsvKlRvtQEsVvMdUh0rGvSxUUgRaAlpDkf9S2MjuXEbm0dsjiH9U
         pF6phbFqVm2M1xboTrjoYqAP7syVRzqtTmz4LF+fMZ3cNkpQxDgtHmdRngKRkiNqE29I
         UknZcoAT8dc6vELD5uREdKQCXA3MC9g7N21LTXOTnQiELEw4zjIdOHwtYlZMUNNrOmg8
         H/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AQCcMnbUCSPazYuo3oxbreAE4KxuxDo2jrYeTun1EiM=;
        fh=+kr08gnQQHJFV6YWpckaTrd8C3xT8bU3g5MB9PRaFi8=;
        b=L8bngQsY6YQQZfQX3upZaqNZceBsUNUz+QkUBvBBxDg6NAQla6rUSyot9UkhEniy/3
         xj9Att6M9NVDT4imZJfXP3K86qdl9x5YaVpb+ZqcWWYWbs2ChJytCHHGM+mTBTkRL3RL
         APugTAYJ7O+QqT8wOHdf1mmnbOcawxi8y2iiAH0nxAQWzTdswoxbO1ct25DuGXYqulhg
         n/pIstN6gSkMVCM8FudWhx45w9gpzumHfv99X1PPO+57vxhxBUtFSobe9iXEJB9pI+I9
         PObEfSQftI4VQSG51z0wK3k62CWadACZ98qbN/BiBSWr/8Em+QhzNWmIEa/t+KVdxiTM
         vrCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574741; x=1796179541; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQCcMnbUCSPazYuo3oxbreAE4KxuxDo2jrYeTun1EiM=;
        b=ZVe9P4f7Jc57qUdig2VezMKHSIIIQOlIlt8NwDzyyr4Et08Qwgp56v3i4bejv8OGXo
         Q+UWtm+rs+O2Z88AjMwBXf28qfMUzWPclOuV8K3a9c4uhCl3IujG3c69pL2KNqJXZYdu
         BZ37ic6tUb38fnyVB3geobiMG01MprqSeviiOeI2QoP3sxH8Q5M4zwHbTs2KY37vxlST
         cAzPkchSgkueE5M04Y5mFFk7zkys7/sD9xcS1aDJWecU4fKfTUXaA/eTDYC2QyA4XqEf
         5EjfWF61V86B86a8uMI92yCrw0oCcqYkhWuNUnGThyMuuNQdwksq3UzhkIqcCxtZNcNc
         sxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574741; x=1796179541;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AQCcMnbUCSPazYuo3oxbreAE4KxuxDo2jrYeTun1EiM=;
        b=bglfHYf3BxxcAuiOc2YJQh75NZIqg6VNgZpFO7S4cAAzg687vtRItre/zrRczOf62g
         yMuAIDcR3WlnK51UoGuUESUaF8Eq5bvc1JeQliYKcIke3fFh402MK3gPFsRhIdYwjdXN
         DomqafBS/fVQCFB0k+/95DVFZKjArMmVIty6VboY77If28cvxpIokP+r1lWQ9ZpTlgod
         TgvaWgluo8JwIvsLc/ZxNjufDYCwRKS/Dt7FETP56GSsVqGPdFS7JJlUoWckAUDFz735
         eIpr/6iLcetwD/C9ppCR/rshFLj4J403RJum5PS8dws+PaLptkKPbEV3F3Z8HAFeDWpo
         2CLw==
X-Forwarded-Encrypted: i=1; AL+hErFthI/RB7hPla3CtTT/+xdAOs5iXKdV8Q9h2kQ44t+UuqxZSWLEjtdx4ix9vfqUw+f6pILb2EYquRM1FtI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iVslEKPhOTouXBpfAsf9YTC4atnnjF+m2G9QMSIG+UL3XtSuk
	XXF67Ju6HR5kjMd4F40PaZbnuIhRty6c9JrrQriFMB/jNqF58eicAQkmcl/sIMHtMwu7IM3boxv
	0n+kIggOmf72VUNRvR5y2JM7e3aDwWg==
X-Gm-Gg: AZFdTZfEDdk5AorP0cMcmGNKC4e21FoNbv02IK3Do6pPQyk9nPvVSRYQ3tJ1ucC741X
	C9v9D5C5Oe7HS+LjsC+GaljH/91KiIG0Xn2DwL0uYpRadLZQ//RPQgepP8vrrY30Og0L5MqcBU3
	CBf3xxyX1uauuapHnhhao2hsDe6a4SqSCR19mrxywXzsfmWuOy1yMwmRvr58H5wCEjMhRPz2ErD
	PFQiiSvZT9BgJUk74tyeAPHI+XFV4qfxG4v/03/NsFvkBiWFeQc+xL6i9UswChZwxMWZhpo7E3v
	8G/Vn7A/vWjnw8nZ8IFer/llGcS3iBVYbeyUGsS7l/w9SUUhHWJeiv05tGBXN+2XMoI/dajbkEc
	ssDQCEUbLWfucLlmMWfYWF02JKdb07cOfVA==
X-Received: by 2002:a05:690e:1185:b0:67d:e36c:6beb with SMTP id
 956f58d0204a3-67e03d05eebmr5618324d50.96.1795574740832; Tue, 24 Nov 2026
 18:45:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125022643.1169045-1-montrealtango@gmail.com> <179557397423.3294.15950681362384539211@kernel.org>
In-Reply-To: <179557397423.3294.15950681362384539211@kernel.org>
From: Vlad Banea <montrealtango@gmail.com>
Date: Tue, 24 Nov 2026 21:45:29 -0500
X-Gm-Features: Aa3M54oIvkyJ3bn3ydWlOVUZC7Qr5wzVR9rO33Bvo5ENlIjcC8baBDLlk0Qyn-w
Message-ID: <CAODTFJTYhFzQyqc72-RRxbzDY_s48+6-UoEsD3i6+ioYLbyBfg@mail.gmail.com>
Subject: Re: [PATCH net] r8169: recheck the TX descriptor after a vector-map interrupt
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, hkallweit1@gmail.com, javen_xu@realsil.com.cn, 
	nic_swsd@realtek.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tested on two RTL8125B (XID 641, firmware rtl8125b-2_0.0.2 07/13/20)
connected back to back, in an x86_64 KVM guest with VFIO passthrough.
Upstream uses the vector-map interrupt model only on the RTL8127A, which
I don't have, so the test kernel also had the RTL8125B RSS series from
the RFC to enable it on these chips. Without the fix, bursty TCP traffic
hit TX timeouts (17 and 6 in two runs of 30 bursts); with it, none, and
sustained traffic ran at 2.36 Gbit/s with no retransmits. The same fix
was also tested on a RISC-V board (SpacemiT K1) with two RTL8125B.

Javen Xu confirmed that the RTL8127A is affected as well.

Vlad
