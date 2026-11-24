Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536620;
	b=ILC2o27QhBgNRpKCvb+LukFUkorMazgYGV+fZJXKnd/m99/6tJbMChC4nw0VDZKBZH81
	 IqxrcWyHHIuvG5Vnbtk4w7RHAoa77ibWRlZW6hYuGfJo/qViX87R/M6z7pal40DFmJAlw
	 YKRfCdHg9gUA+aGYo0k07xh72RlFxmBRoOJmECm2ESqIAnKa6WSavAEd0gYaqOCxAyhxS
	 EqyAnVCcE95F29QUXLeW9o5KRfZJdFhUFrLQdalLynRe6Vm+caT1mUOKKJ8RTHjkDMDcz
	 pntVTV67wUSh96eEudPzdpQME2jV+FSkT3LxAbc98m24j79PUKu/es+OzFvJImD4G/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HJt4JMv5FVP1qu+wQIQwqnzbRKFhP11tEo/XVFuWAeE=;
	b=F5wPAKFL/0phbGefkBy6WD983dZamdYY0+5YDy2tnQxM5cV1m0sxNAz16bNEAKUChULi
	 HB7GCw/YhMrbmrGqUS6RavqWi17lx986PHmUGEFOLX1vKrGOzBgTxVTTVBgX+RRq6OzvH
	 PcPt/I2Z/nBbx3HxoDHb7k8KAtQmt+rWrjL6hZqs8td+Xt7Dkl7lPWOoepAxTFX0VpSfK
	 werRUQMHLXrtPsNVAk9jzY+Q765XyzhQoFajogdz4lQEfD6a8u44dmfbMqwt73/20taw7
	 rRv/0n4jHN03z/N7YmgqxLLex/tQHmB8yhcCihaMY27pv5tdy94otI3L3utT+cMe06g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Izs0kVUG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE6D606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AE6D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Izs0kVUG
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2db1b9bf2so1601245137.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:10:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795536619; cv=none;
        d=google.com; s=arc-20260327;
        b=cQilOVlfO2ZFdIbgmwa7JVKPdTorgNhTFsNjwWxisuLTPgpwfyTqUkyeIsk0Q1DGHH
         aNwQ6sMCQTbGFEVaT14J2nmjNGhRN4YChyD/jnRdtUeWS4Y6xlAeirR11ntjZVM0mqxY
         QEJekaKoVly5O6Lmg6glpnRH+yVELB8B+9QSiINlGl0hFFR3Y+Z7f+NMndkjjH0IOa8n
         UKn2Ep1zvXIGFkUACwOdgPJtNVopVyOyZJZkyVlsqVZeqI9NsOh/SNnS1m/SL6g/tMuu
         W8N9Wg+34Pni57NlOxlFEfgDqeLRiSlRDln8ugWiU3GVLZJt/VmFT9mMnloSwHwC0EhH
         cA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HJt4JMv5FVP1qu+wQIQwqnzbRKFhP11tEo/XVFuWAeE=;
        fh=s6OQHeYDzGt1TOOXQrAzrRJNLPAqB+xjKsGin9qVwag=;
        b=FBHyF7DdXVDJbWX0/KYBJRigU5uMfK5524l+qnF0Y8TpJZQDszsHVoxtjCy4jMt2LQ
         pzk0xFoHH/7xWRvZyyG6lFd5cJ9ZjuZivHYCdqq98RzOrjnh1PINWDiK3I/4fK7jINhr
         FfQcJk2WPiXYif9A8QhJoc9xk0qxI4MT2P2eqXgA+yDGJ6aPs6BKVVmgu0BZlQWa5Qjo
         WS26wka2/kIoHNSaIxY9ZjoKtQ+EfZoTbGk//HuUQwWu68reLE3HoLQYQiNaYOeX6xb6
         Ufy2GuArxHSu4Sw6hkR1b8tOwBvWWVlVFz891y7cbQ1SUPS5H47kIkyFCHeXkfdTrM1V
         klRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795536619; x=1796141419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HJt4JMv5FVP1qu+wQIQwqnzbRKFhP11tEo/XVFuWAeE=;
        b=Izs0kVUGNyHF84e4n2Ea0lhHR7xnboALjopfciBG2KPRUxuoXTimpltEqJU/1v+vYU
         oyN61+xrJo2cIWhKym/ntayfPLHTrcXoScUFdVLzDYIlHWSyZ6mT+jGozVv9TEJ/h+h3
         2fjwaW2bUrMhMVWJsJI6H0CH0rIGBdmbczKiamU4cWSF9CPm3nnk9iv2IvisiRS3zNnq
         ls0vo4TF8ytbfPe85D7Q5vuswBYIQ2OU/qudDl6IEMQxqh8Pk9hNNsQU459ErGsDLgmI
         nXrEgwltEXCbiFkDY92k68d52oGYjMUZy2YjuB+PqE/zwgS2PMlW3yE+Rej4vT2PpyNu
         eXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536619; x=1796141419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJt4JMv5FVP1qu+wQIQwqnzbRKFhP11tEo/XVFuWAeE=;
        b=Hv4k4EcGxxGnCMtv0pIDmET5IW078Fyf4ePTHRgTa/N8D47iLd11q+sSv1+aIEJgZV
         l2xK5LvB6uWfsPaA76UbQSBZQqwfgdvcn/wIQl54u1CIGoreZ9CmPpk6aA6x05gZGklN
         WTkkkhUi+2Zryvcmd/A37Nlfu5iJOJ9JQwAMTNGrjll5pOCM5Unke+64sO0nAx51c3Vq
         FBk99eQmbRBD+GyBQpTpJwcYTaJbVV9nW8uAuOzMVuieeBJtsgWWoc6viJyBLNzkIFaV
         9XYj3qBCa9Kyy5iUWxIZ4FvrrX01svZY0i8sxZInZPUHC6fssu9ynQGP4EtLPtZCPhIL
         nD8A==
