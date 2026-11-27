Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802856;
	b=q9MUoUefBG7korp7wZAygD3D3G+lRNSntNlHfnmEFtO8vfMQy3CRTYY2Adq1+zmSvyVp
	 FJPV6SxZ/fIqTy8SGFIn/l6idBR9MZkqVMi3YxueT3VuEVlBeH3cqTM+Zd+frN5mEvO1R
	 bwSI/7TYAb7WhgxxZ0XQUXzpE6P85b++ZLazcYE2QbQYBLP+SN4dNnwAemddS+kYusdiI
	 HLWUWT7knJWEWVJ7BVvFQpfZ6VZ08QI+reHkyS/wPrOovtHayAxurK+3O1fcGDTaxlL5l
	 64fTENh7wtrroWXXzT8nFsV6mRJfWor1j9UW71qhMNyl0FgK3M3pHgU024hMWfcaQWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=C+jIPjNvYn3h9h+TJTZMShL4W1q3aCeTVBe375LBwnw=;
	b=yBQtO/2ZXWZ0YHpc4jy8T7y9GJRg+svSjb+ymvSKybFavuxPnd4JD6KHhxvzzjVfQqFb
	 s/WvmpYksOPDwitgPSIZMuaHvYGPQ+CnFpQvAMjmSGsYmo/2Le32+G6AmJd5OafPfs6A7
	 o+Jj12WMZUMonUzhKZ1bLuYoIXhKr8nHPMZgvcwqK7xSBGBrGesah1fM1XYHJ4BtuY3bj
	 LFy2WL+M/FCTJ8nffdwhh2V4QLx8QPuriwwyui1Go5eH6bfSLbdT0Y09R6o1D2xjwKWcq
	 efvpTOeUP8iaHVsSlhgOBolwwfpdsFh4DqBuOHZRmUy+tmpCiQHUJJ0TTh0YDhCc55Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ew+YTy+r;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0616606A339
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0616606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ew+YTy+r
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-71ad047710aso5240762eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802855; x=1796407655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C+jIPjNvYn3h9h+TJTZMShL4W1q3aCeTVBe375LBwnw=;
        b=Ew+YTy+rT7UB3gv4my5hKMMNui51RIpOLMv+lYaERfblHEx27inOvOiZLANtrQz13m
         adSVUWcE05Oyqt3ZDZuFYpIDqU6vCMDvQkpOSBP8iP3ED3WNPY6gDHNrWhtBTNC56KCl
         +GND4pZlItV9kABH2WagloaPtBk2dQEayg7pGs2WV/yjrwCFfvRlrHMH+SbkPvOjFSKa
         ivy6oxuUU0gHFzQfY900KjfoRy5I6Y4D+nGIsfMvHM1pchBSTuL5GW/9vWEXNvuTK3PZ
         WCXkN0UGGXnRXDgDmwRRYFhsjkKKyzZoqS/HVkWLXuj7jtR2a2ExgE+4GWvDMif5xU8R
         kYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802855; x=1796407655;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+jIPjNvYn3h9h+TJTZMShL4W1q3aCeTVBe375LBwnw=;
        b=xxzn2JLfkh9GqCE4QB4JtRddl+AAWuLoS9jnwRXuBO/lituHsvML0m6eomoOfNetQn
         rXJKs9SFvjRdcxTxc/6dadjW1QR6AqUOgWHGI5CDZyub6lEuAk5OPaReI3rNvxzKcJkM
         uFo0KdOJdoUjL2Wd+OHpYl4a/1kBlyBh3+10bdL7wEJwECibmsVA+4NfKCY/gJCgAdb9
         aUzqYXo4X5mJGViV3EfEUeXz0TdxnbO8lVjTw4NyyPEhxsQucVWOIvcoWsCoQPPXrnQv
         tPzAyR4CQQ6FNE4IopX+Kn0/f22FjY7UGkAZTlKnhPR/G/C8DulMZPLXB7Q3QrsSoTKr
         NVhw==
