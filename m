Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795116454;
	b=2eyWdZE9cgHiqLpYM2WRo9QqH+ZD3nHhyGdaQo8zGpM+L7oGc/7Y9geJJG4yrkINLlpI
	 tAMbJZpz40K5vT44Pwu6Fx6twPGvWO3pv7WUzwxp4xxgrTGcdO+gGy7IqAFfwN+uACOTA
	 NSjdh+vCCnaNbIILi1mvW64e3eUejORLNZRcpSTSZclJlxBeT2b72/3T16ud9YTPHwSZi
	 mpVcua3XseTRGPMDSC75G1WqvOJCcs/Akrn7EQzoSrzcBz1cBp1dSMqEY6RUKhG7ZoqlG
	 i9bgUNu9O/RKrUVyVOnINkEVfb8OwRruOXqx6EcLjtPnvWUVKNE9lQaBaOZTe+3i7oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FPIyTZ2xa6J6Vt7L8hxmnU/vzE3cyAtAe0I7exZtDE8=;
	b=byHj5kTmz7/zW3Htjs6aHVebPFdsAKJvM+rqYmNDq4o5xvWFOfq9YVR2wrnMRItaooZ9
	 tpM/UdIgVjhDNRAYdJBZpzGPfpOzlbTN2mQSQvT58O7nwXfia6VbwfeeRwzrO3Q3iPk6y
	 zCvyRu2kXLLQKO6HHL5WJJJWVJdpE7PazXWahqoDZZ1ekXWJmqHrGSfrz+WL3ank5ijg9
	 IjpeuJS7oMYHnbPfuOiKRJsSAYpRK8fXHxtFKF+leslVbBnUkYXTwf6jVYMzwDD0AP3tS
	 06u6wqOKOJMzYu7tW1hNE6Rl7y4Opob1WL4ibTW1c71AcuGuGnfc/P9Jrym5+6ylc0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VkFFn/FB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48627606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48627606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VkFFn/FB
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso415925e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795116452; cv=none;
        d=google.com; s=arc-20260327;
        b=PWSXBzYOVn0NhqtzJQbr4OSZFsRA+Y9X8Ky+r6TrVimCh/GmzOzJdpDmPFne5TSpbc
         i5OhgH+Ri1fAFnE6QoR94L2CnHkmJRIZRfJ8SmnyEvR0YovaMjlmqeXWQHmquYj9hBwD
         2Qtyi0A4Ezpjir1mvhclL7fDa9VzrPnwa0T27O47nDqc2PcLmk67eABQHrl8YsUuvBuV
         2RuEklVxVX/n84G5BKnOGH/ZVEgON6O3B3qPYHva79UuvBEGMsA2DS1gRJtxRz/aRA5G
         C1Gy4cIh2826gM6vJbC4qx5jHujt+60Iqrvp1WmbHk+veuK9Kq8wwVg4oHqiNrLaHUL+
         FiFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FPIyTZ2xa6J6Vt7L8hxmnU/vzE3cyAtAe0I7exZtDE8=;
        fh=DB/PFS/v154zzRMDmF6WLOaNSSJa1MRlANDmG1+BvDk=;
        b=DzojUkAm+l2SVLM7W3UKTn4KKJ5t8JyakL+ggE8O67HNCOEh3W6bGGrExZOtraa5hs
         1zZnWRw0Ud+FjornBG2Ehi/iCcFWkLP6aVT1tjybBhXfrGCNpSAYmG43UnJJC4IOgoBb
         Bz/VGjXD8X+oGFaVFelNsv/7a9ZyBVCbaJSyvdzAN8myABdqTs3F4TWbG/B9iLqzSvE4
         LKZXqStKlC0VAjTZLVE4fS+R956QbsDa/gYTQojapUnY1kPrlCfHkTV7v4RL+/3aMivU
         tV9zaDQGiE0pQJoG8GN2S9kCHV4B0oCBQ4iUNMx7blXKGE23IRMY7gT1yAt4imiwBrRG
         YIAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795116452; x=1795721252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FPIyTZ2xa6J6Vt7L8hxmnU/vzE3cyAtAe0I7exZtDE8=;
        b=VkFFn/FBZCLe9PgTyNrmnAq/uufmOi+UyRXVGBmQWSIu/r8UWqjt/HP515Qu5nBlJp
         ETcoKaXT4Clsgsn5VHz4Ho3qFRRpEUrgP0IpWu9wOPCwCM3yJLv61MwTrv3G94Qh6RBg
         kLIODUYBkKHSEy/I1WtRXnMgwuNUld3Mt96TeV8AwvpOIdSE399z91S4iAFtaQzzXA55
         fFvuJ5+fkYnAV7B8cX6dn+lMoJUk461roX0hRYuNQv4NDtZfE91IBV7O8EvqWGkE3n/n
         s1n3oTLpnzrh12mDVoq4Pe6a8Q37UdS35001ihHg+Xd5/cJbYW5ANCuEW+IbS1TD+nSr
         AcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116452; x=1795721252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPIyTZ2xa6J6Vt7L8hxmnU/vzE3cyAtAe0I7exZtDE8=;
        b=oGGnyYHgdHJrvBKwqkS46nJqv9l1wKk6J/3jUN5gQ+hrb9yP/Nphedc3my5SfSgoju
         T1GiB6n8dbk7InMvCC0iPJrn89LEFZ2bOEF9dJuo6eGuY7fGa7AqWN9f6GlW2M2ed+G8
         2wtPmck5Nt6XItDSNTslX79qm9LrH9PL++qoEJAQMY2gI0cXs08FaiqoYdF9F4FUbI7o
         Bw7tBwXRxGAzAsLVFh084/26B3izL9cM5PsdnWeK85afUEd3iM1m7g0liA9HiDv8Py6m
         D2o7Rypty9zDOJP/Iw45PGwMc1k+2sbDtuQ3vMQ5wqULF47eNs57STpy3lZoVeDg0afG
         V24w==
