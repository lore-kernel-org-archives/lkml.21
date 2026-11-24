Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517312;
	b=CZnQ8SJv8UeeoOfTea1NZRIRi3uzPFrn5GVZTrLGgm9BLiNnw4o75IyRJhbEGoG+fglL
	 cqftj5BvJWO7CFTN5CZpT0sDsirBKnLKae+EkyFKQ7cqzuO7/WNmOqkL8X8djKWG1Awvc
	 N00xNANw8M37t9duq7pifRULLUJc3bhHyx+0Y5r4TE0VXDRPVQ1JrQRL4Hfc/dJjQKeVv
	 JAutGyKtjqE7OctAydHKCxP0hypyNGb39xRs+uFKcDrjLQnKt+85cU9QhqQmKA9PtKyVF
	 bGydtm7d24stmXb/0NOHD6gKmmklev8HZZelUjrWiSqrmiTHbK9wmyBGUKR1Gw3bjbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517312;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=sONtv6uuoQDqrzKy2E1x+FEJb1HP1UNQoeW1slamno4=;
	b=hRQlGwqBiJRKcKKziSlR43E2zJvOCRfx5NdxSfa+HFc0JlNw1xfnm/fYtPr2f4q+u0rc
	 KY1j+PvCYQ6Q4vop0IcGXusrYspR79A5EMUwyoYsFZfdfbS0eH0MdqpgaIKvcZS2nbdnl
	 OiInSSkQNR4C806tHCUtg5zsot6TAQ1t1fV8dh0zWeIa8V9Gv9LWrah1iY4hsl56ZFO7u
	 X73QoTtUmJmBlFNmlpe5ZnATQslK0Yx4TY/KIgZLSUE02MqWQMJ9z5uaEEDzIpDe7AZsf
	 yxQzvyd/JQ/ORxG8s7p+NHeNg9nt7ZOFjcCCkC3oofvT8N4ShpsDmZcpqAA/YnCxPoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9AE606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-745497ac8fcso1546912137.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517311; x=1796122111;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sONtv6uuoQDqrzKy2E1x+FEJb1HP1UNQoeW1slamno4=;
        b=lA4R+Q7wfTElDhdjMsBop6ziKThE+SFaWHknOrAxHCTscOuAKq22yrNLpG53l33zbz
         Dz0QkBd1UvIE55vZ2JWofwkVSG1evpakNcQhtqqUT+2am5PJIvdNy08dOIWO83/beLq7
         l7S2gJ6XdbP7R8LZstTm+Z1mUysVGNMa9h1MCx2mTqrx1oxT+4sNMxyli1aQf7jNGJ9r
         YbWavc68jcbiPupaT6iYycWRvXLMWenmgwbnu7HfupPtquNFYEktjwCUDEm9GCOTqZ8i
         7+OdTe0/g7PUpn8s+405SPzrgfsDi6FNfiJXjAywQWY9EKPBSDZJdhK1xAaTlfuVL5Ie
         0z/A==
X-Forwarded-Encrypted: i=1; AL+hErF4mIoU+ni7+O6iPpc6K6H0rFx0l8OA/AGVWPBoiOz/8eo/e/VWzeWbcoQyEM9tnWBB7BkvyGFr2uW8nJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K4fkKkM7v8yOiKDU0wOyI/X7z65yz3VEqx0pa5Vb0dt7lAdWA
	vkx+Wijbcw2qd+Wdxaqo2OsXM73qcDfRJeGS8LcSzpWfigomK+K6KFE82hdcZvjb
X-Gm-Gg: AZFdTZekiXvynsI3a7FxtT5KViRU6wX4i229ch/04rvD1lITkyLHrugnmNTx0w9RVas
	Ry2E4GHkRM3T+8rgHOMs9RgSDrRKvuy9tI+TIzoA3lLAqDiXCMcOwkOo/+f9Stg0PcFZA4tkHlw
	hhgFR0FXs497AEbBuJThAdOpv7dfDctCMgB9Qkq2nVqj38+z0fSQFt99KMpF84L5npemdCcVN3C
	SRbPgr/FiouZOR3XVWRgWCudSJ4joszXnvOtAOuW8bqNhqYAxs2TCzE6rey5r/OqrcOw71mVJJq
	f91wVomm9h8zLoDVEV6TUM+NYlVdUMGE0nhQlxXoiD+NLEs/V5HYF2AuijE0RVloyq9p4KSixD9
	uESSxywuukJskAMucut9wok1FT94i9OgonRpbPrPIM/fTxXfyEFKSDgdM1RMgQ2uaJiB5aZzbkQ
	qvrZnPpXqmqQL0md5VTZxLecqXAu3Wvuws2oe3anhvc4iVSVOiFZAd2lk1QCey5I58PwJpxVHZ7
	UfrZ9mRmQwf5r4/MuUbcKI8k8NubcNwYfoGgZ/xRqV2Lh2C8fHC7Kaqk1N+7IzOCdGTPG/ZZSQ/
	PRFnTIpWll8ydnKfvncmOIK9IirR0sQ+2/kMOgWqPIijNY1dP9qZlUT93ymFUj2KDig=
