Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016953;
	b=CFSYxbozeBCY66iUDDU8dVKr/lkCEVziUNrNTU6xksbkAa8PKaQD1B/r1v+UfeeStBu1
	 vZip6Vbln4C6/9UptHpU1ACroF+c6i7x1cFfE0pXSKITd7IVaRYLkxjH1A5zizcp4uEQW
	 kfNQDbcQ/51CoXpVDBZ/PxC9TMup/aPN6QZDr9tv4mqXVtpXd32bhetVMQzqFU1odibv/
	 2vH7W1DIEP0IEMuQ9GHm2dCqjj2x23wOzcl6CGvkU//v4YBJOY6NwygzMO9Sy6MXatMGD
	 3VbiyLD7YPfgzz8Pdq5oxuh0ezXGbM6scnJBkC7wBLuef/DItrT/g9WZaBmzqvkrz8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
	b=r5cMrqzRSbbR+lBCzGs0SxZwh/oBkqwZU8JUb/b0QmWfCp1+a7jg0tXP4GhzUZnO8TPs
	 iRVshhzZ3c1kP7bd5yExQHAKrIRdthHYmvp4ThdiYvr+MF5p8fRaLjyDGgKuuaA4PsW9l
	 an0Uzi+t7nWP+J8X3aGbUk6xndi0mnhlH3WU1d0S90ZIKzLHkntOQnijiPw+xnGwSseXg
	 Pe5FOCYsYbIhUqa1MwHe2zxuWZ0+UUibkSodU7Zx7RXaQWVWkVeOKeHI6KIXpzu4mSKh6
	 evjD79sGmXqONOQ8K2Ly3FoO7mNE/QtVEuppEk8dZWtCmRp0gamD0e8+tk4A2GFXwXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypGDTFJV;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089AA606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 089AA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypGDTFJV
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ea993271f2so3114465ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016952; x=1795621752; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
        b=ypGDTFJVbxylofrs7RPLtLRc+FST4V+oVKo6JjaYkTo2SZwK/1/t7hQq+hoGa0E0M9
         ira0rz4fUFlP/11ZukY6PdKsJGNIHGFSNKTnyMwGyIRUYpdjmCDun9yrsZOOmxyNJ7A4
         mWf8cFYeCvso0ggjDvnSaGm6LkHSa/zZhaIB8UCWcOSiO/ZqP8ZUeCHWqje+I/Oz93qr
         i9zWR9IrnK8zUAsTiP/DT+5Obv9xGaAbt3lf34ZJ2Te/Tv0Wujfkt5Q6dEEcn5sUR7xB
         mf1c1PH0a3QLvm0hFIpUx4yPYUE/q33sRgG5293/ASc/kBcq+0uCL3YELc17ADVzBqwT
         2gLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016952; x=1795621752;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
        b=yHLw2JibstI9vhpjHT1+1mfZU7ETKassgjIpOrcT3TDrPS+AHZE5h18PZpEcn31hZ3
         PZaaK4mydtw4ISMhgG2IpbLFB4+C6qxwMkPjyeTKde62epChrT2L4QPCmKmcy4yq868M
         jSvNgqoRISS650M2nWZCqMdNT+0fxcsTXVp65cK6jUH8vRMgVLfYWeIApXM7Q2SGBNMN
         M+PJx+PyEazyyiI6wiZQkVff1iOBP6w1eMkDmFp1/9iDoqERwXgV/CgKkfcKAk2t6CCb
         plsReFVt4RHoE+zZE8wxyLimayg5/fBP+4rlTJ06GwnhGdi9cbz3aUcbU4W22yFlL0fB
         XdIg==
X-Forwarded-Encrypted: i=1; AL+hErHjqJGuuULJyF/IxQ63XB0J68SBHri4KU2VuxiS2yRiQQ1kMvrJrpMpKMs3TXJ5RA0E9KTyByJHYaGfpNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gre+VX7aSLwhsPzLrctClYEKIIby66Pmdp8aPCsyscft4fH3O
	/PbpT0HPeBE1jUtYhEDj/wP2r+1Yu/+qG66QfacWYQ7DhaV1EjY8p3ww
