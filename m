Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596557;
	b=0BxBCHV1/D5UJMkIwgHaxnyzkN+rgX8L1LHVVKDsMA1YZPGFqHgn816GIcUbRP8Iy/CQ
	 lpCD+kxrgxE5rFbpV7GedirNPB1Aj2F/K7zjfQLXg3o9nsXvbKIo3K1VHHkFmpipFqLve
	 GUqbl6L9b9cyWBYnLDh4ztPwmQsWkbbbzUDlLb56YOVdOiU+JXsb/nRi/q95t6j9x2sII
	 Au7dO9jAJeWBidl50tPWiFe5EEblKzpbF8T7O7PO7aaEGk0XQeOnW9+xd46r30L238zyc
	 NznrFjy68ut5HO8BLevCvwZPZILUc55u00MvBHFglsrx312e7wy9N4dmpT9T0Eo5JRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XoBUSoCkv2nIwetH2G0D++atFkrgwpTcXSMeJUec7JY=;
	b=TR0H8go0o5H73SCdyLw/jTThBjGOEf76v1iche0FSJBXt7lGgIrk2SwECO88C7TsjyCU
	 BEGBy6fthd91GRdZP1RHUpdIFQh80Vyno3TZiQofYXWWcG7Iab7oC3afFByJ1LNnX3i/y
	 TtcT7HtrouoDYaV/1r0xp9kvAuK1ejaKSnw4UpwjcX2CE1k9zW8M0AoUc9tTUIgngzn/f
	 cf9tnlOdrtNl/2hSyFt3UzT8IJc5/i7FoXtvdzfIv5cPzfhP25UFVkIISz40jZEJ5OfuH
	 1EFRhXsL2ADIrjKpONQb0jxqTdc332Bn3cvPWip6EfqfoySo1tGjW4FHQie5ifwqixg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXqgEe8n;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6A5606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A6A5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXqgEe8n
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f052ae3c86so29696215ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596556; x=1796201356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoBUSoCkv2nIwetH2G0D++atFkrgwpTcXSMeJUec7JY=;
        b=jXqgEe8n7GRZ6iLldGmsCNSv2Ci33Gbuvw+WbH0lu+XI6GPJBJ468XB97/fH/B5E0J
         2eqKGJ2+yZGmfKtcR8B5bm/qAeSDM9a+PQ/r5STC+i1LWnJnj3vMx2rfae9TmFwctlxO
         tMlS8tUarkhm7xp89FBaobYitMGNpWX3majq98MDENkx5ZzYkKs+IMxMqidarlEAH896
         mWabDnD+x03m5oCmiV3zr6vJ5MLe0i75risLoplL6/LP3BVVnPKoy/kx3wDs9sBoId68
         KRafSVDxnQAZoZ5DRW38xZNCiuWzLwf9Gc+y9+8tU1cCzH/HaCV9vZKvg8FF6HgEN9/D
         /jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596556; x=1796201356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoBUSoCkv2nIwetH2G0D++atFkrgwpTcXSMeJUec7JY=;
        b=qypQOa+0Atgsoh1+ejm8askj/nK6QgEVC20vtkSgC/acASwQL7RyKQWBJ/m4pvLwtI
         KSjBI5tphMg6nKhcnO0YulGXivF/zhIsy5uq+xcmXhqssCf/PhYAiQc7oXZNN+EY/sTg
         itN+ugm8XU4Wl4qQvXEyRU4q0QthfU0A5LOiBZEAm+fWFKjkYwh9FhQzCAmtaZQlWwl2
         aze//Rl6+gcLyRt8Q4zzdHiBoeHIaS15+bLKQvg+8Px5EYuHmRQZXPtwQJOLw76prQ2F
         S/9gfnJiosVAK/sYif1XrzrF+EH7ad9Y3X4HByPS3bieJznnQv+bGRib7FnoNFuosiax
         4GgQ==
X-Forwarded-Encrypted: i=1; AL+hErEhpexFdhX/zWP2W04xkIwD/aH4MRaq2m9jwyZ+ziFtJvoewxZVf0ip/JnhhmKRO4eQmzUIwdvW869osO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UYipqlkxNT/gKQ+RdWe64cvs+FQYm6AVdUq01HWY5kIPY3MuV
	Lg5J1mFkLSIo1/Qo3ByfewH1JkmhjO4QNUuE9juzRBX+0j3kLMZEUAmH
