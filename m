Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795689219;
	b=SbRYKxQ6B0rCkuAX4HFbXphZ2A/N8FJKV2NaomEtgRx9i0ibHDe2UN/oFAWJEG0tZcoo
	 xHElcMPzx4C+MtgKf1MRyAbukSTavcTVwteQLkq5SuJ01oKx0QDBa//fmfcr09sawWXu7
	 cdPpjakiGkQLfdWjpbVoMTzEZuSJM0Dz8m1UzA0Unng5DNGbcEFK0IO7f6onroN07FDlI
	 /RFujRHdwO24jsItw1KGUHYfqyaZBoOXoptzMmelQYGdxnNqpqDJv8Mz4O6uwz44mYcEp
	 /puCMp72wLX3VzKeSCdvm1xTgvXJgo+RWUBUQrZzwn/1cBNAz/AvMmvRwC9Q56G7kVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CjQ8gPON54ImxNch/vz81iv8pHWJvCH/N5cvF02jvyA=;
	b=kikkv0Xv61YeAGrnggw/enBgV/b01Avfp6TAjZIeh7LaCCtOqMJhTSyIRAAMffLcN+BT
	 FePFowI/BD+/ulsZsHeJkKrBg8VLhHMvx1zBfOuBjCIN1oYhPAAUpvCTqlVaBj8uunNcW
	 tUAvLn9MXobujbUOFsalJgd2blRUj7xziFkiVbGJIHdQAgqvibOgL3yPgRRcUtGGkOrPw
	 0syqbFFb390MF5Jmh8Pmc2LGIWnkqr9hoF+jJmL45+FLav4OZmO+NSGo31k3yNn8Wp2RV
	 uh/IsarTT4aFt5vIY3zdaoMLofGhksjdmJ2QUtfesAvWOiUw9BEh1HnqW1cVgAvcXhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=De4U3Nri;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027FE606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 027FE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=De4U3Nri
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso3534203a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:33:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795689218; cv=none;
        d=google.com; s=arc-20260327;
        b=W/tKzJ7SoUwfJ0Szbm+7ZMVIppM1eECeGfHEkPAvV6snUMG+HYOG1l1usVSD+VYwM7
         5ibObxWPyTAzhYdtzY/WS6RC+ReD8LIu/saxFF/8cHYkU53psuSY2lvFTNK/2Hf5aSuU
         0HX3bruhH9wTEfrjYpSWIaKad7g4gj2jsJm4HvN3zvUtf96WPHjMi5GM6CEc9cg2+AsH
         OgyzwCb4j7tWB8w/LOOHn/8FvIW/bu1FBhfWdZdvMPwdMb5PD1zafmASGhyUfx7zweLj
         ph4SQcqHOgc50CMwUsDz0yEkRb4P/z5FyoNK/XBXGO6Bpo+4k6TMvwn69puwYJ/jne0u
         Tyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CjQ8gPON54ImxNch/vz81iv8pHWJvCH/N5cvF02jvyA=;
        fh=Ox21bhTE24hZlRPWsy3amc5h8d1y7JCzM2/v3RThj8w=;
        b=DnSbUOSKtdFqjCAclKDZkshkbFQdAx8hbSBYNwf+mOvMG9lx4pfVUHjYTA+ItJj+7e
         kHEcjwanqaSWmMxfMfOTjnyvw7QW/sfpdhGXyeBGU22CwXpA8TdRBpET+/lTzR9LbBtd
         vTAB0XxrOt6vdqtmTunK97oDKzk8ZLVGj7q86kArXG2W3+tSlVvOxixhKqiFPctF1sqm
         BSzAd5nZVO5tdq+gWGYiD44/IJBNdRTJ6htS2gQkXNmK6dtLtBWNASeB1GPNaB7YOJBz
         TruKMvkGw0lZ5QTGngAyGVHnBUG523pkRk5D6uiDluDQtqZCETxGakP24WPwbauWwAmS
         rkUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795689218; x=1796294018; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjQ8gPON54ImxNch/vz81iv8pHWJvCH/N5cvF02jvyA=;
        b=De4U3NriG0pnU5n61Rds0bGZ4V4UfHP8EPTjilbt+dGMz8sXOFX8ozPnVhuRkEl2Tt
         f6hSadLeVrHVyfqbY4XiA7LNkgGGqFSuF6t+umXE1r0hBHy8hCbpY03LMx7YEJswSNkv
         MeuWhnXmoZ7DJUuK/7MD34oP9RlXx3Kr+QRPRP6qVEfPLn1ZB/IOGCutz9AebD+FZtgz
         G89s27EsVAEkWBF3o+DQH33KX2quV9uDdZMdGBJDZLxGQwCO+3ezu0FN2DSYzCu5BWZa
         BNFJGHqP696CfMb0NbfcSRRF19SQowj79qbb32iZbjDSvSnaVJgRZJzN24rnzo02rit/
         i0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689218; x=1796294018;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CjQ8gPON54ImxNch/vz81iv8pHWJvCH/N5cvF02jvyA=;
        b=wv/+aYoZmxVpEKxfFrKQyYf3JiPuA3Z2CrI1++EhLry6ArWwtSpn06h6MGbyU4MLKW
         BlQ8If7gEwIic65PzcGJ4N3kPC3WTcDugVIqVC3DMyfeqcSgcQaFr0Nn7ObPjm1wq334
         K3GZXjYYg3GLs5Ft5sf2PJYFkpWRciiUcaRGuk5YYDxOb3ZDwBorP0vpJb6mjL2oXglI
         DIljfFFeVQvMqPdlsYDL7Cv/8g/tL7VnUGtYk+iH0sP9cGQRKxHhklOHZ0rGdDhCKrK/
         WNpk7XQFNnVdEwMGu1tuQ43vMDBlQk6LSKMtA1uKIlnW2Cy2VjzmodqO9L5bZyQSRGQo
         sbAw==
