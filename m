Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795094649;
	b=oIggxDigWhojQdzn5sFM/pPsJMVTIFlE7uZktRz7c/1pXkmlllC2iwwB9lZ8nbTDYrTd
	 Mglv7BHwOzWYfDED6j9gGTSc7eV/g3Y/kiv+dHghZ9aXU/9Pk/QtRT67K1X4VEAqkLk0q
	 5bMVgizik8D9ocmm5jlK8a5XlRT/ueFM5M2yepKe4ujNv/pIXxXW+hcnbkHuhDi02EmmO
	 ubUWYu29uANnkKx7TA3TbjhYdiz9csGFnX5i2oBMC8T8ZdT6Xz50y7dxo5V4NYJS055iC
	 PNjt/VpH3bZ4I+IMBPvOqDCMqT1+0kB8ygIlaNYdHPixmzDdV5SyjA4AmKeVZFo647w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mc3A7vlsW7JssIN0XeC96WxSi0wSNBfvSMrsmA7bSqs=;
	b=mYk36pr1fHpibyhmQUBb5VTdDcCNd2Y5ueg/gjAoPjPjgkauVIJI5KCxOzqToiylEjoq
	 4mhP5XdryHQTft5CFk+9stnyY849eMBad1D6LDjPDdRsDqfVgtWUAy3DTOSb3tJIH5sEw
	 4eLFpa7uN+1FzFSvvIJx9461IoprYOoM544kVMp+W/rMT2tw+jnBOTmEUh9r1gzl8+3Gx
	 4AFg2krDDTPC29RuF8dgBTR4lQrnsVNJLDBj4nmFLQOhruodt+OU+KWXYxg59d4l4gKcG
	 a3PKf3LQ74JxPpMmY8tE2r79qOZxXYlhT3/DCTGatAPJPICPkfMLtY9dzDjCFWBeNeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ohQxkIHb;
	arc=fail smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039ED60A261E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 039ED60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ohQxkIHb
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5042969eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795094648; cv=none;
        d=google.com; s=arc-20260327;
        b=Yk/rquXfKpmoY9Yuc2J30aPI96Um2Lr3PrBGL6Xkvss5qZMFdmJM5Su1/oiKxU8zNO
         Z3YDH/W1pE0AKyUKwp6E8erdYtlkTfjq4cxgD3c3BmrcHvnVb4KYKiKArI9DcxyvofU0
         ixqF5P7B0bSSYzZuVzl7FYLGT4SRgOE09wiKpHbwk34JP+4LyYy9AFdLoImc+mC1q94M
         7Vyjtj+V/2lUsGPNr808NVtzE/qhguiN83RTjwQYi/Rtdgq+NeSHGAJR+rm7E/Ytw2VP
         sXn3W5G/uMFRX9d7KuJxt4gNKJt23VKl2nYAYsKxm5nMIG5+M7TLBI8fmvT1yoYFAIsw
         HGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mc3A7vlsW7JssIN0XeC96WxSi0wSNBfvSMrsmA7bSqs=;
        fh=ks1L6Iz5FGM+TPtrY0PDs4s6SjZw8Zz1L/s58UhpW5A=;
        b=rYEq1qQMz/D1Y1BNVV/kSdiNa8RtlzMfKxZMJpaysvbQhLzKx2BC0TAtxr+TorNhqS
         WbV2Nozz3xMmhtdhOXSIS0yJjGpjjZ3AJaZc7ds47+rTRQzj7bMAkrNRddoos1fIRbIn
         zlo7kz60gl/9wHgzcHHwT3WR3pWCru/v72S9zjxy7lTrJp3T8mDto5mV0W2RsiXNC6d9
         1AEGObr4KtrlDQ3/udt2tmVCd7qBqRodkqXfjVcAjf0N0JUrOYUjmCoT5oDezWAYL123
         45bglEl6TnJjFPorMasKTRNb26+RMB6+evaegJsJFNtqt+IOVzdPo3xm9s1u+NGkSJyf
         L/0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795094648; x=1795699448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mc3A7vlsW7JssIN0XeC96WxSi0wSNBfvSMrsmA7bSqs=;
        b=ohQxkIHbfFyDyIxYW9q4LWS0JyCaGn48AkjZiAt6P4hauUtnBG8ITWl5sa7P7Qq6Yz
         l1YxudrCQY3gubPaig74j0rOJlJLwwUI1okCzHdn73HvDUcw8Qi5xOSKahFvrY4FbUbP
         9ir8bMZDfjIb2T035cHrr3koqY3lXIeJc1x3YrIQG5j/FEdZeCHBOIQKXDPTKJfmOej1
         L13m+Mc9umgXPOCZQ8MXgX+nXtL/1Cic6UcstYnKaiJuEk/MIpoutNARisjpADJOIzSg
         qAZ2/Uh+z8QdVDYD7Lkf/3AYVHruZ3u9m4i2rq0XRqtU0kTkSZhZIrdQtJl2uEmujd/K
         h/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094648; x=1795699448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mc3A7vlsW7JssIN0XeC96WxSi0wSNBfvSMrsmA7bSqs=;
        b=0ZdbGAbeI4UOw54yfffRqMNV4lTEBXIa0CK2axGVE6+sDUCxg074v2bTP2kGHQgwTs
         Zgu9EUiOvCSRcceSqvg+ZoXV1b4JRT02Kk1x1TcqS9DxBKEpsDsZSUfrC8lJC8Nn6Chw
         6oOHAuagB8v4z2SKb0EZO5e29DawLhA9WHWnJISCk/CwuH5TJkPnP5A8Tw8i0mImbMVl
         bZ342n0UnEgMdfoi6wrP61UNpaP4XvU4ytAzuD6VobBOwbaqXpPdi3U8+Hhm8MUex++y
         YMjPFYdl11YVN+EkIoYDWDy3ATUFyh/B7BwDduRxWVvBoRvb5Pj2sNQ45/I6CcgMO4YE
         v7Ig==
