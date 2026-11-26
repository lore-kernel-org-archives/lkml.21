Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725382;
	b=Hf5tI+EPThY/CusvmBBYNjzhtzVw/Qvobzm3fJAT8S4qHiNEOhmr/9FM2S538YI8MABN
	 KvsyLgKcYrGWVpVX14IC5VoWe4sv3bD1FNSMRZUMeiI243Bqw59O6Cv0jtvy8QmEJoJYC
	 YQfee81VepmaPB0K97Ml7ssuwUc1fF/oMyRll959tlZHH8PCU/KlW5r74jlV7mQZaGO7s
	 slU02FZ3ZKl1EpOyBzTmqI1b9u2QygRGT2ZEMjRHh+m0rhotsU8tCtNf4lO99ZPEpzSM6
	 AuCUNxjwTmmHPy1hYOQq5FCYpiSf+icayhiUcitbGmeq7kSRmCPVvn8hQcwfO+baq/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=JAz5nKgdKURm2kGIEFLUS6ajltDqJFpi+dmIBSAUiPE=;
	b=e0BPtG/PGjyqI6C3jiK36BeSmq5YBMY7AGGbXUnUEZWggd+nSgDVLqQzscl+fVANrquv
	 Lq9UhZanTWHD4CBhbKnYfxNItXUwkgYFuRyMWSPsTFo5kobp8IT3V8YK6azBOGebovRNf
	 5ZP3bLuOE1F39q2KlXt278MkxGO0n4Nn16frK7g5JPoc7uBkr4AzOc2Orbc7uH3zUg5Ud
	 MNh5pm5mmH6t+wDGbuf2KnsJjiW23BlWXPse/QYvLF9Q67j/eFDJdyJ4s866LapCX9JgP
	 qUjkzF4AMM2sXByubmBVGSSi2Kj/asBdwERNTlqaCQduE9ICQTgK86QvNQM2Qtc26zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KcSGiU1Q;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0CA606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D0CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KcSGiU1Q
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6aa9606ddadso4786684eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725381; x=1796330181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JAz5nKgdKURm2kGIEFLUS6ajltDqJFpi+dmIBSAUiPE=;
        b=KcSGiU1QB7OVpyAdNxiW4Op6FUj6A4Cw9xbFu7Wlza2CqO5OS6VBAyfwZ3yH71Jyu2
         jWpaaI0tz/gsx8gOjk6eUgwV/K+u901ltzg2305KJQz0EWcK35W3AWJnWSZcOmy/2lLG
         0fKqWBK9lIlVqLSWMgeL540aQY18nOlnwjjtJJSTjMAFF9pcmJJ2fzu+xFbsrP33vl1R
         6JBTmH09EcDD/286Bs6druFD2EeF89JGcQm6ZdjkJ3QJxB915y8XPhl+6zg044ATYFrE
         1FFlBn6+vPGVJ1wRt4v7IPuzEozk3Hm1gtYxET7MB91fj8hSSJTfAc3I2FVVaQeg5GXi
         t+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725381; x=1796330181;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAz5nKgdKURm2kGIEFLUS6ajltDqJFpi+dmIBSAUiPE=;
        b=I/CXwTHsOcxRbj6OggNLxtVt5cy1dDR4+7Nhs9WA/xtY7wMLT2S45oX3Gf1xaMc/vF
         +DnOarrQBRAMfKJmwElBwH4sgKKLyrx8Tx9IqXxFISw9ta3z2Rm2da1zkiQioGGxYJ//
         QDIXtMbOjhXCyfbrla9H+oDat5bvTge2zTk33RJUijXXSZEcmH5LDSlfSoIdHwgaYfCO
         VU2eOiDvb4iiEONxEEmN0iyp0gB6nEnfQuhGB+VNINWe7ClPppi10mR9+7LX0Uu9G9mk
         +JB56NjH0ZWxpoBRrxP42E5w092FDOv9n6+Shjxk721+h1JeAM8dm2dKl9IxqabO6hmg
         aBvA==
X-Forwarded-Encrypted: i=1; AL+hErGw17Gqq+PBFGmjJHppZekn82iNyZ3mVWq0UHWJD7zXClFcPUGbdU0xonJIdtX1W5Nc742B3Fw4LxMq7Ww=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s2hmQjGwrRIIeSeo3B8Nlecfgniq+u7hgHO/UiZxGUhTZyA+S
	Bxdmr+QDnX9p8uKTkqAKwxu9EBUGxAKa1zTTYOqWdmywb3+BkURh79qF
X-Gm-Gg: AZFdTZdjx6l6iAzD4j0Lp2CDv4IEhJYJlP9Niv4CK3zTG3D788aUzaTYpnncglWaoJJ
	/kqq/Sm64gyoxOyeirb6wtnvd99rTtImsOkWzN92T6Ehkiou1KjVzVJwOGo+PszcFoAvQStWapv
	xRATYrQeD/c8L7nToKA/Xnp1wSCE/gGPbPR7IWzxoon56zjq3WJWtDqOlgfMrTd0zWAYfO27FiI
	Y5Ft53NLETdaa6DOjYiVH7MPFFHM/yL/XTHbgCSGbEjJer5HArKET3+EZL9JtuaR7qRKHcgrJQB
	0Dq1MtsbEmu1WABiCxQ4wWTyU7nQQGN0+2GizCozXhTzyTJdIoXKUVQgHFau75KHSmkq6vYtqEJ
	1979QBPY9a2D4t9cJzO9eh/nH9UBD0XpaZnorx24PFfFhxfUTXhUYskeN7nN4VpE6GYEMuU7Xs+
	ZmdD+INiqOz1gwNUnNIPrY+pPVutUo8nnR53hOigiTlYaXhP7XgD57FJcUhSrO0LktMjN15hXFm
	pAKZkKjaJxYwDQRX0FBLnS+N5sEdpnj1rIZmV3tAYl8gbBLzkGS0MB/op09xltotCdgIrCnA5M2
	x0MTNYyum0PR70d153nN8wuCP8NIPyp+oFFXy4a1dNAWKngWwpeqPVjupzAkwKqdHeofsxNeXHO
	RLjqz
X-Received: by 2002:a05:6820:1342:b0:71b:3fec:3915 with SMTP id 006d021491bc7-71b3fec4aa6mr17056260eaf.64.1795725380970;
        Thu, 26 Nov 2026 12:36:20 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631670c44dsm15454620a34.0.2026.11.26.12.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:36:20 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Thu, 26 Nov 2026 15:36:18 -0500
Message-ID: <20261125-a733-dt-v4-1-reply2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com> <20261122004008.0ee8e16d@ryzen.lan> <20261121-a733-dt-v4-1-reply@gmail.com> <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
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

> If you respin, can you please add this one as well?

V6 1/5 adds "radxa,cubie-a7z", "allwinner,sun60i-a733" alongside
the A7A and A7S entries.

> could you wait with a potential v6 post until I got that one tested and
> posted? Then you could ideally also include Vinicius' A7Z patch, so that
> we have all in one series, and just need to deal with the dependencies once.

V6 [2] squashes your A7A 1/2 into the common DTSI with your
Co-developed-by and carries your A7A 2/2 DTS unchanged. It also carries
Vinicius's A7Z v2 [1]. Both board patches keep their authors.

[1] https://lore.kernel.org/r/20261125131435.33190-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://lore.kernel.org/r/20261126-a733-cubie-a7s-dt-v6-0@gmail.com

Thanks,
Enzo
