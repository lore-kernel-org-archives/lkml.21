Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795714833;
	b=nNz65xQIOSXFF5DpJFItZ81oSoBZFXHsl15LIGePwXLgdxYBimlfx3ru0stJ3Ywb1gVm
	 YXMSkp6meP3qSvZ5l+NJms1z1NAoa+Lx/xbYjrX1xO/U2zv0TWxwdrgzd1yolZYSeMgmM
	 VOUCQgvY/pk5tVKazsTBbfIvjrjQilI3Xy528JlI9Q76MjioY1VJvKIqY7qJOnULbjnU6
	 1gAF0bohvV/LU4woyuA5erwrbWfb9ceRaTYg8ri+En095gJ19/rwgfxz0Te8PZLTzjjFB
	 j5g5Mf1MmU/XJZGQTRCVt45wSSLNvyXcu3xZ5ZKbecofFIbTLvRzKQc8pU9Vg78dP+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
	b=BHo2nx8kBNSQbvsQkcBYJS3Qx/4w6rERNan5k8wbmy41xONQukMnjN6Hsz1K7gn416pl
	 73dQTflD4vw8Vw0t8p7Nbac4GQ6uxLpdb0siy8YZk5Law78gK3dgim/DBRgoguQDub3iY
	 kU8u2X2VEw38Gkym9WoJvxoM9O6F2ZPdvMrBU3x895fwcvflKHM9V1j+Nao1HG+DCL3cE
	 sNCwjKcwsacCBremRmfatJ284/yZdDDdG2yom/XLnl5hEmDlnu1KsqWA3DFuyJTZAF5mD
	 EN8EvGKVPCDubQFVPLdUuzA8Mtb2ETiREtZ2eKClTd4OvJKfTswEYGHCgu/VeS009nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=koJgtQ0K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EF9606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8EF9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=koJgtQ0K
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-92182125ec0so15197106d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714832; cv=none;
        d=google.com; s=arc-20260327;
        b=AfxOfVaWursUnjp8Up1aRXuyh8z8D7ASn4lGgjmHZ0aucYwy0E8/UnOR7GU2p0p2Y2
         JrITMN8+wuo8EydlmPXhJJalYOYFaoCq0KH14ljfF4pLL0YAKjM6f3aOZ+pAwxyx+MDW
         CFsB2cb8NsmxNcLyzpvxwl/o5JNpvY5C5fNh6LsCDXx/Dog1dr35O1Djfk5bMhxBWXW3
         aUuCenmyhMIMN/LY9yIijyfjZ61ZF3pFN0c61MIy3fS68D330vpVG0mkjkHOA/M6M0xw
         M52EgZt3w3JlcaB8MlDS+LvrNSIsEOVAE1RC41ABGRbEOKRUiQEB0531rHswq+IAcyhD
         Hitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        fh=/yPpgFOsT2RgwRkq8NoUYndt7JOdnM2PED5ps828rI0=;
        b=btCGH/BZFfMhllpXwRcleNUT5ev/eMfLLj8ikhx//6fFzkXupLnnJ99I3ZX6xzbti3
         3CS0/xlLHzT1ON0TVcoK/3WBkKuqkG6DKIw1v7Tb7NQg5lk7QTg4yD1iivOPecGYwUXr
         mS0z3mfCDabwFvRsHKq26DbzKSDktXuBmBtNBpKZ4ykAetYAUo9Q+awiUPmzJ4mFTyY1
         1PfbuCVD9qvsLinpOcPhwoRGlsAuycgI6D1dmXRu9uWMANgGLKEY+70mnWQOm6kywjGq
         yzeubi82JZ1awPlpY7DtjlyJYoCiWbQ21FKGuv/VjbwaZi62+R8+ssSaqB39XKM7j66y
         ldyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795714832; x=1796319632; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=koJgtQ0KLWRudibXdRD3TYnXWWnPf7e0C8y5LTWdUuaKVIfZqQoTaOdUn1Q0V76OEc
         E3aYd1F2yhIuzNlsvoWrs6e/LPwSAbflsD6MAzyPXGkPGcTXl26Rt952VWmm3H06B5K9
         buCKiCA7oBahEH6yVxnaY8L+g6mcbdys0Kr4faC4ajE/s0HZLcM0U2m3U5ndNylxobp3
         3LYeL4V5xVaJ/edeh9xQ7/OMq6rU6mJZd/KyInScBCCzq8vV/RTojclmchkwYwXz32F7
         G8pPnhgThJNOd9AtGm4q71iInfNGJMfgp9Xx2ihWTPfcThxxatadk2gNQV6VvMhVuJNS
         0Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714832; x=1796319632;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=y2sF8FXZESdjaAzm1QZW5YPZ57laYilKI5fG+xi+OLFbVg9x8XlFkbHyT33RcJcIto
         9M5hi81F7LulgUoUV8fl1qyubEzshyNrPmZ+cgb/Z1dtNyC3SEJbZi80P2U19McynuI3
         teZc+ixhPhkzMojhSd09Lm0Qv9hKab+bnWFsfDnC+smsHBypv/f+SCCGzIOqCLx+Qlpr
         B+FpVoxyi8+lFIs9f1CjVL4XvLJWEqu6LMZxf3r/EpEXwxdXmV4QLz7SkEbOMkux1GKq
         fLtMCZu5tubGK6RaYBc3fi4BBhi8W/LOMOYBLdzLerTTR65atdUWGxNZwQuK7YXcXfZv
         ouLQ==
