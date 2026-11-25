Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795627479;
	b=kFNhaz9mw9MZZ7CySptRAm5wzSaem/QaBpRn73ODTp5LHH1A+51PD/A31vmNuRoqnfBx
	 rTwe57OkGpQHxuRrCXXAMUJSp9w5jvVWiPLVtdlBYLAu8/f60ia7Hsog9WuJDjzmNskgS
	 LHDBidNcbbBPf0AOAS7HqFd5tuHqSEJFlWFKFScoTiBMvGBFgiQGocWsK0ex0v3lUGbu4
	 nr9Kx89oe5GqosdtaP+Xl97eNWAKqwn+IPQPhE0mvyYj5XgsneifaP3OFgvKWfIZacvd9
	 ui9g7HQ7J6xFBcKtYXaGHP9vFGbBnc5BMJtcBGlw4BJJcUoKPFb77zNyo3Bctx58Ing==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cF86LuesLCHsWCQn/gQpIwpG2tWZTDsICF+hqaQS40o=;
	b=rrNym4MqAc74LDZc2hBK4rctv2mMEI+E3pR4e6zL5AtzrYn06HzRffhAFH7jJtaQjwB0
	 F4g+lxqBDg+HhLHvGCwatKZvMexKk1gWV+XhewpXES3i+AwAheuZD0d9odzdcSauvmZuH
	 F6Qn+w8+To87Do5yuiv3vytoGLJ6ylnZSVtfEQ0JUeoGCIqKSS/g6HQikJtH8GP6TWAz+
	 s7EA2uQX1vAtaALNJ+nTOsFvrWgo6koZRot9JKAGc4BsHTibgUuO3Cc0VPzsH2PSJBnYy
	 GENsTADpm+9flW7ekmKTIFwTEKPDSWoGhHr0Xxzd/nh7JVJS8n1y5Ji6QcP8kF5LeUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2KZvUbZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C9606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 863C9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2KZvUbZ
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492f0a1b685so4226856f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:24:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795627478; cv=none;
        d=google.com; s=arc-20260327;
        b=c5n4n+dpUuep8Nik+Y30U0QDArvbMn8o86wR6y3JORodd/gaurYIfqduuecEVVDsae
         x2wXus7pqs9GcMWDO9j2ap1updQkfmdiGDsfLQnh4ehEzqAOY1BLMYeHx3L57uwZ+qeH
         vWYt2CdKPdGlIk5lL1dcr/K9stcNA7Xwr11is2n5T4DAbV3yiM5Cdn1KYxTrD+MUMaI1
         cxU6Fy5NuSliBXxNxJ4i9YFctIf0hQWlgxVIK01r9gso/M9f0p4kd5m7tJd3CBlgytzn
         EoMARuLEIOFYJdJr+hSL/LXE9kNlGOUjAZNw7FkE8ZY+mJLyTzdlfSeF2MJ9xSAjOOTq
         t60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cF86LuesLCHsWCQn/gQpIwpG2tWZTDsICF+hqaQS40o=;
        fh=CkvlApqE4K1xgx4bpR9fNUamQX40/TxT64Rmp+9yXgk=;
        b=BX/P/AfDjbjN1nVXRs2nIAlrLHqaXEWaTzXDm3xc75yoElTVZvzGyBEPOmSiMGQhCj
         M0AUr6ojYNRGHihlPNU0reJqWEBwmgwF4FGmluOk5odVgPxXkG7CH7ZnzsTkGIDC6mLu
         4GpHlpTLJbsjlPaWbhV8We+2yZmAUZf6B3NB3a5zHneCkVT4SfmQZMyFaHTaaF1/1RnK
         YVcyYPyYXLB3y7PnmzKjkIRHmUIBXqovmB0af5O27qIduA69VD1GILYLUVn7mw75nRlC
         rImJObMriDtiKSRan7d9GAuBigxCb0R+7/JEUici41UEVT1SpZUhdGy5Xu54LOcW2w3f
         P+Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795627478; x=1796232278; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cF86LuesLCHsWCQn/gQpIwpG2tWZTDsICF+hqaQS40o=;
        b=B2KZvUbZ+CMxUliJWjOFoeTdQTG3TUqjBP1t9Qn4diVvh0xtZSGBR5BjkYOs3ufNaI
         n71V9yZUZtHdNYrQgU3Y+7HRErpuoT9sgHY15lyryjj9qmTD3go7LWzDshQX8Jn2A1pb
         QozTF1r3YF1Clq5rME1tnlxSPbNJt7bXGJbtAOP0KEa64kSIPUmAF6hYP++hHHiIIyVh
         /mT79rVodtFebDpFdULiABiBvbWDYMprw8Bg9qtfgzaaULNke0514z+MA6em49XHiaPE
         T/PxkNFgoh7JMml9KZMB8PjCrl5GIjw151bMvq160ENwveKtRCEMGQuW04NbPxiO3J/t
         XZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627478; x=1796232278;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cF86LuesLCHsWCQn/gQpIwpG2tWZTDsICF+hqaQS40o=;
        b=K54/QdDsXaYgsytXw8YHYsBhON8B10Q68woK0BVYG/Vbt11F6+omnR6WD5HzU76A5l
         tL8MK6V1FKcqykt1VXk5KmBCr7zw8K3sD1mo1gA67ND4ytZlhu8rnsnN3Nz2F66iNrSL
         pDX1KssRt5F135911EE2xLFSBohDGhqKT4Lz3PM1IAioMNNwz8+zpOs1fo4y2g7iRtXE
         WwNXurlmeEq1Fl6JZ0Ya64p8tt8SrF6vYIQwhcc941Csl8VafNC4SYkO9SEyrs6zaeV4
         L1d4BDWBsBWbRrDASFXZOInyrgbYfp0TOEyUEszPhZ9OwXAOL5p2ZEr8dlHDcCFfR4Ri
         ZM6A==
