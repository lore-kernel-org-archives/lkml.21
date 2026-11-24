Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548143;
	b=dB91OirAMm8KpHXpYDFwdqBzph+30evoLXJPxyYgxinI8ar6LtBWzwb0ZwjWj6OulFuL
	 WkO7sWY8r3E1S99Qep/1csZrA279m1DhfwdplULnSzd4tHs3ODvuK6ktz1aLlMBoBJ4ej
	 E3vBFMXGSkVSDUtVao6B0HgFFvwlXg3YVMl4jSThMSqfpqJSLF8JFFizE45Qb9AjM9ESL
	 jHsxqpdraN4wXWu6rmh8dVqtxbNNTQA5B0vIW50ajjvjb6LBcpftn3+TpyAwsMwpso8R/
	 Z7oaK9d7KxLiN4dhEnatQWt0Rb4799N9r65AZuSCAj7XprFWiF+miix1bEjTZK1kM6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+sqGc9BB0de+o0BtnP9Aq7Fkyx+O52AcgmtWyPr0TiA=;
	b=W7/yzrb4LRQnscCFBvTAiw1seDzZLbpgJLqfJJbwGDgZ7k2tkjs7nkZ1rDBQFaWJ4e1i
	 WETBdQzjf4fwHtVK4u+mEQVvgj3VT+KGpt89dcaO2iQbnD/e/fGzFO/GeH2dsAH808NuV
	 /5U9bwRy19L+cJ7FZSjSyj1gT1w64Yu6lAudIgJc/kdaq8f+eemx/ZODrBvz7sAQZB2a7
	 dDKNhIoRO4ePPF9i7t02Z5MusJ1XepjnKEzzoHDBhr1h+tJxYVLEUmejitysOjjIIOsOa
	 jU4t3ZbF8/yrA4zeDZpfheqcxesCHFEjonh+Ml0MB+HiPvW0KA6r8Puux+BqXVwMTfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nMZXZySt;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD54606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECD54606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nMZXZySt
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f05b465cd1so25243285ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795548142; x=1796152942; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sqGc9BB0de+o0BtnP9Aq7Fkyx+O52AcgmtWyPr0TiA=;
        b=nMZXZySt4kKuUEuezyaFKNG+BAgUNK3SZMQ+nMKDsk8BZHIKZ2NJxetVIz2mjjCPcz
         949ZO2Du3YGV1JmJksnU4KbmvwPfm7lWkrR2UjC9vzBMOF7gcMQc7cx6wErOu8SaZvmX
         gbGeOTyv7VU39/DmRGeT4f4zq7WOcyjS71esY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795548142; x=1796152942;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+sqGc9BB0de+o0BtnP9Aq7Fkyx+O52AcgmtWyPr0TiA=;
        b=zkPfWfsSRhyvQG01+Aj/ZOYK3D7AN2Q4ocpik0Nocvpv8Z8mCFdrxciv9b+PDuKJZr
         atdblRv/Eo8l2DtUVqKhNDXSbq5PhHrWvSdlXo1oQpdS4fPmuQzu6mDWy0ah/Qn8j/N1
         5LisZ9E83YBmSScbdTK7XEjPlmFYR7i2LMdZHQnpG7LlCzbjo0GJxmPLUXIq0dUj5kSg
         Zq+OKOry0TzvGBuqr6SsS/9KfSb8WT78k4yanK0PI1PBn9gqqaHisvU9qbYE6cHk4kqz
         TLWnO1J1g5B2GojxiJ+quyV0FPBo/sFZ4a21JE/QKIYoZmUIr5HKSO7rc2HH8ak8+HTS
         z69w==
X-Forwarded-Encrypted: i=1; AL+hErGk+7x6uUzrbos1Zq3NfM3P8w18koYTtECTcgkryna1ucRobYmsFpsBnaB5UYRbgFo351z6BXfYEaz3wI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GJeqO5kCBPkrrt2KHBEVoBA6kubSIvzkzJZS49oGNEwPrBk9+
	he/Opw9qKlT45KlY3YqNdx7fYJr9I1UBcwv20/E8LNE2U74gQNB8FqYXf8CWho/T8nEMDeT29mO
	Pvg4=
