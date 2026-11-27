Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795761907;
	b=X4FLlpS3ja1ce5xNQoVncC8Pv6khQh3JfAvBe+WP9n8EAeG6Y9uXwK9nd2eaR+lJ+Czc
	 r5oWiXi7Yh/fsKsVDbCL/N1QjBLxZpPkIAbxQZvqrHtFZkUKzp8w2XJVQYT2n08fzqYch
	 0/3XrlDcrIwhu8DzdLjVH6O5r3RcUelG77gQM8V/d0sXFEBEr3OJ1Ts9rs3GL98DlKwaE
	 NEYe0Fm6Euxa55JvovIm7gj9LXirLC2olzOJZ4756adHSUel52z7nSM7ySO0laG1S7Rwi
	 9RKK+4SBSYtFpKitrmVnDmaAf2sJ45YIj5e/NFPprkYPQ9rFY2zix+m96K86L3UHryA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FFsUJVFUbAWpAb0j7OUqMiqz522ZwaBawqznw4GbXZE=;
	b=iXmOHger7IkCj7cW2Ui5nCon6jlDQ3kezIFF/C6WWxKchIHn7lFlCf38VRD0HwLUwM9O
	 uaKFbF5idn4Ft1ppodNDsgwPvkHQMU7UqbCnQiHjl1Wiuit0PTLerAVydetKpzv6Hmyqf
	 eLnX1Z1Z2zbGdeiEgw2V3OS0A9fKtCvVv0erpkxyWAqwaLfqrlDg7hdAIqF9KDGOJ9Ws4
	 2/G/AZ7pINTSGA0cMze2ZWfv4jmwWVZoM+FEeHsD/0T2IyY8PsVieVCE3t/u5ZywS+dzX
	 9pncY1RUXAM3Nv1YD8jPueJ//QuC0hsfcJ3Ps111FMKEC1z6ZRhX5sY0cn2k+hy1a7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTU7IoNj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2159606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2159606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTU7IoNj
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-92134c4592dso67962286d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:45:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795761905; cv=none;
        d=google.com; s=arc-20260327;
        b=rVTlrehmaditSP/SBd0Y4Ft/EzeZWvlqnXYp+Uw1A11+u1PZdKZZGI7C47ja3IFAr0
         yP2ho5IEzauMi75FeENw2awQcysLqqt9t2T4TcAU89i2XTKZsZnz/QvrzWg6luFSKtF4
         BEkjgLICe0yhSiCwbfe3Rh1VwMsKbeyoiBQmIvxGbJY8roTvR1BEl+pNblqQOw60eFXY
         y0ucoLEPe7WHjjzqYK1VhIm/XiuiF+1TUvVyyKvUb2ZWdXSir04j75NZViHvDkfKPjre
         JhfqoBpNgooMVOwk0yfvjY0uZMymlF5w5rVMhw5CwepJ3/FjdvuJn4+V/UcSG0Z+RQUM
         VPbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FFsUJVFUbAWpAb0j7OUqMiqz522ZwaBawqznw4GbXZE=;
        fh=g6kpEfb1Bx6YL3+cCgqUXCrhurJS5TFC9bDZGOJ1UOE=;
        b=Lrsy1xCWLsr53dmOcB2u33bLgHzVT6+Wts2tafokwbs6jjw9uUNhbiuvoooHhbYFb2
         V73ES9OvXD+dt5W4W26z/m/CFGQGbpQhCs1ZnJ4I/JTzDlMEcDZHmqZvJ2lumRslIUAp
         fL83ZrzbmOrvjxcPHUDukcXPUoZQ2ktBmfwQLAV9/8/tZF5fu3gsqQEUZFKIKSLYDNEn
         8BMH/ChbkrRYnzQUfHEoRFJlsnmd/82hrjhxfOaSQEDIIk0tjAF6fg1lRxWvhsp9xZGU
         /ACEOd32TQXDJ2IfXOvYHnGWremcOcpWtQJh3E2MZGnwvngmVtDTqCKxr5MdKfEXCQut
         aGlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761905; x=1796366705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FFsUJVFUbAWpAb0j7OUqMiqz522ZwaBawqznw4GbXZE=;
        b=DTU7IoNjbN2lP3w7wmxOEzoURv7Z94ODaqqb9uEmdRxlyLgbIY4hszcPqFkbS9rAMe
         20gcSFdMMtkquwh1KL5sfGJh+w49Jvl90rzyxBMxNW1M00B2ivonQczTAVvuQZPpUpGk
         DQwn3aT8VgFICr7Kf5NO0ABV6k77zm5stHflSYJLynyHNQA1CiIKOF4gC9AMRDABtlB9
         sWmrKjz6aZYBhrMzt/VWE1rI1zDqXWdsIhQe6vevKntr8xVMqck6AMuXlAswB38txvXJ
         qYZot8LbRfh2x9YnA+7dNE6RYz7wakKjapU23iBXXBQH7935oG1Wm9KndyBRvSY5Ctzr
         V7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761905; x=1796366705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFsUJVFUbAWpAb0j7OUqMiqz522ZwaBawqznw4GbXZE=;
        b=2J8N7HYDDStn8BcUlWC+KohJ27yTLihN1p0RwW8EBUwiN2Pqk+i0hufe3RHAIX5uHy
         fGtu9Cdjcz9g99cgEExsAxUeOgLuq6CppKlCbezae3PVJxA9iE2VQo8ds0O6P8gbKMlN
         UK+kgJNwF2j2AXiqreCP75eL+E6OGjEEKpBHm7wt+qH/TQRgrhmCiiWaBzj5RmnNWdO0
         RFRHh6ulnpPNGVsb+NV/dvQ59v9PPNIFHg8BNQev6PNDRCk+re63/vsSnKmBER2pap+Q
         Cu72xzOuOHpjMaXPf2LnRmvfseSRvBkBaWKI+DwvoYr0CHY0fAgKt+QRDx+dR4iPrFQm
         N34g==
