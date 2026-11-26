Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683177;
	b=guSO+Pg+ewcd1gesYxihXja/UOrspEVjc4KV3Ikw9MYD4D1sAnmxUnW4q0paHC/amBe5
	 BCe/Oe+WHQRhWLt61164vs5kHbu7grQ7YjrYDPU/IE/bKrlqM/Vep4WxQm2mTHedmOZZ7
	 WY3eeLesfUzHYAO0YS7ckuN+i3v37MAijdOdRSKSU74ybbETMpgqGwyCbwE9zv0XGc3x4
	 0L34bYNlvdrK2ym7apgFOryYAYUlwaUezBgJdgadxouqevsqXo3KUAD2kszCIYVsfF+Qh
	 xAa/DEbfQQvDVXLX+pS8ruvCS6fOnyI4Rhk4qDQx/LYMs95twI1FnTyVOjbLoOp42ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683177;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LQC7n5UB+twTmoKbhuhV7McngclJ8wPtfQsYLymxWtQ=;
	b=tZyr4DUt5n/7WzDUVYq1ePbH02OiDFELdnkwf5MIOAek6+YF+7SppeCfi9hioI5iDMEP
	 lS3SfB9/p0WnOAGLFbwam53Yu0IhUtdUeve/GteNDd73QZZhrf4PNWVSRg8QLif88lXYU
	 27jikuln4lPH7DC+vp0dWu//sYaEBP2/rOCsvgI7wTI3qSa9EqjskP4BenA/oL+plBP1I
	 pMoo/gBP7e6Nu8zKliq7GRY/K58OtDHuqvfR8ZaWyYeefQ8gs4WxJ/53R+jtnONVW0iTm
	 +ESBR8ad2vdRPHKJ1MJueSsCFj9DyT4y5sBzmvIZHHw2sjIx3hv+7fzvyXSOy3ijPmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7AE606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F7AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2c8141dc6so3601903137.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683176; x=1796287976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQC7n5UB+twTmoKbhuhV7McngclJ8wPtfQsYLymxWtQ=;
        b=D7bgOxEsLvAn6kadn3ckGFeWgwJel0zgpWsdg4/NDWPld9Pi/6k1f6vviV2XFDDzxj
         HhdAtFfpu0gZK80N8s2rOme4wqYhZtn7k6xgk+30hqOXkib68hLFW/8Z47bBTwL9wPTm
         C5Wc6ZSEmIdnQvuRuY1ShKK9u5cG+LSSjlukL69VibaqRNTSqEJQly8dA/9j+WcjRVvR
         ZRq3tpQfjOXweY38Qu4T4wqEuzH4dcbd8XapBdm9w2aM1a6kOZrANKYW7NI2Bk0I9NPg
         nC4y7uUQ5iBvAaBYrRcI28oWC+de44AmDPNlWdyv9kHu4y7jfC6dGNasoZFMN5lyaP6G
         N7+A==
X-Forwarded-Encrypted: i=1; AL+hErFBOj+2aOx1npYshn8/tmJ0ubfKXrg0pzgbiXb/Zwiguq+bSYZi6JZLsbQyVgvW7bMPltLmf1gGyi4C9FQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zH0kL+Vnf3pOeLIDckVMf9JR7s05FN6xDI1VUx0JuK3bR2B/e
	75WhOM/tFUDF2PKJLJkIK/zebtF6aNvazjt+oHcCrSLrADraYZlJBYeORzFW7ft/
X-Gm-Gg: AZFdTZeuVyylzh4R+50moaBq3jGRGj+R/Zxl/R/ByDPDvmb9BavTXl+shJ0w3KoMA8Q
	cjrzcsNH2erE24E1yAUJeEWOu0rcq7fSphsQbrCXdimSqdGcgKG4GW1tVh7R0a0JPMD46fa2B0f
	T9n9ovfuOhUrK6xxMPqcWE6Z8fRexGt0ZAI0M30KPbbUvnkhjqrtullApVlwMFpVmrwMAQcmfYx
	H1ASd/qCmCbtU995HwIJoUcUyQFVJcW082ywQJniViBX0wOGctaYhbnA56F/BltDNl/iP5KGbQN
	Wq2SmUYEhcpON9Fc8czYAvhaRsN6VBeoa8P2PGu2sVJmrkw8IkFnZrgND7QcQ3lKS7CwbqJCw/l
	DYLBEiaBHRDEr7XT2sVnxls8PJqrDuoc6xq1JL6IvXDtBhf173CFAVsqjEd30lSJV5GdPVUguSA
	NSl86IsUF2ZFyb2eo8uk3sKG0YuOkXrr06dxoIufiUMfEv1ti95MhK4l8r0y0odPiM6uHb3HvH+
	+mkS2iO62qcx3JjT+W1RbuKmeYneIGvDfIyg5xOmSKZmHbNv9wXjONCfWPkaLufDCVfWHPJDndT
	hEycAQHOVdqJp8fAmJCCYe8Rw2yTBDTChCWVH4u/ZsTyXiXfcwJYuXBjmJUH2iQW0mXpXYc+WDu
	QFB4Zoqg6sWPxjrKubg==
