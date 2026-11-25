Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646237;
	b=T7Jsehandg+tmyaibJ42Ixqw/SFYJ3UeA+FaELpzWRgwEEJD2tSTrtYQe6dYlHUeMXwQ
	 x1uhBn9m7fRW9KM5MvdHsvJ9GDnnxjF0opZTSbd/RsYqr0UEj5ksn9bv2rp4tMr9vKAZI
	 IHmbFY7BeOjnHWpxw1lx8W/vk3Gyqdb/wpSNmy0A41+0o1Gn5BCt9JmL9AT6GFuz1spkq
	 KCqtCRii7kFlxTSSmar0AqFKwK+OcCML7Z6MbQDiLi4eIGJAsR9yYOL0g/l9P1c/x65KD
	 RcKz+1/A2kf7VwtIL+JpwQZYXfGRGvOH5wtT/ehNlqUEvknX9tu5nSUgsIytbRC3Z5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NETc7SGDIwIqrmInvNti52VmQ4lFCDnjsHSIoXfrCQI=;
	b=hWmYCNfAf6lQXT5qdGWf36C7juZOLifPQApY2fRBy7zv6wTNZ5ToNmllkswAN66RX+q1
	 C8ikdUZwVSPOZ+sKzfBuLuQ2xPQU4qelZd80YzdyPdWnspZ1LDxcQ77SheOQLuwc1pUkS
	 gOuZANExz5+dBVDiD7nwo5e74DTt5DCSdSQjISiyC54NhrcPBnYF6Z1ZNk94e9g+NhWvR
	 rZglTbNTwFQkP2T7/UxY6rKd8O2MfSF0uX6aS9Y4W+b2cCeB7kNnjZFskB1KIfv/VUpYQ
	 7h6AfuEP5M1nL4f6v1iHomd6G9etgme+/uG/cBsq1ojGaiXgYYSnn+9UrGrWfiLMgWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MlGyQ88F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A64606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A64606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MlGyQ88F
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9215934a14cso39201586d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795646236; cv=none;
        d=google.com; s=arc-20260327;
        b=axXIS9g8MJ5/wThDe3aIEXMYpP4WNaLaVFr2lfDcjmHEFeVwlIGAbq2QZ+aY3QqeTs
         SklxXWx/MjIQZ/VVnbPaW4hgE9MHm6SDStQjfCQxkGj+VvM/rsuR81QpztIwnCxulNJg
         lUG5GXmNGwd8j56dnaZNPOo7UrY8ClibUwBdyFXS4RsJ4xhlBs39Sq/QKrLbyKwIfoBW
         v25fU4AZ4nwchUTEauyI1AyE2TxDg15aulJTPipQDYOnRJ7KrxAjX6E4mZLjvMrk05uE
         wXg00KJYp0uVlt/g6wRdS+Iwg/HocLfuTmhdsTd/IgRn8V4cGEEWGkB98MW2ryALP4jT
         qybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NETc7SGDIwIqrmInvNti52VmQ4lFCDnjsHSIoXfrCQI=;
        fh=Zs8db70fm0gcvI8CxKV3G8D1B+NcgIzr2/+i7hSyC1k=;
        b=Zz/B5KCLn9xujvD5gJbz++jE/31ZNW7r2DsAET1zR58ewMTTIFscp0ZbY0dSdsl1kT
         BMXMJu2M8rNtRwMiIw7HjOVsXUC+2bDPYfeg/2+LV4xi31UAds0764jrXI8NmFeJr3mc
         eLH3UmcqabpWFoQDBRQX0DoD31OiFmpxW8RwgoESq4AGeJaLqAxtgDFI0OS8qCJvu89A
         8Wsi+uIc2Bgwl8yeB1PPNIBo1DEoTkX4nKs9DM/6UpskuMY5E7EfW4av93ruIJkaPTCC
         GKkTjmeZ2oi+wqU7kE029di2jtxBqqAXLfedjivN9zHENIXVK1BywM6kX+/B43X665IG
         5TPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795646236; x=1796251036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NETc7SGDIwIqrmInvNti52VmQ4lFCDnjsHSIoXfrCQI=;
        b=MlGyQ88F+0CS+gbdDqfKGgX8VMkKlSxUi5Vdr49LUTInUC9hc10k0IfUWvoPpZgMva
         qtvUoe4c3QM/pM0L0Ca2qUWcF8z6/BmYvYNmdUdzfePFCXHiX13jzRvstyjwI/FB8KBh
         75RsqjhixioWhl92M8RVDUSsaz9HW4OviHhcm7830TsMJzedNFRouuQqiBSqjIu8+zbD
         QcVBbEfP3r5uRPQFyAd5wmi0HvDfdFTC5s+95pUmR9G1rUQwNEf6124jNEO4dA6bxT/A
         79FtGf8mSffEAvDBdW6bXO3adHGjN7hDmz7gnQTV1vxusEYrWAmhk4N2eX5yQsHAHWZI
         yDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795646236; x=1796251036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NETc7SGDIwIqrmInvNti52VmQ4lFCDnjsHSIoXfrCQI=;
        b=Gi1hot1FKIzmmBkSkoInUxo7btgymmFPg2c7AmNszbeX/o3bDlq/+3k8ohZ1h9Gdfy
         A0pZG5Op9AU41FZT3dzDF+d8jF8Na+m7wgDnDZT+y7g/jJJCa14JFF8akb8Ag+iIOKHv
         92ViZQ///DfTU1q3Cj/hstIhfPpg+DMJBm/LmdL5ZsBSOt3oebawJEPtCqm6zRLfdGHr
         R1+wap9LaqDNeSuWfDfbmA9QCposT0NVentJwrthM8dEny7iko2Glj62KkuN57Wqqg/G
         bleFyrFKVKk+dcfPYbq2N/g3HUieSBBvJPhYIagPk40Je+NeZg7g3gSY4C26s3IwZgIy
         16rw==