X-Gm-Gg: AYBFou3mLrWFQecvnLustPNG2ymE0Jr0C0WKGBhz3NHg3BhyHhBlTVyyaDC36Di9jna
	Yoomz0Q7Rk4wy815MXEO7T9c63BUmDVMBZYql6ExvpnVmZ5x8tfUUX2AoGmPa5vuYiGdQjvl97S
	Zybl4UwB3Dg0ytpjOEjGN/YAXz6DpF7BwgYTxD2I9lXIZ0k+aFMX9+HBXy7hDzil1gGZphGwpDB
	V8W6MUhxdmp/CweJoJ+CJA30buea0YDTVf5+Un5/Wcwl2YMBaD8dy4dpwEJA2jGLP8KoDURByrH
	pjVafZN8LDbcyMJ5XfQ2+XfpUbOBbWbLOdchETcH5AazSYODDRcC7rPRkOs8SnxkYiHK7HKB7ba
	2Qq8ho09DcNtQRtX9BXqzQ5etCJSN85WMNnZ4D5cdm73yiHLWgY7L+tICCqDZP25lpfnVghNsH1
	21DXKwJ3v/TZPzj2zLWojwrPCjPLTpGQKMHUP12g+yTKj5xzqhVVykLp+mqWpV566WZUl6hWoF7
	EY92LIj48MODs4sawITXKK4UTG8aShe9ntsnEf8LjkngPVO4I76JrDQZ2fk1cjo8sogt7ANo/g6
	pcg=
X-Received: by 2002:a05:6a21:6e0c:b0:3e1:bb35:476c with SMTP id adf61e73a8af0-3fe8bdd7c38mr2965829637.72.1795016951931;
        Wed, 18 Nov 2026 07:49:11 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c6660c2e4csm1055183b3a.22.2026.11.18.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:49:11 -0800 (PST)
Date: Wed, 18 Nov 2026 23:49:05 +0800
Message-ID: <e4eb5f5b7ed8b3b6bf47d709e4344e0a.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>, Guodong Xu <docular.xu@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
In-Reply-To: <9d97d5dbcc619a9c52904ff8c6704a91fe8351e7.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
 <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
 <f4b8c87eb0676500661ebea67363ac27.docular.xu@gmail.com>
 <9d97d5dbcc619a9c52904ff8c6704a91fe8351e7.camel@icenowy.me>
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

Hi Icenowy, Guodong,

On Wed, 18 Nov 2026 14:25:38 +0800, Icenowy Zheng wrote:
> 在 2026-11-17二的 15:51 -0500，Guodong Xu写道：
> > On Thu, 03 Sep 2026 20:09:42 +0800, Icenowy Zheng wrote:
> > > The connector available on the Pico-ITX mainboard isn't a
> > > DisplayPort
> > > port -- it's a USB Type-C port instead.
> >
> > Right, it is a Type-C receptacle, and the commit message should say
> > so.

Agreed; v3 will say Type-C receptacle in the commit message.

> > > I think you need to model the Type-C port and alt functions of it.
> >
> > I am not sure that can be done on this board. The redriver/mux in
> > front of the receptacle and the PD controller that steers it both
> > sit on the EC's own I2C bus, and their interrupt goes to the EC too.
> > The SoC has no bus to either chip; all it gets from that side is the
> > DP1 HPD line.
>
> The ChromeOS EC firmware exposes some control for a Type-C port, you
> can search for `google,cros-ec-typec` and `google,extcon-usbc-cros-ec`
> compatible string in arch/arm64/boot/dts for more details.
>
> Although the K3 Pico ITX hardware connects the EC to the SoC with some
> not-so-embedded interface (eSPI), which needs to be handled first.

Thanks for the pointers, and thanks both for the review. With that, I
think in v3 I will leave the dp1_out endpoint unconnected, as it is in
v2. Let me know if you disagree.

Cody