X-Forwarded-Encrypted: i=1; AL+hErGjhdQQRKaKp1eTG5VaS5u6vWSrBLd/dW82PiWD8cZy+LJgVpqs4a6oWH9z5cBBDBR9WHTpbF/DyqQXBvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LhBQvqXiXmd7LedvdEydvZfdThRcgZe76+ru8jNfwi+Hx0/WT
	0eNj1yVgyVEgeMhFU7GpLD1Zo+5/SumIQ1J9pMeesP1Yuh6VQOV4Y4THg7TbJQDOyf3cwDjffiB
	Fe/KsS8fB31JyPrEJvnemBf0581Yokws=
X-Gm-Gg: AYBFou1axTc5gljCq1kIdjKJHyjdvvPjstebjFOhcCb4QI9uJotBdOG39fjfcRsJ1QR
	Q7yC5l/goXxMT8Ksn4kXEOuRSPLW8blEYI5WT0DZINtukZKNBLVQvh+h2WfbEAXRIox3v2CXaSt
	ncO7TE37L9u+QnvKraOgFp+GJrOqxxusC3Ia7piqAZZYH3PMa2HBlmwFT48xpZ0V+oQFzao59Na
	L6J3XGjoE8c9m/L8pgZ03yGshK0ueitASPQGAanwP+2lJ13Tby2jv3e8yeJUCAaGPEhPH5sYRMk
	UhSOXx9dqU/rxQnlxqVTF9tTnma3mWuI3AX6AayKD95J/6Nd4trDi2q+dEFJ9W0iyWDdUli5EYc
	UyK875qPVd3epH59UN5wzSyC/o5Dfmx3VpfDE3yUiBF3H/v8TQzRPtoY=
X-Received: by 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id
 5b1f17b1804b1-4bb887865b5mr15236975e9.0.1795116452430; Thu, 19 Nov 2026
 11:27:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-pwm-v1-1-adeff0cc366a@gmail.com> <av8GQXBbkf8_sHhX@monoceros>
In-Reply-To: <av8GQXBbkf8_sHhX@monoceros>
From: Wong Steve <shyckless@gmail.com>
Date: Fri, 20 Nov 2026 03:27:19 +0800
X-Gm-Features: Aa3M54qACejcwQO4GeeUlTAXh5NBJM7D7iB7MZWZSjS0J-bqqH1dxZQ9I68b4dg
Message-ID: <CA+X8SdijifK4VwyTWRq8ki7yNrJe1HOHfNW5J1-UamJARkeGFA@mail.gmail.com>
Subject: Re: [PATCH] pwm: Don't dereference the chip after put_device() in __pwm_put()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: m.wilczynski@samsung.com, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Thu, Nov 19, 2026, Uwe Kleine-K=C3=B6nig wrote:
> I wonder what ensures that the compiler doesn't reorder put_device() and
> the assignment to owner. Maybe it would be more sensible to call
> module_put() before put_device()?

put_device() is an out-of-line call that may free *chip, so the compiler
has to do the load of chip->owner before the call. But your way is
simpler and doesn't need that argument: pwmchip_release() lives in the
PWM core, so dropping the module reference first is fine. I'll send a
v2 that does that.

Thanks,
Suyuan

Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=
=8819=E6=97=A5=E5=91=A8=E5=9B=9B 22:27=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Nov 19, 2026 at 10:56:17AM +0000, Suyuan Wang via B4 Relay wrote:
> > From: Suyuan Wang <stevewong@hust.edu.cn>
> >
> > __pwm_put() drops the chip reference the consumer took and then reads t=
he
> > chip to drop the module reference:
> >
> >       put_device(&chip->dev);
> >       module_put(chip->owner);
> >
> > A consumer takes both references in pwm_device_request()
> > (try_module_get(chip->owner) and get_device(&chip->dev)). The chip's ba=
se
> > reference is released by pwmchip_put(), not by pwmchip_remove(), so a
> > consumer can still hold a pwm after the provider has removed and put th=
e
> > chip. When that consumer finally calls pwm_put(), the put_device() here
> > drops the last reference, pwmchip_release() frees the chip, and
> > module_put(chip->owner) then reads the freed chip.
> >
> > Read chip->owner into a local before put_device() and use that.
> >
> > Found with a static analysis tool and checked by hand.
> >
> > Fixes: 4c56b1434b81 ("pwm: Add a struct device to struct pwm_chip")
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> > Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> > Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> > ---
> > Compile tested on x86_64 (W=3D1 and sparse, no new warnings). I don't h=
ave
> > the hardware.
> > ---
> >  drivers/pwm/core.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > index 4c6d716e5fde..8988a7dbe5b1 100644
> > --- a/drivers/pwm/core.c
> > +++ b/drivers/pwm/core.c
> > @@ -2020,6 +2020,7 @@ EXPORT_SYMBOL_GPL(pwm_get);
> >  static void __pwm_put(struct pwm_device *pwm)
> >  {
> >       struct pwm_chip *chip =3D pwm->chip;
> > +     struct module *owner =3D chip->owner;
> >
> >       /*
> >        * Trigger a warning if a consumer called pwm_put() twice.
> > @@ -2038,7 +2039,7 @@ static void __pwm_put(struct pwm_device *pwm)
> >
> >       put_device(&chip->dev);
> >
> > -     module_put(chip->owner);
> > +     module_put(owner);
> >  }
>
> I wonder what ensures that the compiler doesn't reorder put_device() and
> the assignment to owner. Maybe it would be more sensible to call
> module_put() before put_device()?
>
> Best regards
> Uwe
