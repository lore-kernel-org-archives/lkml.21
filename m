Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988799;
	b=hL6WEeY77cwQCZf9XOH0EVFklCwqpdiw39RhQNfi1W/TgWzI+xvlW8K6d2y/P8lZRI8S
	 Gz1iWicWHCA4Tqzmegw48Ct6ynkjExQCxs95yu7XG5ca8vyqObUBzWhNDAXoEiC0bKYYN
	 7EFFwIifXvOXZrvkQovz0QZG3sUyzIDGAu8FbyoqD5pzMjsDU4Xcy85zADR4GrgwMjeg6
	 3aJTfetES28jV63Qg6bBNX+mnqEXODRas+3F4d+qaGlTGLT8L9oE4BXNsW+hI7/6NGGu7
	 DQP6ick8IAiwQk3PEeZYNpYQ1rdg6J+F5DRGSK71758AFRqlWN1esMuwSfJXcivyU/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=72tGctQSJC3sovrJNDKUw4VsbC0GPU9rXB9Nz1ShMzs=;
	b=ZhsEo/Y5FbTGkD0wvMgejIbvnqErx6is6dFBhOlMs412BwJSM3QSVwFBTYIv90SxuQ3E
	 qyc/awIhxMHcWycbnm+dwanqcfmulxAw54x8MFIHrwRL0zwhHfaF2BhlvYaxPC7Q8CZGh
	 GftsgOzjoNzGrvO5KPS+tN4UxOHO8BEZfydhCinYFAuooG3Qtpw2Gxjzs3CiXkj2xaT9f
	 +aidevydCb3Y0L0ZfnMwfz6LvaA8snNfQuT6R/SNtT9yoUpAs2xUi3eboBVCfvG5EK5SW
	 VGJ+2qFFDrmSaI024HspE/FJ5GiXqqM9g1PwUAD790CVGq8qTclfCTMhaNSP9j02CFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Uq63F+mG;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A9C606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A9C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Uq63F+mG
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso361408a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794988798; x=1795593598; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72tGctQSJC3sovrJNDKUw4VsbC0GPU9rXB9Nz1ShMzs=;
        b=Uq63F+mGUdnOCuzr6jxVFIqzxqY3jT2j2B6h5/mVYuQ8tldoG47usv+jjipwy41yZ2
         qn4+BzrJnjK8QTSvt+QX6lNCMeWpHKpPvX8BgNXWPcaMDJOWJ/Taa8DixmZ4YMkA4+Rf
         GaduIWcTZtR40rkj0Ms1ZNGk40Jp2oZH28Jio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988798; x=1795593598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=72tGctQSJC3sovrJNDKUw4VsbC0GPU9rXB9Nz1ShMzs=;
        b=ARq3D+dPpKR9474HxEpdTRzS5nuoUqQnR28p8JOrAHMauj12Pi3wmp4ZDNP+TZwmY0
         euFe/+flKmQBTBxEG40qChHIDhkm9x+NNGNYTkCe2eDbM9bpJvYZkoAiNOwu9dbARYUL
         zlcRqvJtPxBkgg8hnid4Crxly/U1qP2y1YACSCZZfQHK90vZNZpqf2KjLaaCjH6FpeHm
         YcYVZVCiPyAb456K1Wo/MVIE++zH4pLpRt5JWRVIVEWJ1k83+dgDbwid72voYdHm75DF
         sKjCAOMCsLViKC6GQ/CPKRo8R9INNP3S0ZS16G2i/jKBcgPW0Cz+1KispAnfo9fYqkYI
         HBGg==
X-Forwarded-Encrypted: i=1; AL+hErGtTWpO9jB9DfMNc+osvqXobuSzGvNCP+Flc65FyLSn9o92ak3++sfMhFpFPNVUgqkxvoPQhJyXVJv0Fqs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EBkgHmelx/ijp4T4nmFRfOvN5jkLZLIlF1E+FFZUq+apvVfoS
	9A1EBKEM+k9miTGp8BzVNA0LhbxJr61nvrfVx6Cv9FrM2yXPVSM6fMvj1wsxmyrTgr7Ya+AYhqw
	FYXZ6IBbf