X-Forwarded-Encrypted: i=1; AL+hErGnRPiwodD0HBkTVUNrsiVaOuvoK+oyH7qjYS3+1Fyyo6l7IkMfJomKXI6is/QAGucO+xEkDEDWduUMya0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C4QZf3kWLvZFHALd2NaPoAfDt/6icxrBn0p+tezppLaiKR8qc
	p+dc+R9v4tRHEOuVlMc2RZrU22wh9Msc5NFiOEnTxfGPAL52u7ujeeWSEtJcjkjdWIPvq9LwGPK
	XFcKAJjVISJ+s8Az/FDG2CjBW55qG7ys=
X-Gm-Gg: AZFdTZdXlnS6JM15MKhGno45EsPtbmkPeJ7349uD4qjWAD+llCRT7EX5UZaYh6P1D4W
	7MOmXJRBvxuUWDduQX9mINi33bdnR54JUasWRu9607kCg/n5qxmSjbkQhR1rzEhBAn6hHNmQin9
	5DGYmgohS0nGSpAzXWUQqls303Dl2EpX1ulF/f0HqEpa0qBnHb6K1UQMXurJPEXMKlavlDZWfYr
	zTegTHzgxZqkqt1J8EACKKJRrANi+naMOCA2i9izLmUW8Y27WOv9CKrnhsiV2bgSh65wRV+aOiJ
	Yv452J2/R1WtW6kTfqQHLeZWBZ5u2UY5xajtMjs1AfUxRrekgvsAQtZOS1d7ssy9FZzmchL9mYg
	Vmhezs4n9XtGZPz1aWjYoDqZmwnAGStofJnu0U/Nxy30yMNxO/+wZw64jKQ==
X-Received: by 2002:a05:6214:5295:b0:921:1365:5c0b with SMTP id
 6a1803df08f44-92134a76bd0mr341425156d6.30.1795646236224; Wed, 25 Nov 2026
 14:37:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <AS8P251MB00012F559DCFF177B19F767BC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
 <7oq0p682-ps92-9986-2rq9-q8n7n7154752@xreary.bet>
