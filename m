Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795776531;
	b=iq8jB27tf9kCNZNZK8L/DKUoxyl7tztrv65Q5OdKVpFRwUFxMzNklEx/z2XhvPVfxCVL
	 lB88rXm/Eh4DbSOaBFa/iHJ6oEhwE+xRhO2LkWDVODrLpTDq1ovz16HZCK2z1xvEROShf
	 CIBF6jKEWQaIgHVedMrMYj8sJsgx82hjNUns4pOnFaymA/NE5m3kMlLJXtQe7F16AwDqr
	 JQU2EV94mfUXnpveovYgOY2RB6uUG+e/RC21JEy+eAsZ/JxlvssTkZYj8Sr3n0Izc8JMh
	 bhQzBGu2ynkrT7xwMFs4PC4SEmylF7Ysf8aIh5lRk57FLEhNg43uhqHqK6RobhKZM2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bZfwrwWaECV1/tbhLITy17tqF3X7HBMLHo2nwLtYHHM=;
	b=ytKzqnGXOllQtdxLxvpdLVcbbVP53uczDbh7CzVIW7SUm0WhSlexLpNqq47gvfZhKIlU
	 vrYdaF0l0SyYchjipn333VyYVlYY43I/TND3IJX8jfbaA+XZpobFPwMDsXYD85Oen9Oxm
	 JJyUzw3474J61UQcvbl29uAzdi4P1Mpmgc4arU229FMtUuD+N9ikZGp7ZOOcibEr8gmmA
	 3sMeoH01+Qj0whFgD0N0IOGEXhNL6gpGpS/7GSITobSGBYJQhZcKmYC/8Yny5VZN+x6kl
	 uOfLyAIXGXjvVmSFwT7cnOIvpozocwbhkBa9dD08/2kYj+I7Wib+QPinZ5Cc5XIj1dQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=fHDGl49p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6BC606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D6BC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=fHDGl49p
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso1179734766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:48:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795776528; cv=none;
        d=google.com; s=arc-20260327;
        b=UUUvYY/8oeuYZCrVyaZc3RfZ8HW2QjyLlqVWzUGXjYsta5kLtOmrhE2+RtMxPGnnNp
         xzh3vdVUx7tv06JWm/BTPEgd1CuJW3GDfKTPAXmgcYTUop/EHpOy230Gh5PycMBF1d/2
         o2kSPGuDzhQF6aFD0w8mwLZKarewjFglx2OgNLxzJ2SxLZ29TWctjvh2ZnPENf2LIhBh
         ZGIHS8B0jo3iM8QS0apP9xoePwTSfEnwL9tEztXxBiRB/7cJoXRPM7kCfbFBHRKC5U/N
         rgqyzXE6b0FlsfJsmdZh903r282NMB1qiXcKtaseaBgThhASasI6Sq9eEqAGME2zgjKn
         WxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZfwrwWaECV1/tbhLITy17tqF3X7HBMLHo2nwLtYHHM=;
        fh=KV3L6dthPb/sx/SoMZWgcnd78H4LCCeov6Dfl4RP7jw=;
        b=GurmTovkRi2OmD1xn8E8x4EnerECrYON0OkPydddkJqxSVGEoAgHeAyKQXdmZdfTgD
         S+8jiHfnWTd2VOe0zGbRWIpsIH0cU6BFkIPcHYeiZ5GqwNOtiiJf6s1cZHvFLDoGNPXy
         wNwqlNUNY058c8rVuGBko8eyjEC0dyAe8NJtg4IGE92DKD7uk7VOtsTaIjqpkTFnZgJQ
         3A3Dcm8Diky2Yt2xbg0CpdV0e/06+8zI+DQcRnBldPJkKZRgzWjEuKXsEVe0A4LL6PaL
         l5D+2JvtzzRCi5ad8jcsEhswg6pixtVADslB9aPt6ZRFIWkPZ7O2inO1SNjkCzNzGQY/
         tYQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795776528; x=1796381328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZfwrwWaECV1/tbhLITy17tqF3X7HBMLHo2nwLtYHHM=;
        b=fHDGl49pFCwXT27v/JhT4wfwo3Yg5uPybf2U64SBhXJ4e+FWQPC1LXOm4mW+6aKqa2
         RxhtJQE0mZjXzY0I3A942W1l4FPFK1xYx3fxEggdqvy2kvCkunk3ZWMdedxPVHRKflVg
         QXFlDB18ERazN99KYBXSL+DBSMIDDBdq9TGRSDEFBeoBJimAcXfkpbXknFIpRnZ5fs1g
         6Vm0jP3vw15TvQgZP80aQpybJFx91FjQIC1c3opxV/SMnQCRL4Jxo31c9hffaKfl8qDs
         VAkpWm0SFq7rpacr9ZkrxpDHWo3E7TKDgnXBKRD3TzfKclby8Xaye/ysBY3LKf6CAGYe
         6Keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776528; x=1796381328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZfwrwWaECV1/tbhLITy17tqF3X7HBMLHo2nwLtYHHM=;
        b=ikc/w2PR28YFb18zAEBa+flOlNhIUfF1s9BnPDzZDsix3SMqWx15SxreXiM73M97A3
         RqOG+P7iC6QuCzeFJYDcSWE9EAAoe2Qfy9S+c/0FJEK0eNndSt54E+Jnkm9dM2sYNfJp
         9XVK1R+lan6Mq24iHicWJiwLKcwK2qJGuwYTDVbgzTvWHkPeJ++Ro/QHJm9EtsFF2NIZ
         Sz88lH/zPvh4lAywrpM5HwDVrwr3eurgKMRCr7f1cI7Kb0WsdWRbaFtEjzvce8ZW5iiv
         np6GreMBVDCfoQdDGsa2KKjO3r0xdwNaA6g3AGFT1prB7gQKUjYeVNbjmBHYumXwIK1K
         GrDg==
