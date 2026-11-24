Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795479690;
	b=Zd57rI1HfYDWbfUkQke8h8pKifyRLdZkA3Rk6Qgg+EZ8k0JAWdDGJSfew5ur5LEs9PnF
	 MIugyntMDxtkqraSLAOR9axxaelRDsCSbku2c53lLDVZ3NFJJ7EPiUeZ78bIGLdmHyHZs
	 WbhqtpjjESoOabiGOTAv+1eninQg3sesTB9XXoOHk7auh+UfWah5kc5tq+HHRSpcYv67G
	 w8Ff2L4Q9p1cuGZkpYZ6R+FMWw0cntSYgtN8ZqFSxLCj1K9yjG4x0lCbi9lr2FWKzdSM/
	 PMSJNUcM61dNSzjJtKg0lotV3dL5fSgD3vpMAz5Dk2FrMTsjEkSeUuux9gD2XEVTMYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FqRh/LX34nQF3qudAfGlfiwq6IAwp90MpzECot2f3+Q=;
	b=p1luGrwjJFIf8h6vAvUYd/BHvTfO6xD6wF6SoCsak61/Ou90YcVmPMEMa4hXfvNjBz7I
	 Y3Kixqbg7ebrMqQaA+46gdlnyaXpXfwGNxwpAOpIPWUxfBD7nfj1ubKN9TgyyiPXOi4Qe
	 FoRI+MwHJhuTwu3xQY6alMXJN1eHR7JATDedemdZCi6LKNQfJNBH5g0/spFJoipLXbfB8
	 E9HBOmkTCfeBTmucaE4A+4H7Ir55ayE4dvjqR/8NRt5ifpIU3q5VCJKg37NiJiRvYX272
	 PRh1D0fGrgNCMHJeDMpiCxOpen5niYo+g4mi/PhBEZ3VoRADnWpuSn3e9bcAl3fFI4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLKF5rHs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E29606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E29606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLKF5rHs
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so4803716a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795479689; cv=none;
        d=google.com; s=arc-20260327;
        b=JlSJH3WzgalmdEZuxXHYTpMig7F6OvsZlRabZ6Y0glPtKgqhSl4pmc6Z4Yf5bh5a8s
         cvFDvLin97AcdogF6xBkS+CWff49rdrkq3NFn/QGkFBfdNrgDnfjxg6qybAuZ+zc86tu
         FgpifoS9GCB2HGs7x65ATP1YjtQWk/tOQZ4TA/Wca5FJQqclc0faEqUTHMCEC0zUwHgf
         Nq3yJy7N9gDgkKyQ/8eBNcG674tQRv+vudV68GRhj73WNcL+ksW9tqeXJ9ZqEn8Hc/fE
         6bKM5m/D8Yo1WYvCGvhwrgyWVyo4m+7dHt+HQp64u0KW/pVRET14uyfKib1FBFF9aY1j
         OcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FqRh/LX34nQF3qudAfGlfiwq6IAwp90MpzECot2f3+Q=;
        fh=YBXQqsHJ00s+Lxamgpq+5NEVYtR64Sncc12uKLpxhRY=;
        b=mM65dO7m4YdmKTI8UvXWyiftrnO5flXydJHdmqJJbXxCI+IKnR2eECkCaXdn11PqQm
         AJo1vCqlWiYHf1XfHKGd+KDAkdoC6DvZLxt6hgR4eZePk/zWyI1gXfm0eq2QHGJki5bO
         c+6VjirOicn7h3SG+DQasfn3I3nZZSBaEn5a9upX5z2tNDEGap2ZrnDIOtmEIxLrfs/A
         L6dzRQCcK1kQuIqZlpX/1w1A+QjUh/JTRv/B1fNAuR/NwHQMrP7RcEYYy5PT7/NwmhVM
         9oYv7l3Fr7yZXvytOXew5nhxwimbp/56gtyxSYW8olx5nnOiod2o9WTufd3XhvlvcwKO
         oodw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479689; x=1796084489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FqRh/LX34nQF3qudAfGlfiwq6IAwp90MpzECot2f3+Q=;
        b=rLKF5rHsPOTUzw8jA6fcmSGCc3SISVvG81SEj/QnbdI73VCFd2+SvR+URp4aXbiwTU
         NMzD3TIeDed3u7sxPq/mCjWshoSmyEAY8hkCMRuzffM052x+L2ClWbWN82//8ypEiyTM
         sylrTabCRhpuD57mx4ich2UOC1noPuAsuxFcdLWZQXGd64dsy0YiiWJN3A4OiFN+1CU4
         kiisVQS6vXOMCrTfeUSa+jCc6n0Kq54zLFRF+wI6o11KR5+XHpHa45ghp190zJ2UD7c3
         aW21p/V88n0SbjTTz37tVvwVZmMqG6jAKQ3VX58m7OvQHDhS2nxf/e5meFyf0jok55yq
         1M8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479689; x=1796084489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqRh/LX34nQF3qudAfGlfiwq6IAwp90MpzECot2f3+Q=;
        b=tisoicpd/Nc63aole3pDQGDSzi5G2278ji7hYadHP4OSMSxUplIO2mIll9oZ6M7rE0
         ztUhwiJNI2Z9S30kBuG5zGhFUu9HtUuAt29uVE9tMdUYj4wQEmViFw6UP9b7cOjFilgo
         DKayfvWaYzXBBAht1I4v7YjdeIi/UXNFvQnjGOHgL/CIje2ith5gr8pCNAXa0LzTcjt+
         VAoS/wcvZVXtAEY8ko3GTLaGeXOkmkNEY9f4vIURJgggW8XC4aY4Se+Ek5D7jmG0awfv
         +8bknO7q/34hFBPS0qwhrXOSaOPNR5VTVqaWx8jcdr3qPgyVbe9w1TpO6DYFFWj5Y82j
         mNkg==
