Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195767;
	b=m/yu5QbHUWxvBL0wu4KdqCZemXOF7rr5y4bO0kO9UsI+vHkZbicMpZTVV36Ny9Uq2vte
	 OmbR+beX8Tp+BmyLa56sOe8GmVcSXoXPoXfSzAnA5L5xA8nS5gc0UveqbEeo++aqPULsl
	 3PFxf185u4/WyslXFE48x/wK2MnGhbJruSxNYkbdY6Jb0OvKVEhuAe2roBogyZ7xSldKC
	 hXg8xyQJj/dF12i+zbSEj/rWkf1GnCziADX4wuVZA45juVC7pioeUVDL44O/RsNVV/lYS
	 0AHrjIT1K5tlWdgh44mPat1JKRV9qgNe37rMXDLnAqvbqzP5n58EdCG4qWpEtQwP6Rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
	b=1heXQhlGtVc9+07iQc9uX2UJWujYyAhSYc674xFaHdNpkQ5vvLjs5pKxPQ0R6HJhfNh8
	 Kdez4d6kl4WM3K0Rf0HIsBh+JoE3eSEMH37VpLbg3uSwxh6Y2m59nTSmVxWwQIcD6uhel
	 JffBohzEQ2IOBVZOUQsWJtwrOAoXlKlMdOsaawnX4GgXjzWvLm1kj6CepYZzXEfn4acKW
	 GYp1PgeUuvqAgiF/Y8MuPLl2VOiIXt7mCctgZlQD7092DD/GxYcqbYy1kxTcQigg+9Dv/
	 KSvIKPjXNfESEW3cHGONy0rrzODei6o5CHKL3EtulDbTMEj0dWt5cGTP0O70DZ086YQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l3GVRdg1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE9C606A339
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE9C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l3GVRdg1
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533202fe429so372021cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:29:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195764; cv=none;
        d=google.com; s=arc-20260327;
        b=BNxT0xFljC12XOCV8R74nT4roRJr7XWAcGyvsxzBgt9fx30cw542+faWStdO7VGv4x
         5oH+f+prro5TmVjm7kKNKcQrpUj5gmObrvkns97FX4hFBLhPPzds7dOX9EQXHmLvUmQh
         fw9KsYKtnKFTLE+i3C+n12SkbQrzOnNdp4Q4ZNzx6LgKMyB8UyWgs4OQOTsxV7LkK11n
         D+7LHd9z7/4eUyZ8oyGySq8cTwhcchqW9RHyyh0mHCQNHMx1cQi5NmeP0/7QrDonT+Ua
         tY4l/48iLgk6C6s5GG+OQ0w5DQ1FjjSgFe8mA9rBCx/p/P4eFkgbMxgsDv/iW2VoxwGB
         6IzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
        fh=sCCTCA9pfZssHTsJ0S6nITCClf1KDavsZNglJKFZ9Mo=;
        b=r08aT+ouDCLP0+sQepBMD72WRg/nktAY7+k3X3dCMALpiVKvs7QuVtE/MTZchTQI13
         F3U05hJZ8tkJx+cXe2E5MfzQtX8ep1FliiEOhIeXgcqiB2X2IiacGmlAX2uabQ7ZdhrX
         9CObcHj76ZCkwnE0B65KQWzVwWFAJLlHxfbsqF1rriQA6Wu/joPU2ocBSG6lLbKdsU4D
         MIkbmJZFsI3HEgtPMvRso5SxArq0IYf3NhIGRxo3ThwtBlDEWDCe1YKpqYeiGcCpprde
         PEY+GOly4pNxTowRL4b0apkqUc1o+4fbwwseBX85xM6emW27jdSngJEJOK1iugof3hkm
         LulA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795195764; x=1795800564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
        b=l3GVRdg16VPWScqmn5BZxtA7/L9oF1UcOodEIO2q1vp3rCSTc9dU02fuwKYSR/rige
         DnYKmcxXgxVWLKX+001F0giqPxrt5e5dCabvgUobgNQmOSyr9QGV3Ct6uQO4lu65aa6z
         W4P+jzNvyOI2jPBcQlJPRUxRp6No/dhs7hAVMNBmJJ6Wsuu9jnWrKoBS9FwsPoIOlIHW
         b9LZcYpzyNJm0zaAS3lY4tHQ9FHHtKn/unaGKbT47l267GkfhDrrVN4xJfj4fA9+49sP
         EkEKZJ5K0IJaQyVu8V1KKnkNaScUr4PKmNW6brE1mg3tM/SG6aPBfaVsFZTrXPcKQsU7
         /8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195764; x=1795800564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
        b=RVsGX6j2bupiUh5S1ydI37tDazg4Q8EWrbcs30QEiwnwraKEq8M/NZC4VLGQ7m1c3+
         Q+2RVjOqGBU0/gLYGlpIF4ppzQSDdV+5THDX3a3xx9KkoHOtU9r6XHyRFLBxUdEXZ45/
         NpJcq0OQA173fDLRDcUx6CBcajUkZprqLQR7huSadfKF9tWRwbgg8iSiSGaYy6f60kPC
         qn5ehiNbsWVEi081GFJFiFsW7zalLsn/IxUd2YEYG24eIIATHSGyGMEirHzoj8LsOGIU
         gJNqbnunK+0SSFesqJQWB0WvONtHMnVjCjafuWwwMX/Wu4dRT3vThMb3DTYMjraYFsaN
         NKoA==
