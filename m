Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632830;
	b=MPrlKRfuBDmm6yf+DYa/t/gCtSPGTO5fWJ3SEvoHKSvykyXxDMe/lxAeWc7D385XZjQv
	 UCKKVYQ8Ej2M8kdtLR0mJUVNdbn19E8+9OE8zpQI5RmMRVjYNJUY/TtPtyJUjqNb6mZaA
	 8ftUjV72MyX7csbrX5jJt2RAKaVEGYfvqH6hMSz0jqDbCTXlFxH/yC2ihz0c4HhrldEZv
	 a6wQG9YOVa0yueaj1z2H2hcuMzH1+Wlff1Tv25ShEaySK/Tn8xlhjZDIhtfSacym/O6fE
	 Ldru0dVS7DTB88TFxItaJgRu5VUL+Uoxc9g2HV9kOEEbS8LODIi6K8aqr1AkkugwxFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632830;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZUFTgX9I3rIDWyWbEPzzLtEjDTEABzFig55bitVUR64=;
	b=peqRT+VGn4SvO5n1qY/p9/1jZaKPo7+vQsGTZPe19bUOrS7C1HtBam+gfUgysDVJn4OH
	 u+X4BFt8TRXYl69rWIO8UPuksTV5F1McjAXRT6+uRe2hDAP2IWWh/Czji04UXRKZvwlph
	 k1+v1oWDkG7wZln2SiD+Ntc+JBPf+mQ3yOb5Rd/Gq82h+NsRhSgWDtwmNykTTh/0cSMjx
	 t9W4f1J4eZeujZY6jEihMmMObtsrLo1kIZtPXEojnCkwJbmlRp0T7GBjsm9Xpi6CS6PBB
	 dNbAwCOa06hSWKwsZHe3u4mw8WXibQk5oHoxabAWid07K0Yts3/EyyKbPBydvg82BsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WI0M6A8f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA1E606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WI0M6A8f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D6D1F000D1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632829;
	bh=ZUFTgX9I3rIDWyWbEPzzLtEjDTEABzFig55bitVUR64=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WI0M6A8fX4kGm1w7FRjqBn9QdwHmvJe7RYyHe/hjVrABkDsaoikwibWMWvJigx6aT
	 UNuXGNuHkMyEa9o9bfMHBTp8+I+CERDKk8SvfRjvHrqTLJsy8NvimJPLofrYX+7p4x
	 wDQAJz/goWW9hOmvxzSQno4AQtV7ESH6cdtTHrwfLq3nFyyRU1r3QvMI76NdQPrtXT
	 Wk8L6A3c5XSK47xdDfZa/RXAHuyZeM9d2VrwHHqNnQFN7FbHtv4VwShWnHgZUSOzbG
	 nS2m/1ltINXQeJomNJ8vHKhlTRo8CkJubWLsuij6BOU5LOoGxkR5b8o844JrMOYG91
	 keHivASxMvPzQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so5871688e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:53:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE01t5LHNGkIwYeegKNnXM9ng1byHfjf/v7pEvlWxPLhQSJy3dVrOsIrXaSAk7LSQ76XVAINwoMFHclYy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TGgXno1UR+gDyWARG6bS3z2jJ2JkMjKgSVSFFzHFkPnq3jYnY
	NKYJp2N2PfDJBh1OvGxoBJMzIH1kz2DQXJmGNPN4bK9/P438D+X6pNc0ZZBmnQZ0JwN5IsE8YTw
	tIgjZ2jz/JRXdS6pgTRbNcICfkxXhHI8=
X-Received: by 2002:a05:6512:2313:b0:5c1:5457:a147 with SMTP id
 2adb3069b0e04-5c1b7c5f28fmr4778056e87.32.1795632828292; Wed, 25 Nov 2026
 10:53:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-acpi-ghes-poll-interval-v1-1-6f45cc65fd62@ahmedabdelfattah.dev>
 <115ef051-31c1-4201-b60d-bfea9d413bd8@linux.alibaba.com>