X-Forwarded-Encrypted: i=1; AL+hErE0sAVcZlj0y1kqupCZA7lHflPAGM7KhGLabUZo/GnAwWGpy7ro5hIak5laKXRtykaPxgKrJSO+cJm/RSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xENEcQTo1a+nfc1IvV0qBq3uUMFD9yjCkoXd4gSctrei1eif0
	czI25We9dqoUU+i6xqmFN62sjOdMwmRZvj/XCoT86PQKSdHkchz1u7QLGfTQTO2+8G17c1xpDGc
	8ioAbtZwZoZ6IiyjF74Tw6dwGmPvEESVTMe7okCehhF+vXp8QjBf7NFi1lQ==
X-Gm-Gg: AZFdTZeCaCkz+AHiPQHJBcXwN9HxiLD5lz/JQPpcRxhETbayVu5zrZSTGyDyh0fhoas
	9dE1vQGk/6DSoI0qp0okajO9MyVGNt2ck3/HYW8NZDFuTV1/dtTYuujGSQhpQAjq+0gzYzY49oD
	4tSiLyqfR4Eit6qr8yn1XKO93YHm643OUyQtDlOVFuzn2yWVc+DyKh9oIdaseIh3IqSfkH3+Dj5
	0ygi4R5DV6xRHdDeRrLofvCPGAaeVefAfz4On0xTYPDAE2LAO/Q/mCR4oWk/3CT04DrMCVcoBaX
	ZywvRcvipXsLdHvpK92I+X8v0meHQcyPQG4gNYTcoNfUjW4OV+glKjLpBb6NkfiMN5DRc6sMAJ8
	+V4YOWPgy83mBA9IyBBLIekJEeToreux2gtkR3uYM6mrq/fUCYUCqX29FLdMAuEK7QrvV
X-Received: by 2002:a17:907:6ea8:b0:c51:3bde:bfd0 with SMTP id
 a640c23a62f3a-c513bdec070mr1973240666b.47.1795776528545; Fri, 27 Nov 2026
 02:48:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-fusb302-drain-rxfifo-v1-1-bd9b232ab345@flipper.net> <avT9KERG1udN-TzR@venus>
In-Reply-To: <avT9KERG1udN-TzR@venus>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 27 Nov 2026 14:48:40 +0400
X-Gm-Features: Aa3M54or9yeVEE-woI741UW0EzKnppjO5sHk_pBlY-YQQJfczYq3thTEXFYcoIg
Message-ID: <CAKTNdwEuROjn1LxnAHW-_pS=ERVF4iRUxwa3P+R25+kdNTCSag@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: Drain the RX FIFO on each PD interrupt
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Thu, Nov 12, 2026 at 3:41=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Mon, Nov 02, 2026 at 04:37:59PM +0400, Alexey Charkov wrote:
> > The driver reads one message from the RX FIFO per GCRCSENT or TX_SUCCES=
S
> > interrupt, assuming every queued message raises one. The chip, however,
> > queues some messages without acknowledging them or raising any interrup=
t,
> > e.g. it decodes only the low four bits of the message type and mistakes
> > Get_Source_Cap_Extended (17) for a GoodCRC (1). From then on every read
> > returns the message queued before the one that raised the interrupt, so
> > replies answer the wrong message and a Soft_Reset is never seen. The
> > partner escalates to a Hard Reset, which an Apple Studio Display repeat=
s
> > every 1.5s.
> >
> > Furthermore, two different messages received in quick succession may be
> > queued without raising separate interrupts, causing all subsequent PD
> > communications to be permanently out of sync, which usually also leads =
to
> > a hard reset eventually.
> >
> > Read messages until the FIFO reports empty, so that each one is handled
> > on the event it arrived with, whatever the chip left unannounced before=
 it.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thank you for your review! I had to rework this patch because I ran
into another issue which sometimes corrupts a properly acknowledged
partner message upon enabling PD, so its new incarnation now builds on
top of that fix. Please consider this one superceded by [1] - it would
be great if you could have a look at that, too.

[1] http://patch.msgid.link/20261127-fusb302-getsourcecap-v2-2-6770eb1e7945=
@flipper.net

Best regards,
Alexey
