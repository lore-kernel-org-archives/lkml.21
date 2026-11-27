Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748973;
	b=FrKv3GdDiKZTwKUcCcDDPAfW9/KVO5Bp2b9EYM5alwC+tkrF/A+yw/Qit+g9eHLvz0/T
	 6IR4QiMzk3JCH6mZRCuoXvRmW3h/gUIDu85uj59x/zuS4dtXcHpwB0xBGTEWbxx8uydwX
	 dUF10AxSv8APwDlOZddTfa8WtrebFwEH52SaSbc/pzQ/7tlp5IQZxf2eL/UhzQD+O48mC
	 ivgnwwSOtcOfoeWAiIVt8rUu8SdOFqIWoIpRkttYD7+GgJU3blzL5Ye40uo/NZQF7ZjoA
	 xSPM1DNJNBhK5L/0c3fzcUsI/PUbwiLpsubvUpIpOvAxXucKcPbX1IfunvUqGWgwg5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lYdXgvNP0+osPYkNvp5kuJoWkPSjofQK2n2XC+K8pfo=;
	b=iKx0P/Lwc2FC+VtMr2CF7bhUD91WGfvyW3CBeHdpIzrmN5WYBCmJXGRlm7sPf63KCc9W
	 qPr5mQlpcvSO4E2j88uitApYtfE8V1/tJjnMLEAI0ivL3/rllibghYeoNe4Rw0/C39bXF
	 1DEbYx1O1GN6hT5gzNXtDdhTcvD/6DmAfOgQFx8lORXPimGp+JRM0tiTahfm4iiktwrkb
	 Pk0LGBUimjTBh8JA2z4cau83zBQywaPxUHqxp6ge3H8yk6JKXhaEZ+r5S1q8fRNIIiBhT
	 Q05VndVzo2QGviRNLyMILS+fIB5pdVPOV3BzBc7o2uYTwO0RzjnybhcltelLZUM11Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=KB8PH8Fw;
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2526606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2526606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=KB8PH8Fw
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-385d8a00598so11132665eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795748972; x=1796353772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYdXgvNP0+osPYkNvp5kuJoWkPSjofQK2n2XC+K8pfo=;
        b=KB8PH8Fw7SgTQKHOGbHoQOc+kp9UfGQLKkah0BG5SMsl7+YyD3yfrOo1szuMxsVfgh
         JDVvNuvpQ+hC5sYQv85XG+7NbrUnp6k7gVeH9CzWaRXyQffIAzDujsLObXfaLm1kJMYC
         hldQSy0znLpSteuiZ09fidyzBGCnWE4JS+ZpFZCSl0Wn8z0PTDM3Z3E/XrMdsHfx47/1
         htaN7bDRZpKdWqST/KLJObhT+GBomN0mug9S3X3cb4ALsnt01OaAMZxTEor3+iKppHmJ
         g0nQdb7at8godzHEgTXNJxhd4BOa7PZeBIx3HCsxHNR7jM762fhqMjAKJjPTAF9qoEkh
         fK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748972; x=1796353772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYdXgvNP0+osPYkNvp5kuJoWkPSjofQK2n2XC+K8pfo=;
        b=Qg2Vsc9f/F7may0Rr2xoBmDt2mmQ0Xw+7CJGX25Kztky7ML0MeWtRPB6TgtDwTBNht
         gdGDu0wYtOQbJIWqp2Xy0Pbjk4tdiUlTeWwZGQR2AExDJywVOmSitX1J13A89lg3t6Fs
         yhFlTc/vTgRYb8+ANJO5kgP1JyUX1OD8IBft+K/gAFFiKUXPVZoyUdr2X2V2Ly/DZeLF
         F/DFVl0VxnlOWnhWQXjNvtVFIYsQegN58yJxxTa0URYMQRW7ZOiTAMWipCVFwj9YHvkj
         KcVBLaDcn9ui5Dr+AkI48WT/fHf3pFidyVM1vvQXuaBA6vHUT9f0X1iekDdrCBR8X4zS
         CMhw==
X-Forwarded-Encrypted: i=1; AL+hErHSua96b0Ay2V8WLiNtDsiTuoq8QZQe6IzWfldgEfErRsRGp3m4mVzM1k0kDaBJaro1VqOFn0f5PI38pOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V8iXbHgf5QqPu6+30xsAZZc6tHe0Rj/bVpx5OMWm1WpxJ6dyT
	t+dujGhiZXvQ/md6RCSgaYUN/KoYb5x6z8EcjA7Hu5LCTq1G1sUJT0vQys45+xSy/g4VqkCa+JZ
	umt1oSzsRzAykrDPh+FA75j+8fsooc878pjxfMSMlbCCfPDUskhRo
X-Gm-Gg: AZFdTZe6Izx21FfZHmD3ShOVfVXqCz72MvNeBfX/t80lcezUt89kQabTVTZe8qh8uOC
	dA95l2OCno5E/UIPxz2u6o0ntBJQbPRuCgHl/OHl4hjEJqbXBtVpbQZNG+5EYOnfCd9HMW+OlD8
	4l65yViJ4Ow61kComk7nI3a0dsVszowlkKFJjqueZ53s0etORe3cUIaRFWIArabshhQCQPX3Exa
	1aUSSeum7HUpSFJ3PwSo0Nw52ldgC6p5NnBlII6C3Vknbeg4FJ3IgZB4+2B4c3pM0JVPhM1ps2f
	W+LOTVPSTTA5wAK1ywzZr4/NlPhhd/nJmJ7B8UqvZJmZkkAK35Y/iLOfsnytW8gJ7SZSN+5/TE5
	lcJA0IHKHUdQyiBEUEaO+L1QZTkw=
X-Received: by 2002:a05:693c:65ca:b0:386:b826:407 with SMTP id 5a478bee46e88-386b826061cmr13259762eec.20.1795748971828;
        Thu, 26 Nov 2026 19:09:31 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-386c7c627b0sm1659379eec.23.2026.11.26.19.09.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 19:09:31 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH ipsec 2/2] xfrm: iptfs: hold the dst while a packet waits on the output queue
Date: Thu, 26 Nov 2026 19:09:28 -0800
Message-ID: <47c34f93-d927-4052-acde-83a84e5ef373@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <45f802a2-c639-44bd-aba0-5c81e2198c9e@mid.andrii.net>
References: <b56bbced-a8b0-4ae9-80b4-1958ea36684c@mid.andrii.net> <45f802a2-c639-44bd-aba0-5c81e2198c9e@mid.andrii.net>
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

Please drop this one: Nguyen Ngoc Thang's same fix is already
upstream as b88c75488ecc ("force a dst reference before queueing an
skb", syzbot 622de7e1f18a30fc404a). v2 keeps 1/2 only and follows
as a new thread.

Andrii Tereshchenko
