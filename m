Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795756301;
	b=0O/GYG9dC9ORvpoBQzbWI7ZmH+loJhtOpBqe0xTooIbgxjt5XcchqBQTDgPYFD2EB/AI
	 JhtdJ2Z5p8X4sy0NwK8Y+Q/cxabCVPiFePmJM82OkCSXpU4LcLSHWENM+gZCl+lr4p0mH
	 h15f/PkcieWK97/nTMWpBlq95fP3oWfwMOrdud3y+uVs1sVfwDUpw/HVWzFDSruajeCJo
	 bAKHmKQLt0jq+sDEZmO5YopIR/84P6sbZMB0pdW23Q3WPEp2qtudVLt6tS81waTky27v3
	 iRJaTBbectsilhQHSlMWUftc5cq+yIqFJKoj2cj75/vl+5L5JjJsQt7RUZ4yCJdPLfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qmFinXlRdGL9t34+mLPwrAd0judk0sTSkDIqNRwhWAw=;
	b=uJkFwRtnpNZblXsYklWcftwBomFxZhKPcCKnpYxKuxQfd4hPEYILqeMGjyAQrgcTOfGq
	 wTv0gX0JHWTJno9gxxsANp8KqRt04G0W3MrUli88YV5WEn35IkusUuuk/p4OtLMHoNSat
	 5H97GWvgnlVF34r7Q1H6qUBdFUEMUrhAId3+jsZU0ZTozSN3Fex8BAVhV3i+1aAsvZUFN
	 2U3eGHQIW6FbSSkDvrBL7OvK3S/m9Z1v0PI46TMsFbFlZnmZbLVqc96uXccZ6vSkPnC8t
	 gzeP4b/VhB0wtFA9O6BrEhS9e0XsG7I9xVBGoQe3y0z9x+7AqEJJem1EkJGLEY1nEsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOD8TyNc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E0C606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1E0C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOD8TyNc
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3acec6677so11730065c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:11:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795756300; cv=none;
        d=google.com; s=arc-20260327;
        b=UAD+PigTgGbtHUCXmeAVN/T0+GZ2ugfPcTKczBCmQtkpPhQI1OdJV8kRWqMS6llhhV
         ox7wX1uCMCq8/O/MCbM7Qbq+FQdYAiTpgTYZk3nqSunUxTlO9AlJJcjkbQ+Oc0Cg4DxF
         ba/M9kUOu92hIrBS0i8/ifMff9LwjhVEfymculPmCrc2LZoINstNmNzfuX6XL4vPCTX1
         5l1bugQS4gr2dn9/GY4Qx/YU6JOM8cen1iGPQtj3C5fMQK51aEJ9DlAfwURTL5Iw64BQ
         bF+uJ99tpiSgyWB5nEs/01HpLfvYtrchQxC5vBRZs7mon9u6zP8UYbgQZ9IZxyvWeZBy
         8D3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qmFinXlRdGL9t34+mLPwrAd0judk0sTSkDIqNRwhWAw=;
        fh=XSlmKOHoSaO19iT/y9ECZKMoyxYErBg6j9RqmT3t7lU=;
        b=QgZQpr44AyOs3oHWVWp9fZfsURqWwmiZkaGqctWzipJzdIgF4jVo6FqGysFMfumtiz
         gV9tgZnFsIPggDa0LlGfvZE5RDH+mr8hkrzbZYKQummFmxsc6woaMbX22AzoYDA/09tj
         OvjVhi9c/lfIUAEsZ30iqM5ZLWyqfuFdzuRMzv23xzX/pw+QictyG4e/lRXXWyfT1Lu/
         nCnKDX775qc8YPKflyDwDhV4K2EEixPmsRJdLbs75tVTYZpbKclBXWb+t+dnY4IlZHWH
         ubFC4zAd4JjGiNqyxk/layyyZayhINxhoS0+MlcJhC9uFzgsVQQbbNDDxtoog96jXVfx
         A8Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795756300; x=1796361100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qmFinXlRdGL9t34+mLPwrAd0judk0sTSkDIqNRwhWAw=;
        b=BOD8TyNcZN983BLpvCaoE7KEH9OSMQWvE1uxjOE58sGkTnhvkRSxqNCtzUeb4JCLbD
         DGWln2zxPhYbh9HiZoMmRJPYhBT654feOs5WV5DJa9KMzGQHCJF3AEOkm/ipYrX/p3b0
         iz3UANNhR0Du2gasf2+qwYrLkFCaXMr7QQVE41fGAD3hXVBZhOAsB/CUBT7u7VOD2+Kq
         +76pAtBadMloSJ7GizpXubPlsePq/yh39zP/FnfK/0qIZDXVjLEwTOn0LGynDXEC4G27
         G+RwHnnh5qz9a9Vs/j2HkCMN4PBmqWZx8bJ5Xlg2mGi8XVVz+QAoxC/u6zbebUnXGc2k
         2G6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756300; x=1796361100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmFinXlRdGL9t34+mLPwrAd0judk0sTSkDIqNRwhWAw=;
        b=dXpyqTrWRZwItWcfUB3rvzZEWdVFw6O4NCzCnSPX2BqMUqVP5AUm+vtQWlRLSyzhp4
         Vq9+ckoKItUXEAbhT5Mpg64mjkfw78INNvqbC8+J0+nPvi2PhOpkR0BV4GPaw18jKi5+
         vyZ/ajh+rI8tv+zc983SVEt/1azqgb0+HYfTSlxQljwFH29JCjax/6fv1/vwXVkfdzMU
         MOsrF/VM56sEEH+IKXXS4lNEjxdK2ry1NjRMRjSnK/fv86dTyqH6mG0s9d5/aoTxYUQs
         FCR4xBv0eBTOLNuPVvvF78fq0ZA4hNIDvrfVJQgA5C1Ex94IbDQHjtVrVTDmgr+aMfWZ
         kZtg==
