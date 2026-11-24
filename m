Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551799;
	b=QzDCdFLmmNPRpS4WBJ1j0fY3qQeitcHlnwJOH1m5li/9DaKlNv6mmyyp2rqrW4R0Y9yq
	 IMB5gnIf8KiME+hBZN7MqXxUC/nUYXqLw9nU4LS9HHTThcBWukQhiFCdyNU2EHHBqdtpU
	 4jtKMUpfRJMTEXx44sI02JpZjTYY6sbI04HGOndB7AxYNJI6iR9c9VG+3b7XzEX3p8AiZ
	 25fdeAK5gvrV+jZGIzFHqyeFcSa9ugSZ895hat94gmuskxnwppVkOwbBAH4w7OWg9Fzs0
	 AjSOthh7npXfuIixElHTFju3SOfJihMZzKr3tzwuPTRHuaGpUs1IMXdoUjua/tidv2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4zofyjzfJerfRmeIkr2oNO0eYdNNEtzuwuP/HP6VIhk=;
	b=T6LoLjBeP45MhBjhNLcOnyqVqzi1Flu9eSETQaV7EIUgTdaZnfKHjuPUpNbtzODRl2/P
	 uu2/SihUM9C/DRJYPWKys50eJ+ggSRE3gszTVruwI5hb9vKA2wutsJFvniiJpYiZUqCzT
	 LBbIIU6jlN1hNvPxgGHUbnWtX8ReuocjwSq9og+qd+kWI1RdKLM5tEsiZFEC4O4BziVrO
	 +zOdjJuwaUnA7elfhAIgrH4b+Xdhnen1gd+OtTiBcaArrJzJ34kywlz4oFut6b3uzQoJS
	 0nq6t7TlJYlOXBKuhOyOf49xsT291Q/pheWBB0nXv6uaH0+Ph6WjE/+2vnqWtMsNNng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fC8ZJsxf;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05933606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05933606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fC8ZJsxf
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso2475089a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795551798; x=1796156598; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zofyjzfJerfRmeIkr2oNO0eYdNNEtzuwuP/HP6VIhk=;
        b=fC8ZJsxfIEh2xkhbmQ5HG4mcmhy+2fdHGuVq0FyItZg947n6a6/4U2IXKUDDm1re5c
         qU93ozgc5p6mTyTC44obUSCEQT+hPeNh7dbxSyhjq4dWJlj1nPufNFTavs2o2Pa4zp7R
         qgLs7I9dL11i/xMdbrOwVOZbuB9gLc5Kkio1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551798; x=1796156598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4zofyjzfJerfRmeIkr2oNO0eYdNNEtzuwuP/HP6VIhk=;
        b=G/AG5D7hjRY1kLPJ8DKoDKtq4Z30a9+iVx0vR1Ae8aJSTkOMCmtVXiFUaZ4GKEERDF
         ZIynIXiTIEpNTVahUVc//0y+YA5PRu1g9nCxA4yyKSkud2tcpHfItvSt2saR3gbmcpYl
         Rgb2fb1FSdPKvUo8+AjvGdduDM+41h//9H1P9/Mw5wWvlvZwQ8jJxPwbBBgnQQSSfgf0
         6nKK8SyXgahAa9KM4sxu8ViLwYR8sN28yk43bA81kzJfqyk7qmpICvoqwT88G1GIU7UG
         B/Qs3MgEuu6B36l20dt7FfFIfm/kIgmt6PnXgTiu9cuEENNrhvo81Cs0n7pg0QKzgzz0
         SaCg==
X-Forwarded-Encrypted: i=1; AL+hErFcdkQvfvs3vOAvwAeU2rIhVD01WwsITNX9Kj5kAtuNpJ85v4QME8qgBA8wAAPfADEwU1j2Tg0TLp6xLeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RHrqJu1lNYEJgddJ40rVOVj7/zbAj6Tbo+UCxKio/Bm2Z96Iw
	apZ2AXkI/vPjaaS6hj7SJAKe16JT2WbgJuOhllqtU3z7vxJBO3MpCgZuhIITq4J8Y2ILPNMhOH4
	Yiafb2LLd
