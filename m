Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167116;
	b=XTvuKb1IMc9J7bTiEa0OZVXOO7oOTMEe7vGZAIndAp3UKWeBt3TQVmHkUYxwUI8C0+Th
	 548PA771k5BPbhlM07TSbn8tUwiwVFuyEqqrlxehh/XL+B/poZaQxVPnZ0s+bS5gdddND
	 eIwDUw31O7S2dubpee/FuASjeTakZ2YIH6aq6TzUzwiRuyo7uop3YUS/sGKxV9OyiEJM/
	 c1Y/YH8tA8aHWGRPwDkkPhzDSjydeR17zCOq7l4WJFd0HW7AO+IJOopqMBdxDV3g0thoG
	 NCr3ql4G039ISCkFvE1HtgYFGWtaXrP0h/GjEJlYmH3QN6hE674cdGazzpb+U2jGkuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Zn4lAoghu5jQhcYe+1nVRr6HSJgIEjuvXu7xfOq1cUI=;
	b=reTp49edEntT4jOVbFevhEKnbCxglAo+Yvb+G7PrIbSrOV60vLOxjgaKmBfXOyBVo3pH
	 5f1vrChry6A/5y/SgRQUbJ/zsb99zCFiEDbMDW5ReZNM4HSLQfSDjycgHpF1DC4k0eO7t
	 PQ8bJo5irmoFEMfdSd9OuSCWrptkVNIE1fWLSByIulV1gdXwKecXaEtsRYL2BMVonV5Px
	 4tg8QS4NN91nOngB4XYfBUjOCB2YsJLc5uhd2c01bs1wXzBETWtv8VW5NU00p8Edi3m59
	 1k6vNRLF4+sEdNiXTTVfkKx1LUPA86iv/vglfLLAszON0lRZSQ1673RmC3MdbLjn37w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zow7pfvy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CF6606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2CF6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zow7pfvy
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so560500f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:31:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795167114; cv=none;
        d=google.com; s=arc-20260327;
        b=bxAnr8htKwvNGtV1pWQkCrySOiUUVasvTh0dJbD7oSt4v/nZaT1yDg6Xr6qd/uEPrl
         pBzdfEujb5wky+dTp7FLBiowxHHkLCDbaNfHRGW7pp52z4Dc5mMK2m1hKQfnQ4K5IYxb
         Ge9fOyTPI5ekg3A2C20SRUGa5xQYXMYmjSrk6x5HnUkAvbQ5dkwkPLRp6Zo2FkD+/M4a
         UZGCrV0xlC2TzOq6XaJPcRjsAdE2kEyVILjH/Ey9wzTBH1BEBwxQIwyWj+nz2ElF6Nvf
         nREk2Y0KcrFISYh3Bw0/kis6tciKCQvLA7JYHszhgKFpp3CRKDZM/FwA+LmtWnpYetzM
         XJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zn4lAoghu5jQhcYe+1nVRr6HSJgIEjuvXu7xfOq1cUI=;
        fh=uwQHn6uzdd46MgXtrzj7mlEsMtBNr85lR4hIK1CHIG4=;
        b=KfqGCwrJlQbq+wGCTyvzs80RyJAKRSrogQcLwNTwZtRbNN0QC+jlhOKqqLA4QG3it0
         At0CjeyVJRuR/h0zC4v0MZ9auJcD6K83e5X+pGT26dA5/EOW0Vk65GYKxGFiQzucFXCu
         Uu2dF6uQw8sUf79nRrhJFd/rWFVjzSyjRiaQAE10rjjkZdUJuHL0tmMtriK/tgjK7Yio
         AqxnBd1t1Mlmi/436sk3rsluzN3zZw6i/qp+lCiYiGxHdvixBZ8Q5YqBtuuiuvVWC8HB
         Vvc0j5xXASnGKSQlsja/xKGkcMEvolcdjLXMvc1mQ1x7cgYrIxl85Dn1fYea3nrUg9y3
         k2gA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167114; x=1795771914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zn4lAoghu5jQhcYe+1nVRr6HSJgIEjuvXu7xfOq1cUI=;
        b=Zow7pfvyM3IOra8rNj/NxUPatXWX8aoqZA1fBUrTcWZx7ri0NFe1p2Sz7jPB8rzpPy
         0ek6V+i67Oz5sPzhLnjb9lMZg3erdZZsgjAWk82tpe0PlFg/gfCU7kHH//aMFhVv6/Zy
         5NBuvU4AEB7S8j1QkpcLuRadAskdCwDzfGfPl1gBQ60v5i/d/kYT8IlafhKsRvKTkQ8d
         pS/ii1oUp/uGUvccuUa5BZrNqLwaQckass+fjiE5kzF05BwWPrhTQzLEu7AfOXvt96+6
         nAzhkWJ8LKSt9TBl3LwRwa1vmJBIHrhRQ9A4qj/zmo2UNxBAiNFPBqLsSyyoxuTSTiZD
         s6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167114; x=1795771914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zn4lAoghu5jQhcYe+1nVRr6HSJgIEjuvXu7xfOq1cUI=;
        b=bqd+Z/dNge+c/IVRRNeRufoqDAibK8TmyqXpsPcjPvY70oakI7vAiFAIzXkAYe0p2/
         Xs0TSdYmNT+/lo5Lz0q5fxQYwzkAXOYJE3fXj5PN0ir02MF/XxSgs5T8ba7wUTxG4Yqf
         bvWjHYvORuVSWIplGh9fhZFdi44HHl+qWVmOyEu+YlwLG9E5hWBymPly9GHNl6g1UYhj
         3tA8PF1M6O1y+nUx+8laszszes5SJHR2SKeGl95ecSW85dzBMUm/B1VG4II6WuvDr6VH
         zG/O1qpEN4q3dU+6nV1ISMYg4B5KMX5w6i5FbmUGxHW5hz+9HGvsAQdj4UgoT/HgvyH4
         j7Ng==
