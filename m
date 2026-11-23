Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466394;
	b=u/IwMke/Byd/VMEQTI+xPXpBIu55LQoJ0OaWDqAUGCegUe/Z7+pG7fyHS8dpA6N8nKW4
	 1l3xAkh6FFM80sBGUPgopFXKesDUFcfreeCKvxKv/DARVhwdJeKj40xCW6OB8jC0qf26S
	 smgk8fJ4Xwwj5T14a6YJLmZT44702wBHZST/3JbEKFmly4IP2g0/l4oder8i5967aGjWR
	 R9/pFpXZlsENRJ+lOo4K+AE9peCSHEGFYWGkx6DG9YstOPKfXVk4vBFRJORk5zcuo5P4x
	 KLF6cW3Hb4JmplPUAnf3/6ksfNZCXemIrc/xtP0Rosu/aSzoKBs1Abqw0T0a1atIW6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nMl2tg7zBR1rlQ3Z80sjydvjC1TlhDIEJG7iv6AnATU=;
	b=1qQWwEjBu8bqK0iSoDOs1QPXFPSJuRyEItnPqTOwDSgd+Ftwk7PsHONoeDSmSwLZ5GX3
	 MY/uALgFpD+PbuCMyTU/WSq6OgcjiwloEqe6jGiJaM4YNYZfUrSQ7yhphfRx32h3A97iJ
	 R20mfsDD5kCVgbL7JWtEh860s0e+Jkezz9EJh0GxZcscATkQMEV11/ciq7wOqXIBFL3Rb
	 hKBoDZ+RYW9cIWav5ND3flgCK7aIpp6bbMwOoiqqXm/8FOq4dk1gtIt+AvcTNly1TrP6r
	 M/DhpyH7XK1l39NbqaLplSQIrmQsS5g32kMyd4RU0L02JhIgRmNJKQFMTKvq6OSMZWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xyho0CaO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A336606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A336606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xyho0CaO
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so24445405e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:39:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795466392; cv=none;
        d=google.com; s=arc-20260327;
        b=RHV5viaHVANZjFudhwQvC7ocgM3gK1E01p818cNaA2MZoPWPiD1cZMv7Te680UlD1S
         yPBQa9I/yJqq1WiOvL/c3/GnWiE9l6AhV9B3n7HpTD8Ob8cH9YPCqVYxbTSHUrkTG3P2
         AEkrgFkVV6ysF3AyBrQgiLQEckPafX2pU4Nzuwk23g5+cT3izdKe02Eqj2WecGx/5uKI
         od00iXiu3hTbywLxtX6eD/0tv7XrgIcEY+fq7Htas25M7V02KE3I6rN0w255ESTKBZK4
         yWoQMnoy2uTEPnfbof0ZZViqhDfsVeP/YuhB9Xe6a8to0yuus6/+hxTzg9TskrdoO3ID
         IVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMl2tg7zBR1rlQ3Z80sjydvjC1TlhDIEJG7iv6AnATU=;
        fh=L6zqnvuShf/MgqL84Mo7QHPz1wevpv3ZJg5YMNTLJGs=;
        b=f1XxhUAatve3Sel8aodkD0a99unOLMYC533hZyM8eCK7qgM0F+c00KoCqZSsDRJO3M
         mtvS9DD5Hppjj3Oo4u0uQgh3EmX0chJVlKLZtj7+MMpdeOjDZQ3Daq3t7mgyuXw7m2bQ
         PEezSa8XnwI2fVAhb6KFU8VJxId7n8BMSuQEu9Fmlhjf3LcsMaYS66sYkKOEiOYYMYuJ
         rwN1RtuDJGtjNdzNfDx5yTQzyyW4QV58psxJRStk9//wG5o7WmEvGyOFK0Tr57pkzbMw
         uaTFk1ZXE+unAJcqjtktVuzuX+Mvq1WqUUApuV0Pg4p32Y2LA3QFM0ZX82/kuYaaNulg
         oILg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466392; x=1796071192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMl2tg7zBR1rlQ3Z80sjydvjC1TlhDIEJG7iv6AnATU=;
        b=Xyho0CaO9ajf+CZo2ue7LaRGM1afwxl+5LXe5Ql/Y+CA0QzR0QQBDuSW9pn/klcz5i
         dO0A7l1p9qyq/N16q8UL56mBsa4XH71zxHkkEs9iDBxnkXgIloz5WDHGf+9n/Jl8yzaA
         LI0UHXF0/tBtbqHumvMNAGiubC0/o+TPaXMb/YlhxumFz48uDdv3oL3vUiPAi5nPfqtk
         dsKvuZZF9o8E/e8vvgAIcCZ2Tw8YFbE8l8H7f1PqBqeb/y/sEWUKJVO98kuwMaKo0jfr
         QAIiM1iJplZcrW6pTsSqEp2jS1NN4YlhBiB41KgIK8oC1XaR6HmuKNVrwo7r1uhUVofc
         E9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466392; x=1796071192;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMl2tg7zBR1rlQ3Z80sjydvjC1TlhDIEJG7iv6AnATU=;
        b=bXS2JXriTvSyTPzp2lhgiFWG7cPpRvznFx1O8U+NnuzylZeabnepQ5wLjaPnrvwiPq
         ct9godi0FJGpMckNb+6/JDDavhftBs+V2um2q1RUMck4ElwRCqtRokOPJCS/Q8SAXJZh
         9w5d/kZRtdh4BTKvU/wXEU2DlWc/M3m2m+PCGTRSgqTu7oeaHq6+jVkQALwqgyiVqj3H
         DqjB1N23xPqDfCk8dtpTtt5E9pV6JvlpLZ0fybwGM4WIhzLeSZR1fIjlOEiV1A+nq9hA
         5pVJjxQgVL3KTh8AHp6OotZI+9AhUvyOTAZ0CHDdoVTCx5b+3z5otDBwO6M/ieXteBNN
         OQlQ==