In-Reply-To: <115ef051-31c1-4201-b60d-bfea9d413bd8@linux.alibaba.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 25 Nov 2026 19:53:36 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hAT_wnoyjqW+P4SYCE49Eq7V8Xa_CRVoWfk+pNpAoF0w@mail.gmail.com>
X-Gm-Features: Aa3M54q2sGywI-9-qhviPWNjL1kVKc40QfkFo9jrfVxwYbE3y7InpDpSgFEWVf4
Message-ID: <CAJZ5v0hAT_wnoyjqW+P4SYCE49Eq7V8Xa_CRVoWfk+pNpAoF0w@mail.gmail.com>
Subject: Re: [PATCH] ACPI: APEI: GHES: Poll error sources at their poll interval
To: Shuai Xue <xueshuai@linux.alibaba.com>, me@ahmedabdelfattah.dev
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ying Huang <huang.ying.caritas@gmail.com>, 
	Andi Kleen <ak@linux.intel.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 2:50=E2=80=AFAM Shuai Xue <xueshuai@linux.alibaba.c=
om> wrote:
>
>
>
> On 11/20/26 2:36 AM, Ahmed Abdelfattah via B4 Relay wrote:
> > From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
> >
> > ghes_add_timer() passes an absolute time to round_jiffies_relative(),
> > which takes a delay:
> >
> >       expire =3D jiffies + msecs_to_jiffies(g->notify.poll_interval);
> >       ghes->timer.expires =3D round_jiffies_relative(expire);
> >
> > round_jiffies_relative(j) rounds jiffies + j to a whole second and
> > subtracts jiffies again, so what gets rounded here is 2 * jiffies plus
> > the interval, and the timer fires up to a second away from the Poll
> > Interval in the HEST. With a 1000 ms interval, on some boots the polls
> > come every 1.5 s on average, for seconds or for minutes, and the rest
> > of the time they are anywhere from 0.75 s to 1.95 s apart. A 250 ms
> > source settles at one poll a second.
> >
> > Rounding the delay instead would still move every interval that is not
> > a whole number of seconds; a 250 ms source would still be polled once a
> > second. Drop the rounding and use the interval as it is.
> >
> > Fixes: 81e88fdc432a ("ACPI, APEI, Generic Hardware Error Source POLL/IR=
Q/NMI notification type support")
> > Signed-off-by: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
> > ---
> > I found this while timing a polled GHES in a QEMU guest, with a HEST
> > built for the test (one polled GHESv2) and given to the guest as an
> > extra ACPI table.
> >
> > Tested on v7.4-rc3+ (4405c18c95d2) at HZ=3D300, tracing ghes_poll_func(=
)
> > with a kprobe. With a 1000 ms Poll Interval and without the patch, the
> > intervals on three 10-minute boots ranged from 0.77 s to 1.95 s: one
> > boot averaged 1.5 s for its first two minutes, and the others
> > alternated between 280 and 320 jiffies, and between 240 and 360. With
> > the patch, every interval on three 3-minute boots was 304 jiffies
> > (1.013 s). With a 250 ms Poll Interval, the polls settled at about one
> > a second within the first minute without the patch; with it they come
> > every 80 jiffies (267 ms). The extra 4 and 5 jiffies are the timer
> > wheel's granularity at those timeouts.
> > ---
> >   drivers/acpi/apei/ghes.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> > index 5d888c82efea..92d54c6b209a 100644
> > --- a/drivers/acpi/apei/ghes.c
> > +++ b/drivers/acpi/apei/ghes.c
> > @@ -1276,7 +1276,7 @@ static void ghes_add_timer(struct ghes *ghes)
> >               return;
> >       }
> >       expire =3D jiffies + msecs_to_jiffies(g->notify.poll_interval);
> > -     ghes->timer.expires =3D round_jiffies_relative(expire);
> > +     ghes->timer.expires =3D expire;
> >       add_timer(&ghes->timer);
> >   }
> >
>
> LGTM.
>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Applied as 7.5 material, thanks!