X-Forwarded-Encrypted: i=1; AL+hErETsQpRn5ObZ6CZshsjZZ83/BpUGnRgv4o5NwoSU7GAGoh8LpMrOZTfBOmgHK9AqnbHhufp1qiXGCev9Cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G3iLFRCqNYm3L7nNfuzGAvBBgRWFeJEG6Nos6XDZw79t305Ak
	se8xg0lneE54mH1Qu7PL4m1eOhdKBHrOA/JwrW/gpYodOeKOifmGFH/gCn1SZEia6nb/b4MJwyQ
	FvNIt4GoaqrpR6zD8gQ7AmBSkwRaCH9S2FCUpdZWv
X-Gm-Gg: AYBFou3qBNv7xfal+SKzJfqNXjgWf2i6R3PivY4vKQw5rpYpPYQ7RYauNOSnD8k4mDJ
	oC7njMt2tK+U8hdT4n294zbCIFtTptamQlqT9DDe60swkPzMajBuNPXdja+wf3SAdhviyl3tha1
	TSFM0IKK7zQ4ve1wZG6JwZXzwNxkI4J5CLrdQ1Ujc5/qCVmqN4YE8D1wdYVcg/90jjGtujHomnV
	zETit6EhKkAk/OBL4cgDxD5TB3pgtTH751/bUYR3jnWz0kU59phWLgwdfl9Tnt8aU757rQyrZHW
	dxquYlOsTB3GK2LPyqIllHCgUGcJcWU9ajPV/bSmjSZ3OR21g27ihfQE3ixtqGDL8CIW9e3w6YQ
	czBCi6KMHg11S55ShcvfSdT9PjJDFAjBNN6A8
X-Received: by 2002:a05:622a:2b07:b0:536:6ea4:e6a0 with SMTP id
 d75a77b69052e-55d7a35af5emr20936351cf.11.1795195763344; Fri, 20 Nov 2026
 09:29:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119170853.1529676-1-irogers@google.com> <awBiQ0S1hYnm-ngo@black.igk.intel.com>
In-Reply-To: <awBiQ0S1hYnm-ngo@black.igk.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:29:11 -0800
X-Gm-Features: Aa3M54qjIXZFwfoIO-dZiEsJTXyVaZW2PPM6ShZu-HH-RmWEeaNIOyio_jR0G5c
Message-ID: <CAP-5=fVhPeWOCmQRB3ZAkv9jS4cOgsHr_yekiLon9ZhF6Mmsdw@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: Avoid reading uninitialized
 state on error paths
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:08=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Thu, Nov 19, 2026 at 09:08:53AM -0800, Ian Rogers wrote:
> > In qcom_pmic_typec_port_set_cc(), error paths from regmap_read() and th=
e
> > default switch branch jump to 'done:', which logs 'currsrc', 'mode', an=
d
> > 'misc' via dev_dbg() and passes uninitialized 'currsrc' into
> > rp_sel_to_name(), indexing rp_sel_name[] out-of-bounds when dynamic deb=
ug
> > is enabled. Similarly, early error paths in qcom_pmic_typec_port_get_cc=
()
> > jump to 'done:' before 'misc', 'attached', '*cc1', and '*cc2' are
> > initialized.
> >
> > Return early on error paths in both functions instead of jumping to the
> > post-success dev_dbg() trace.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wconditional-uninitialized enabled; fix and changelog drafted with an =
AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wconditional-uninitialized; not tested on Qualcomm PMIC Type-C hardwar=
e.
> >
> > Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver=
")
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> No stable here either?

