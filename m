Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429844;
	b=n5RXyiGy7qweYT0JCgyYkePIWxtffkA8SP4m9ZXPJRE2m7lYOcPjuQz7CEMmDxl4ve/M
	 TyMr4VXwQ2Gvoyjy+IP7hWPbssxpO5u+YH8L2RQvXMpsHBljaKq2MavXiggpMfJXqwS02
	 Nv7kTnmHfsvesTazQ07+MsSYSOTDogG0ABUb6KREckeuerRaA6n87+eRqeRJf5UviKO0x
	 x/UxB9zvnFq7pk7Lmevw/iR/X1sAdgLL2XiqKY+E8gsYrNzarcrIzhbbS4M5eroopQBCz
	 uvi6RCx6CJQc/oiESeWjyQeZPh1nr1Zq+UkchfmeeOIp6d8vWHi/aECXL+9vxFAZX0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=W/y+mYRMmfGOv6XxlcO5KmQFJU+5n6UFhbQYgX4LGMs=;
	b=P9MpX0XuMIlvz6zA87SoI6UFsUWwKFefZaMbEdwvZIRY7YUn5A6URHgs/yx9o/utiDky
	 UdVska5QFqDzbCdkWxXnEg1cT+jefoetWRBI3ULiJu/yfMK+Nb3DxTxPZf+GV+g4x7peK
	 uk8tgH1Zzh+62RNGu1OycK/oQ6Io4adaTJCnvb1VcJye9b5YjBCrrrtNoHCjj9u9jBx+I
	 0tjbIPoZbP/UoaFC9YRHmUjYWgyaGvLO+nHXp8fyXHjDi2Qw/l4wHFN3xDq/KWw4HnhyJ
	 BmKvRQGcuhK/OeefTh0HhorFQv+55g4vIim4eXgNco3aG7vN0oCvSOkW/YBDUlN5Ysw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CHAQ1poz;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9276D606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9276D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CHAQ1poz
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso2139245b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795429844; x=1796034644; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/y+mYRMmfGOv6XxlcO5KmQFJU+5n6UFhbQYgX4LGMs=;
        b=CHAQ1pozqfpoWy5xzrMDAydlO99gtw+0RzjrPPAPDCChfRy+E8yfV55sFDKQ/lEQUR
         7zMsiG9rUjllyrROL5n+zxpSc+oMBdmOJC9n9wVddzKAj/Op3Tgym2xaaArcJuJvgSvK
         2mqrRr4wY1HJkycG0uxSW1kf27hrfUXfCTNO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429844; x=1796034644;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W/y+mYRMmfGOv6XxlcO5KmQFJU+5n6UFhbQYgX4LGMs=;
        b=zxgCeg0yF4hg3BZQ+jgMJ2vrtLCh7DjRShC1d8LqGkdagjL2jtHko5vctXK0wbFGra
         iKkw2q/UCLlWFE+4e0iEH6OmIo9a/dSenJebfRDwpKxrLcFLWGzXlvB2D4x0jUI+YcIE
         428IfToXPRTKczRGXQg/jemQSrl/CHvbshferrYPnpnVu2F2Hg4OvnZ2+C3+8GiXDZA+
         5nYF8avGs8UOvKjwiN7ITGBdYwO56HSWQusO/T3/xYqVCnNAPpJqLgJ/zIGyCgpUH1Vc
         l+qWnSPulQRW9Ae/sVCrbnN+ge7D7jQmwRsNUBvDzuymodxQL/f+TX+24HGoVZW1xLBQ
         4zCA==
X-Forwarded-Encrypted: i=1; AL+hErGxn8rA8uDa7er81twrrzJXCKUJ2aK1c0jmkIfpxGbF2cnnZyEmZARG5vyLERYfl6Ff8SPbHO/2fEcfk5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rq7SITLMr0wKsd7U7tDrA6UoLwwb5DEorXXOEs3ryQ1x8BaU0
	6TleZkqyVEGuhPjko/0e+YvfGpJ50rX/t0yg6Y9JLFbHz5C05qGQQpnu+Y0kfB2QQgt2L6MhHne
	6/TrbYw==
X-Gm-Gg: AZFdTZdcTYrZI5TQ5+IKLBFhaYa9eCkt/EoLOVD4quywjq5RzxKkEEYp1iaXl3AmYiM
	NLLONFWmE9RxJTMbeI8AWc36TPtFQ0fM/RO8DwWP1ugMgpyGLzDf9ECRdwToTxBUY7sqfQaXvMh
	IKBTYt6F6tsNSJCz/9y2mxSw8mz2Tg1c1KAwfIgG2783df+25QHsaul2nH9HxMPeGnz4ArZwQkX
	dcwqpY7wzF6PztWygk2XNIPIBwuiKJsZrjbtTGWYS9kGMvOvFXFk6UrkWbm6HuO2uRgv8c/E8iT
	qwVDhs3WM3K2mH/LSAwjuSc6N9Mm/ApXNm6MQqOxs+a/dVfdXcD0olc/ZO+tsi2Yilt3v7r+l+6
	oXiauqn9Ia3Mn9ixBzWdS8ZxHe6T1uB571NeY/SwAuiEBQbhnnrMisC7SO6N4jet/saysTBO7tg
	PdqBaZZi3f4XuE4fnGhLXojvvRHsZfgFENoUjeLNUR6HbEwzU2lSjYvcheMSVhAmGgkO4Co0iP+
	jmLlb8sJvSkV4aUi9BpX92lGAoCjqN8+QXxyjKmjQoM9UXrf0hBx4MYSpmU3AlJ+GzStCYanMA9
	4tQCkxsK4JKnbkPT8HkmoYMRDZfeetTt1J7iy3H9ZANeNcVAbH0OyV1jgb1q3fGquCo8Cg==