X-Forwarded-Encrypted: i=1; AL+hErHE1b1Oxr6NB+wVHrWiRhZ6tG/ZmlPPdZc1ZVxF1ZPUECeHx/QEIdJ9TqOZVFnzyfyCRDEX+dU4vv0mRjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z93I2IJ4DxPiMPZA0ux8wwv5Pm+AoOQT/sCJBAMWTWj7AIIoZCZ
	HRmrR4wmnvQbk9aTHXEIPbjqN8wfzGWvpTxg6HrRML2cqBEKmoAsurSaHQ1qlBCS6n9l4DVroR4
	LVXz4LRRT3tp2wwudR9lI18QAOKHooPs5ZX/y
X-Gm-Gg: AZFdTZdwnvSy2q85AmFZLD/OsY0ZqiZbeLmhQMMZ3S4TFeuFvbJL8gI1Aah/UfN4CRw
	mMsZMs6ZOFJmTssXqDp/Z7am3b1GdsFbJpDzErvlXnh+DaBETMCfAp9YjDW1U2KRLtlfj9bQd2q
	pShR5qysxSEEsLWNcUPhA0uOuRfLkeU6p4alfaL44C05g8XB8pi5/SJ6Oxyw8ScLJd0MzN24SAC
	b+b7nIEZ6c8QTdWkQXq7NC8r1P/SLdMJB4rvsKWS7zvgRCzDmW646G07SdxEtOisj/Hmzpod2ii
	bhttmQnSg5ct6zGTdIC/PZInet1vokMCMN/wXfcbMTcSu/8bSzt2MA6zZS/wzKHq/ID1MJ0RepT
	MPI0KzK0EzpBORRwb6Yfaa1aXtiWmym/gW1pXNw==
X-Received: by 2002:a05:6214:4301:b0:921:7897:493f with SMTP id
 6a1803df08f44-92178974c30mr138520786d6.20.1795761905265; Thu, 26 Nov 2026
 22:45:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-14-a0282524688@gmail.com> <20261126195807.GM38590@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261126195807.GM38590@joneslee-macbookpro.roam.internal>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 27 Nov 2026 14:44:54 +0800
X-Gm-Features: Aa3M54rbQdVPmfUViaexDIoLl4Z3254v8UG0DklTTqBCSLcNT7OWxr5vcfysYN4
Message-ID: <CAOoeyxUKeXh0Npa67X-R39S2oFiBL3uKW7+4DXEAf7SsQVLU6A@mail.gmail.com>
Subject: Re: [PATCH v10 13/13] mfd: nct6694: Add Host Interface (HIF) eSPI
 transport driver