X-Forwarded-Encrypted: i=1; AL+hErHdyngvv3GfSnQ0/h4qtnqHQu604mJaEXdM/TlIlRWO9ONJ+PMXskYfvTsrmPwu0f+5QSI7+5x68X2Sa80=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a+9Ja3rxyeBlg1scO1AIriW5lTWu0lccGSPI4h1gF+qz7iJtP
	he2Wu+/9iG5QbOKQss7iK9JHMH7zJO+OhDPbrYHndpy3ZiGF5gokyHnBV6aB/u/BNhL+XsZVzNj
	MJegpB/6aFemfYqA6gIpWDdduDa+obeg=
X-Gm-Gg: AZFdTZffl4V/EBu3nH85mIuYCwDK0UXzVQqOsu4qeYtrc5jDpthFsyURpxZWdFHPaMX
	ZxuN4fr0jJGxa4mjw4x8FSY/BJoSs9DAgC1WbCl9YvkE+cV+2PHRrVl7J5rBteyxms/w+ztsQYB
	HvsyBCSpAPTcWoWiq4MVHuBWOZT0idByKrKY1tz1DFOOkeylMwOUVQ9OE3n14Eo8mYX/j7GcElW
	jRF4MpGOsLAQAUcskmP/FnLGUsjyWPe+Ct6EsAQmmhE0XmORPaQM0Rz0R6BfGrhnjGZlTDRqWOh
	g+FPuMsGaMxaYVtPSpC69tO22EwbT6YqiuOaZTJWJ32OWTKVhE2ZxzUp99mfW5Y6A09zg18gEu8
	vW75wYR5bqNZ6SenMLfaXuh9FtOt6J55tLTAGsPsYQvwZl2AGhmSsPCHCeDRaCDHqMuqH/7H2fe
	QbPIqCjWW1Swgb/P6x
X-Received: by 2002:a05:6000:2913:b0:4a7:7bec:e16d with SMTP id
 ffacd0b85a97d-4abb0c5d670mr5033398f8f.20.1795167113904; Fri, 20 Nov 2026
 01:31:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-xen-tpmfront-v3-1-3ea2e3fd8611@gmail.com> <awALp-m9n07zxwfj@kernel.org>
In-Reply-To: <awALp-m9n07zxwfj@kernel.org>
From: Wong Steve <shyckless@gmail.com>
Date: Fri, 20 Nov 2026 17:31:40 +0800
X-Gm-Features: Aa3M54puGGfyhs9Fb4PbPHCi2DwRGJKHVjyhAyTJ0EWTjaesj9JM_GgTWd2co1U
Message-ID: <CA+X8Sdi3CFZNDSOueF1b+C0myV5kqtwYzcxrUPx2T=8dJKyVzg@mail.gmail.com>
Subject: Re: [PATCH v3] tpm: xen-tpmfront: fix use-after-free in backend_changed()
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: jgg@ziepe.ca, sstabellini@kernel.org, jgross@suse.com, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

On Fri, Nov 20, 2026, Jarkko Sakkinen wrote:
> There's no use-after-free to fix.

OK, with the only backend in use never closing, there is nothing to
hit here. I'll drop this patch. Thanks to you and Juergen for looking
at it.

Thanks,
Suyuan

Jarkko Sakkinen <jarkko@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8820=E6=
=97=A5=E5=91=A8=E4=BA=94 16:58=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Nov 20, 2026 at 04:26:16AM +0000, Suyuan Wang via B4 Relay wrote:
> > From: Suyuan Wang <stevewong@hust.edu.cn>
> >
> > When the backend moves to Closing or Closed, backend_changed()
> > unregisters the device and then keeps using it:
> >
> >       device_unregister(&dev->dev);
> >       xenbus_frontend_closed(dev);
> >
> > The xenbus watch callback that calls backend_changed() does not hold a
> > reference to the device. The tpm_chip registered by xen-tpmfront has de=
v
> > as its parent and holds a reference to it, but tpmfront_remove() drops
> > that reference when it unregisters the chip. So device_unregister() can
> > release the last reference and free the xenbus_device, and
> > xenbus_frontend_closed(dev) then accesses freed memory.
> >
> > The stubdom based vTPM backend, the only one in use today, never
> > switches to Closing or Closed, so this path is not reached with it. It
> > is reached with any backend that follows the normal xenbus state
> > machine on shutdown.
> >
> > Take a temporary reference before unregistering and drop it after
> > xenbus_frontend_closed(). This keeps dev alive for the last access and
> > keeps the existing order, in which TPM operations are stopped before
> > the frontend is marked Closed.
> >
> > Found with a static analysis tool and checked by hand.
> >
> > Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> > Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> > Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> > ---
> > Changes in v3:
> > - Drop the Fixes tag (Jarkko). No code change.
> >
> > Changes in v2:
> > - Say that the stubdom vTPM backend never reaches this path, and don't
> >   ask for a stable backport (Juergen, Jarkko). No code change.
>
> There's no use-after-free to fix.
>
> Br, Jarkko