X-Received: by 2002:a05:6a20:9183:b0:3fb:4856:bc4c with SMTP id adf61e73a8af0-40145e2f39emr8263599637.0.1795429843817;
        Mon, 23 Nov 2026 02:30:43 -0800 (PST)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bc47sm5392452b3a.6.2026.11.23.02.30.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:30:43 -0800 (PST)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38564b4b017so3351648eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:30:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHtjx7PNJInMBVy07GeV4b44k5eO+GT1Xee/EPVh5Li6/xGWBKBgLUBOTsB6Nu6frn7igJs2Iy/jAQtGcQ=@vger.kernel.org
X-Received: by 2002:a05:7023:a8c:b0:1b5:4d7b:9ea8 with SMTP id
 a92af1059eb24-1b55692849fmr11943688c88.20.1795429841975; Mon, 23 Nov 2026
 02:30:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122060309.105714-1-parmjotsinghrobot@gmail.com> <20261122060309.105714-3-parmjotsinghrobot@gmail.com>
In-Reply-To: <20261122060309.105714-3-parmjotsinghrobot@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Nov 2026 11:30:28 +0100
X-Gmail-Original-Message-ID: <CANiDSCuE=WOpDFqVtM2wXue5TDqvQgg6OeHZXfv_Bvzf2QmCDw@mail.gmail.com>
X-Gm-Features: Aa3M54rnctLnkhzopoZXDgx7QCwZEHCcUkpiBk-HjnKf2cjvcnFapOVs0ycponY
Message-ID: <CANiDSCuE=WOpDFqVtM2wXue5TDqvQgg6OeHZXfv_Bvzf2QmCDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: delay HP True Vision 5MP isochronous start
To: Parmjot Singh <parmjotsinghrobot@gmail.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	hansg@kernel.org, mchehab@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Parmjot

Could you provide the whole USB descriptor of the device
lsusb -v -d 04f2:b767

Is it a internal camera (it looks so based on the name) if it is not,
could you try connecting it to USB2 hub?

On Sun, 22 Nov 2026 at 07:05, Parmjot Singh <parmjotsinghrobot@gmail.com> wrote:
>
> The HP True Vision 5MP Camera (04f2:b767, revision 0.05) accepts
> COMMIT and SET_INTERFACE, then may disconnect shortly after starting
> isochronous transfers. A 350 ms pause between SET_INTERFACE and the
> first video URB allowed color streaming in MJPEG and YUYV modes.
>
> Add a per-device isochronous startup delay and apply it to the color
> interface.
>
> On Arch Linux 7.2.14, FFmpeg decoded 90 frames each in 720p MJPEG,
> 640x480 YUYV and 2592x1944 MJPEG, plus 300 frames after a 720p
> restart. The infrared stream still disconnected during the delay
> experiment, before the first video URB was submitted.
>
> OpenAI Codex (GPT-6.2 Sol) helped design and analyze the USB timing
> experiment and write the driver change.
>
> Signed-off-by: Parmjot Singh <parmjotsinghrobot@gmail.com>
>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
>  drivers/media/usb/uvc/uvc_video.c  |  4 ++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 19 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 99c28991b..cfc626a15 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2754,6 +2754,20 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_RESTRICT_FRAME_RATE) },
> +       /* HP True Vision 5MP Camera (color) */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO
> +                               | USB_DEVICE_ID_MATCH_INT_NUMBER,

Why dont you add this to the previous quirk instead of adding a new fied?

We usually do not need to match int number.

> +         .idVendor             = 0x04f2,
> +         .idProduct            = 0xb767,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> +         .bInterfaceNumber     = 0,
> +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> +               .quirks = UVC_QUIRK_PROBE_DEF,
> +               .isoc_start_delay_ms = 350,
> +         } },
>         /* HP True Vision 5MP Camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a92a986ab..e20330998 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -6,6 +6,7 @@
>   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>
> +#include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/highmem.h>
>  #include <linux/kernel.h>
> @@ -2103,6 +2104,9 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>                 if (ret < 0)
>                         return ret;
>
> +               if (stream->dev->info->isoc_start_delay_ms)
> +                       msleep(stream->dev->info->isoc_start_delay_ms);
> +
>                 ret = uvc_init_video_isoc(stream, best_ep, gfp_flags);
>         } else {
>                 /* Bulk endpoint, proceed to URB initialization. */
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index af8cef94f..eb949c6d8 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -545,6 +545,7 @@ struct uvc_device_info {
>         u32     quirks;
>         u32     meta_format;
>         u16     uvc_version;
> +       u16     isoc_start_delay_ms;
>  };
>
>  struct uvc_rect {
> --
> 2.56.0
>
>


-- 
Ricardo Ribalda