X-Forwarded-Encrypted: i=1; AL+hErHQQJ6FYtqji82tMf+5k594rixEok4S0WJVppCy3UlSBIps0nfZEpV9wiUu9vRwOVPN8YooBJDiE3IkqxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r4fpWUfWBgLiCsbi1InbXxVYHDDBxDYkyEzHtfNl49oGXZktO
	9FS1K8oV8W7ThEgPrr06owASXK0N7n63yVXjTC6q29hDeHZeqL0rg4RG84+JnIPuUt5w0a5FUZr
	VacH95jV0zsgyneAfKXc4oZls1ANih6U=
X-Gm-Gg: AZFdTZf+eU6Qx84VtB36iU76uJC22bRfAvz9kC0FxkS8rUqkLMaoXile+MI0bu4Gpw7
	iwo0lHOmjkkjkDhOU3Qp/eNfKfl6BZT5izYxpDxE+B3fpcByYzow4M47r7WmOstl7hWK3gpBPGt
	iq/dO4flwoE7W23C2DGgvaool98crfaR57RhhYOhO8+gcGFbpkSjU2j+d7+bXRqvkZNSOfXgt2p
	uevjp98TAj5lsdz9nqMH0tFVvYnhd3o/DSViwlSVwqWjLXWic783ga2v3OLkYTF7LNTfh1HL/PR
	y0cdCkFpBGtEQaVVkSAIZUz9tHrVhiwbyZ7m0fvnohc2BrNnMpN9OPH9e95rQq13zn2f/r55iR4
	BSD06s1RpaTgdqWNwMaqVDd3UAY0QNl3VEViGAIb0JqMM/VXIyt7p5Wtik+hvl+iiQ/NI
X-Received: by 2002:a05:693c:894c:20b0:381:2f5d:a696 with SMTP id
 5a478bee46e88-382815231femr5552211eec.34.1795094647673; Thu, 19 Nov 2026
 05:24:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117104110.240112-1-hj351016@gmail.com> <179508442284.48856.17227214993153041326.b4-ty@oss.qualcomm.com>
In-Reply-To: <179508442284.48856.17227214993153041326.b4-ty@oss.qualcomm.com>
From: khj <hj351016@gmail.com>
Date: Thu, 19 Nov 2026 22:23:52 +0900
X-Gm-Features: Aa3M54pq8_LNh7uQ__eLE8hy46Sn_JzIFh689mI7Grw_bv_tYKUKVMqusZDjKC4
Message-ID: <CAGr5VtPJq10ZZoF71+714xrkC_-3g5JAEKfXXXx+6MEY3PN6bw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Mary Strodl <mstrodl@csh.rit.edu>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right, sorry for the noise..!

buffer[2] is only read when there's no interrupt-in endpoint, so
rejecting every short transfer would break the devices that get the
status byte from the notification instead. Dropping the patch, I don't
have the hardware to test a narrower fix..

Hyunjung

2026=EB=85=84 11=EC=9B=94 19=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 7:33, =
Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
>
> On Tue, 17 Nov 2026 19:41:10 +0900, Hyunjung Ko wrote:
> > mpsse_read() reads min(len + 2, wMaxPacketSize) bytes and then copies
> > len_actual - 2 bytes to the caller. A device that declares a bulk-in
> > endpoint with wMaxPacketSize 1 completes the read with len_actual 1, so
> > the copy length becomes -1 and memcpy() runs far past the one byte
> > buffer on the caller's stack and past bulk_in_buf:
> >
> >   memcpy: detected buffer overflow: 18446744073709551615 byte write of =
buffer size 1
> >   WARNING: lib/string_helpers.c:1036 at __fortify_report+0x6e/0xc0
> >   Call Trace:
> >    __fortify_panic+0xd/0x10
> >    gpio_mpsse_get_multiple+0x767/0x780
> >    gpio_mpsse_gpio_get+0xa2/0xf0
> >    gpiod_get_raw_value_commit+0xf8/0x1f0
> >    gpiod_get_value_cansleep+0x1e/0xa0
> >    value_show+0x42/0x90
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes
>       https://git.kernel.org/brgl/c/f94f85f82e042c89a1e64ed3ff1d591a2bccf=
a7b
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