X-Forwarded-Encrypted: i=1; AL+hErH5d27+VYGLcC8tMzsYh06+FLeSZUq+diAsl3PJwsB1D+YEntHV86gc/kCzWlHwgiXz49AVtgJDHQcCSCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YqaKmUHSgu0rTP+A4Tcjz8y5D+GKt4reNZGZo88aB8kwogE8y
	DSNNm/SSVPyhyFcJBUVhDdFQcSH7/ChOyLMRYcGFp2TQ8/XjKPgsedL6E2FVRpKF2LLCdCsklYF
	JxIloHj0zR4gcCuRfG6xanoJTLTWJXLY=
X-Gm-Gg: AZFdTZfXwjAYMmkMDX2u/NjlAGwuBdID/anXR1ma2jtL/vu6iZbkFtglB2myiyH2DPP
	x3H4l3sYB+O03aMj7ORQBiA1gQy25NO6kkrttJp9Mo6igqby2sppLF5CP4jLeGHQmj9bGGIzakH
	baPbLmO9sXMDQI5Mj6e5o57d+9QdoEpXVMt+GQ/LwMVAxLZFrh83yoyzRKQ8fWjq0nfPGf2Y/W3
	d+YQDTaf1XFPuO1aq2ObCn1KsHJdd+HaGLckOCzzzYaFiK/RqlduD0dZ5p/2w9CDHW1IKNp4DN7
	WtEAcIHVYoPfntzFYdpiAdiwv2x6I03irCtL5R0gvRyhHRAA3lg3FV+PvUWQTZ26ynVj1RzjXp3
	WjR7Jzyba6J7xCODdPSsX42KQtJPJgQMsyepryfv21Fs9tagEe0aAn1G5Gn3pjwpz7XHC
X-Received: by 2002:a05:7022:299:20b0:1b5:7c7b:c1f3 with SMTP id
 a92af1059eb24-1b57c7bc2a9mr11684307c88.15.1795756299924; Thu, 26 Nov 2026
 21:11:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADy1qsZaucfiZPbMkLaXE=_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com>
 <awjwkhoHNOPcHz0o@hu-petche-lv.qualcomm.com>
In-Reply-To: <awjwkhoHNOPcHz0o@hu-petche-lv.qualcomm.com>
From: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
Date: Fri, 27 Nov 2026 00:11:28 -0500
X-Gm-Features: Aa3M54oUYQNaKcIPjhELzJMo12Yt9TjJU4-cZ7AYDd5pB9PvGwmXBVlBMZtq_nQ
Message-ID: <CADy1qsbhYnvSoV_M6o2vWk_0-EjVxtw9oYJTDWazeSS2ZPTabg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types
 on unbind
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thanks for the review.

> - Change the name from "dp_hs_irq_type" to "dp_hs_phy_irq_type"

Done in v3, for both fields.

> - Add to Cc for stable tree.

Added.

> - It is not needed any more.

I deleted the Assisted-by lines as advised.

> try to send with patch text.

Sorry about the attachment. v3 was just sent inline with git send-email.

Felipe

On Thu, Nov 26, 2026 at 9:53=E2=80=AFPM Peter Chen <peter.chen@oss.qualcomm=
.com> wrote:
>
> On 26-11-26 14:41:24, Felipe Infante de Castro wrote:
>
> Good caught.
>
> > Assisted-by: OpenAI Codex
> > Assisted-by: Claude Fable 5.2
>
> - It is not needed any more.
>
> - Add to Cc for stable tree.
>
>
> >       int                     dm_hs_phy_irq;
> >       int                     ss_phy_irq;
> > +     unsigned int            dp_hs_irq_type;
> > +     unsigned int            dm_hs_irq_type;
>
> - Change the name from "dp_hs_irq_type" to "dp_hs_phy_irq_type" to align =
which
> existed code.
>
> Others are okay for me.
>
> I not sure if Greg could get the patch with attachment, try to send with =
patch
> text.
>
> --
>
> Thanks,
> Peter Chen