X-Received: by 2002:a05:6102:448b:b0:7d2:b199:6721 with SMTP id ada2fe7eead31-7d73957a1f4mr12199535137.19.1795683175841;
        Thu, 26 Nov 2026 00:52:55 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e80cb440sm21273497137.7.2026.11.26.00.52.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:52:55 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ee3a3d281fso4320005e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:52:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHBaTmY7+Ds0/znBG3tADVZbF8M4Sww95yDdUSufnBHWteQ8g3IT1YfiovPOJhXdbUqPl2R0GwLZfv8s6s=@vger.kernel.org
X-Received: by 2002:a05:6122:e16c:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5ee8aecb450mr12178985e0c.8.1795683175291; Thu, 26 Nov 2026
 00:52:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795639368.git.alx@kernel.org> <396395e1d02ca080da67cfd91a1c49058b2676b6.1795639368.git.alx@kernel.org>
 <awdaYz9NNVv5fHv9@ashevche-desk.local> <awddHt_xvc-lIygA@devuan>
In-Reply-To: <awddHt_xvc-lIygA@devuan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 09:52:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9gnV0beBEoh65FzPCwrQy=WpGtK5qKsOF3Tsv9iUj0w@mail.gmail.com>
X-Gm-Features: Aa3M54rOnub7bCh_NzEEm3acSwF_6HJABwfoziM7rtzTMFRTInpGyKc2wQ19vKo
Message-ID: <CAMuHMdX9gnV0beBEoh65FzPCwrQy=WpGtK5qKsOF3Tsv9iUj0w@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] device property: Fix fwnode_name_eq() for empty
 node names
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Alejandro Colomar <alx@kernel.org>, 
	linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Andreas Schwab <schwab@linux-m68k.org>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

On Wed, 25 Nov 2026 at 23:18, Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:

> > Date: 2026-11-26 00:00:03+0200
> > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> >
> > On Wed, Nov 25, 2026 at 10:03:55PM +0100, Alejandro Colomar wrote:
> > > str_has_prefix() returns the prefix length on match and 0 on mismatch=
,
> > > so the mistmatch case can't be told from "empty prefix matched an emp=
ty
> > > string".
> > >
> > > For instance: the OF root node's name as returned by
> > > fwnode_get_name() is "" and will return 0 for any name matched agains=
t
> > > it and since len is 0 too, fwnode_name_eq() will return true.
> > >
> > > Let's use strprefix() instead, which also makes this function simpler=
.
> >
> > ...
> >
> > > Message-ID: <avrSUUM3HMgxTNpl@kekkonen.localdomain>
> > > Message-ID: <nat4ilqmzzpuyrjbuahl367ip22tfnmjorydlppuwqiscxaujo@kf63j=
4lb3flk>
> > > Message-ID: <nat4ilqmzzpuyrjbuahl367ip22tfnmjorydlppuwqiscxaujo@kf63j=
4lb3flk>
> >
> > What is this?
>
> git-am(1) has --message-id and the corresponding am.messageId, which
> stores the Message-ID from the email header field from which the patch
> is taken, to document where the patch was taken from.  It is stored by
> git-am(1) right below the last trailer tag from the patch (which should
> be the 'Signed-off-by' of the author), and before the 'Signed-off-by'
> appended by git-am(1) itself.
>
>         $ MANWIDTH=3D64 man git-am | grep -A5 messageId
>              am.messageId
>                  Add a Message-ID trailer based on the email header to
>                  the commit when using git=E2=80=90am(1) (see git=E2=80=
=90interpret=E2=80=90
>                  trailers(1)). See also the --message-id and
>                  --no-message-id options.
>
> It's useful to document where those tags come from, in case it's
> historically useful.
>
> I've extended its use to other tags I take from emails.
>
> > Is it documented tag nowadays?
>
> It is not documented in the kernel, AFAIK.  It is documented in
> git-am(1).  I included it, because I find it useful.  Feel free to drop
> it if it's not wanted (I can remove in in v8 if it's not wanted).

Please drop them, the tooling (b4) can find the origin regardless.

BTW, the kernel way to link to emails in commits is using Link:-tags, e.g.
Link: https://lore.kernel.org/avrSUUM3HMgxTNpl@kekkonen.localdomain

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
