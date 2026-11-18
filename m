Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987978;
	b=Sxae97tUOayTH2/FSBvE0kiiCVsG3qkcKR9PaBUlW95kY4hHpFt42JOP+84zXkl1yUE2
	 k58mtCkTQmV7moS5FEpPlOl7khLpU+kqoSm4K1lnOdC6CVJw/+8EeWzzKEWIz8EmY0TCC
	 DCd/ueXIrtkJY9yLs7HcuPj3D8RWc3lQXFsjEfR3QBP7+b5rTdXLp+tC8msmBuShDKLEl
	 wLvBLNwQAxnFU8cbC+zYowCNPmAW4FwejaM2ZpMMiGNYbdTEWAFLFfHpFj49k/crBZAlR
	 bwI8v3TdLvapyfxpHuTq0oNALycssFcyzqDEmdOvPy3UDFpaAH+8bdEz5doxi2T8g2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987978;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=6to1e8ywxICS4xI4JtlfYu40TwDVD3t2Zo+rkXerpvs=;
	b=rCDhCtnFboTE3k4o6ZhCjUb+tYDlSAy4yzM+cpSyNNuuBG0+0+KFCLdpRQtJ4QmAloa5
	 ohfG0TrCNsnl3ifYAtqJ2VPziPi8JCjF+zxYVG6HY3UmB4h6cR/rfijSXdk2BCDE/4zou
	 dL/cY1PoS6vh+u9eIeL5Opw5ikR7mjesthnPOtvuXFhm2R1S+LWbAz35D+DrzKhR19LjU
	 7ymyzJrPeEKWEpIAWUAbNf2qP6rqxhvwTX69pzifnLVqsgmSaQLOsmG1VFSCjJueW5FlT
	 Ni67h7AOvRf2Nfl6/FY1pixDyNFwXP6ziSkT+aAS9TdXX/2N9L4uOpiAxsMpMUvs1vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4629606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4629606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-99e09f4c44bso200722241.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987977; x=1795592777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6to1e8ywxICS4xI4JtlfYu40TwDVD3t2Zo+rkXerpvs=;
        b=Y/3PAk8Igvz+eMjn0ARZk624P/4cVRzL1INKcEvpm6vNz8tuX5fTHb+I2Mm1xTbdap
         aOq+DO1Qq07IqHmMH1c5Nbj9KXr//7IGR4kN1FDLQ1EC93Nax+RaDW1LD4+xVQGseHKP
         d7zvI91MkRY4NE9ABbz5XHxs0YXJziW+1j93wFtFLLsQGin7HwzODLcRFykK2rhNt5fB
         vrDREGHtpt4/aTDCuBT7WybAlUA4akaDdD5Y51+qFj5Frch3+BnUlP53ZBwC8DtxyVR2
         oguOHE2zh6rq8Zo1z5ty9sHl4Bvctv1lO7wWcE7RyRgyv0Rmo2kXzqSfyTEAf3URyiFg
         LvoQ==
X-Forwarded-Encrypted: i=1; AL+hErF2XrcAN/lN6WvD4e8Aa6byabIYNVGfYX2diHj9xLNgUjzuhlgRV4MYxerUGG9eTNb9xx4mM8JXQfKcfxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ootJfyuDsjlWAqTJa4fnAIx7Ivs1GAqrXKDzWxhW0L6I3g1pi
	n5ds3APmpqMXOzgmx1tQ37iEI1K895FyBsRNmhgqZ7qabssPPeFCHau5KbexQ1s4
X-Gm-Gg: AYBFou2p+ZRW3S9DJO0a8whaNPg7OYu1vz6h9SI7JEY+ZfcfSjt0IkIcbZGhN4JBddV
	a60bTuJ5wDdkEhn19aW5V/N3v4EWu+OPQQJJdMsdQ/bxvTOhw3/JF+4tr8oKdnlJYraQa9+yMQY
	j7Kq1kM6gLkgWS9EsLyyAjX7uP+pVIxtb+cOyyddPpB+ejnBw7Rke4XprHuThBjP+M4ZVN+dtCh
	w/U/O4+/HyT6Su7qMcWggYwVJf9FdiTQn5c1UZPi8ciSY8JjhIhqj1csKfWrthzrBWC1+5JBZnK
	MpoSG50Oo2cavYOYKWUsJ09WJxRhAA7dvNoMd1VFI88tn+v9rYSLPLZMWQAVpCaxXXSzXT77esy
	Fwo/OyhFOXEkx6ryOoymXHt7KrBG2QiAZHocRd2uYrTU7bJLtmqnWvdmt1vGXmFb2nTsA1vVh4/
	9dhQ52uxYwqp/wIrx7JcaI9vEEUuiJisxlMCKrbhZkEWzEXGlnE5278hhQGp2CzMWGWpxpXsp3C
	aLfKEmWhohwJXp0xv/L/mwtq6g3fe+HGMTuHY8RUZWqhFhDp5sNA4UcYDxQdKMdER1pP5ntyZeK
	QF/LXuOjSvpeHE+XxWfOiNfM6jDFEIeHAtYdfvubYgZwyFF+7zgzOs/fZ2aOw4Z35ZM=
X-Received: by 2002:a05:6102:149d:b0:7a5:391c:37ac with SMTP id ada2fe7eead31-7d6ba3e9483mr601866137.10.1794987976725;
        Tue, 17 Nov 2026 23:46:16 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a2af8dfsm1288781241.9.2026.11.17.23.46.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:46:15 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7d6a6776719so371040137.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:46:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGsXSEm6GeXjw/PBUOzSRWly/C8fug+NMYj5djcG4ejPWQEIUkujO4DlCbvhCX6xQZexMFeBRBR4N09y/w=@vger.kernel.org
X-Received: by 2002:a05:6102:e0a:b0:7cc:94e0:ad23 with SMTP id
 ada2fe7eead31-7d6ba4d7327mr622866137.31.1794987975215; Tue, 17 Nov 2026
 23:46:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
 <20261019-paul-v7-3-rc1-edac-v7-3-84c76c6d7595@bootlin.com>
 <avxR5VZESPLklIuG@ninjato> <DMXJ5VMIPGL9.1917ON486UJRD@bootlin.com> <avzCbuXANntvBPDz@shikoro>
In-Reply-To: <avzCbuXANntvBPDz@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Nov 2026 08:46:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWC30-=DPtui1EjDEOdtXBVy7WLqNU=xz5=68VoZijt2w@mail.gmail.com>
X-Gm-Features: Aa3M54q17UL4mAgBxZLvOfOFworgkEOusBybuuLEx_Lh39xXrUjItuh72fZWiHU
Message-ID: <CAMuHMdWC30-=DPtui1EjDEOdtXBVy7WLqNU=xz5=68VoZijt2w@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Paul Louvel <paul.louvel@bootlin.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 22:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > On second thought, any reason we don't want this enabled by default?
> >
> > Please see my answer to Geert [1].
> > After reconsideration, maybe it is advisable to enable it by default. Enabling
> > ECC is done by the bootloader, and it might be better if no further actions are
> > required to enable it kernel side.
> > If ECC is disabled, no errors will be generated, and the capabilties will just be
> > set to EDAC_CAP_NONE.
>
> I agree that enabling ECC belongs to the bootloader. With the current DT
> bindings, the Linux driver continues to work on whatever it has been set
> up before (which may be nothing), or? From that point of view, I think
> it makes sense to enable it by default. But again, my knowledge is
> limited here...

FTR, that was my thought, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