X-Forwarded-Encrypted: i=1; AL+hErGKc7FQhvdDHEkzY9DrMDqfchUXcJagjt18EQfUl/n/kj4V71pvImus2SMarfO3EG3fr16KOnaoGBnpkjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mO+wVYlY0DyFYicN0IIcz60HKz7sIgO7rT0VVykqLXwdbfp+t
	m7QhQ9jORwK4KrguTurpc6FLAVThhqdVGS1ZQ5Bg2DGzo8kXqOs7PgzOtmjbCsKv29XuJpwJzfn
	WDZZZ4kYomYoBaQU58QyFXA/UjTPb8ts=
X-Gm-Gg: AZFdTZdo3lk6Pc3Pduh9xWauck92UpL4HQqpbpcC/ze22BfYCeg2PrOtRCv08huqv74
	lpvMKNylO3BJp7PYOgAKCdmuoX5q+u8826vl0Hmpzm/8m+TyGCrC7U05bryX/0eMO1A52ALmbhn
	dIK+RW9PWNWJvkZQBxYwa8lAM6Ctdy/10swITqQDbkuifZmBz9mq+8Nc/n3xXwXvHFwbtqWoBDN
	vBJB1y2Rxt8A+mmruN53QinWUQdCnExFjZwi4ORyu+lxV1mwNoMhG+/HmAvb14GT06yFUWLyrpj
	ZLcrgU/DshwhmwYpHE70EQmebPLnGQvtWywjK1aXCbagW55empxaeeRmGzyslD9tdTi+nBFbEiN
	Bo4+UFXdOqHUY9uFL/3uvuqY/MXqtuqdo4eGctyQo+XflESoV4D563Ih4gmhwo8qgOve0p0cddn
	ITCMghftiOgPXbqRLZS07cUNTlOsQt/Fqa/SZzzbamtUv0b0fAwMO8aQc8rWSlVX/qteRK2YVYH
	szRt42JZ2W/iIcdU5/q/S7w+52owxBsC4vx57DDbo7L9OEOiQ==
X-Received: by 2002:a05:6402:4009:b0:6b9:c43e:19df with SMTP id
 4fb4d7f45d1cf-6ba37ed9a8bmr8687510a12.41.1795479688502; Mon, 23 Nov 2026
 16:21:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795219225.git.rosenp@gmail.com> <6abac23d8f9985b55282ee56c97155a67076257c.1795219225.git.rosenp@gmail.com>
 <51f6631e-62df-0e64-b358-805d343475b7@linux.intel.com>
In-Reply-To: <51f6631e-62df-0e64-b358-805d343475b7@linux.intel.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 23 Nov 2026 16:21:15 -0800
X-Gm-Features: Aa3M54pIlzL6e3JOmkuHYZ-2pLUgxSjaakZlAQWrxfICjUxUzInmwGW9UZ0eKFk
Message-ID: <CAKxU2N8cn+hbUH4iwP2w6myQV28LM1+djvmQfN92A8z1G9Y5Tw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86: dell-laptop: Parse the charge end
 threshold as an int
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, 
	Darren Hart <dvhart@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 12:32=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 20 Nov 2026, Rosen Penev wrote:
>
> > charge_control_end_threshold_store() passes a pointer to an int to
> > kstrtouint(), which only builds because the kernel disables
> > -Wpointer-sign, and makes the following "end < 0" check dead code.
> > Use kstrtoint() like charge_control_start_threshold_store(). Values
> > outside 0 to 100 are rejected either way.
>
> Why the <0 check has to be kept on the driver side?
It's currently a one line change instead of three.
>
> Why not change the variable type instead and remove the then dead code
> check?
>
> It's somewhat disappointing this even has to be pointed out by review.
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/platform/x86/dell/dell-laptop.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform=
/x86/dell/dell-laptop.c
> > index eca348497ac3..c512267be4c4 100644
> > --- a/drivers/platform/x86/dell/dell-laptop.c
> > +++ b/drivers/platform/x86/dell/dell-laptop.c
> > @@ -2382,7 +2382,7 @@ static ssize_t charge_control_end_threshold_store=
(struct device *dev,
> >  {
> >       int ret, end;
> >
> > -     ret =3D kstrtouint(buf, 10, &end);
> > +     ret =3D kstrtoint(buf, 10, &end);
> >       if (ret)
> >               return ret;
> >       if (end < 0 || end > 100)
> >
>
> --
>  i.
>
