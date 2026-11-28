Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795828328;
	b=sNPs1QU0odIUGN8Ef353RvHCp6LwMUdzN13fRd+t8lanx340i4uEWywwcYUxfjYa51R0
	 r5lEBx9B64clKvgWNevbV94y/fUmBF6WpD9Czn6aEMBSI2qo3t0vKJzHSLoi7IVn0Vwo9
	 5d9bmGDJSO2MkAp4onJOCbRN6pHNyTndMqEkudnhAgvBTwUnA0nP1QN9+FYlAoOSIqs3Q
	 VNnqrXDl4Ifj7i2Bf025KI3FF4S8AeJ/RruIzJPeTerfiIvOgjGBPPq4+myySf8GXOlQP
	 Q2JOPxuXRmOeOb2ujcwO3YEKokP+oZJe+fQcBUbppwaRMhI87xQkp3HzEB2L71Rb3XA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795828328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d+pQFpRQs5oDrjGbRHfXhVFeJrx2IO0P+8h/4Gnd3Ug=;
	b=owILTaHh3RZYSWHv+WK6AgYa1TghO5haHwm4EU4M8jX8mmQAi1703A9nbJ0L1JOBzWQ7
	 NyknXSDkDs7/2Gpy46Fh2lrYcvsxZrPZN1jBitiwJ14f31p711TI9WlGH4HuLm77MUuYu
	 CB2b+rx11fNAjg48QchAcD4jrl3RbNfrKlJuNfBRWaQtYPjpt1jO3H735zUJe2ls941ae
	 Y95thGsJ8y7XCOmd4e1zYLp+xpUjC2j9ezi0GxUpKesRd4//p+kYNqd2/9ezG/Z/QxcT7
	 E0ScYA8VUDPdtIhIhJScX3zLreADz+/DPp0RVk4kOYZfEKECX7+H4ytPvvJBUtBn1Iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+xZ1Uyo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390BE606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 390BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+xZ1Uyo
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386cf1041cdso6083338eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795828327; cv=none;
        d=google.com; s=arc-20260327;
        b=hTrbSg00gEgmdBaQgDURIOawf9bP7mr45sEfhdNRFAn4B6NzJxhp+vx0UkfyIIO/X5
         L9iEaKN+cx5KnDzhmzJps9dmRWg2xMS0URw7orIEEqDXSYdnNjHr+Krwdy6viB0oo7MV
         h8ESM95NRKfPiU13BvSEs579ICgpgktUpNLbU9rKfJPbigDSb9JCbGs+VEq0UpeH0/Th
         uJhrm0kSWcxyuRJC66CJTlxTfpTbFbvm4lMyyTreftVerJkvOeq+EqwEmkE1JdOIGrpt
         8otfbRv1TyEj3gF6KYtCqpJXeZYcHVTznU1xoNJub8H5KaABzHMpEKXoSe2PDdlU+iGl
         2szA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d+pQFpRQs5oDrjGbRHfXhVFeJrx2IO0P+8h/4Gnd3Ug=;
        fh=QsdHoGD9qvE4e8rlh0kbOQHaKBjOKPw+KBZq+h6uJMY=;
        b=VKz9p+qwgSpP79VqyVAyeaajHGn7HjlrAI8ZjVHKn9o905aUvYU3biKcqd4STmXsqY
         vEw/iEW8PVh09y6zFcGZd3koCYahGJXOVIv4aneCMv8PYVWXslLaRsdygm7+72xZGpTc
         Pcd6w9rDd+kgxKPjnYQgt1zOYHhW2UgxVX9STLKLLk/OUJsPhOXZVoVvjh2EFRsF2hvP
         u0xAZrB8clnWiklqw8wg5L43kBBMgXOAzNuRzuCl3TXY9f1T2lugMOhLEmMzYod+7Drg
         KegFypUuABT/SEGUUDnixg7QgTIfGQaXksuVTn8hhWQ3MdF7YP+z6S9s5uHkGe80OymG
         6trQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795828327; x=1796433127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d+pQFpRQs5oDrjGbRHfXhVFeJrx2IO0P+8h/4Gnd3Ug=;
        b=W+xZ1Uyofg9bKPP1dQwl/jvrpGvnic8TMIEwPzumzChpG1KkHJFcM3o2AB4O0vD8Vl
         /tDUnHimG4klsY99Vblzd49aXxtF7oTD03l2dMxbBwzQrNJSAj046onPeWJ6w712Q/jJ
         qV7OwM0npTBk7cr9NyNbjxBJq1vHzm5RwJkxx98D2t1KuESkxdDEO4tilD2iFz35knob
         k1H9qMjwULGzemWMswhmisEaSQIADb0MP7HQ5J2Jx/aY7B7aqIzcDk3zUxuPjFttCo/z
         fXkbP9NI+R6Asq7dwhA7hKmlQGTG/5hOIBDq6OOhJ7DhO6WathENJ8qgu6cAyJXTQKqC
         6FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795828327; x=1796433127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+pQFpRQs5oDrjGbRHfXhVFeJrx2IO0P+8h/4Gnd3Ug=;
        b=2OdjF3tMgUySqMszrCc2XrMAmoAMDWeJ4wrDalLuVK0ceGo0fb4/GgsYTc0JXCpHbg
         75bs+GCvZ81NrNr6I1xb78BbGFUCMEqE7su0y1qCTTftoN3QRgccZNovp+BEVlA8xDZO
         aELGQYkllBIwIddP8dokjEdwjzQgKsITVvJhoR0IE7P5BkZTXCXioTEizn9a1KQddzYw
         e1KlrH2bvv5K+INMNjWV3bGvQglqbwy9EFBEpjbHauEau6Fm2MjXfJTXmr4bqQ5CJVoZ
         ze0Otkk1gJl1qtU4nv48BeycbAw6cU5VuO5aTk1yvQAhNoxnnFG7KeyNUZ2kxZz8Gv+L
         kOxg==
