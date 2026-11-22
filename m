Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364307;
	b=isHyECE2gqrMrbxr4S1cG9RI9Ns7nQ6ccpZhl8+VBRyReK8FJcHKYRMr5W1qSn74XLaS
	 spOjFrYsuVs1p9jq6UB1cQrXj2xSj5Yrl2viRwi6tlrbkTl+UD7SboZnYeO0zdmKAEGdt
	 0iOBgmnjrbn9HW9i1vti3PmRud0Q4Y+dDbCvUbBD1JeDf8WreT6lWMw5FvZx3dsHSGYJv
	 sAHlR80pBMA2KGN4yuBnzVG5IDPTUw9+DHCtWhNkgmPg5OiyZMREA4Q2rlQ2yFT5+Zdex
	 N6HL7RO69/PGAngoFnH7npP3ocSoLhq6jup70u3sM93zHL5KRc2fc/Gmrq6flC54UrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
	b=BUAKzBsOBMHvt4XUhXDTDidmXtuUIIKMuuJLBrOdZvyQwOYQrsrV8Zlspa0HE9wdWQcL
	 2f+TA4eGndZANfffCwxrn7Egu+0Uu2WeTV31VmVoN1/zi0d3mA/rhr7val908jBG55vei
	 SH80VJvaXOhHqv+XQzLOoSMV6DHnSbbeM8jYviGcvut4/KvbjybW1bWVoGwMsFwmAAlGi
	 CSyZe7R7J8auPXre9WrQgMDTGwRFnNSG7u0+SEd2t+qMR0mIWYOIssIse9RSRPu0qPRuH
	 LYFuzWOLiNiaaLoiDV/t6G3HCxJqtQr9l9rTN44xcsjUORiu5QjJpM6wSfrqhak4nxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UYuil1Jp;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B332606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B332606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UYuil1Jp
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so26414175e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795364304; x=1795969104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
        b=UYuil1JpVqZHpLxVePXNnzpVNmOMyOztBX7FDXfW8NAitnVCbIxeiJVUZP8fTAxjog
         p11G/SEqtyxEyjc7Qjj/QOTXD6zCXJwOznL7B8zU3HHPJAVnZpaNnqJOIiu5KcJDlTrs
         frvOwTGOHCkK8xrymAFRlWKA/3TxJNyiDi54/+y9N4TGp8opnzglrF3wlcieWPILpWZu
         PC5w+smuXMZNQ3lJ/Z6Oze4Rr1CG0S+AJSiCvXZy5eUKnHhNZJ+wVmwGskY+o2qizl3+
         VGszQjxr7HnsyUkhkhVrahUmPO+ieu2zNKrSGh4NGp1MhG6sSsu5KWbqgp49DHoE9Q44
         7/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364304; x=1795969104;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
        b=XLNBIlpSjcLFHsyMmojR9eHPiX1C+WzUHuEbTMbTPZvISjwpN0Zj8/n1Jj+PRa4rNV
         3R8A9CyDdzFbpI/bt1yrsIVmhBTFNPxVjTPEMkYaxiMF7Wc7JXTiEZbiZMZHwqI/OU/X
         swjZ6cwsHJp7HrhkWNq1p2y2UPGQCmwuBZBqFkHamfuVjdw2Vor/JmyvCNqJ/fxNA74y
         lieqbL2mUVojxDdYoPiC8HmtNjnyWIQrRZO0Vrx8o79G9J6+rcRaU7guO0TdhyQlvHSA
         kHX/x1jTKzUJy5YqXr0P/PSaRiRd+0Jb2CvFRZVzf49+Le/foDHT+So5HNDLcQv2NgT9
         QGEw==
X-Forwarded-Encrypted: i=1; AL+hErEnt551hKIVXu3LcdK1/nYgyQ7Q0qI9/dTcm5RmJhcYTjspr1npOu3YJG+AcfpWyULmvhnq2qw3UF1BV2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nJoONXgKIx4X5SXvnwwP6y8dXcD69kLWwQlprCd846K6tZtcP
	3wZYDcKLFFREHU+EgIYz/di+2EqvGqfP3Y+jizRMwZqXyHBKcy9KBaA8HYkuessSBqQ=
X-Gm-Gg: AZFdTZd6tisqJrVQArhy7Y3MUbo4yGH1Pm9zxGMlU9ZYhuviPbxF92ya59mVaMmlo5W
	30UG7HVNYh0/o0xJ94M/MTAX+jMfdSmOidX+kKbqjWw9syO3Rut0eFp0npxmk5JmNl/KZArfmG3
	0dvJVnRNV2x7jISwBp4pFiBd5ZcRhqSk70zffe1sl1WUD8p6lHRelyXAydKokAMCaOqWBn5SdIM
	7SgGlw9Lnrg6JKRdVHeOlkNo4A2OdlAKeae9kGdkxY9LNDXR/trx9BawMHAK0Jf8MOPFmK+wk4U
	wCTvJftz3NfTvf3KPi8zYgmWLjTPMkI9Mqyxy7J0JvnoQgRpn9BVq7woroaqKJ6PE6N14cNIXpY
	objQp0d1HfPLli3OiLDqdvu7IEJhLQvLDjHZihwY1BXB5tkCe/1yf3vdKPpIoK5fqRn0wNDvEDv
	+VXLG/1X6MqdgzdPD+jS+tffdQXHqbIo1qQ1KRLYKhchdLmkx2zswGP6EOKVNp/m3TsErOKvIqA
	3UDeeh33a77N07sgfRhdPDfvFgnoibLdv26w6TzvsxyVv0rM4du0khmPaGmqm6k1uwPsp070Ct4
	F1nJvC5bbyhLwU1yEy90nzSqFFClZp0kEfLU9oipFan0oyCE
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr46862925e9.2.1795364304705;
        Sun, 22 Nov 2026 08:18:24 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm226037545e9.4.2026.11.22.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:18:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Sarah Emery <sarah.emery@canonical.com>, 
 Ze Huang <ze.huang@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Cody Kang <codykang.hk@gmail.com>
Cc: Cody Kang <codykang@vsit.ai>, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
Subject: Re: (subset) [PATCH v3 00/17] drm/spacemit: add SpacemiT K3
 display support
Message-Id: <179536429642.2728475.2044119204203952258.b4-ty@b4>
Date: Sun, 22 Nov 2026 17:18:16 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=207; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=v3hfU9UHf+Kw6j8mPInDkRCmcdQcn/tFYuhWer9PVLA=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMouffLtac7bcg5TPvFslVKz/IiM43L2d2W3La8FzzF
 i6bCx9Xd5SyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAim44zMmxxe2hesHqmrEzE
 C5a4iu+CTLL9sfqpvwrzRPpPFr2X/8XwPyhe6sxK569/On8WiM9u/vRjfl5c4ZyfsjXJvPYlub7
 z2QA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-spacemit), thanks!

[06/17] clk: spacemit: k3: parent eDP/DP pixel clock to the PHY PLL
        https://git.kernel.org/clk/linux/c/dd010f2b662d

Best regards,
--
Jerome