In-Reply-To: <7oq0p682-ps92-9986-2rq9-q8n7n7154752@xreary.bet>
From: Jason Gerecke <killertofu@gmail.com>
Date: Wed, 25 Nov 2026 14:37:05 -0800
X-Gm-Features: Aa3M54rJ9MwmaCXdPotwBN2qugkZVUKhLi83dpEuPzNGuEqAfSo2SmcJHzmY0cs
Message-ID: <CANRwn3Rptpbh_74GaDQ9D54uAFpqUv1VVD17GQBEE+8CAtxQFg@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: validate GRAPHIRE_BT report length
To: Jiri Kosina <jikos@kernel.org>
Cc: Aamir Ahmed <elb12345@hotmail.co.uk>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Benjamin Tissoires <bentiss@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:47=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wro=
te:
>
> On Sat, 5 Sep 2026, Aamir Ahmed wrote:
>
> > wacom_graphire_irq() parses GRAPHIRE_BT reports by dereferencing
> > wacom->data at fixed offsets up to data[7], guarded only by the
> > data[0] =3D=3D WACOM_REPORT_PENABLED_BT report-id check. It never consu=
lts
> > the report length, and wacom_wac_irq() does not pass len down for this
> > device type.
> >
> > A malformed, malfunctioning or spoofed Bluetooth Graphire (VID 0x056a,
> > PID 0x81) can send a report shorter than 8 bytes that still passes the
> > report-id check. The handler then reads past the received report and
> > forwards the bytes to userspace as ABS_X/ABS_Y/ABS_PRESSURE/ABS_MISC/
> > ABS_DISTANCE and battery state.
> >
> > On the Bluetooth transports the backing buffer is large and fixed (hidp
> > copies into input_buf[HID_MAX_BUFFER_SIZE]; uhid uses UHID_DATA_MAX), s=
o
> > this reads stale in-buffer bytes rather than overrunning the allocation=
.
> > It is the same missing-length-check class already fixed in the sibling
> > handlers wacom_intuos_bt_irq() (commit 2f1763f62909 ("HID: wacom: fix
> > out-of-bounds read in wacom_intuos_bt_irq")) and
> > wacom_intuos_pro2_bt_irq() (commit a8e04f3f894c ("HID: wacom: validate
> > report length in wacom_intuos_pro2_bt_irq")); the GRAPHIRE_BT handler w=
as
> > not covered by those changes. The issue was found by LLM-assisted varia=
nt
> > analysis of those two fixes.
> >
> > Pass the wire length to wacom_graphire_irq() and reject GRAPHIRE_BT
> > reports shorter than the furthest offset the parser dereferences.
> >
> > Fixes: 387142bb8fcb ("Input: wacom - handle Graphire BT tablets in waco=
m.ko")
> > Assisted-by: LLM:opus-4.8
> > Signed-off-by: Aamir Ahmed <elb12345@hotmail.co.uk>
>
> Ping, Jason, could you please Ack this one? Thanks.
>

Thanks for catching this, Jiri. I'll ack this to get it out of your
hair since it seems to do the job :)

Aamir -- I would really appreciate a second patch that addresses the
*other* cases handled by this function. It looks like everything but
WACOM_MO should have len =3D=3D WACOM_PKGLEN_PENABLED, while WACOM_MO
itself is supposed to have len =3D=3D WACOM_PKGLEN_BBFUN.

Acked-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

> > ---
> >
> > Notes (not part of the changelog):
> > - Compile-tested on x86_64 with CONFIG_HID_WACOM=3Dm; builds with no ne=
w
> >   warnings. No runtime reproducer: per the changelog, on the hidp/uhid
> >   transports this is a stale-buffer read, so KASAN is not expected to f=
ire.
> > - Found by LLM-assisted variant analysis of the two sibling fixes cited
> >   above (see the Assisted-by tag).
> >  drivers/hid/wacom_wac.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> > index 8feb8027be95..31da8b956607 100644
> > --- a/drivers/hid/wacom_wac.c
> > +++ b/drivers/hid/wacom_wac.c
> > @@ -338,7 +338,7 @@ static int wacom_dtus_irq(struct wacom_wac *wacom)
> >       }
> >  }
> >
> > -static int wacom_graphire_irq(struct wacom_wac *wacom)
> > +static int wacom_graphire_irq(struct wacom_wac *wacom, size_t len)
> >  {
> >       struct wacom_features *features =3D &wacom->features;
> >       unsigned char *data =3D wacom->data;
> > @@ -350,6 +350,12 @@ static int wacom_graphire_irq(struct wacom_wac *wa=
com)
> >       int retval =3D 0;
> >
> >       if (features->type =3D=3D GRAPHIRE_BT) {
> > +             if (len < WACOM_PKGLEN_PENABLED) {
> > +                     dev_warn(input->dev.parent,
> > +                              "Graphire BT report too short: %zu bytes=
\n",
> > +                              len);
> > +                     goto exit;
> > +             }
> >               if (data[0] !=3D WACOM_REPORT_PENABLED_BT) {
> >                       dev_dbg(input->dev.parent,
> >                               "%s: received unknown report #%d\n", __fu=
nc__,
> > @@ -3475,7 +3481,7 @@ void wacom_wac_irq(struct wacom_wac *wacom_wac, s=
ize_t len)
> >       case GRAPHIRE:
> >       case GRAPHIRE_BT:
> >       case WACOM_MO:
> > -             sync =3D wacom_graphire_irq(wacom_wac);
> > +             sync =3D wacom_graphire_irq(wacom_wac, len);
> >               break;
> >
> >       case PTU:
> > --
> > 2.53.0.windows.1
> >
>
> --
> Jiri Kosina
> SUSE Labs
>
>