X-Forwarded-Encrypted: i=1; AL+hErGEDswUYV6SpO0QnPa8K037v5y3Y/l7xLyRZOYChIrZK+jgJVvXCxLa/K2xrGhk2GBCyKB8Bb2/nQM4cHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IxMX50zv0yRYbl6W5Hzo5FSA9jNvwpceB2zhBQ3F/t/uuEV3h
	2B7jxdKIo9ntwJRA9k3YPiXgoZsUluptsx1Mv5DE5Gwp0KwxGvBo6P1wjtTHeUI3eJ5//AHkBNd
	SwdHOVntm2HuNEUyLANr4GJZMjB+K9tY=
X-Gm-Gg: AZFdTZeF5bq9YVNLlU4Vuo2DD6T/40gKY/Mcm5FIm8m0UJ0M0VTdKA0pgNJj2TMRzmw
	57s+7lnXalOl0R31Cisk+SsZHelUHagaOVDfzwMW4vdmrAgetI/w1F6svfbE7nMHkq+/drqZ/Zf
	eZSkGHpvth6wKIb2ehxZi8+ipXnmcXyvOCotdiA9oKldRor2RkIRlFMaIcjM835I/+5C3n9Tmw4
	np/RPHYRet320JpUdiOhUqU4eeM4j4yfUxkje9TDwhTjVsgcxfcGxGrssiE45mZ0eNkng4xwjW+
	/wxIPGPUKvOlFOngn6t0wjZ7TQC/ZPIIirvYweOos9sy2bLrnVq8Svs5haV92Cgh4u7HJdK9vgn
	doMGD+ujhX7IFhJi62JZQoJHLoO9yreZqv+UW
X-Received: by 2002:a05:7301:6083:b0:386:a01f:a36b with SMTP id
 5a478bee46e88-386a01fa8d8mr31179998eec.35.1795828327239; Fri, 27 Nov 2026
 17:12:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260815074844.1330-1-jakejgpark@gmail.com> <20260903115516.32495-1-jakejgpark@gmail.com>
 <5b13119c-105a-4197-8f5c-711acc47ac0c@app.fastmail.com> <20260903222830.213089de@pumpkin>
In-Reply-To: <20260903222830.213089de@pumpkin>
From: Jonggeun Park <jakejgpark@gmail.com>
Date: Sat, 28 Nov 2026 10:11:55 +0900
X-Gm-Features: Aa3M54qCJwm-mygX_BgRmUNUXDh62GubqfQ1bS9LfhMfezk7aV08_bKS0lx_C7o
Message-ID: <CANFjs8t79dAZe5szPghV=3cTgfOZnqsL2XNNudTqGwAjwm3r=w@mail.gmail.com>
Subject: Re: [PATCH v2] efi: vars: commonize the 512-byte name buffer quirk
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jeremy Kerr <jk@ozlabs.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Laight <david.laight.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ard,

I'd like to kindly follow up on this patch.

Could you please let me know if anything else is needed from my side?

Thanks for your time.

Best regards,
Jonggeun Park


