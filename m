Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123876;
	b=xRA/PlExLr3D+fCI/XLnmEzkzjHW1Ik/zIPnKZqBnPHvJgvJ4BLzovAEY9D11FMioXjY
	 XCrsuEhtlb+Miukb5ubde35xCbENH4Fimg9JbkddYdACOmJrDvUlM2QDxg069tnx1clhN
	 i9B3AKJMOUPAa9BY/ZZ43TqXIazkXYWlJCNcpOXUyop5ZTgkFd+0VOqae6tdGdLrreylt
	 R+G3zPcz+ieSjwUT/tz0pq+l7/0JQmQAxSvGWxa0X8O5LqJcOUfHSfgWH4G7SG6Ob5mT7
	 c4yROKJvL/pSOVSK7wZVt6FK4pa0LLGbVN5KuZ21MGpHUodUlOedt03WfEQtbdu56rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123876;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=hruHLRUy8gnh1Vnhks0wNz1gcOtf8ACiLDMpD5iWNyE=;
	b=EfsQMjNUUKwHk81bfU/ZqOIonhG4wh1U8Z16q7L+Tn7us3HTLwfXvKyUply8FSxnvlNK
	 qQyhVTv3lZqPYpWewpKjzP7ISO2q4oFRCMbOwnk65daABsaGTlbZxupoxa+Os0Sd+VZC0
	 0JzJmwSXfriUKr9TMsU5lWt2Ux9qy9kQ/QzEavqJjikt7DIsj44y/H7nlCgQQIKTe9D8E
	 w4A1TGgbhBV2LdLDpu+MKzuwQq3oGiYD3JlsQK3fo0PFP52tsoOeFUBODdXIgiRsiwZUD
	 ryY6a1s/hk/vGdhqo5qAU6cWrti2tIWipAmTjAhQhpXKi1irxNV7ut7qmIz2vyYwr6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EE9606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73EE9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso209349a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123876; x=1795728676;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hruHLRUy8gnh1Vnhks0wNz1gcOtf8ACiLDMpD5iWNyE=;
        b=IwypmUfqDwKsEHte6Izc79H+KZwpi2nId5jPDjC8GcJy4/3ULEXHG57zLqMrMUUiEo
         GXUyuaXLTwNtHG35cehGYjl4izuAPvAxgfjI0IVyhayAnJacMHcY8/MW58RMbYg3yWju
         +bDQ+ZtMoqOARhCsXG4adnZH6tL+3Ba03LHDmylQA0UoLgMCKJfZMu4TFP58sJmmxoiY
         d5kZkKuPXjr/huWCp/EvFeM3kF2JMuHRT1mCquRxMgBdqpMLkrQfY/Mf3JGW/H113c0j
         UmwyX/BzOl1zoEgD6i+crR2h0R09ndnxr1kwI89vziBOlaYF0tRtrqfzHMEc/jRZ+vN9
         ApDw==
X-Forwarded-Encrypted: i=1; AL+hErGQcBI8h5Kin438Jj5fUy6yaZ6R1RjGkQFXg374IHdeCwQXC1eeNZTjqvJyJAtYZqTu6Pu7aQpv4lyv/oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z84bem+jxvXAqku+yZjKgB7M8Gke0G8WSIZAmR8V+td/31TGxp5
	xpWjYg+tvZRNUD/b6k81l2e5N9zGTmK9QIfRuUMfJH2ozjiS+jMj9niHFP5wbioO
X-Gm-Gg: AZFdTZflVGojVNblKpmtAVWh+ZxTmtWCEonui6bJvJJEbr5cHp3uxV8OzKshFZdOngu
	1xT2TcupXlMT5JKyu8juHOuHUY2ZHJrZURpvMWYwh2QHffN4Na76M8aZDjiGPwdjxb3Cfi4ySte
	gWRssOHOFBQvAqpDUqV7OJ6oRVwrC8Mq2pYrUpbk9biu+g236oDzpBezfe/uWTyXWjBdHj3Pq7j
	fG3sfN1o+P7Jdfusmy+UshgxDyo2jTDK0yKIYvuvEJ+QHDeiTh2vutNM2BhRjxuN5b+xASiP//u
	tz767DvSnxoIUwI0DaMM/WfPcbO3UpYKi9McS9vQHLZ3AofxD9wNdVM43Syk1Qli8Da8sDXo194
	5HB3xJm+dlReRDFU2lP+JuXZgov/bq2Sp8k5V/C/OjCzP+GKB2hudWDgavTzSvVVbZ9sHgBSBm3
	+OcQhIaXeDEh/S8BcDa5tVNv2iEGxSA2CKuWUnAtMrxqWVMVal8T1NrxG0OOhXb6yetleNwI43a
	4ONIoy+m3shAYos9dlNqGtKsp0Dv2nACdLb2QD8eKTdRrAVqpuWuCGIFA7YL8yHKFL67Zee5A95
	JZhH2BLxFpuvO9jv7edWTmmzo9h6Ft1dWQIfZwyFRK1E5p3xpmrEhDZod1EF9kq3JvuwVyJqtdG
	NpFU1S+AEjLIHluTn+AsODZnYOonmBZPKzys1y0OFHupWZwq6O5XWOYSCPZbqlQ==
X-Received: by 2002:a17:90b:2d8a:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3b41c95b7femr648442a91.53.1795123875778;
        Thu, 19 Nov 2026 13:31:15 -0800 (PST)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com. [74.125.82.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad47091sm1091502a91.10.2026.11.19.13.31.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:31:15 -0800 (PST)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3b4944abeso204472c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:31:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErES4O8Xu69TLYLr6aRrLUG2Q2aJDi2EibH8YBIETF1p8N1jkh9dhfq8zChAi9f2v3IaDxmYll9h4FfYG7Q=@vger.kernel.org
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id
 a92af1059eb24-1b55689fcb2mr692433c88.12.1795123873153; Thu, 19 Nov 2026
 13:31:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-sf19a2890-sysm-v3-0-b07bc7833a87@telaak.dev>
 <20261116-sf19a2890-sysm-v3-2-b07bc7833a87@telaak.dev> <179511480695.279474.4521829214953240997.b4-review@b4>
In-Reply-To: <179511480695.279474.4521829214953240997.b4-review@b4>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 19 Nov 2026 16:31:01 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6DjoKi9v3Bk0Pt7ePRW_yiNiUzfX1id7efK8i8cUWFaw@mail.gmail.com>
X-Gm-Features: AclHuK9xGZquR5VLNTlBltqHkPsM6MviyjZztqAp_KfvV7PyzlZVlXCSmeqvUUs
Message-ID: <CAPY4CJ6DjoKi9v3Bk0Pt7ePRW_yiNiUzfX1id7efK8i8cUWFaw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: siflower: Add SF19A2890 clock manager driver
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 02:00:06PM -0500, Brian Masney wrote:
> Can this declared as a regular platform driver? We are trying to
> minimize the use of CLK_OF_DECLARE.

The MIPS GIC timer runs from CLK_MUXDIV_CPU, and it probes from
TIMER_OF_DECLARE in time_init(), before any platform driver. As a
platform driver, the clock would not exist yet when the timer calls
of_clk_get(), and with no clock-frequency to fall back on, the SoC would
have no clocksource. I'll say that in a comment above CLK_OF_DECLARE in
v4.

Joseph
