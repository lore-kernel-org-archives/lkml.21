Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795183171;
	b=naMjYHgFA7DWQaZSn9Gn0ovNa14fd5Vue0ZLui+C1KYcikintuErqRUpNPRv8X6HrGvx
	 z55CZnEYdbGzmKqo7KNvAiCfIGwx6ECU2GFBf4kykVGBifQcocXSTYncFn1vBLMKhplfB
	 CgWfrlL2sE3oP0yUUbTegUYH45Lw5pHe3keLtTVPC4eIdf0zy1waljMmeKBijnm8X9QD3
	 Ulmh96BTnuFx3mnMA2/cxCMEGFuqvTXkuUKEaczDDGlNuVieEzt7QKIYvS+r7dqNCVxU8
	 egJlCRT96+jGdqFR4iqNw7jxdjdJEv5nBVZUJzGgWXkcEx3/MgdswqxJxPOBdGQjcng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GyVRv/CGnOjgyJQ3q5z4bGXS+biNZU7h7VocVSVeF0Y=;
	b=v/Y9QrmonthOFWbm343Hvb14kDBeId+cf88z7QgRdt14dOROwT6tlId2PgA3srJLLy+c
	 yQg9VfqtLH6lasOiQzU5iONGPHf2tSEijEbX7BkYfVraLkJm7WvKqKlN5pYYrM78rne8o
	 gNxTv9XoHHRiPZSIR4gbzzxTEjm177vN64O97xswPSgnGuAyajytqVQsLopL7XhTa5VFz
	 TOICTfeatwOm0fMvR4QqCT+xupit6aVR2xrmdc+jtbvfWU3HnhmE5Inn5x64WBuDXwH2U
	 dwV5dncHIuyMa6hFR+CfFfIlex2aXezNW23EYmnVRXa4grazeaScLkB2l5/by6LEEXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvE4oT5W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD4F606B9A5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD4F606B9A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvE4oT5W
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6df5e315bd1so811151eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:59:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795183170; cv=none;
        d=google.com; s=arc-20260327;
        b=sCFCLtwrci4aAT1J1BnN2epiARSrBV7mEVE/00EumLxdnO2u+IBVk01TQGY89tR1Zl
         EDi73GtHw++HMejn/ttKkqtLCp+o13p/uHyYwRDLM2MSSfICk8QLyh5+NOkWvDMrNUst
         BcnOeh6NRZIKTqiitu3/xYpwe41E6pnGmQY5MMo7zyePyOwcrK7w0aZTmjVXgxUdVB/A
         K0f5WDgcZupLJovCGrdTlnP/tg5RSTCiXZW6uKzcNSFSJEha9+djOjTOKVE2WGVuJIHI
         y4hw/+kXavdC2hIMRtBYZMo3/0bikPrz36cs69VoNqIofVxFmITfWR08KXZCJhULTd4w
         zB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GyVRv/CGnOjgyJQ3q5z4bGXS+biNZU7h7VocVSVeF0Y=;
        fh=jFGzst4EoOQtNy7BpujnEZoaCSydJ0Eq3FFus+bKRnk=;
        b=EX7dw0U+QgEzfyc2OqURGh7tShdVh0HfALCG/OklDl06ARQ3oRpQGZa+yxrVALUiLy
         th5uP9ygFMdUlGJc2ZtPII22RbEFofOC9G0lBSTLpnm47U2qDXZlN1AI3TT8WuMhzyJF
         n74G6MiQbjg2JcGv50r1TD8QYLgvEjfZhswXjLhxX+MhtnXkuTSaLxgwvRsy1HRpKG7/
         3UDjrsBo7Dj+gUPoq4SpNrVn7t2l6T4SUFUAIdTCQm2jkZnAWgi+CSLYFASoo/OycCUp
         x4DSNWAWuyxfGJKrKe7FVA2jUGes8cPNYorbAY6Qc80l8OJc/bmUk0LHNRbAAkLGpUcc
         NNIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795183170; x=1795787970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GyVRv/CGnOjgyJQ3q5z4bGXS+biNZU7h7VocVSVeF0Y=;
        b=FvE4oT5WNuD76Q7AIJYfkBzPg8slJLrz/vS8FoQo7Ih8vgb1L79K2m+R+d7nBhJ6+g
         JEZ06vWgz4+I5zZVoaGN5UNaj9NvlatKL7T3otDyg4mcOR/DT5PpHPIEyhJbC6Tfl0q+
         mMytsqJk8j8EPaZTS1t7AsZcq5fCirj/Uu281sEJ/7uBF3Hyb5Nyu/P3xhkjc4FZhYKK
         y3RYmhTtriZlqXmwh3AQdBDuoJRApP/OLepOLk0cbb7jxHjm3Nf83PDlwsprVK2+6Q+V
         tBzivdpct7wvGO5Dt7tS0mXEOB0W/MjohTcHmTJZFCOYOAzml6dFQx7yO1/oxKeFvS3N
         YeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183170; x=1795787970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyVRv/CGnOjgyJQ3q5z4bGXS+biNZU7h7VocVSVeF0Y=;
        b=Q9+pmxVoN+Y1RgFKoWUbL/UuigHQzYKpdreZ1yUk50daH40v3e/6ZmRsCgNGA2MWNl
         odvf/5ULBd6qZ/CnQumHiv78552hLCVe1cSx+zD6sHkifYbqckC7jBcKw/+fXlQyjrrV
         pkTrq/NWzrn+aaaIv6/H2KwUA+2i1bsUfPjwmK/C0iwhw9WCaxtbXmLot7PUeqViZi5u
         Lvx4h5tcP0MUOxYc1XAlywlc9OBStmALQ1xIUSA8e4sP5Nvm9lRI16ilsxyedYhnWe6/
         P2N7q4LJ/vDVvH4Snv+mymSIISkCMCIEmT3EpNIFDFM+pJqWnstBx5J9qADTgOOTsx0r
         l45g==