2026=EB=85=84 9=EC=9B=94 4=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 6:28, Da=
vid Laight <david.laight.linux@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> On Thu, 03 Sep 2026 22:03:18 +0200
> "Ard Biesheuvel" <ardb@kernel.org> wrote:
>
> > Thanks for respinning this.
> >
> > Some additional thoughts below.
> >
> > On Thu, 3 Sep 2026, at 13:55, Jonggeun Park wrote:
> > > Some old UEFI implementations reject GetNextVariableName() calls with
> > > a name buffer size larger than 512 bytes. Both efivar_init() and
> > > efi_pstore_read() open-code the same workaround of resetting the size
> > > to 512 on every iteration.
> > >
> > > Move this workaround into efivar_get_next_variable(), which keeps thi=
s
> > > quirk in one place, resolving the TODO in efi-pstore.c.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Jonggeun Park <jakejgpark@gmail.com>
> > > ---
> > > v2:
> > > - Move the workaround into the existing efivar_get_next_variable().
> > > ---
> > >  drivers/firmware/efi/efi-pstore.c | 10 ----------
> > >  drivers/firmware/efi/vars.c       |  7 +++++++
> > >  fs/efivarfs/vars.c                | 12 +-----------
> > >  3 files changed, 8 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/firmware/efi/efi-pstore.c
> > > b/drivers/firmware/efi/efi-pstore.c
> > > index a5db3534f..4f2594d08 100644
> > > --- a/drivers/firmware/efi/efi-pstore.c
> > > +++ b/drivers/firmware/efi/efi-pstore.c
> > > @@ -164,16 +164,6 @@ static ssize_t efi_pstore_read(struct
> > > pstore_record *record)
> > >     efi_status_t status;
> > >
> > >     for (;;) {
> > > -           /*
> > > -            * A small set of old UEFI implementations reject sizes
> > > -            * above a certain threshold, the lowest seen in the wild
> > > -            * is 512.
> > > -            *
> > > -            * TODO: Commonize with the iteration implementation in
> > > -            *       fs/efivarfs to keep all the quirks in one place.
> > > -            */
> > > -           varname_size =3D 512;
> > > -
> > >             /*
> > >              * If this is the first read() call in the pstore enumera=
tion,
> > >              * varname will be the empty string, and the GetNextVaria=
ble()
> > > diff --git a/drivers/firmware/efi/vars.c b/drivers/firmware/efi/vars.=
c
> > > index 3700e9869..0f95fc60d 100644
> > > --- a/drivers/firmware/efi/vars.c
> > > +++ b/drivers/firmware/efi/vars.c
> > > @@ -191,11 +191,18 @@ EXPORT_SYMBOL_NS_GPL(efivar_get_variable,
> > > "EFIVAR");
> > >  /*
> > >   * efivar_get_next_variable() - enumerate the next name/vendor pair
> > >   *
> > > + * A small set of old UEFI implementations reject sizes above a cert=
ain
> > > + * threshold, the lowest seen in the wild is 512. Set the name buffe=
r
> > > size
> > > + * to 512 on each call.
> > > + *
> > >   * Must be called with efivars_lock held.
> > >   */
> > >  efi_status_t efivar_get_next_variable(unsigned long *name_size,
> > >                                   efi_char16_t *name, efi_guid_t *ven=
dor)
> > >  {
> > > +   BUILD_BUG_ON(EFI_VAR_NAME_LEN < 512);
> > > +   *name_size =3D 512;
> > > +
> >
> > This should really be
> >
> >   *name_size =3D min(*name_size, 512UL);
>
> You don't need the UL suffix.
>
> >
> > so that a smaller buffer size provided by the caller is respected.
> >
> > That also removes the need for the BUILD_BUG_ON().
> >
> > No need to send a v3, I can fix that up when applying.
> >
> > >     return __efivars->ops->get_next_variable(name_size, name, vendor)=
;
> > >  }
> > >  EXPORT_SYMBOL_NS_GPL(efivar_get_next_variable, "EFIVAR");
> > > diff --git a/fs/efivarfs/vars.c b/fs/efivarfs/vars.c
> > > index 6833c3d24..5a01833a6 100644
> > > --- a/fs/efivarfs/vars.c
> > > +++ b/fs/efivarfs/vars.c
> > > @@ -391,18 +391,8 @@ int efivar_init(int (*func)(efi_char16_t *,
> > > efi_guid_t, unsigned long, void *),
> > >     if (err)
> > >             goto free;
> > >
> > > -   /*
> > > -    * A small set of old UEFI implementations reject sizes
> > > -    * above a certain threshold, the lowest seen in the wild
> > > -    * is 512.
> > > -    */
> > > -
> > >     do {
> > > -           variable_name_size =3D 512;
> > > -           BUILD_BUG_ON(EFI_VAR_NAME_LEN < 512);
> > > -
> > > -           status =3D efivar_get_next_variable(&variable_name_size,
> > > -                                             variable_name,
> > > +           status =3D efivar_get_next_variable(&variable_name_size, =
variable_name,
> > >                                               &vendor_guid);
> > >             switch (status) {
> > >             case EFI_SUCCESS:
> > > --
> > > 2.43.0
> >
>