X-Forwarded-Encrypted: i=1; AL+hErHEhiKwzJPefAYYjEodvNMNZUbnDr7LtzV1NXfOe7HG9eDxlg0R+h1iyEQws8sEmoZhABBOlpCGhheW+Fs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bY/NJOZkoRzntHY77YwAxKtLsbmn14EDGNxGSgCjXecKO2WD5
	5VPq9gceNCWF/+Zin0KeuSX2u1pnk89q1sKPLU+rRYbKUPSmberb5fZt3H3eW+wphNuS3olvC9Z
	44gbYSnCyMskqrDgLkq5xzHtXA5dgm2qtuXojbCD4rQ==
X-Gm-Gg: AZFdTZd4Qdq11ajFtKpkLf/7esWtpZXunGZ4VCe+IhqDQcQtwz2Vp2O9P0jYdwCYsKD
	p5S9r3BU/gLYWXK7G78gTEsjtCTW3hn0jR11a3GcTB+v8m8Q+qp1XwW6vdU18PpyLGkSNxgezOL
	LA50bDaonMDLRsC+ghFNRpp2dEdbXRidkG2bFkGVhqRAfNt/Gq4QjiolP4MF3TfUNyuUWKS++hH
	faw5UPjhahQwb8XSJ1Vfg3FYE8wqYjedJ2kA71BAM3sYMEuxqzFoAJY7yyqxPeu8ZdIoQRXBIuG
	76P0+jSqODIe6Tv3pFQajYR44taN3csatZo6b59ECnsMNWULsssjogN86TzYP3mLFJJc4o/hh2H
	H5VS8xdldt8Gmtdyf85c6PocTkPfC5vrVtS5C29fzC7ZDapAmM5mzRUbkj52WVNlE4gEdjd8=
X-Received: by 2002:a05:6214:3c9d:b0:91c:9316:f4e8 with SMTP id
 6a1803df08f44-92134baab8amr374316166d6.54.1795714831544; Thu, 26 Nov 2026
 09:40:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros> <87v75jyiw2.fsf@bootlin.com> <awg4ubbFu0FksThB@monoceros>
 <87a4mvwv1b.fsf@bootlin.com>
In-Reply-To: <87a4mvwv1b.fsf@bootlin.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 26 Nov 2026 17:40:20 +0000
X-Gm-Features: Aa3M54pTYXahjqTv7_MT1I1wEAeHDvmXQpnCEn41MhhclxuSVrfOIbrke1NKz3k
Message-ID: <CAA6zWZKPY-wjq_sbheLBK-k1b6rCdXs353b7j-fTYB6vTGLmGA@mail.gmail.com>
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id arrays
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Joern Engel <joern@lazybastard.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Let me know what you intend to do.
I might as well address the nitpick since we are refactoring already,
so please wait for v2.

> Not related but since you were removing the /* sentinel */ comment
> sometimes, when do we get rid of those extra entries entirely?
I don't really know if there are any plans for that, I certainly will
not attempt that anytime soon.

Thanks,
Pawel