X-Forwarded-Encrypted: i=1; AL+hErEj+VIDAiG4op7Ljcs/CMFchHDmf1PwgX+X5PfIvkLe0K7bb7IXJyekrJhQxJtFr/q0FV11Y5GT74JKq0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Nd9nBwUNhOeL3yHUgw158vVH0v7tO/6klhtYZcfLPBM2GkCsd
	Nt4N4Wd9vAXXd1KILvpbR/ZeI5hsdJfGyVfTINE05ha5Ur//MCsygYzauuY4bzjCoodlgu2jo4f
	S9MHOQjxb6A3MdCuBrtQJvSxQ91KRbrE=
X-Gm-Gg: AZFdTZcNRG9lhzOyKUG3v60Dawsan+ac4qZDyMJ7uLJZphG/b9AUDYmrRDFlNpL/crA
	qp1+pmXv1hkZ8ziqRftVHETnaHYU5+zMU0lufPrd3kQQn6zn8D1WWlro3IsW7rq3O3NRmKqlSC1
	s+BvgCh0EgsckJJDxs9rGep03nlV2fsyrVfuH9BnMfN2dFg04SaCRgmgWJzhm0HzNd/EjUd35Pg
	zK/yVoIJr6uvR7I8RzZJ+rMSUGjYrTsPWZ9C5YsYy0f3LWrgX8mQfxnzsJ/it3+Jx9D7mpEUars
	tsq2xbOT7RlZtRkYbjHP5Bk8SE97Vp4iqHQEECnpD0PtCXYTmnjHx7PRWwqON+CDk3PTPVw0b59
	jCLkbD8doXcwBJgo4/gnjNX2h2gGj8/2oEEPQ8zK8Vev5esndEwuO0QuDkNDBTU6mobBiPAh5vd
	UEMETgWGv5Ljj6CwCnidoLIL+npV91VKT2/QzF1pwQycaAbfrjpNP0Wx4fRuJxIFdCA3JZE45s6
	sWBvfQCdFAB+jujDghSwmzjgk76DzhkWo5AWY+c0rNruvNvXSA=
