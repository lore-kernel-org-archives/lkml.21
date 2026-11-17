Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952088;
	b=0Z7Jz+ePHkwFuNIXEfFO9Zdm8VDIfjvVhqGPOjLo0jOjglvkCTbzQxfv+Ov1sfalXJOO
	 IBXM/Ommf1gZEnqOxqXNiG6JGBu1/bg4bfSn4r6voczksGBkGv8109bkcsZRneGVC4nKZ
	 bfs/iHT8LBOggCkNJY+E+TzDBIYio58MF2c0sR4Rd/ng3iXJuHLB9C30oz5AeXBukVcpu
	 vFlyZWRYhC2sxL7UWpJrTjFqV7YYzSe9MkPPstW9x7EysQ6ue9IK4+7IGPyAy/SOH1pco
	 Nv9ugY0yWk2btig/ka2UxtxdX1XEOZHokAniUCoBsZyVbGdK2SVGwGeD3vDreVnItLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
	b=Nz24nNJ5eYJlWEG+LVtcKjvTub9FqMl98ktnA2K6xghfuZ9YAjwlVWz7WOfzvxA2ZkJz
	 jk3F/GUadrxICkFZ61lUE07QPvIlTdJFfvYFzOlwD3TATWB7ZgG925KRjaip6tVAXqhf+
	 id/QLLgka7KESVBTyCzaFDWtTFu2fqREla0LADNVuvxuKuIlA0vmjRSBgM+SA1bYhxm7y
	 4/OBP1L156txeddB+eP97gEBEjYP6FxteIa+0OQdHMghUqNMgU9C+1/HZcEZMWcP5FHIN
	 4ZhS51q4dzQNQaEHnU5wZEwLq5RaVJyEMdrHTl3XzABzJ0wDTQMda81sdyE4yuthX5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e24jyoO5;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA28606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA28606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e24jyoO5
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so1806437b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952087; x=1795556887; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
        b=e24jyoO53YopgaSfOE/Fbsm5STwcDYn92WEUT2SbYFXEfZbdebuB9Uz4CNO+wMG10Y
         Gv6TLPmp31f0I04qRwADQYTEIymhSy+cER/u+FlolWhft22RQe5c0V9BxS3hE7/b/Cez
         W1CArqkceyzuR9xgeX22jpGyAAuOd0N1aMUX3XYYuv2GJFAcSdgJH68gkZyqVhs9awsS
         mVPFopBZA29M6jIZHeAqYRw+H4g+/zFHUhsbWEuq9eryl/muCInH27hprXKW+8XbARw4
         FmimRJiAEuJmofIyBp87dTHKXUyDm2XD0AGimHObRlVtMOhJB0FdT10oIecAelJM22UJ
         U91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952087; x=1795556887;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
        b=N7EFowiaxyrB4KQNbdwyUa+l1RKMFJpkGUCjp+ZAzIhBF0pPBgdlHsZYbF7LIeGXUd
         IL2kbDf3yRJe47n/+cn3+nOS4XIRYwBwosWg+FWzgsFd/+kRZstZaqc2pvmPfpI10wai
         bSOehOdd58qv5mP6U+J1eCZ/mQa/W4x4n3HUjkEUftJVWi6M0bub5qw9rS6ZM0lRv4jt
         JqM6k3+ez6Uc9zXsjIngVHA9dL+ax7BctiGBBhzx0xF+/Jd5qdnxb9ZZHa21QcyD2aWu
         9mvABI9NVB0L9MZNiviISrrWGEHqvewbpE/P7DwUaBhV7oUI9rqpNmd/qWyNCSUqf7fp
         BfNA==
X-Forwarded-Encrypted: i=1; AL+hErHAhjNg+zePYA7o7p2dkUzWS8PBu13BMYdrDLM5abdxHj2jH0xaOXjhytsQnZDYmyzCfKx9wO8GgAGFmpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i5q91NLAhGDQ7PM3dNiYXz4aCH6N6jQwmF0G3SxXeVk2mAmb5
	6eRgQvQPYjWAA9bK5BpeXZlGBHUIEo7xFDvgQddjk0yWSQRbY7x0PpU3
X-Gm-Gg: AZFdTZdV448C/TFoIAmfW9kYZsECQMnMB34nzxmfS6+P1zNZr4geKpZCuR2ML3cCLbm
	uxTR1uUoT9KFO0CcKb8SNy1tfwpXV95RhFVzT8kZW+BEGzQtLlFmZzQs6cDcacLe2O8md7K5/aq
	ff/HT/SLjSmv+eoYtTq7U86BIGgmGePNEPe4IQAuG4SN8t4VwMZ15mhV6mEJVIzk8Frw1j4wLbG
	EGQcQa9mfU0HHXhuOzh3Krs04FXc0aC8LuqrA+IXGHVZmPRPNiFZ9G/u0O85c9/Tz+hVdegIm51
	+G/VHUXuYCCbQ1ACBFNNlo22AdafN60OJuxvxS9cYryG/eE7dt/9++e1NNT1MPpGyb4t2dowZ5j
	Hhb9PkCJtM5YondG4HiC9mZ8VNxX1AJOVgrB2e5kKBCeeugW81KuIQyfJTkO+u7aEgpcJfEzwU6
	mK8tUXGEWQG+qmIfG0SjjoD9envem9C6GAPUKqXEtFl27bEd99LVTwmCgFSwiy4zOl5qJgijJlr
	3cRUylacEMQLrX4ZWj6ESPs02u+8LkV7JROabZq/uJnwndX/UdHLq5DouTeMBQo5dZFbuXBFy78
	6XadwZxNh7H2JzS5570BnkID
X-Received: by 2002:a05:690c:6502:b0:8b4:e2dc:3f2e with SMTP id 00721157ae682-8b4febccf0fmr3038007b3.8.1794952086607;
        Tue, 17 Nov 2026 13:48:06 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe030a65sm7195267b3.15.2026.11.17.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:48:06 -0800 (PST)
Date: Tue, 17 Nov 2026 16:48:02 -0500
Message-ID: <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
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
Subject: Re: [PATCH v2 07/17] drm/spacemit: add Saturn DPU register model
In-Reply-To: <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-7-327d7910bf71@gmail.com>
 <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
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

On Thu, 03 Sep 2026 20:08:10 +0800, Icenowy Zheng wrote:
> 在 2026-08-09日的 21:14 +0800，Cody Kang via B4 Relay写道：
> >  drivers/gpu/drm/spacemit/dpu/saturn_regs/dpu_int.h |  25 ++
>
> Is the slightly different K1 Saturn DPU registers considered?

I compared them with the K1 BSP you mentioned offline [1]. Judging by
the block, field and interrupt macro names, I agree with you that the
K1 and the K3 use similar IP. But there are also important
differences between the K1 and K3 registers, which is why I would not
propose reusing these tables.

For example, the blocks sit at different addresses, and most fields
are at a different word or bit. In dpu_int.h, CFG_RDY_CLR is bit 4 on
the K1 and bit 5 on the K3, and the underrun bit is 9 and 8.

IMHO a K1 port should add its own compatible, its own field header
and its own backend file next to the K3 ones. What do you think?
Hopefully you agree with me.

[1] https://github.com/spacemit-com/linux-6.6/tree/k1-bl-v2.2.y/drivers/gpu/drm/spacemit/dpu/saturn_regs

Guodong
