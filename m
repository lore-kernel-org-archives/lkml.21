Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199585;
	b=y/AlJS7GwsfoDG671DwBdDpGFQ6lZj1Sw7vrYHLmdPngoO3bc2KB0gof6ai4xNLNFsA3
	 MdfT8eUHPGQ7ccXkqa8glohzOVhG3a6KrU5lRQ5BUpjRZe7vK7qeXFOpvtWhoN2R1LCFo
	 JyRGomQJCHcuDlQprfbkqhKbpw+fg+ACICsWGvOygV1HieS+DcjkPEL3Z7K/T/k1BlmH8
	 L9A4RIMAb3jloiU3s+aTdMOsdPRt4fldvYIZnxxqT4Qh10iuGg8ydMHyFyV2jUrW5PCW8
	 BhQkkF1Kbz5Kxk60x+aW4opuRG0fPY1OOU47HVQXyfr1YA+vaM01cjCUPZeqVRLxBpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CAPneeylBz3YXn2VnybkvLnn9F0XjtSc9eSWIHGISq0=;
	b=ACYJBevMFeYuo+RpZGKQfLY6+9lPs/m/Sz0u96K8+58zqZ//HhRDyR06yhEMnvi7oo7W
	 BJMa3tOgkGDK4lnOPY6RBB8Uhno3xEZMFrj4iJuC38S0uiTmoX8fHwKCnxeUJYjS2xOXO
	 MSXIaCECXdBySSn17Xt9HbadHkpa7MCWRa+HX9J6xt2wcS3+3rO5Xpt1Oe6JiHdnfEfSX
	 u2ZpPipj/HXRU7O3/ERfIvHzFSECwl/TIrMU5gMHr8S9So/aU8y08o9+vpM2JUShiCWCc
	 7tnrvbdes432l6zryKlw6nkSRuq2toAyzbo4hxIWT37aNffsjd8wJB7zOQJ7nuQNE5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=reflexrobotics.com;
	spf=pass smtp.mailfrom=reflexrobotics.com;
	dkim=pass header.d=reflexrobotics-com.20260707.gappssmtp.com header.i=@reflexrobotics-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F0cMgM5B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAC660A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DAC660A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reflexrobotics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=reflexrobotics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reflexrobotics-com.20260707.gappssmtp.com header.i=@reflexrobotics-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F0cMgM5B
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso4730028a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:33:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199583; cv=none;
        d=google.com; s=arc-20260327;
        b=CTbXrCgYUBLcmMLDS5o6feas/2wvPGD4AACn5NGfgo4+k77sHVk46Dy5DB9H4rjSia
         MFdEv0gecbqwu3LN+7VFCDmM2OttA9QUKjv5M5Kq8EsYO62FO/eOWu0fBmHzhSf7f6Gz
         94VD4LcFnx3604SpmjfJK14/OrZbnTM0Wicz7ue0ZxhxAjuiCe+gaYdlU2JKERxrpQBa
         MbqZ3aaRL6Fxw3yYBb7j+N9V27hVn6cQ3nQ1ZQrQFJIMx41SRVST8mJi0USGgDmd8K8U
         eBoRmA3pGzJ5yghvpInMEf14tjGagsJuO4ig/QP4YKfUfjBJuok7xWoPPnpfMRDQAxMN
         DpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CAPneeylBz3YXn2VnybkvLnn9F0XjtSc9eSWIHGISq0=;
        fh=cVBWtHsIiITLNdkspkBTXotS2Wcluv0ZR/OTG/aiK0M=;
        b=PHYELfZ0AgaUqc16dKMP7wFekUtuyCAf4PidCKCVCBfZb6/cANwE7rlOB4+kv81pgE
         WdKm0ehOheo+K14cgywAc0PCVrKLAVv3DqYWn1HDb3TUh5cehQ//ca/sZYsP90PDJk43
         WjWOP0kq7YVUHupkYuQCgDPn/GKE+nb9xPkfoLs5QKGX/lMt9T83ZqykqySaDrERj0iq
         +OGSyo6B3Li5Pq/+/rreJ2OwjU4s5MK9SPM6VW16l26//B4GvF9CTyfZNcXaLXRse573
         Xa3L97ZTIc5qurWCcyd+68igkf1Dn+ncUjAhFaFsJqSI/QLLi8q2DPuEdH8vbysepFc6
         xMaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reflexrobotics-com.20260707.gappssmtp.com; s=20260707; t=1795199583; x=1795804383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CAPneeylBz3YXn2VnybkvLnn9F0XjtSc9eSWIHGISq0=;
        b=F0cMgM5B/mftILx/4d2yWLhLfvI0yR4/pkUXQ+93jk5juo55xYmqJlJpxsW6MtWXPl
         I2834IQNamlmFvPt/aAARRFZGLzdUtYs9vfbW0X7e/0qrXqlN0rPKY/q5Ddvlb757QUY
         iCSOWRiM88EZr5fANrYkh9w05tphycwC+OZz3wlSYD+hY9774yI6vwMYUWT/jqy9qPBG
         54dq7T4Qra4REIbZzV6iVJRSbheJhZCgXDzI9NF2dl9yGkWHRT8m9MOo19zTE1rB5UG9
         dPKYxxJLcOlufEzSlCkv8dagYdAKqTvivKNPsV/CV7VGe/ba9dBel/Hfx2EuvufDJOZE
         eWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199583; x=1795804383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAPneeylBz3YXn2VnybkvLnn9F0XjtSc9eSWIHGISq0=;
        b=dH4hV9gkJJUhdg+QFSVfR457px7mjVQBi3TgNmN9H/KqGFmB8WNNddY/nQQqqx6VIq
         V3esryAN/D6C2RS5oZEsQGEXS4SRWMAbVjVU8IV0wd9mpzHnGT1eS8zAfQAR1fvHP8ka
         KZp/UXHpUSCC6oy2D8FzaBLXJEtKglvWMfPxQR/k76iesgA8pav/MPVWiCl50rEt8mkp
         OFbbA2EJm/R1HszFgod5YU1//+OrIpqXV82fsXQ4c0loj2+FFWbfx4exmI6lMBiW1BC+
         /ZTQNxYsMeuLcFypFhrphOuBP3MVii1vzJACH+1wUaFrDWHMGI0+Ht9B+lhZltknOynN
         IRrA==