X-Gm-Gg: AZFdTZcmXEDFH5tunHzpa4PVTSvwni8k/YYYqwMMLpHbOXonKx+gD9CuKU+AGFvQehQ
	rxtCRSX/oxuqrC0Bj89JdD9qfDIJNQuH5+dw7z6mXqH82g7w7wBOKJi/Sb/C/S3ajyELSw1+dVv
	hwE0F4IxF/c1nV+hFeJr8Sq6EUhmw/eqNdhPsS922gFSX4JJmrns7kNVCOdyvJZpZtuBUCi3njg
	qaAlXpBxnJoX78iHBuxMcd1kqRUoQZ5UEeGGSRzp37fGpOTNnNYR3uJwvx3Htb/ti4Q3NCMaA2o
	sLxs1tfRjsk2N5+pfvSK853QPnGKulyZjp1nZYT55m1QH+kl+k4bXzEwaE5p8oWtqm2N0KYqQT3
	LwcLG4B+QHUABiNz9A75Sewz/2y8icXkZP5CukjPrc1lPOVoF4HrBGydLmskhsvF6uvcSWsKwRE
	r+E7wIf6LmguDXRu94uL98IBMTHk7E4Y6Y0tOAK1ZjuGL3duLCEnUBelHmVcWffkqsxTc18rf4C
	m2W7B5nqRgS5QvjVphvc6JNYpaocaGbqhCyl20pYHHEE6a2WEOus2juxKW2pca+demtaVWtdaWL
	as2JU+UR20tedp8HHWgDMYFqtLTFTrM4K3MRwoX6TSWLF6+6OycFW/J2jKxqqRIk9rE=