To: Lee Jones <lee@kernel.org>
Cc: Ming Yu <tmyu0@nuvoton.com>, linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

Thank you for reviewing.

Lee Jones <lee@kernel.org> =E6=96=BC 2026=E5=B9=B411=E6=9C=8827=E6=97=A5=E9=
=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=883:58=E5=AF=AB=E9=81=93=EF=BC=9A
>
...
> > +#include <linux/acpi.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/irq.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/nct6694.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/unaligned.h>
> > +
> > +#define DRVNAME "nct6694-hif"
>
> Don't define strings like this.  Use them in-place.
>

Will fix in v11.

> > +#define NCT6694_POLL_INTERVAL_US     10
> > +#define NCT6694_POLL_TIMEOUT_US              10000
> > +
> > +/*
> > + * Super-I/O registers
> > + */
>
> ... and this is a multi-line comment, because?
>

Will fix in v11.

> > +#define SIO_REG_LDSEL                0x07    /* Logical device select =
*/
> > +#define SIO_REG_DEVID                0x20    /* Device ID (2 bytes) */
> > +#define SIO_REG_LD_SHM               0x0F    /* Logical device shared =
memory control */
...
> > +static const char * const nct6694_chip_names[] =3D {
> > +     [NCT6694B] =3D "NCT6694B",
> > +     [NCT6694D] =3D "NCT6694D",
> > +};
>
> Remove this.
>

Will fix in v11.

> > +/*
> > + * Super-I/O functions.
> > + */
>
> Isn't this obvious by the nomenclature?
>

Will fix in v11.

> > +static inline int superio_enter(struct nct6694_sio_data *sio_data)
> > +{
> > +     int ioreg =3D sio_data->sioreg;
> > +
> > +     /*
> > +      * Try to reserve <ioreg> and <ioreg + 1> for exclusive access.
> > +      */
> > +     if (!request_muxed_region(ioreg, 2, DRVNAME))
> > +             return -EBUSY;
> > +
> > +     outb(SIO_REG_UNLOCK_KEY, ioreg);
> > +     outb(SIO_REG_UNLOCK_KEY, ioreg);
>
> How does this work then?  Is this self-incrementing?
>

No, both writes go to the index port. The chip only enters
configuration mode after 0x87 is written twice, the same as in
nct6775-platform.c.

> > +
> > +     return 0;
> > +}
> > +
> > +static inline void superio_exit(struct nct6694_sio_data *sio_data)
> > +{
> > +     int ioreg =3D sio_data->sioreg;
> > +
> > +     outb(SIO_REG_LOCK_KEY, ioreg);
>
> Remind me, why aren't we using regmap?
>

The Super-I/O ports are shared with other drivers, so each access has
to be wrapped in request_muxed_region() and the enter/exit sequence.
That's why I followed the existing Super-I/O drivers, e.g.
nct6775-platform.c, nct6683.c, w83627ehf.c, it87.c, gpio-f7188x.c and
w83627hf_wdt.c.

If you'd still prefer regmap here, I'm happy to rework it.

> > +     release_region(ioreg, 2);
> > +}
> > +
...
> > +     sio_data =3D devm_kzalloc_obj(dev, *sio_data);
> > +     if (!sio_data)
> > +             return -ENOMEM;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(sio_addrs); i++) {
>
> for (int i =3D 0; ...
>

Will fix in v11.

> > +             if (!nct6694_sio_find(sio_data, sio_addrs[i]))
> > +                     break;
> > +     }
> > +     if (i =3D=3D ARRAY_SIZE(sio_addrs))
> > +             return -ENODEV;
> > +
> > +     dev_dbg(dev, "Found %s at %#x\n", nct6694_chip_names[sio_data->ch=
ip], sio_data->sioreg);
>
> Remove debug prints from production code.
>

Will fix in v11.

> > +     hif_data =3D devm_kzalloc_obj(dev, *hif_data);
> > +     if (!hif_data)
> > +             return -ENOMEM;
> > +
...

Thanks,
Ming