X-Forwarded-Encrypted: i=1; AL+hErEFmNEzQfV5pT4CoCBhfAHaL2TEATkjSjJHH+FoO7PL5EvrXNsG8cb539yTxPnnwEGJYPTtBKimoUl4Crc=@vger.kernel.org
X-Gm-Message-State: APuU4Z837Iou1ausbSidwObbyDd0Y2QexNH0LLC+CuwzVgH4lx0ILqaa
	tkL5BAq31bA0+Asy0oA0LYMJ7PajGITud462yymAGZ6HzYy0zersBnhpN4Og07jwrHxyUibY0z7
	gX7RIBHWGXHSLCXlSuEWUponC2whN73DketEJUnCoWA==
X-Gm-Gg: AZFdTZddkwGql6Df1z164btRtdkDp9MKGDmFO/v7g4dbyXl2sfkl6wiTKCSwo88KWV6
	/lck6+N3Ac3sDwKXEqnNkhw9g6vp0ZOelEbS7MkJvjWNDLyYJDifMGl+cwHrpQJTJmRqP6QTi9l
	vfThoWFVSMlyll8sIeinKU2i1/7RLQQQjNNo8vS5nzmZlVC9k51UtVr9tsJ21xVRuXyPKy9Txg+
	xWF2htN9CQFM3JqhmowbaBm7vE9MTCGQ49F8+EsEw0ugC7NfCfVtqOvGHGvQNY8LMIhNVi5VPPB
	j1jDe9fL3OkHyrGm06qt0JDjarV269/2VMgpSZ6zy6OQSguGIX1ks5qDlCujTqWict2RYYzkK/+
	9XLCKr1Zb/tqeLxYKatWKQu1lJbvm/6dgKyh9IhInga495rZuTCb732bxhViCEKUMiGqVOeJo97
	PjjLKqry0EdKTLwxhrIZzQV9N3O15zi8sHBQ8aD+AXV7nfUDU5fA==