Agreed, 'Cc: stable@vger.kernel.org' makes sense here too (especially
for the rp_sel_name[] out-of-bounds read under dynamic debug). I'm
happy to send a v2 adding Cc: stable@vger.kernel.org, unless you
prefer to add it when applying.

Thanks,
Ian

> Thanks,
>
> > ---
> >  .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 25 +++++++++----------
> >  1 file changed, 12 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drive=
rs/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > index b2ad31e85b5e..a1595b8b53e7 100644
> > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > @@ -372,14 +372,12 @@ static int qcom_pmic_typec_port_get_cc(struct tcp=
c_dev *tcpc,
> >       ret =3D regmap_read(pmic_typec_port->regmap,
> >                         pmic_typec_port->base + TYPEC_MISC_STATUS_REG, =
&misc);
> >       if (ret)
> > -             goto done;
> > +             return ret;
> >
> >       attached =3D !!(misc & CC_ATTACHED);
> >
> > -     if (pmic_typec_port->debouncing_cc) {
> > -             ret =3D -EBUSY;
> > -             goto done;
> > -     }
> > +     if (pmic_typec_port->debouncing_cc)
> > +             return -EBUSY;
> >
> >       *cc1 =3D TYPEC_CC_OPEN;
> >       *cc2 =3D TYPEC_CC_OPEN;
> > @@ -392,7 +390,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_=
dev *tcpc,
> >                                 pmic_typec_port->base + TYPEC_SRC_STATU=
S_REG,
> >                                 &val);
> >               if (ret)
> > -                     goto done;
> > +                     return ret;
> >               switch (val & DETECTED_SRC_TYPE_MASK) {
> >               case AUDIO_ACCESS_RA_RA:
> >                       val =3D TYPEC_CC_RA;
> > @@ -417,7 +415,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_=
dev *tcpc,
> >                                 pmic_typec_port->base + TYPEC_SNK_STATU=
S_REG,
> >                                 &val);
> >               if (ret)
> > -                     goto done;
> > +                     return ret;
> >               switch (val & DETECTED_SNK_TYPE_MASK) {
> >               case SNK_RP_STD:
> >                       val =3D TYPEC_CC_RP_DEF;
> > @@ -472,7 +470,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_=
dev *tcpc,
> >                         pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
> >                         &misc);
> >       if (ret)
> > -             goto done;
> > +             goto err_unlock;
> >
> >       mode =3D EN_SRC_ONLY;
> >
> > @@ -496,7 +494,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_=
dev *tcpc,
> >       default:
> >               dev_warn(dev, "unexpected set_cc %d\n", cc);
> >               ret =3D -EINVAL;
> > -             goto done;
> > +             goto err_unlock;
> >       }
> >
> >       if (mode =3D=3D EN_SRC_ONLY) {
> > @@ -504,14 +502,11 @@ static int qcom_pmic_typec_port_set_cc(struct tcp=
c_dev *tcpc,
> >                                  pmic_typec_port->base + TYPEC_CURRSRC_=
CFG_REG,
> >                                  currsrc);
> >               if (ret)
> > -                     goto done;
> > +                     goto err_unlock;
> >       }
> >
> >       pmic_typec_port->cc =3D cc;
> >       qcom_pmic_set_cc_debounce(pmic_typec_port);
> > -     ret =3D 0;
> > -
> > -done:
> >       spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
> >
> >       dev_dbg(dev, "set_cc: currsrc=3D%x %s mode %s debounce %d attache=
d %d cc=3D%s\n",
> > @@ -520,6 +515,10 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc=
_dev *tcpc,
> >               pmic_typec_port->debouncing_cc, !!(misc & CC_ATTACHED),
> >               misc_to_cc(misc));
> >
> > +     return 0;
> > +
> > +err_unlock:
> > +     spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
> >       return ret;
> >  }
> >
> > --
> > 2.56.1.708.g77570a6a1d-goog
>
> --
> heikki