X-Forwarded-Encrypted: i=1; AL+hErHUU8psdKhDdl6gPtqZIu1feOJ+a2cadc3eUvn2XUMHCYYLWJHbp0V34d22KgJdZT4OegawgcVF9MkvIkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xtkjbHowr3gKhswRSWjEq0Dng3KHc0F3AQQunhqzXURZWt0BH
	at9NuLJGWO+8MvH4+jHHiVvBAzJa0BBfHbSXJv+++9PT3k7nKUdllt4pk0lUkinySfBIVLnFrui
	Otip2/6DyfSiuvzQxTcnS/V109C0MC08=
X-Gm-Gg: AZFdTZcq55npniHVXSWaZGi0JQRRvCr6qrOUYUZLyM94oWC1vji/ji6d264HhgqtC14
	PcEtYToqQToSJ/ZW0LZ8Ck3IIs3HTO9RwcEUqT9SUaD1YPcZF2/mXPrhTClzWg6MV2DWo1iDjet
	ADHDWRbCwdQCgZnuHODmCYY5rge6AP7CaMzxEEUtb0z/44RYY9A/Uuy4O/K7/sCRaTI7AfD1Ich
	BRnPj05O/99iioCJPOHcBBHBqkjXboeWuA6oV+6s8XSAx2JDzct11I+6aQM30sbouTFNWP/0esT
	6yBWIMEGKKrVgGOyReRPb6fKoSXmMNEOlTeaEFT8L7f3Yzw7xFDSRnETOXVCajXp72eRqooVLRh
	iXQdnRIYjBq+0c03u8/5QdWJabZgSDqbPpxjBFME=
X-Received: by 2002:a05:600c:a085:b0:49f:e8bf:8f9b with SMTP id
 5b1f17b1804b1-4bb887ca0dfmr280208775e9.4.1795466392388; Mon, 23 Nov 2026
 12:39:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
 <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-4-f2322a91686d@gmail.com>
 <awSbkAjWErc0ac_n@ashevche-desk.local>
In-Reply-To: <awSbkAjWErc0ac_n@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Tue, 24 Nov 2026 04:39:41 +0800
X-Gm-Features: Aa3M54pW8nTndfc2YkE4XIoHXj50vEdpBOxgCjgICpgYwVEehODt65XRpbec5kM
Message-ID: <CANYHO6qir4Zb9TBG+JP36=tCpQdf+uUiOwv5XurP7XGRz5GnSg@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO
 OUT not function mode
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, BillyChou <BillyChou@aaeon.com.tw>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 4:01=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 23, 2026 at 11:16:17PM +0800, Gary Wang wrote:
> > The CPLD I2C pin mode setting following uart & spi used modes array
>
> UART
> SPI
>
> > on device AANT0F04.
>
> > CC: stable@vger.kernel.org
>
> Should be better Cc: (CC: works, but looks non-standard).
>
> > Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP b=
oards")
>
> You need to read the AI slops, test them and add your formal SoB.
Tested, but I'll check AI slops than add SoB.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
