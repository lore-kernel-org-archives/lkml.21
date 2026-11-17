Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948709;
	b=SuzCN5/HiC/hWEYIbyoCEDML9KFJO1Durp7s1yqzXlZt+x8A8d9eZA5Lgb3wngZPWQOn
	 v5l65PU73G5FUGt34KF6zLFSzI01y9YbC5F+JdI+P9JbG7g8RtUO77aX7pA9Gab1hKjIJ
	 Q20+JMox0Qvt2KH1DK6g2xLpfbxAiX/2AjyAnkhi7HIDgJjpVGSugM3YByps8fqtzy+NA
	 xoo7TwKjq4/dkYX776c0G3eQ9xGHN5hsjyWbSK6rZFVyKiczrrNZBtbujXzfKIAibeL9X
	 c8YGB1oo62Cbpb85xrPHPHuWVzgerLFVN24R+4Op9zhHaYqiu55rTwCCxGgOlNsjQbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
	b=tbeH3rxUpR/6l89UEni3ZOHGIDaceMnJjx0rGvjCOBSuviaIG0YOPWqCx/V7B0ySqwT/
	 wCuUP1rhifK1EGhQ1Z3eBnvZlH22hKeNh8hTpdC481Qhv1KtzoQgQZW8curqMtdVQRdYS
	 6XrLUA3c0U1YFquDio4gNeqnRFc6Sw6Lh/YyWyc7OWRzMkegVUDudxavXyoQV3x+drQ31
	 IuNSgNYSj4BjGvWdV9I8pRjEy909PrHlknB6CpAhTDTp5x2IUDzQwEW7l7xIxqqZQl32x
	 xUM4tqJKRfY0QLDVClBDbvbqJE3/+f/bjH0zqy7oIUZbfCIHJ6Oaoiv6ArVMEdMOCsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PVf/MNIb";
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D027A606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D027A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVf/MNIb
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b30ff12f84so1312447b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948708; x=1795553508; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
        b=PVf/MNIbC8a6bfWjqZsIxgcF6k2/UaWL3F+LZLDew2Ev/fZ2Lu81CYI2wWz7Stxkq7
         L6ByZQ6Z42kEUj+NdNL4lNmZJK+zv89zA++4ek3zydtxjSKHyqJU+05UPBXCTOD2ZG2z
         3vMal9prNOcq0SOcvs6A3Oq02OC0W8ncTrMwhoUQmiaXGVXbcf5cxEUO8dFV1hg1d70M
         2HLVh9M7my3KAxVDfSULrJabCnwF5iqImeMt3Q+2htXO4Vrk/B7KKWbgqKWVj7gpL08j
         OOWeeDVHafI94yxstctdFUyjan6C+EAof615/HWP1AlqJfwBGVOXnpZkm/+mPNuzwcRY
         UN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948708; x=1795553508;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
        b=Rn5cy7QdbEZeVI1bXmywTHCfar+B8ZCS33xuxu+m6NV2p9UNN1yi5ZitJGMdKILclA
         LcWhax2iPO/sYa+jWzN1O8tuS4yeP83nnLYINY5y+LMM3t48cC09U0I2JvpEHhNRL8lc
         bnhCc6JjsTq+1NT8qJzlqbMfNUCHElNZS6W2n1WqxxKwsbUrC7p9G8Rgrzoml7pWmtl+
         AwPtE9tpiNNySEA0dCkZMCPKdgwT9Pl8y+dZbvl92708IQPvmS9bOsLIDUwyCOLlwUhy
         c18J0LuYv5wYjwAraOtH2avnqgzYlqpJwvxzD+/n07ADnJfKS8RApyzIU9X4ZmVvumcW
         D9EQ==
X-Forwarded-Encrypted: i=1; AL+hErGp97URQ3gKL0h+1/O8lX+8f6ezX7Rk3Y5R37G4gODEA52o1bBKUchuOh7F6FVshg8ucFX5ld0V+W/aAGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YfqW/DVnW4Jxh509zwPAMhCgfIK2YYzztqj2iBcp7Smxfm3Fz
	2Go65mYiFb9SrMxuzGuJTqwqK5TtJ0hGh1G0lK0IdRTYJJo8nKiuaUma
X-Gm-Gg: AZFdTZcOrMUcbs5j1fBvkfFT7nyRHVemx5GdNVI9oY8Aby7iCjOd88Ug1C7gQJZdVH3
	c+TeWVI0H8QYMVcL50etd9mtdk2rwn4npyoOVwEI2suXltr4CQc6R71fDSEA8/vaz7pmz1B3GOL
	8kyF0gOBr8qG2Mu/tQXAP4BePNiEnL8Qw4nP48pN4PuVQz2j1GAhvdfyDC3RHnxeGE8rTRNSO3D
	6tmR98xChTtaDOd9yqdic1xJ0JFcQlCMsKVyN0mHWTPQm6gIydq1Q9YZIaOyQxCNu0RUZZ+XiVf
	E0Ayu8OV0PTlRyH0cbnlTJNtXjJrGoY/B0ZyDiOngOPYl/xGW39LxtOFzHvJZsPMeNev+AY2Tax
	tH6D91Toswj3ieM3mIT0V/utR6YBSkoFq4JsVBdZaL4AMTbLsnvS5QitLcRDKbUp74zxpHvU80J
	JMmr4Zac+iGrqVUKBwFa9E/5JT2yun4A4sDWCxEO8IcnRLDc64/roRRw+i/ZL4ckAmWCCTpfJDw
	wKWASxVVWBgxTckgF1391AODHfGORkNx7CqmkgI9iGmijDDM/wEnH1kCDU/1bspj4r36tGQ9Enl
	JQgl06WbI8nNfLqrDl7ujXLH
X-Received: by 2002:a05:690c:306:b0:8b0:e479:6872 with SMTP id 00721157ae682-8b4fed09583mr3173897b3.17.1794948707375;
        Tue, 17 Nov 2026 12:51:47 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe057c1esm6086647b3.20.2026.11.17.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:51:46 -0800 (PST)
Date: Tue, 17 Nov 2026 15:51:42 -0500
Message-ID: <f4b8c87eb0676500661ebea67363ac27.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Cody Kang <codykang.hk@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
In-Reply-To: <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
 <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Icenowy,

On Thu, 03 Sep 2026 20:09:42 +0800, Icenowy Zheng wrote:
> The connector available on the Pico-ITX mainboard isn't a DisplayPort
> port -- it's a USB Type-C port instead.

Right, it is a Type-C receptacle, and the commit message should say
so.

> I think you need to model the Type-C port and alt functions of it.

I am not sure that can be done on this board. The redriver/mux in
front of the receptacle and the PD controller that steers it both
sit on the EC's own I2C bus, and their interrupt goes to the EC too.
The SoC has no bus to either chip; all it gets from that side is the
DP1 HPD line.

So a usb-c-connector node would have nothing to link to here.

Guodong