X-Forwarded-Encrypted: i=1; AL+hErHJtHTUMCj3JNx/LA+y04RpU0bJfEIbf1d8AbFEogfwgWNkkhtI008N8rKCzjk1YoMJ1ueSVCO+BZ20zX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fruTPFl0o+45ngJArozpxxQTd0WJMoqlX3hHmm9RFKBxD03QZ
	VJLxGbtt09EEz2d6qPfmqajVkeG/2WpjMDnYJit03EwgdJZUWu9zT9Z4C9meqdAq/Q2CsaSe2Ux
	1gzb6jDjNV6bJ4PcAIALuVC7vnhMivWA=
X-Gm-Gg: AZFdTZd1oAVRtOkmmMaU7RxCKsPhpTarADSTVpDSJOOhBbkeQU7LRMMXBdWGxyRF352
	IM6Di3HCBg+xhVR6498FpI+M7NptKGAlmsvEj699zywzHPiG2pxbNIG0nbnhnMAfVbbXk6kITA9
	JZkVXwFNf5ilIGJpuN9RJ85rJBA+r4d+FA5JnrAe0YneFvesuXgVcc2P4rgpyvEjfpudqzSCOYn
	ZbOIf95g2Sh6EJvrwFGhlUnyOWypjrxin+F+uo13wS3bxUQXo3uTrbRUM5Y2VCEOeEjxQjG/2aO
	gOnfdQHSdGZKq7jhJehEZKq3L6/Bm21teEHBhWbNEdRBKaDfNrRl2MtmyBaEAd9DdDDGWtaH9dj
	WELq5j1f4KgIM6MxbuduSLItdyYBfc//B6xIkRnw=
X-Received: by 2002:a05:6808:16a7:b0:4f3:890b:5fee with SMTP id
 5614622812f47-57a0a4053acmr3862923b6e.16.1795183169924; Fri, 20 Nov 2026
 05:59:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175710.19181-1-vikrantyadav4802@gmail.com> <CAD++jL=0E8+H9A6M4r=+_P5Q6BDyL9J0A6DDZborrMt0ioAZkA@mail.gmail.com>
In-Reply-To: <CAD++jL=0E8+H9A6M4r=+_P5Q6BDyL9J0A6DDZborrMt0ioAZkA@mail.gmail.com>
From: Vikrant Yadav <vikrantyadav4802@gmail.com>
Date: Fri, 20 Nov 2026 19:28:50 +0530
X-Gm-Features: Aa3M54psM_pWxs9m_9RKrfNWpbmCodZhUW7rZuVIdUL71nTkadvLxIio0x3fNP4
Message-ID: <CAHjiWjLdHxkq=1wxM-ai5fOkNW5r1GuvEnFwhAS=y5h4O2q+Fg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix bias readback in airoha_pinconf_get()
To: Linus Walleij <linusw@kernel.org>
Cc: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, lorenzo@kernel.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Nov 2026 at 18:58, Linus Walleij <linusw@kernel.org> wrote:
>
> On Fri, Oct 23, 2026 at 7:57=E2=80=AFPM Vikrant Yadav
> <vikrantyadav4802@gmail.com> wrote:
>
> > In airoha_pinconf_get(), the last branch of bias check
> > "else if (pull_up || pull_down)", has no check on the requested
> > parameter. It was meant to reject PIN_CONFIG_BIAS_DISABLE when a pull
> > is enabled, but it also runs for PIN_CONFIG_BIAS_PULL_UP and
> > PIN_CONFIG_BIAS_PULL_DOWN. When the pin really has that pull set, the
> > earlier PULL_UP/PULL_DOWN checks do not reject it, so the execution
> > reaches this branch, which returns -EINVAL. Reading back a pull-up or
> > pull-down therefore always fails.
> >
> > Signed-off-by: Vikrant Yadav <vikrantyadav4802@gmail.com>
>
> Maybe Christian can ACK this patch if it looks right?
>
> Yours,
> Linus Walleij

Hi Christian,

Just checking if you got a chance to look at this patch. If you want
any changes, I can send a v2.

Thanks,
Vikrant