X-Received: by 2002:a05:6102:a18e:20b0:7d8:b509:df1e with SMTP id ada2fe7eead31-7d8b509e0a8mr443194137.21.1795517310669;
        Tue, 24 Nov 2026 02:48:30 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b635d0fsm13553186e0c.15.2026.11.24.02.48.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:48:30 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-99e1b352df9so1140838241.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:48:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGLnQGp58R+KKhTJY9hO3myMdt8HX0gWEV18wQehVbV69fHIl6xq+mSuKqOdRctxzmMb+90kU8jsCK3U+g=@vger.kernel.org
X-Received: by 2002:a05:6102:6890:b0:7c3:fc96:fbdc with SMTP id
 ada2fe7eead31-7d7396b5a8amr5632287137.37.1795517310321; Tue, 24 Nov 2026
 02:48:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124100604.2380938-1-daniel@0x0f.com>
In-Reply-To: <20261124100604.2380938-1-daniel@0x0f.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Nov 2026 11:48:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1e8_fNpciRaJxxJDUvCsV8bgkOBoPjpzUp=uPNWaM8A@mail.gmail.com>
X-Gm-Features: Aa3M54qB1yt6lqgJnmZUZ9UYgPzwgC5-7_fQiU7RevBgj6A490deRL9llFJVxM4
Message-ID: <CAMuHMdW1e8_fNpciRaJxxJDUvCsV8bgkOBoPjpzUp=uPNWaM8A@mail.gmail.com>
Subject: Re: [PATCH] Input: amimouse - Fix the buttons
To: Daniel Palmer <daniel@0x0f.com>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Tue, 24 Nov 2026 at 11:06, Daniel Palmer <daniel@0x0f.com> wrote:
> On the Amiga the left button is connected to CIAAPRA bit 6 (/FIR0)
> and the middle and right ones are POTINP (called potgor in the code)
> bits 8 (DATLX) and 10 (DATLY), all of these are active low according
> to the "Amiga Hardware Reference Manual (3rd edition)":
>
> In chapter 8, "Interface Hardware": under "Mouse Buttons" a 0 in CIAAPRA
> bit 6 means "switch closed", and under "Digital I/O on the Controller
> Port" reading POTINP "will produce a 0 if the button is pressed, a 1 if
> it is not".
>
> Invert the bits from the registers so the state of the buttons is
> correct.
>
> Tested with Quake on a real Amiga 4000.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Thanks for your patch!

> --- a/drivers/input/mouse/amimouse.c
> +++ b/drivers/input/mouse/amimouse.c
> @@ -58,9 +58,10 @@ static irqreturn_t amimouse_interrupt(int irq, void *data)
>         input_report_rel(dev, REL_X, dx);
>         input_report_rel(dev, REL_Y, dy);
>
> -       input_report_key(dev, BTN_LEFT,   ciaa.pra & 0x40);
> -       input_report_key(dev, BTN_MIDDLE, potgor & 0x0100);
> -       input_report_key(dev, BTN_RIGHT,  potgor & 0x0400);
> +       /* the buttons are active low */
> +       input_report_key(dev, BTN_LEFT,   !(ciaa.pra & 0x40));
> +       input_report_key(dev, BTN_MIDDLE, !(potgor & 0x0100));
> +       input_report_key(dev, BTN_RIGHT,  !(potgor & 0x0400));
>
>         input_sync(dev);

Nice catch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

That bug was introduced in in full-history-linux commit 7c40d075b02b3ddd
("Add keyboard, mouse and touchscreen drivers. Add tsdev, power and
evbug event handlers.") when converting drivers/char/amigamouse.c.

How come we never noticed before? I did use the mouse after that, cfr.
https://lists.x.org/archives/xorg-devel/2013-March/035831.html

Comparing drivers/input/mouse/inport.c to the old drivers/char/atixlmouse.c,
I am wondering if the same bug is present there, too?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