X-Forwarded-Encrypted: i=1; AL+hErGYqWTqrSgO/hQu2vFyTQyncmW6TQpqwuCnovEJa5FGh1cVqAkYonOO9bRtwWQKm6cwoyYb/SR1Zwx+yh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AduyGlQZey8a+JX76DXePhXn4TjyaguNYmV6AkRn37vY5Hbzm
	GZyI44NkQtGDYowBpf+SvuNbYg46KGe/vS9A5SBWwZDygD7mbOVoYNj0hq0QTS6d1YZ5FiQFYUa
	zGIeuO2MWdDughGp8F+wMzyu6zZoxIZuQlsVgqglXig==
X-Gm-Gg: AZFdTZf30pAZzmBblBW9ijcbuU6XnL4V6jEfSj1MvDKRMnU8V+IenjVrtUTTfwEl/nz
	rjSR0+R0xgRW8P8d6Q9V07D0NkKoMpN1dLYm6ANtajh+pnDnACyUsJT1MLteWlEnKglOIEFiSmm
	x5ekdL7QczLo5bw5ra4+9oSF6lcOx7Szrl2OfbOZUYumJ2Eg9B9e+hom0pBlN4d4cw+NoJrZro3
	PPDclHn6rUSfG7VPXtJKrgjoXLXlhQ5/dL3AG8yhMu2rs+NSDuCzTIQ2IOrJ03qnRPQkQHHZ8MO
	+2VeMXXtHNVoR3HGVOvK4V4TyqaLZJJobEzogu9N5T9Z7S5O+QJ+yCuYyxfaxNHqOZZrfd1iEjm
	gEtsdhS1ZbN9kiPkiRKzWUihepJfuBlStsE5ISME4+8zi/qA2pElsxmHRQC636Im9oB0=
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id
 ffacd0b85a97d-4abb59e2898mr35765846f8f.53.1795627477631; Wed, 25 Nov 2026
 09:24:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120102754.778283-1-magnusleatti@kernelriot.com>
In-Reply-To: <20261120102754.778283-1-magnusleatti@kernelriot.com>
From: Giuseppe Nespolino <g.nespolino@gmail.com>
Date: Wed, 25 Nov 2026 18:24:26 +0100
X-Gm-Features: Aa3M54oC6LgFaDRKQ0RxvICA2M2DvBKp7vjOEYxTmttrvoHrhd5am24mA8KAZok
Message-ID: <CAKx9m6M389NvuG4HiiRO4Ck45TDgmxwRqRwOHc42OM3Da1YWog@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: dwmac-motorcomm: shutdown
 hook and Wake-on-LAN from S5
To: Magnus Leatti <magnusleatti@kernelriot.com>
Cc: Yao Zi <me@ziyao.cc>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Magnus,

Il giorno ven 20 nov 2026 alle ore 11:28 Magnus Leatti
<magnusleatti@kernelriot.com> ha scritto:

> Giuseppe, your Tested-by was for the v1 design so I couldn't carry it
> over :(. I'm sorry, could you test again?

Done, same Slimbook EVO15-A8 (Ryzen 7 8845HS, BIOS N.1.14GOS07, BIOS
Wake on LAN on). This time the module is only Ubuntu's 7.0.0-43
dwmac-motorcomm.c plus your two v2 patches, built out of tree, nothing
else on top. The eFuse on this board is programmed and the address in
use is the eFuse one, so the magic packet went to that address, from
another host on the LAN about 75 s after power-off, on AC:

  v2        wol g   wake, 1 of 1
  distro    wol g   no wake, 1 of 1 (from the v1 round, same kernel
                    and BIOS setting)

This time I also have the shutdown log. With
printk.always_kmsg_dump=Y and efi_pstore, the end of the power-off
reads:

  [467.495243] dwmac-motorcomm 0000:02:00.0 enp2s0: stmmac_dvr_remove:
removing driver
  [467.497124] dwmac-motorcomm 0000:02:00.0 enp2s0: Link is Down
  [467.906480] ACPI: PM: Preparing to enter system sleep state S5
  [468.213535] reboot: Power down

with no warning anywhere in the captured log.

Since the eFuse is programmed here, I can't say anything about the
empty-eFuse case Sashiko raised.

Tested-by: Giuseppe Nespolino <g.nespolino@gmail.com>

As before, I worked through this with an AI assistant; the test runs
and their results are from this machine.

Thanks,
Giuseppe