X-Forwarded-Encrypted: i=1; AL+hErHC6KNIyii2vp7j6LkRfYgh0JcfxCsSAphtApPYwenGDHKBSiaQlhm1Xftg787b3MzjHtTxzwJWlD21xuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ggrw6lA7U3c/DCGYLjNLvoer4NqXX8WIhETIyUBlJb/TkDt/r
	10PSWzxc1MebiOmqMpU3Ib3xO35fmJo7UdjgnRooi9I5QJfHb+USCHzi
X-Gm-Gg: AZFdTZe7Dau4ucZSmgRRxMx/GvJRNuu7yw7i9B1YTbVT/X8YQ05B0Ip0W8/JX+cQPfD
	xLt0QYJC4cKOxMZGTtZbPPDgtAzUulhYlPP0h7TnVRcvfqCiE9SmW53G1QKjTNnCE8BBI9b4+zd
	5dyuV2a7fRN/WzhaT5BvRQaYQ4tvxF61s4p0hcedmOYigbGan1j8BM5jr9bmj0W46RF9SvRYHcC
	PCbQc1ida0FNJhKcmnJDl0H/hGzjmamM56Nm7xBynXxb4jrJJX0eMxlU49Zqi/rHx1dpQ2IdA4A
	HReZfN2WxdNlf7pYUSiztvnCvVjeA7gBkf9XRmEP184ffGINQK8MajUHcdDeAoJnou6bot1rm9e
	Mz3IcuFCPQDBd3ZdOULukAi0dGoQCdwfmawYWLYBAG6NWLAxElZcBMFgA4LqxBhRSPGvq1wrcUz
	y4alL7/vcCDhZUIOZU0x2nMWETmvwnmycCEei9VWjRepV490wkIqeks5dXPriBR/QI6FX0cjEC0
	2W6OInTHYvkHimFX3b5+tVOkBML4JUnN7lI6LS4e/Qx5GfFnH7ZwZlt7uR/gXbcAAOLs4s2MnlU
	3efUpJWtTsfYOxg0/ByJPW+QF6JIlvWIMxCXtS78WxDUdG7OSfFXGKhpDV9ExBd71Dkolk7Ih73
	Gec81YZAunIxiTNfMbRgGpXxk+O8=
X-Received: by 2002:a05:6820:3410:20b0:717:da:ba40 with SMTP id 006d021491bc7-71b394956cdmr13815414eaf.26.1795802854800;
        Fri, 27 Nov 2026 10:07:34 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38015c46sm16618767eaf.4.2026.11.27.10.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:34 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: dockseed@proton.me
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Fri, 27 Nov 2026 13:07:32 -0500
Message-ID: <20261127-a733-dt-v6-05-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <z51JFKDjnRGxR5v8f-2sigY7Ih39S9_hQJF-C7-0jwRzGvAZcyniqmAsBFOyj_Vci0JDoXGMbuWcop6uSGRMUon5bqjJFMIjMk9jN8TbaLU=@proton.me>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <z51JFKDjnRGxR5v8f-2sigY7Ih39S9_hQJF-C7-0jwRzGvAZcyniqmAsBFOyj_Vci0JDoXGMbuWcop6uSGRMUon5bqjJFMIjMk9jN8TbaLU=@proton.me>
Content-Type: text/plain; charset="us-ascii"
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

> The cover lists CPU/cache topology as untested: all eight CPUs are in
> one cluster, as described. Patch 2/5 mentions the shared L3, but the
> DTSI has no cache nodes, so the kernel falls back to reporting L2 as
> shared by all eight CPUs as well (index2 shared_cpu_list 0-7).

Right. v7 rewords 2/5 so it no longer claims the shared L3 is
described.

> The EEPROM probes as writable. It holds Radxa's factory data, and
> our own DT reads the MAC address from it at 0x9e, so read-only might be
> worth considering.

Agreed, v7 marks it read-only.

> Card hotplug, listed as untested in the cover, works with Vinicius'
> "do not switch the mux to read IRQ lines" fix (a256b8c8083e) on top:
> pulling the card gives "card removed" and reinserting it gives "new
> high speed SDXC card". Without that fix the PF6 level follows the card,
> but the card detect interrupt never fires, so the A7S needs it for
> hotplug.

v7's cover letter names Vinicius' "pinctrl: sunxi: a733: do not switch
the mux to read IRQ lines" as needed for card-detect interrupts on the
A7S.

Enzo
