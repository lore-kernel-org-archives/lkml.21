Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625790;
	b=iWqejTJ5UqwR6Gn5QchGM2oEC3n241MEZwBsBLcMtoT9pX8yp7lmMhmvsuYT+EE4wpBG
	 umJXEz+weqMXb3RYZXT/wiuM3ZRRR9epU3gqrUyGTzPr49QC9oqTdYFTBUBSwZC94xnYq
	 g+JadrOOn48KsJbPWiClnNs/4ikwgfsRxFvCYT+w7ORF81fIuFzfoFF3JXfMzEUuu9H06
	 doVwlBk7mvjvcKbRF+RA9ZxEh+1p7hBPszPktek9+hEKPYCm4YoTsZ3xht8UnyvTkUP/q
	 ZoEc8GeFelGTXwV1iIlVYjVFJqidYpl1fADkMVDpLSsuZXHP6+qqVWrracC+RQ/jFKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625790;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/KcILltQBoAou7W2+XQ9IkERjy/Lp2MpSgOSIAqYW+I=;
	b=Q4gnLUKfBvivIXMHYTX4q7rEcznbnt0lH9XY2oKn2HUhDWiaxPMpAuBEivf9t8Vio964
	 mNXvACCrbDf3f7ZBJquRA7lloX26y4H5ewCHEwg76wZpiSWRDl+AI3tq1dtlaew7mNBQ1
	 PiZ5s0/BJkEbrdhDRfQiBZ36ISUtiDeOMapQvPKkuYbQApJqcqIKj+Zg9c8UdZGXOHFaO
	 5iejZXckMtJCkR2bmTTOtd2MZq1ZybD7DmIPz3MBZbbmtDoT315HAsdAmlWjNH76pUfCC
	 HNGZTCCSlCulQClF5CAZw79RM/coZ4hhrEPNYk2cIGIgIrnqXus6XMBWILajNUzTjNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488FE606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 488FE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55d2d380f6aso65451351cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625789; x=1796230589;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/KcILltQBoAou7W2+XQ9IkERjy/Lp2MpSgOSIAqYW+I=;
        b=W8hhCHbjmPfFPXT2bVEulWuvVMsufYJkI44hL74tRceLCxJNK8S6CvHza+xHrDWAkS
         CpIEelzu+kICYz8p5BQNkjrkJEqZJTkPc4ZU8QPem9cw5UK11Uc+2OBfwPJQblVbtiNy
         lTK+T3udpIYSWHZ4NQd1pJ9kk+vojvugDKNeEnJsOqLSp3zal7L0uKaeDTSrfQCOsj71
         8NkRBEH6aMcaud7b038WINfdcoKWPN7bolWO252badojIEbQbd58D0ryh7Ry8BOk86pl
         KxdF/uvSMwjO5V7sB461qTMVNcBE76ubeFRezTVkpjmZ6YIe6ZV3b0tu5v9zE8Qbx7y5
         fRtg==
X-Forwarded-Encrypted: i=1; AL+hErErOBLvdBOfyILjoIPvYEhxGRXBzkm48bGcEdgS4aDPg6xV8JXqkmGCcf12nAGpowindCbKwBTqjgnxP2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z99YzaGdSKJHAhx/xs9S70rHzN9FSbtwj6TnS8yFUGgxjLag2ov
	AJ2peOGeMIN6JF+ZtvUHD6iu8wUHLC+bCfAAni7kt/0uKoEdAfMwLmfrBD/cA9oe
X-Gm-Gg: AZFdTZfm53gJg8utZTKZRjeDgR+/GIgZdjltgKA7etxcKKnLwuMix0XY0OHyI2QsmkY
	9SBh5JgybUadT4liE2Hj5BVRxfnnR026d5b36a+YnIaVvFG2oRbAQLRCLKvxV4BPqGvLHhSZUC0
	RBs2DNy44SUhQzwGpizFqo2rbJhnhPJsbE0iX0xswGFmJiVbH97t5K34jRRzJ/DYv+X48fXAzMC
	29t2lNV4e+4++FCleZaZKr7Ytg6k3amtRw6vFvZrZP8Qh+qzbQzpazBnJfcZbnZnVgcLrPUUOVe
	PXFT7cP2uYrc4pyRrnT96dbB3e+e0Db7F6LVUihKXBboXt2WGn+BuU2rERGYIdNn/Kw54sG1fhB
	41vnUXQNovpY5bpDUgFEhvyw+9TCB7Ymzx6F+tdbHXrDl5v+A4+PDROaper0lC5fjxm8tovA5lM
	R/mXH1NkkpaQCOlZn3TSQadePosIQoT4Po/AE8CMEpiUjwJta+6oa7gdX/0Kzmx0XwhIN3d8cUr
	Zfs6+gf5qWhJ5wBxfVVO/Gm4LY7+IZzgBXNxx9DHpq8nUzGBbbHovbzPcVsV2qkXOGw10RtHMpO
	xWHgp8zQYAS8/gdYrB6gahudYEgykLXCLNGbJSiZ2c6YzltLlqJ4omj2jpBO0aAQvW4=
X-Received: by 2002:ac8:5d09:0:b0:536:8f5a:64a with SMTP id d75a77b69052e-55d76a75b90mr339563721cf.63.1795625789139;
        Wed, 25 Nov 2026 08:56:29 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889ea4csm160635051cf.26.2026.11.25.08.56.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:56:28 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99c042cee7dso3242083241.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:56:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEfN1uDilPvNWebKJZi6FS6xMAOrjC6Om+PY1YWLm/E/sSsfPUt0u0VuJX/Uvn/dAVrQV6qfwqq99Xv4hg=@vger.kernel.org
X-Received: by 2002:a05:6102:578a:b0:7cc:2f04:a078 with SMTP id
 ada2fe7eead31-7d7396c2b24mr10563851137.37.1795625787958; Wed, 25 Nov 2026
 08:56:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-paul-v7-3-rc1-edac-v9-0-470f2e6928cd@bootlin.com> <20261120-paul-v7-3-rc1-edac-v9-2-470f2e6928cd@bootlin.com>
In-Reply-To: <20261120-paul-v7-3-rc1-edac-v9-2-470f2e6928cd@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 17:56:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwTWXN4XepPPrKUTJXRk4pQ+MzGbDADe1Z7FSB7q11pQ@mail.gmail.com>
X-Gm-Features: Aa3M54ojpcJtUnDseL85QBstdnKjfhN6BZ1wTiGKwa4bXu6gXK1ydb3RLzGiqBk
Message-ID: <CAMuHMdXwTWXN4XepPPrKUTJXRk4pQ+MzGbDADe1Z7FSB7q11pQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Fri, 20 Nov 2026 at 17:09, Paul Louvel <paul.louvel@bootlin.com> wrote:
> Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
> The memory controller supports ECC, software scrubbing, and SECDED.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c

> +static int cdns_setup_mc(struct platform_device *pdev, void __iomem *io_base)
> +{

> +       edac_mc_chipset_printk(mci, KERN_DEBUG, DRV_NAME, "ECC %s\n",
> +                              (!priv->ecc_enabled) ? "disabled" : "enabled");

Inverse logic is harder to read.  And we have a helper for that:

    str_enabled_disabled(priv->ecc_enabled)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