X-Forwarded-Encrypted: i=1; AL+hErEcy7JyZ4wkH6WTXwyEai7AkFxVH1yClyhRJGsAlV2defO3fZLZ97JCDvKvWjg3khamhkeGdbhTNZ08U4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eDgOJuRSfqRmwodlO0ba4lSGciE7OeRWUOAVBC6RbFfyuc9uQ
	VbkQcNDkQ+6kbTS7TTCPmK1qx0xwlW60ps5VWRo/ipDjYoFb6T9XnWQfcoy8oPRmsudNHLPngTf
	TGK5wD0ee2ohA9FUp/qbzfqlfREJGXTs=
X-Gm-Gg: AZFdTZfTKPx/zl6XwaAgsJWKgUUCyI5UUAW+pG2X/maEbo1WhHJKeHiv/emqwvMgcBd
	qUBTXmEgMDzTV9zY8QWCkpK6nwgx7ZhGKvOAyHFxZswCGtEOkktGQfTzPSYfklMKbi76HuXiYnT
	fQtn5ChrjEikFqoMXxDDJj/CRrGGAsg1K4t4Uuqh5SAbHGwK+HaBWvBfvmCWSGVzVxpCT0sk9tn
	f1dL/gAupUbhHfVbuF88kH5oy8fn7mcoiAXx+nJHRrRvk/5tIU/axo3PwbZJd1hqG7yv6jz6AJY
	AizQ7rFU7P465+egL+rQUaNNq9xztU2vEJ64NdoCZ2hUicZcTN7Ny9r9zc7nyi9iwMZ1FaEGWaB
	FbX5oT725c9uvv/CHeeEROhfZBu8rpyOx6slFJC/SIcln1UQpOzXyaWY2aA==
X-Received: by 2002:a17:90b:2f8c:b0:3a2:b16d:928b with SMTP id
 98e67ed59e1d1-3b41c95aec8mr18512828a91.46.1795689218173; Thu, 26 Nov 2026
 02:33:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122190008.21278-2-arbabhaider649@gmail.com> <4724fb41-06a0-457c-be3a-25ad9e49e25f@kernel.org>
In-Reply-To: <4724fb41-06a0-457c-be3a-25ad9e49e25f@kernel.org>
From: Arbab Haider <arbabhaider649@gmail.com>
Date: Thu, 26 Nov 2026 15:33:26 +0500
X-Gm-Features: Aa3M54r0J6MsPFv-FI2m1pPxneDAzgN4uFfUfog5-WhTsHNyfmVJ8PwjCWIuLXE
Message-ID: <CAHPLoh+1WDe2YFxuyP65MHtCbSmmg6FORnk-bJ8FxTgq-PQW8A@mail.gmail.com>
Subject: Re: [PATCH] media: em28xx: clear dev->v4l2 on init failure and fini
 to avoid double put
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+fb0d2df09b56117605fc@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans,

I checked media-committers/next at b4e3c4b6a36f. The init error path
already clears dev->v4l2 under dev->lock before dropping the initial
reference, and em28xx_v4l2_fini() checks the pointer under the same
lock. That covers the double put this patch was meant to fix, so
I'm dropping the standalone patch.

Thanks,
Arbab