X-Received: by 2002:a17:90a:d445:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3b3d07d4352mr1794223a91.41.1794988798034;
        Tue, 17 Nov 2026 23:59:58 -0800 (PST)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com. [74.125.82.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acd118sm3028249a91.12.2026.11.17.23.59.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:59:57 -0800 (PST)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-170135e43c7so1150502c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:59:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGSjwnzhJBgsDWsRSpkEAAqyTMOHl25XyeH6ZildW2TbI5A6pfJcnV8tge3EP8xsr6rUM3hPvJskQwJO8o=@vger.kernel.org
X-Received: by 2002:a05:701b:21d3:20b0:1b4:f5cb:ebe3 with SMTP id
 a92af1059eb24-1b543beb815mr1824249c88.16.1794988796147; Tue, 17 Nov 2026
 23:59:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118134629.463042-1-shxzhaosr@163.com>
In-Reply-To: <20261118134629.463042-1-shxzhaosr@163.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Nov 2026 08:59:42 +0100
X-Gmail-Original-Message-ID: <CANiDSCuFgmeFyLt5Bjy-WZAWXVBWwsZxmTZuBcf_1hmVGDjkfg@mail.gmail.com>
X-Gm-Features: AclHuK8OLcA5-JmybD4qQm43TUB5nr2Qa1PGlP7CqD-OYUmqV619UG_T_bPxNfA
Message-ID: <CANiDSCuFgmeFyLt5Bjy-WZAWXVBWwsZxmTZuBcf_1hmVGDjkfg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: reject descriptor walks that cannot advance
To: Shirong Zhao <shxzhaosr@163.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shirong

On Wed, 18 Nov 2026 at 06:47, Shirong Zhao <shxzhaosr@163.com> wrote:
>
> uvc_driver.c walks the extra descriptor data four times, advancing
> the cursor by buffer[0] each round: the frame descriptor loop in
> uvc_parse_format(), the skip loop and the counting pre-pass in
> uvc_parse_streaming(), and the format descriptor loop after them.
>
> buffer[0] is bLength from a descriptor the USB device supplied, and
> nothing constrains it.  A device that reports bLength 0 leaves both
> buflen and buffer unchanged, so the loop condition is still true on the
> next iteration and the same descriptor is parsed again forever, on the
> enumeration path.  A bLength above the remaining extra data walks the
> cursor past the buffer instead.
>
> Add uvc_desc_walkable(), which requires the two-byte descriptor minimum
> and that the descriptor still fits in what is left, and use it in the
> four loop conditions.
>
> uvc_parse_control() is left alone: it already carries
> "if (buflen < buffer[0] || buffer[0] < 3) return -EINVAL;" at the top of
> its loop, which covers the same case there.
>
> Found by static analysis of the descriptor loops; not observed at
> runtime.

Your new checks are redundant.

Please also include the driver caller to your tool:
drivers/usb/core/config.c
usb_parse_configuration() already checks that each descriptor
`buffer[0]`  is valid.

IMO what could be improved is that our "field parsers" do not leak to
the outside the `field`. Something like:
7fa44c2c123c ("media: uvcvideo: Bound uvc_parse_*_control to the control size")
but for uvc_parse_format() and uvc_parse_streaming() and
uvc_parse_frame(). Unfortunately, the change will not be as clean and
self contain as uvc_parse_control(), so I do not know if it is worth
it.


Regards
> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index cbc1456..57437e1 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -332,6 +332,18 @@ static int uvc_parse_frame(struct uvc_device *dev,
>         return buffer[0];
>  }
>
> +/*
> + * A descriptor's length is supplied by the device, and nothing constrains it
> + * before the walks below step the cursor by it.  Below the two-byte
> + * descriptor minimum the cursor does not move at all and the walk spins on
> + * data the device chose; longer than the extra data still unparsed and the
> + * cursor would step outside that buffer.
> + */
> +static bool uvc_desc_walkable(const unsigned char *buffer, int buflen)
> +{
> +       return buffer[0] >= 2 && buffer[0] <= buflen;
> +}
> +
>  static int uvc_parse_format(struct uvc_device *dev,
>         struct uvc_streaming *streaming, struct uvc_format *format,
>         struct uvc_frame *frames, u32 **intervals, const unsigned char *buffer,
> @@ -486,8 +498,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>          * based formats have frame descriptors.
>          */
>         if (ftype) {
> -               while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
> -                      buffer[2] == ftype) {
> +               while (buflen > 2 && uvc_desc_walkable(buffer, buflen) &&
> +                      buffer[1] == USB_DT_CS_INTERFACE && buffer[2] == ftype) {
>                         frame = &frames[format->nframes];
>                         ret = uvc_parse_frame(dev, streaming, format, frame,
>                                               intervals, ftype, width_multiplier,
> @@ -591,7 +603,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         }
>
>         /* Skip the standard interface descriptors. */
> -       while (buflen > 2 && buffer[1] != USB_DT_CS_INTERFACE) {
> +       while (buflen > 2 && uvc_desc_walkable(buffer, buflen) &&
> +              buffer[1] != USB_DT_CS_INTERFACE) {
>                 buflen -= buffer[0];
>                 buffer += buffer[0];
>         }
> @@ -658,7 +671,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         _buflen = buflen;
>
>         /* Count the format and frame descriptors. */
> -       while (_buflen > 2 && _buffer[1] == USB_DT_CS_INTERFACE) {
> +       while (_buflen > 2 && uvc_desc_walkable(_buffer, _buflen) &&
> +              _buffer[1] == USB_DT_CS_INTERFACE) {
>                 switch (_buffer[2]) {
>                 case UVC_VS_FORMAT_UNCOMPRESSED:
>                 case UVC_VS_FORMAT_MJPEG:
> @@ -734,7 +748,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         streaming->nformats = 0;
>
>         /* Parse the format descriptors. */
> -       while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
> +       while (buflen > 2 && uvc_desc_walkable(buffer, buflen) &&
> +              buffer[1] == USB_DT_CS_INTERFACE) {
>                 switch (buffer[2]) {
>                 case UVC_VS_FORMAT_UNCOMPRESSED:
>                 case UVC_VS_FORMAT_MJPEG:
>
>


-- 
Ricardo Ribalda