X-Gm-Gg: AZFdTZem3UHT5qHd0s0q5mZihcD4AJUFBjw6L+MyRJHaq7ZRbo/9KR4JFSMbWqnJt4a
	t0isSHVoqDMRG0KAStietexgoDXJ+pxyVuHxdZ/qKtViUa8gUehM/CbFTgKKSavJiQssGaOOagr
	GR9lxXD3SClkg5lx1FBA/ORQ5JTwnPT05nGVOwM43HyaB1XlPjnK6paOYm7se8SBbaZq/bCyeJW
	ItoF2LWIU6ttrMNXAnBREgSi3OYIhfLfSzs5DehJQ9Ndfm9G7GNxrPcJa8iqN6ShSDuJirOFLIi
	gzIlZS0L4vnCgQqBKQsdm4gzcMPfnnxqBDqxkIfwvpfmIw1uutXDSVrxc0HssS9Q1kjTtra7gbZ
	jafLIBp/kqraRGVQBYfyniybrM1I/5FlolPscZZSCKEIXZXqYt+AAsYPNCYR5gRCMqB7WDsSwsN
	p9GlxeeFegVArP8sKM/pyx5+q+MgnrfO7KD18MbKen92PbRRyQI/mjb/MWDztGhnGfmtTW6cljT
	UFA5ckuWN43hbVEiXZRspysc9y14Uro0WLUWEIBdiEAdGps8X5zHG8dOXtkj9AoU9oYCqjorotU
	3KJYGxcjhUMXSFKXIKqDGyxvmk7MLsIGnaCMKVDWwl2kZRnVHVf2m1DM3AiY69dpYQ==