X-Gm-Gg: AZFdTZdanoizJWAj8dse3YpD/VnJOAtes9wMcYqykxXCJH0b8Qwmu4c5wmpHIHsagot
	iUHAlKUOnqvJFxEZNtw/IIma0BtVlVdEvcPN8KYxR17FP+IEJhyciPV00sLrge0X7my2UPcAZ/5
	JSC44pItAR0YTTSZ2fpJjdD24F3yWJ1/tvUtE7Rgzzg6bZpUd2d6rEXC6X3h1dx86UOLiLu/pS4
	QDFQD8///pY32DX72euosTezcKv3UEG4akGVeBpsUD+a/DO6clnbZOv72PalQMQrDSpvQKeRNpS
	edH5SZcH2DB4r3TMfayimr39xOG9VtToSs5YA8abKQ6DrvbKecvOXytTjjXug6nv9qw5+H2wbzu
	KKPufLvmq9wEuoVd0YdgUfi/HmkCbl3cn4WUJmCSDeZ5Wf6nZfQWDOz3qdMOmtehXiy5lxttLLA
	SVu9RObAEwBtZtr4iJtgJUF3ewazeoNQMztak9V3M2IpgjLoL3OkLY5pBJ6p/zYbO0+Ylk6Xh3q
	tu/xfDO1BAsE7dLGm+HJBuOtsp/1dRDztyFSUUenqDdhx9j+tUAQs3Ic9g92gsd4fDWlvbeTuM6
	hz89QUtF5udFQqDc7HYtTVYHxS4tpFzs6u1gC4sqN+Uit8z4JZMWe9JQkidY73vjTw==