On Wed, 25 Nov 2026 at 12:40, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> On 22/11/2026 20:00, Arbab Haider wrote:
> > Commit 288254383674 ("media: em28xx: use v4l2_device release callback")
> > switched em28xx_v4l2 teardown to v4l2_device reference counting, where
> > dev->v4l2 is only cleared inside em28xx_free_v4l2() once the refcount
> > reaches zero.
> >
> > If em28xx_v4l2_init() fails after video_register_device() (for example,
> > when v4l2_mc_create_media_graph() returns -EINVAL) while userspace has
> > opened the video node, the unregister_dev error path calls
> > v4l2_device_put(&v4l2->v4l2_dev) to drop the initial reference, but
> > em28xx_free_v4l2() does not run yet because the open file handle still
> > holds a reference, leaving dev->v4l2 non-NULL.
> >
> > When the USB device is subsequently disconnected, em28xx_v4l2_fini()
> > sees dev->v4l2 != NULL and calls v4l2_device_put(&v4l2->v4l2_dev) a
> > second time for the initial reference, freeing struct em28xx_v4l2 while
> > the video device node is still referenced and causing a
> > slab-use-after-free in media_device_unregister() /
> > __media_entity_remove_links().
> >
> > Fix this by:
> > - Calling v4l2_device_disconnect() and clearing dev->v4l2 = NULL under
> >   dev->lock in em28xx_v4l2_init()'s unregister_dev path before dropping
> >   the initial v4l2_device reference.
> > - Checking and clearing dev->v4l2 under dev->lock in em28xx_v4l2_fini()
> >   so the initial reference is dropped at most once.
> > - Reading dev->v4l2 under dev->lock and checking for !v4l2 in
> >   em28xx_v4l2_close() so a close racing with teardown cannot dereference
> >   a NULL pointer.
> >
> > Tested locally in QEMU (x86_64, KASAN+UBSAN) using dummy_hcd and
> > raw-gadget emulating an EM2820 device with failed media graph creation
> > and concurrent /dev/video0 open/disconnect.
> >
> > Reported-by: syzbot+fb0d2df09b56117605fc@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=fb0d2df09b56117605fc
> > Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
>
> This patch no longer applies, can you rebase it on top of
> https://gitlab.freedesktop.org/linux-media/media-committers, next branch?
>
> This patch might not be needed anymore, it's unclear.
>
> Regards,
>
>         Hans
>
> > ---
> >  drivers/media/usb/em28xx/em28xx-video.c | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
> > index 84424284d..50998aa1c 100644
> > --- a/drivers/media/usb/em28xx/em28xx-video.c
> > +++ b/drivers/media/usb/em28xx/em28xx-video.c
> > @@ -2333,7 +2333,6 @@ static void em28xx_free_v4l2(struct v4l2_device *v4l2_dev)
> >
> >       v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
> >       v4l2_device_unregister(v4l2_dev);
> > -     dev->v4l2 = NULL;
> >       kfree(v4l2);
> >       kref_put(&dev->ref, em28xx_free_device);
> >  }
> > @@ -2414,7 +2413,7 @@ static int em28xx_v4l2_open(struct file *filp)
> >   */
> >  static int em28xx_v4l2_fini(struct em28xx *dev)
> >  {
> > -     struct em28xx_v4l2 *v4l2 = dev->v4l2;
> > +     struct em28xx_v4l2 *v4l2;
> >
> >       if (dev->is_audio_only) {
> >               /* Shouldn't initialize IR for this interface */
> > @@ -2426,13 +2425,16 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
> >               return 0;
> >       }
> >
> > -     if (!v4l2)
> > +     mutex_lock(&dev->lock);
> > +
> > +     v4l2 = dev->v4l2;
> > +     if (!v4l2) {
> > +             mutex_unlock(&dev->lock);
> >               return 0;
> > +     }
> >
> >       dev_info(&dev->intf->dev, "Closing video extension\n");
> >
> > -     mutex_lock(&dev->lock);
> > -
> >       v4l2_device_disconnect(&v4l2->v4l2_dev);
> >
> >       em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
> > @@ -2455,6 +2457,8 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
> >               vb2_video_unregister_device(&v4l2->vdev);
> >       }
> >
> > +     dev->v4l2 = NULL;
> > +
> >       mutex_unlock(&dev->lock);
> >
> >       /*
> > @@ -2502,18 +2506,19 @@ static int em28xx_v4l2_close(struct file *filp)
> >  {
> >       struct video_device   *vdev = video_devdata(filp);
> >       struct em28xx         *dev  = video_drvdata(filp);
> > -     struct em28xx_v4l2    *v4l2 = dev->v4l2;
> > +     struct em28xx_v4l2    *v4l2;
> >       struct usb_device *udev = interface_to_usbdev(dev->intf);
> >       int              err;
> >       bool last_user;
> >
> >       mutex_lock(&dev->lock);
> > +     v4l2 = dev->v4l2;
> >       last_user = v4l2_fh_is_singular_file(filp);
> >       _vb2_fop_release(filp, vdev->queue->lock);
> >
> >       if (last_user) {
> >               /* No sense to try to write to the device */
> > -             if (dev->disconnected)
> > +             if (dev->disconnected || !v4l2)
> >                       goto exit;
> >
> >               /* Save some power by putting tuner to sleep */
> > @@ -3110,6 +3115,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> >       return 0;
> >
> >  unregister_dev:
> > +     v4l2_device_disconnect(&v4l2->v4l2_dev);
> > +
> >       if (video_is_registered(&v4l2->radio_dev)) {
> >               dev_info(&dev->intf->dev,
> >                        "V4L2 device %s deregistered\n",
> > @@ -3129,6 +3136,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> >               vb2_video_unregister_device(&v4l2->vdev);
> >       }
> >
> > +     dev->v4l2 = NULL;
> > +
> >       mutex_unlock(&dev->lock);
> >
> >       /*
>