X-Received: by 2002:a17:90b:4ccb:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b41c7b67femr14659046a91.3.1795548142256;
        Tue, 24 Nov 2026 11:22:22 -0800 (PST)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com. [74.125.82.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm7639721a91.5.2026.11.24.11.22.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:22:21 -0800 (PST)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2761c69fbso5280171c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:22:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEcVz2EAxbYimwuHjInb0ThEHRevd6Ad/ppYoyqTgOm80tVUT7uNgFg4RWmvKNbiYssE1nVDuU7TVxRQbI=@vger.kernel.org
X-Received: by 2002:a05:7022:b908:b0:1b5:25e:9582 with SMTP id
 a92af1059eb24-1b55691dbe2mr14081660c88.37.1795548139472; Tue, 24 Nov 2026
 11:22:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124100623.2227323-1-chris.bainbridge@canonical.com> <20261124100623.2227323-2-chris.bainbridge@canonical.com>
In-Reply-To: <20261124100623.2227323-2-chris.bainbridge@canonical.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Nov 2026 20:22:05 +0100
X-Gmail-Original-Message-ID: <CANiDSCteP85q_nz+-_kG7+h9AkoE+uiVr4VwYHGm8Y+w8vNYKg@mail.gmail.com>
X-Gm-Features: Aa3M54qZlBqKXV6xMS8voS7QdUfU25qdUIfEGZwbhyuEty5R7NTbFgGEiEWFQUo
Message-ID: <CANiDSCteP85q_nz+-_kG7+h9AkoE+uiVr4VwYHGm8Y+w8vNYKg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: uvcvideo: Report the failing control when
 restoring controls fails
To: Chris Bainbridge <chris.bainbridge@canonical.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chris

On Tue, 24 Nov 2026 at 11:10, Chris Bainbridge
<chris.bainbridge@canonical.com> wrote:
>
> When uvc_ctrl_commit_entity() fails while restoring the controls after a
> USB reset_resume, the only message visible at the default loglevel is
> the generic "reset_resume error -5" from the USB core. The control that
> caused the failure and the reason for it are only visible with the
> uvcvideo trace parameter enabled (UVC_DBG_CONTROL), which makes the
> problem almost impossible to diagnose in the field.
>
> On a Logitech C270 (046d:0825, USB_QUIRK_RESET_RESUME), the processing
> unit restore fails with UVC error code 7 (Invalid Request), mapped to
> -EIO, and the user only sees "reset_resume error -5". The restore order
> suggests that WHITE_BALANCE_TEMPERATURE is written while auto white
> balance is enabled, which the device rejects.
>
> Pass the err_ctrl out parameter of uvc_ctrl_commit_entity() and report
> the name, the selector and the entity id of the failing control,
> together with the error code, using a ratelimited warning. If the
> failing control is not known, report the entity and the error code only.
>
> Also extend the "Control error %u" debug message in uvc_query_ctrl()
> with the name of the UVC error code, the name of the request, the
> selector and the unit, so that the cause of the STALL is visible in the
> trace log.
>
> Signed-off-by: Chris Bainbridge <chris.bainbridge@canonical.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c  | 36 +++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_video.c | 31 +++++++++++++++++++++++++-
>  2 files changed, 64 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index d2f722bc3459..f70fa37800a4 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3199,6 +3199,34 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>   * Suspend/resume
>   */
>
> +/*
> + * Report a failure to restore the controls of an entity. @err_ctrl points to
> + * the control that failed, or is NULL if the failing control is not known.
> + */
> +static void uvc_ctrl_restore_error(struct uvc_device *dev,
> +                                  const struct uvc_entity *entity,
> +                                  struct uvc_control *err_ctrl, int ret)
> +{
> +       const struct uvc_control_mapping *mapping;
> +       const char *name = "Unknown Control";
> +
> +       if (!err_ctrl) {
> +               dev_warn_ratelimited(&dev->intf->dev,
> +                                    "Failed to restore controls on unit %u: %d\n",
> +                                    entity->id, ret);
> +               return;
> +       }
Unless I made a mistake there i no case where err_ctrl can be NULL.

> +
> +       mapping = list_first_entry_or_null(&err_ctrl->info.mappings,
> +                                          struct uvc_control_mapping, list);
> +       if (mapping)
> +               name = uvc_map_get_name(mapping);

can you move this into a function uvc_ctrl_get_first_mapping_name(err_ctrl)

with that move this function would be so small that it is probably a
good idea to squash it into uvc_ctrl_restore_values

> +
> +       dev_warn_ratelimited(&dev->intf->dev,
> +                            "Failed to restore control %s (selector %u on unit %u): %d\n",
> +                            name, err_ctrl->info.selector, entity->id, ret);
> +}
> +
>  /*
>   * Restore control values after resume, skipping controls that haven't been
>   * changed.
> @@ -3210,6 +3238,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>   */
>  int uvc_ctrl_restore_values(struct uvc_device *dev)
>  {
> +       struct uvc_control *err_ctrl;
please do err_ctrl = NULL here  and not in the loop. We probably do
not need it here either, but will make the static analyzer happy.

>         struct uvc_control *ctrl;
>         struct uvc_entity *entity;
>         unsigned int i;
> @@ -3230,9 +3259,12 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>                         ctrl->dirty = 1;
>                 }
>
> -               ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, NULL);
> -               if (ret < 0)
> +               err_ctrl = NULL;
> +               ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, &err_ctrl);
> +               if (ret < 0) {
> +                       uvc_ctrl_restore_error(dev, entity, err_ctrl, ret);
>                         return ret;
> +               }
>         }
>
>         return 0;
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a92a986ab714..b10064defaf4 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -68,6 +68,32 @@ static const char *uvc_query_name(u8 query)
>         }
>  }
>

Maybe you could make a function

static const char *uvc_ctrl_error_name_code(u8 error, int *code)

and reuse it in uvc_query_ctrl() it is much more nicer to get the
error name than the code

(sorry to treat you like Santa :P)

> +static const char *uvc_error_code_name(u8 error)
> +{
> +       switch (error) {
> +       case 0:
> +               return "No error";
> +       case 1:
> +               return "Not ready";
> +       case 2:
> +               return "Wrong state";
> +       case 3:
> +               return "Power";
> +       case 4:
> +               return "Out of range";
> +       case 5:
> +               return "Invalid unit";
> +       case 6:
> +               return "Invalid control";
> +       case 7:
> +               return "Invalid request";
> +       case 8:
> +               return "Invalid value within range";
> +       default:
> +               return "Unknown";
> +       }
> +}
> +
>  int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>                         u8 intfnum, u8 cs, void *data, u16 size)
>  {
> @@ -125,7 +151,10 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>                 return ret < 0 ? ret : -EPIPE;
>         }
>
> -       uvc_dbg(dev, CONTROL, "Control error %u\n", error);
> +       uvc_dbg(dev, CONTROL,
> +               "Control error %u (%s) for %s control %u on unit %u\n",
> +               error, uvc_error_code_name(error), uvc_query_name(query), cs,
> +               unit);
>
>         switch (error) {
>         case 0:
> --
> 2.53.0
>
>


-- 
Ricardo Ribalda