X-Gm-Gg: AZFdTZcbenk7UdSpgfWqKxOY/kR8JgYYxr7K5WhEfhVfJ70Bj0XAPv7wfDb9goxgBQG
	szyuQ4L9nL2+76jF7vOWc02AJ6h3xWuNeHUYWo49fzYirrAqWznqkw8BZIGpHZ2SUII4rT4kdmm
	wYB0EuM0hDk5TKUJEs2c9tlxbfdVf9MFkQdxqzDkMH2ZyHoitrEfFKSOmeGReZf03LRHFLg6WzZ
	HJcu9ijpeXGk1MB/fbFGbh8AVo3jEhj/7rfbCJPkDXNXJ4u03JLs/DHLAuZ6vbXGrHygRReEFn+
	CCmLJmsyXWR2pwihR7I2+HQVfg/rGDOkPw7g0eeeyBgeO40QtQtt8RjpubO7ARhgG/fdZRhCoYj
	+PgR08qXFpXBHASYyFhTrvw3IJBLHfY0+DT+/69g7ba66N/vXPgm0xEUKsPDbjHbay3dT2+GsYy
	E69moW/XKgxK+l/oLtwogzlfwKHe1CpZ4MCdWJxRgpEi63kUPVwVgPTQpSoyG5BYiszPMFiAYiw
	xJZBLUmD2tm2zrNAlY7V4gF+0WNWmTScNE2jbsULw8fqCWfqW7vCjqxnrVgJUs/EN8xTbTNd6If
	0ZKDPzibTpnsXmz9e6V3s/jlQg==
X-Received: by 2002:a17:90b:4d10:b0:3b3:ce10:7659 with SMTP id 98e67ed59e1d1-3b41c7ac261mr16316108a91.5.1795596556346;
        Wed, 25 Nov 2026 00:49:16 -0800 (PST)
Received: from duge-G3-3500 ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm28307740a91.3.2026.11.25.00.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:49:15 -0800 (PST)
Date: Wed, 25 Nov 2026 16:49:07 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Add K3 eFuse and
 temperature trim cells
Message-ID: <sifzfexbsbd2byrpynbv42habxgbrxgndaxqhsjgppyipfuivp@qvawoamxksfu>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-4-duge1256@gmail.com>
 <awYIF2ynf95-g5-W@aurel32.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awYIF2ynf95-g5-W@aurel32.net>

On Tue, Nov 24, 2026 at 10:56:39PM +0100, Aurelien Jarno wrote:
> Hi Jiayu,
> 
> On 2026-11-23 01:38, Jiayu Du wrote:
> > Add the K3 eFuse controller and NVMEM cells for the temperature
> > calibration data in bank 0 and bank 7.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index e89d2cc5ca8c..af1a758788ff 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
> >  
> >  		/* sec_i2c3: 0xf0614000, not available from Linux */
> >  
> > +		efuse: efuse@f0702800 {
> > +			compatible = "spacemit,k3-efuse";
> > +			reg = <0x0 0xf0702800 0x0 0x400>;
> > +			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
> > +			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
> > +
> > +			nvmem-layout {
> > +				compatible = "fixed-layout";
> > +				#address-cells = <1>;
> > +				#size-cells = <1>;
> > +
> > +				soc_rtemp_trim1: temperature-trim@1c {
> > +					reg = <0x1c 0x1>;
> > +					bits = <0 8>;
> > +				};
> > +
> > +				soc_rtemp_trim: temperature-trim@ea {
> > +					reg = <0xea 0x2>;
> > +					bits = <4 8>;
> > +				};
> > +			};
> > +		};
> > +
> >  		mimsic: interrupt-controller@f1000000 {
> >  			compatible = "spacemit,k3-imsics", "riscv,imsics";
> >  			reg = <0x0 0xf1000000 0x0 0x10000>;
> 
> This looks all good to me. The offset and bits matches what is in the 
> vendor driver (after mapping each bank to the correct address).
> 
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> 

Hi Aurelien,

Thanks for reviewing and testing. I'll include your tags in v4.

> Small nitpick, no need to fix it, but the vendor device tree also define 
> offsets for soc_die_id, soc_ver_id, soc_pack_id, soc_chip_id and 
> soc_svt_dro data. It might be useful to export (some of) them.

The downstream socinfo driver uses these cells. If I work on
upstream socinfo support, I'll add the relevant cells then.

Best regards,
Jiayu Du