X-Received: by 2002:a05:6402:a594:10b0:6b8:a711:65f3 with SMTP id
 4fb4d7f45d1cf-6ba37e935e0mr2522060a12.14.1795199583392; Fri, 20 Nov 2026
 10:33:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120020850.24318-1-joe.l@reflexrobotics.com>
 <20261120020850.24318-2-joe.l@reflexrobotics.com> <awAT-ofy0p_uhvGN@ashevche-desk.local>
In-Reply-To: <awAT-ofy0p_uhvGN@ashevche-desk.local>
From: Joe LeVeque <joe.l@reflexrobotics.com>
Date: Fri, 20 Nov 2026 10:32:52 -0800
X-Gm-Features: Aa3M54ooMSbRCqeK2L0GWBOnVFZSWQ2EEWv_N9fWbx0PggVT0BMZwu4_tSVZ3Vo
Message-ID: <CAJLMkXafYtUx7gXE8g-sJ0keGW8eSrVGPc2ao5EzjkxZ-nN2cA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iio: imu: inv_icm42600: return -EBUSY for temperature
 reads when idle
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jean-baptiste.maneyrol@tdk.com, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

The -EBUSY here is consistent with the existing invalid-data case in
inv_icm42600_temp_read(), which commit dfdc31e7ccf3 (=E2=80=9Ciio: imu:
inv_icm42600: change invalid data error to -EBUSY=E2=80=9D) changed from
-EINVAL to -EBUSY for the same situation (both accel and gyro off).
Patch 1 returns the same error for the stale-data case, so userspace
sees one consistent response.

https://git.kernel.org/torvalds/c/dfdc31e7ccf3

Thanks,
Joe

On Fri, Nov 20, 2026 at 1:33=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Nov 19, 2026 at 06:08:49PM -0800, Joe LeVeque wrote:
> > The temperature sensor only measures while the accel or gyro is on.
> > With both off, its data register keeps the last measurement, so a
> > temperature read returns stale data. On an ICM-42688-P, a value held at
> > about 52 C was returned while the chip was at about 62 C. The data only
> > reads as invalid before the first measurement after power-up.
> >
> > The temperature is the die temperature, used for accel and gyro
> > compensation, so return -EBUSY when both are off instead of stale data.
>
> Hmm... EBUSY means they are doing something and kinda hints user to come =
again.
> Would this condition change on its own if user comes again later with the=
 same
> request?
>
> ...
>
> > +     /*
> > +      * The temperature sensor only measures while the accel or gyro i=
s
> > +      * on; with both off, its data register holds a stale value.
> > +      */
> > +     if (st->conf.gyro.mode =3D=3D INV_ICM42600_SENSOR_MODE_OFF &&
> > +         st->conf.accel.mode =3D=3D INV_ICM42600_SENSOR_MODE_OFF) {
> > +             ret =3D -EBUSY;
> > +             goto exit;
> > +     }
>
> I would choose one from the below (they all have their pros and cons)
>
> ESTALE
> something like this, but error message is specific about file handle
>
> EL3HLT
> what is level 3? But we have the only user, and it is outside network
> and it sounds close to this case, but why not EL2HLT? (Also the users
> are outside network.)
>
> ENODATA
> also used a lot, so semantics not so clear, and data is there, but outdat=
ed
>
> Depending on the answer to the question at the top of my reply, the error
> codes may be EIO, ENXIO, EPROTO, EAGAIN (but if EAGAIN fits to the flow,
> EBUSY also fits).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