X-Received: by 2002:a17:90b:4a4f:b0:3ac:8af9:4a6a with SMTP id 98e67ed59e1d1-3b41c93c3b7mr15447021a91.42.1795551798199;
        Tue, 24 Nov 2026 12:23:18 -0800 (PST)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com. [74.125.82.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm27298440a91.10.2026.11.24.12.23.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:23:17 -0800 (PST)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so7134524c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:23:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEQhBdHqy45CzWLoSP5q/fcH1b/alUG5uBhyNYkDylS2qR2eu7RmJBXDZyRxrauL4yKaAb8oS3skI072sw=@vger.kernel.org
X-Received: by 2002:a05:7022:e886:b0:1ac:2f6d:e1c6 with SMTP id
 a92af1059eb24-1b5568a4f42mr19880063c88.6.1795551796265; Tue, 24 Nov 2026
 12:23:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124100623.2227323-1-chris.bainbridge@canonical.com> <20261124100623.2227323-3-chris.bainbridge@canonical.com>
In-Reply-To: <20261124100623.2227323-3-chris.bainbridge@canonical.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Nov 2026 21:23:01 +0100
X-Gmail-Original-Message-ID: <CANiDSCtF3jcJmqCpe_4G=w9KeXsmJ3Nu7BYguDmepcq1G-E9uQ@mail.gmail.com>
X-Gm-Features: Aa3M54qMe1F_FiA7W1AJ5MMmW-l8mTpXaFw8QnR6ABNEwslDFeimszZj4ZbPMCY
Message-ID: <CANiDSCtF3jcJmqCpe_4G=w9KeXsmJ3Nu7BYguDmepcq1G-E9uQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: uvcvideo: Restore auto controls first and skip
 inactive slaves
To: Chris Bainbridge <chris.bainbridge@canonical.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chris

I think it would make a bit more sense to squash 2/3 and 3/3.
Maybe split to 3/3 the functionality to continue even if there is a
restore error.

That would make it much easier to review. Could you do that before we
look into all the boring nits?
(you might not be Santa... but it is almost Black Friday :P)

PS: You will also probably get more attention if you simplify your
commit messages.

Thanks!


On Tue, 24 Nov 2026 at 11:07, Chris Bainbridge
<chris.bainbridge@canonical.com> wrote:
>
> A UVC device rejects a SET_CUR request for a manual control while its
> master auto control is enabled. On the Logitech C270 (046d:0825),
> restoring WHITE_BALANCE_TEMPERATURE while WHITE_BALANCE_TEMPERATURE_AUTO
> is enabled stalls the request with UVC error code 7 (Invalid Request)
> and leaves automatic white balance wedged until power cycle, while
> aborting the restoration of the remaining controls of the processing
> unit. Two rules are needed to avoid this.
>
> First, restore the master controls before the other controls of each
> entity. uvc_ctrl_commit_entity() sends the controls of an entity in
> index order: Auto-Exposure Mode (index 1) precedes Exposure Time
> (index 3) in the camera terminal, but Focus Absolute (index 5) precedes
> Focus Auto (index 17), and in the processing unit Hue (index 2), White
> Balance Temperature (index 6) and White Balance Component (index 7) all
> precede their corresponding auto controls (indices 11, 12 and 13). After
> a reset the device has auto white balance enabled at its default, so
> even when the user has set the auto control to manual mode, the manual
> value is written while the device still has auto enabled, and is
> rejected. Restore the masters first (committing the first pass only when
> at least one master is dirty), so that manual controls are written with
> their master in its final state. A control is a master if any of its
> mappings has a non-zero slave_ids[] entry.
>
> Second, skip the slave controls that are currently inactive. When the
> master was restored in the first pass or is already loaded in the cache,
> decode its value without generating any USB traffic; otherwise query the
> master via GET_CUR using __uvc_ctrl_load_cur() (taking struct uvc_device
> directly). If the master control is write-only or GET_CUR fails, treat
> the slave as active rather than decoding an unpopulated zero buffer,
> matching uvc_ctrl_is_accessible(). Clear ctrl->loaded when skipping an
> inactive slave so that subsequent reads fetch the firmware-driven value
> from the hardware, even on devices that omit UVC_CONTROL_CAP_AUTOUPDATE
> in GET_INFO.
>
> This addresses the restore order concern noted in the TODO comment for
> auto/manual control pairs.
>
> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> Signed-off-by: Chris Bainbridge <chris.bainbridge@canonical.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 152 +++++++++++++++++++++++++------
>  1 file changed, 126 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index f70fa37800a4..d11ad3da1d50 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1463,7 +1463,7 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
>         return 0;
>  }
>
> -static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> +static int __uvc_ctrl_load_cur(struct uvc_device *dev,
>                                struct uvc_control *ctrl)
>  {
>         u8 *data;
> @@ -1482,13 +1482,12 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
>         }
>
>         if (ctrl->entity->get_cur)
> -               ret = ctrl->entity->get_cur(chain->dev, ctrl->entity,
> +               ret = ctrl->entity->get_cur(dev, ctrl->entity,
>                                             ctrl->info.selector, data,
>                                             ctrl->info.size);
>         else
> -               ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> -                                    ctrl->entity->id, chain->dev->intfnum,
> -                                    ctrl->info.selector, data,
> +               ret = uvc_query_ctrl(dev, UVC_GET_CUR, ctrl->entity->id,
> +                                    dev->intfnum, ctrl->info.selector, data,
>                                      ctrl->info.size);
>
>         if (ret < 0)
> @@ -1509,7 +1508,7 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
>                 return -EACCES;
>
> -       ret = __uvc_ctrl_load_cur(chain, ctrl);
> +       ret = __uvc_ctrl_load_cur(chain->dev, ctrl);
>         if (ret < 0)
>                 return ret;
>
> @@ -2572,7 +2571,7 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
>                 return -ENOMEM;
>
>         if (which == V4L2_CTRL_WHICH_CUR_VAL)
> -               ret = __uvc_ctrl_load_cur(chain, ctrl);
> +               ret = __uvc_ctrl_load_cur(chain->dev, ctrl);
>         else
>                 ret = uvc_ctrl_populate_cache(chain, ctrl);
>
> @@ -2816,7 +2815,7 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
>          * operation.
>          */
>         if ((ctrl->info.size * 8) != mapping->size) {
> -               ret = __uvc_ctrl_load_cur(chain, ctrl);
> +               ret = __uvc_ctrl_load_cur(chain->dev, ctrl);
>                 if (ret < 0)
>                         return ret;
>         }
> @@ -3227,43 +3226,144 @@ static void uvc_ctrl_restore_error(struct uvc_device *dev,
>                              name, err_ctrl->info.selector, entity->id, ret);
>  }
>
> +/*
> + * Return true if the control is a master control, i.e. one of its mappings
> + * has slave controls.
> + */
> +static bool uvc_ctrl_is_master(const struct uvc_control *ctrl)
> +{
> +       const struct uvc_control_mapping *mapping;
> +       unsigned int i;
> +
> +       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> +               for (i = 0; i < ARRAY_SIZE(mapping->slave_ids); ++i) {
> +                       if (mapping->slave_ids[i])
> +                               return true;
> +               }
> +       }
> +
> +       return false;
> +}
> +
> +/*
> + * Return true if the control is currently inactive, i.e. it is a slave
> + * control whose master is not in manual mode.
> + *
> + * The master value is read from the driver's cache when available, or queried
> + * from the device via GET_CUR if the master was neither restored in the first
> + * pass nor loaded yet. If the master control cannot be found in the same
> + * entity, is write-only, or fails GET_CUR, the control is considered active,
> + * matching uvc_ctrl_is_accessible().
> + */
> +static bool uvc_ctrl_is_inactive(struct uvc_device *dev,
> +                                struct uvc_entity *entity,
> +                                struct uvc_control *ctrl)
> +{
> +       struct uvc_control_mapping *mapping;
> +
> +       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> +               struct uvc_control_mapping *master_map = NULL;
> +               struct uvc_control *master_ctrl = NULL;
> +               s32 val;
> +
> +               if (!mapping->master_id)
> +                       continue;
> +
> +               __uvc_find_control(entity, mapping->master_id, &master_map,
> +                                  &master_ctrl, 0, 0);
> +
> +               if (!master_ctrl || uvc_ctrl_mapping_is_compound(master_map))
> +                       continue;
> +
> +               if (!(master_ctrl->modified &&
> +                     (master_ctrl->info.flags & UVC_CTRL_FLAG_RESTORE)) &&
> +                   !master_ctrl->loaded) {
> +                       if (!(master_ctrl->info.flags &
> +                             UVC_CTRL_FLAG_GET_CUR) ||
> +                           __uvc_ctrl_load_cur(dev, master_ctrl) < 0)
> +                               continue;
> +               }
> +
> +               val = uvc_mapping_get_s32(master_map, UVC_GET_CUR,
> +                                         uvc_ctrl_data(master_ctrl,
> +                                                       UVC_CTRL_DATA_CURRENT));
> +               if (val != mapping->master_manual)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  /*
>   * Restore control values after resume, skipping controls that haven't been
>   * changed.
>   *
> + * The controls of each entity are restored in two passes: first the master
> + * controls (the auto modes), then the remaining controls. This way a master
> + * is set to its final state before its slaves are restored.
> + *
> + * Slave controls that are currently inactive, because their master is not
> + * in manual mode, are not restored: devices reject SET_CUR requests for
> + * them and some firmwares misbehave when written in auto mode. The manual
> + * value only takes effect once the master is switched back to manual mode.
> + *
>   * TODO
>   * - Don't restore modified controls that are back to their default value.
> - * - Handle restore order (Auto-Exposure Mode should be restored before
> - *   Exposure Time).
>   */
>  int uvc_ctrl_restore_values(struct uvc_device *dev)
>  {
>         struct uvc_control *err_ctrl;
>         struct uvc_control *ctrl;
>         struct uvc_entity *entity;
> -       unsigned int i;
> +       unsigned int i, pass;
>         int ret;
>
>         /* Walk the entities list and restore controls when possible. */
>         list_for_each_entry(entity, &dev->entities, list) {
> +               for (pass = 0; pass < 2; ++pass) {
> +                       bool master_pass = pass == 0;
> +                       bool dirty = false;
> +
> +                       for (i = 0; i < entity->ncontrols; ++i) {
> +                               ctrl = &entity->controls[i];
> +
> +                               if (!ctrl->initialized || !ctrl->modified ||
> +                                   !(ctrl->info.flags & UVC_CTRL_FLAG_RESTORE))
> +                                       continue;
> +
> +                               if (uvc_ctrl_is_master(ctrl) != master_pass)
> +                                       continue;
> +
> +                               if (!master_pass &&
> +                                   uvc_ctrl_is_inactive(dev, entity, ctrl)) {
> +                                       uvc_dbg(dev, CONTROL,
> +                                               "skipping restore of inactive control %pUl/%u/%u\n",
> +                                               ctrl->info.entity,
> +                                               ctrl->info.index,
> +                                               ctrl->info.selector);
> +                                       ctrl->loaded = 0;
> +                                       continue;
> +                               }
> +
> +                               uvc_dbg(dev, CONTROL,
> +                                       "restoring control %pUl/%u/%u\n",
> +                                       ctrl->info.entity, ctrl->info.index,
> +                                       ctrl->info.selector);
> +                               ctrl->dirty = 1;
> +                               dirty = true;
> +                       }
>
> -               for (i = 0; i < entity->ncontrols; ++i) {
> -                       ctrl = &entity->controls[i];
> -
> -                       if (!ctrl->initialized || !ctrl->modified ||
> -                           (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
> +                       if (master_pass && !dirty)
>                                 continue;
> -                       uvc_dbg(dev, CONTROL, "restoring control %pUl/%u/%u\n",
> -                               ctrl->info.entity, ctrl->info.index,
> -                               ctrl->info.selector);
> -                       ctrl->dirty = 1;
> -               }
>
> -               err_ctrl = NULL;
> -               ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, &err_ctrl);
> -               if (ret < 0) {
> -                       uvc_ctrl_restore_error(dev, entity, err_ctrl, ret);
> -                       return ret;
> +                       err_ctrl = NULL;
> +                       ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0,
> +                                                    &err_ctrl);
> +                       if (ret < 0) {
> +                               uvc_ctrl_restore_error(dev, entity, err_ctrl,
> +                                                      ret);
> +                               return ret;
> +                       }
>                 }
>         }
>
> --
> 2.53.0
>
>


--
Ricardo Ribalda