X-Received: by 2002:a05:6102:442a:b0:7d0:5688:f4f3 with SMTP id
 ada2fe7eead31-7d72b368b6amr6483489137.1.1795536619304; Tue, 24 Nov 2026
 08:10:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
 <20261122-submit-rawnand-operation-locking-v1-v2-1-030bc867f0c7@gmail.com> <87a4mys2ia.fsf@bootlin.com>
In-Reply-To: <87a4mys2ia.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 24 Nov 2026 09:10:06 -0700
X-Gm-Features: Aa3M54pmQwhIMEHjbM07Pzq4IWONoMnEjbuJLtRAcRbDWaiND34wvm_s5GYEEOU
Message-ID: <CADvTj4q79XR9ymtzBHr7TUc+TnuoB2R-sUa+BWOCS1u7UTEUkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: macronix: serialize OTP access with
 NAND operations
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Boris Brezillon <bbrezillon@kernel.org>, 
	Kyle Roeschley <kyle.roeschley@ni.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 7:55=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
>
> > OTP I/O can also run while the chip is suspended.
>
> Really? Where does that come from?

I was referring to chip->suspended in nand_base.c. nand_suspend() sets
that flag even when the chip has no suspend hook. Normal NAND I/O waits
for resume in nand_get_device(), but MTD calls the Macronix user-OTP
read and write callbacks directly, bypassing that check.

I haven't observed OTP I/O during system suspend. Userspace is normally
frozen before device suspend, and the Macronix driver doesn't install
its deep-power-down hook on the MX30LFxG18AC parts.

>
> [...]
>
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
> >   *
> >   * Release chip lock and wake up anyone waiting on the device.
> >   */
> > -static void nand_release_device(struct nand_chip *chip)
> > +void nand_release_device(struct nand_chip *chip)
>
> You export a core helper...
>
> >  {
> >       /* Release the controller and the chip */
> >       mutex_unlock(&chip->controller->lock);
> > @@ -336,7 +336,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, l=
off_t ofs)
> >   *
> >   * Lock the device and its controller for exclusive access
> >   */
> > -static void nand_get_device(struct nand_chip *chip)
> > +void nand_get_device(struct nand_chip *chip)
> >  {
> >       /* Wait until the device is resumed. */
> >       while (1) {
> > diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/ra=
w/nand_macronix.c
> > index 16847f28b19d..d7f5a9e7c240 100644
> > --- a/drivers/mtd/nand/raw/nand_macronix.c
> > +++ b/drivers/mtd/nand/raw/nand_macronix.c
> > @@ -380,6 +380,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_=
info *mtd,
> >       int ret, cleanup_ret;
> >
> >       nand =3D mtd_to_nand(mtd);
> > +     nand_get_device(nand);
>
> ...and you use it across the entire OTP operation...

The race doesn't require suspend: an ordinary page read on the same
chip can issue its command after the OTP callback has enabled OTP mode
and before it restores normal mode. Locking each command separately
would still leave that window open.

>
> >       nand_select_target(nand, 0);
> >
> >       ret =3D macronix_30lfxg18ac_otp_enable(nand);
> > @@ -426,6 +427,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_=
info *mtd,
> >                       write ? "write" : "read");
> >
> >       nand_deselect_target(nand);
> > +     nand_release_device(nand);
> >
> >       return ret ? ret : cleanup_ret;
> >  }
>
> ...and in the commit log you mention:
>
> > Make the existing NAND serialization helpers available within the raw
> > NAND core and hold them across the entire OTP transaction
>
> Why are you doing the serialization in one vendor driver then? Aren't
> all the vendors affected by the exact same issue? Why isn't taking the
> lock once for all in the core a better idea?

Macronix is the only in-tree raw NAND manufacturer that installs MTD
user-OTP read and write callbacks. Both use the same helper, so taking
the locks there covers both paths without changing the interface.

A core wrapper could take the chip and controller locks around a
manufacturer's OTP callback, much as nand_lock() does for
chip->ops.lock_area. That would give future implementations the same
locking, but it would mean adding raw NAND OTP hooks where MTD currently
calls the one implementation directly. Is that the approach you had in
mind?

>
> Miqu=C3=A8l
