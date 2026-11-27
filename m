Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795802277;
	b=Cmp+traeX0BJfYiy60SHGfqMXFUE68/usVuZgb/PmSJIqqhY5Ks/0gYp363AY7KKKj+y
	 QXgSCbwlHUmT+pM9NqT1mg5cAogqgUbd5kItkLJUSRFpeDFKQal7riuTBOKJkDyNi7evi
	 SMaephGhgO+OA0ixOrlP61J6pxffacgz2ItLFd1v0vM1JswBThRExGhptAgW/s+oiwd1X
	 p9RcSUiWVBXpo/aMblcNBV7KcsrXHCC4ASALB6RZxNySr7+37y3T7caMU/r+l+mfORDRh
	 SDocWo1NxmdTexa9ErYzORXo8vQEY8gzrK9a9dR9tLnXzPsoHJZbt1jxH80Lc2OeBSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=r89bi3N8igRjPKtxY0/AYTvIwguFglFSkm5fyq/4TZ4=;
	b=DREPbc39bOtpNCEfP6E3AmCwysPI92oRlbdSmiZgZt/ShEKI3s0pWlZDXa5zR2fGGXYG
	 dEdLIAGgrahmJ8VgWqz/km4nRxBZ9nPuOGE+PZv54X9MeLfU2SeTrPKcMdD8tluYIyCr6
	 9UjN3NVdwSXOZs+7c/WK0Jp6S94skq7N8cwe6y2GnJ9s10nX66UZcII7KEIKXv7BJHfKL
	 Ganw2e2EH7G4G1/EAeAc+8oi/5S3WZVdsIftHz5zslT+96OoiYwU7pCWYx4JaszlPmKNN
	 LVbvYcO8msBOn2PFhnJ31awk/kM+LbI2/vfNk3jrdEVKoQxTxgGrOWHzJCU6Wj2JDaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFykR+4r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DAC606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3DAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFykR+4r
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-85ac281604dso4182568a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:57:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795802275; cv=none;
        d=google.com; s=arc-20260327;
        b=MXdTWdN9nPP3An7uT/sQSmqqcxHBCH+YUpXeLiiPJo2l1Zcx1EnAlmEW9uFGoucmmx
         gX5mrbDdlQ1aZzSa/UV8Arwwb9YBSNgKa82/lMVpQpASxpf+0YbJxDafWehBfQ4LKpCj
         O0nRxMKGizn94XgNL+4y9K5K6q29bjM+a74ctJQ9ftRhgBTupsZW6wbGpizAPkpGyCxG
         t1vz9raw2f1xFHCFe3vNicrpNzkvOT7OARpQQ7RNtP3+qHzB6caZZovwTpgzQJ6YReUS
         WVek2MK6zy+rnQ80+5u397h/+YHmnI0ACMyssofYhoEpEym8+OzOIz92OxemQpu68D/z
         sgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r89bi3N8igRjPKtxY0/AYTvIwguFglFSkm5fyq/4TZ4=;
        fh=5dOizNQDEsxvJsruKiyf9/4U1FirftEO9kzlZR/5x6g=;
        b=SD7SEbrZTD8s+N6DwcqJmSsbcMUVPYYHm0dPQnKRjdYznsH+sLPGCP5NvfoePkaXOg
         zoK4fgjGs8Nt5e5eFGUJkGnTZWctL0EfzG0nQhO6iMXwwRBZAhtTWVjaVZAKpfIHbzBO
         4qFwHFUhNAGHFvoXsYlrA+rqLt01ryZPBBUIpM2YoBpYNlyA6pw6W2Tm5EBH3Z26dOW6
         BJw5JcS2srv3KVYcL+PnGyV+uZJ/4/Jx0JNdTSs7p92d7/ILN659+CkRdB3IEKV5JcxK
         4+X/PuaSeG1z8DLvwztA7URnsCWNWqUEjwA8OFBij01foBDmvfLBuY7kQ1ElNiQ6jewm
         NKig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802275; x=1796407075; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r89bi3N8igRjPKtxY0/AYTvIwguFglFSkm5fyq/4TZ4=;
        b=gFykR+4rK+Y5pha8E6DialWdzskNIp+rfzdBDyUxhpuU5ZWiJ/pROfmHhj5+w1auWk
         hIXllfgw/Hhk4eBsidhKgc+i7SlJ6YKHqFitOK5MEzkHTs/2SqxV0A3IrMelLqOkdeAo
         pMebpjWB8pybiYb5wj/K0ftxzHg6Z76iJdHELGQ7iS+bjyIMN70Ujx1cIS2H31COyh2g
         b8ND8BAtVxD9ctFC6IziQeKYnjH7FjqJnu+s5OoO0HC8ZQ2YXAo7apjVs7/VAmKHwNHe
         LWwpMFGCcY6mV8En4seUsLqAIbYt0TagL1HEeveWZWqfaI/0E73Qphl+9Fr0fWZNGALz
         YXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802275; x=1796407075;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r89bi3N8igRjPKtxY0/AYTvIwguFglFSkm5fyq/4TZ4=;
        b=zFTgx6EzSwZ5srJVUs5msNJv/nW1l387nsqlPTq1T4tcVPjn6tVlFoDglYHDpLsJBy
         YzKK/mpuk0GKDoLdvqv1UUhlbGP1Z9Xm4l8VNBxZIb3hSi3aagr7WnLzn9bSCUxHHQAT
         aNdocBhh2PHXZnOOSgcmZwgdS1ipyb2dmiB/Jcuu/pAMDQ+rOM3i3GcKLnRZ5/Z/oVsK
         U9O2TKj4jH2mvs2Aphzai/ZCSM4mln1ZqW59znJzZh7Z81pMeMH23J5YKv+kcbqnMhXr
         lWxcZHJ9JyjX71YgJSxNeqTcdSa5F4BImOJ4Wm55bMU6gPTKppjsENE8Dws87cG43RP1
         Opcg==
X-Forwarded-Encrypted: i=1; AL+hErGxfsLiMxvLhmuhfQqAPi3bpREMf0gjxsTAKgAtliaT95E0dAksO/CSUpjjopT5+/FK9dIcrs0X/kVZGKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8heX3L8amw+9/u6iBGJK02tIbp8DDMem/Fmni61HXpnnvQ8ko7
	BcFUAxkUIvlJYDBF5egks0+zRI7HnUxB7OeHYaBQNrx0dHD/7Amn/iYHM15ceTDLkr41yM9GLnt
	xQX6t5qEfUxwd6Yl9ncv1pwFIv0rVW8I=
X-Gm-Gg: AZFdTZeibSRwb03qbksHAuRyh1J+xPhVCTisDjIZ2gbYq+RSY3JyaWBpdq2waauYT39
	V8MY2nxjgM2GPz2NAJW7PcM8txW+d6awNj+Li6GY1YH7mEquTcbqbKZoaQ4OKXZxUZI2fY44Xrj
	EVaw97xBUJtPPmaJRGvVAjNounYeFLD/93o61lbe6Lt5WBNXYOLHpZpLpzx06zFHX9m4eOEfS+l
	cNebT4Ser2gSrKTh8J6Gc3y/pPghI/yu2cnSqLnZs51MqoPmEHAIK4mh54d2PnOHV/uE9dSLkU0
	NbjzIZ0m53gDxauEeA1OCqjl1zuS2mi1zmCha5G/W+FlQSwaModwrOXFBBjzPRqsxfTq9gNDdAy
	z6HCo8Qbz2DWQ6FmAiIzKCdCGN3KFiW7uNWFxtqcGegGOj3YAOUwdV7eSVQMDcz72bDVXkNeEGM
	pi0Hat8eevcgYAZ00Hb7LrPRWgwKMlR7M=
X-Received: by 2002:a05:6830:4c18:b0:824:e29:e00e with SMTP id
 46e09a7af769-863159c069fmr25712859a34.20.1795802275351; Fri, 27 Nov 2026
 09:57:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112154520.151617-1-hjf3108@gmail.com> <55c2f09b-71b7-4aba-8f87-58f98aaf9e13@suse.de>
In-Reply-To: <55c2f09b-71b7-4aba-8f87-58f98aaf9e13@suse.de>
From: Jie Feng <hjf3108@gmail.com>
Date: Sat, 28 Nov 2026 01:57:18 +0800
X-Gm-Features: Aa3M54q895r8_E-MN064VdwuBWxnz6l02qG5-v487UDRTqOZKbwQ6xFMTCrK5KI
Message-ID: <CABOQOSW+Df5STmeexmdwGm4dVtXunezZJoMR_HPKtYZgRYd4Xw@mail.gmail.com>
Subject: Re: [PATCH v6] drm/tiny: trigger5: Add MCT Trigger 5 USB display driver
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, cyrozap@gmail.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 27 Nov 2026 at 17:49, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi,
>
> I think the driver looks much better now. I left a few notes below that
> you might want to address.
>
>
> Am 12.11.26 um 16:45 schrieb Jie Feng:
> > From: Ho Jie Feng <hjf3108@gmail.com>
> >
> > Add a DRM driver for MCT Trigger 5 USB display adapters.
> > This supports USB 3 to HDMI/VGA displays adapters with
> > trigger5 chipsets from j5create, StarTech and various others.
> >
> > The driver implements modesetting and USB framebuffer updates,
> > connector detection, and EDID retrieval.
> >
> > The protocol is based on reverse-engineering work by Forest Crossman
> > (cyrozap) at: https://github.com/cyrozap/mct-usb-display-adapter-re
> > and usb packet captures between the Windows driver and the device.
> >
> > Only the HDMI path has been tested. VGA selection is inferred from the
> > absence of USB audio interfaces.
> >
> > Tested on JUA355. The list of USB device IDs are taken from the
> > Windows driver INF.
> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> > Patchwork:
> > https://patchwork.freedesktop.org/series/176855/
> >
> > Changes in v6:
> > - Replace the USB transfer worker and vmalloc frame buffers
> >    with eight URBs that send the frame in chunks
> > - Remove keepalive work, it is not needed if it is never sent,
> >    and disarm any keepalive it already has
> > - Use container_of_const(), drm_dbg(), and drm_err_once()
> > - Group plane code and function tables before CRTC code and tables.
> > - Use the standard NULL-CRTC plane-check pattern and remove redundant
> >    mode checks, the driver-specific no-EDID fallback, and the INF comment.
> >
> > Link to v5:
> > https://lore.kernel.org/dri-devel/20261026112843.69795-1-hjf3108@gmail.com/
> > Changes in v5:
> > - Fix warnings found by kernel test robot
> >
> > Changes in v4:
> > - Move the driver to drm/tiny
> > - Remove the buffer resizing to reduce size of file
> >
> > Changes in v3:
> > - Flush the vmalloc buffer before submitting the USB transfer.
> > - Support display panning by using the source offset
> >
> > Changes in v2:
> > - Move the buffer resizing to crtc_* functions so that we can report
> >    out of memory errors to userspace
> > - Change the PLL search function so that it is faster and doesn't
> >    produce checkpatch warnings
> > - Update drm functions: crtc reset becomes create_state
> > - Fix warnings reported by kernel test robot
> >
> > sashiko review false positives in v1-4:
> > - atomic in these function names mean that the changes should go through
> >    through at once or not at all, nothing to do with atomic context.
> >    Furthermore other drivers also have similar patterns
> > - drm_gem_fb_begin_cpu_access is also required
> >
> >   MAINTAINERS                     |   7 +
> >   drivers/gpu/drm/tiny/Kconfig    |  14 +
> >   drivers/gpu/drm/tiny/Makefile   |   1 +
> >   drivers/gpu/drm/tiny/trigger5.c | 990 ++++++++++++++++++++++++++++++++
> >   4 files changed, 1012 insertions(+)
> >   create mode 100644 drivers/gpu/drm/tiny/trigger5.c
> >
...
> > +static void trigger5_plane_atomic_update(struct drm_plane *plane,
> > +                                      struct drm_atomic_commit *atomic_state)
> > +{
> > +     struct drm_plane_state *old_state =
> > +             drm_atomic_get_old_plane_state(atomic_state, plane);
> > +     struct drm_plane_state *state =
> > +             drm_atomic_get_new_plane_state(atomic_state, plane);
> > +     struct drm_shadow_plane_state *shadow_plane_state =
> > +             to_drm_shadow_plane_state(state);
> > +     struct trigger5_device *trigger5 = to_trigger5(plane->dev);
> > +     struct trigger5_transfer *transfer;
> > +     struct trigger5_bulk_header *header;
> > +     struct drm_rect current_rect, src_rect, clip;
> > +     struct iosys_map data_map;
> > +     size_t payload_len;
> > +     int width, height, lines_per_urb;
> > +     int idx, y;
> > +
> > +     if (!drm_atomic_helper_damage_merged(old_state, state, &current_rect))
> > +             return;
>
> Never use _damage_merged in your display update code. (^1) Userspace
> supplies damage rectangles for ares that have changed in the current
> frame. Merging them creates a bounding box around all of them.  IOW you
> add areas that have not changed.  For example, have a blinking cursor
> near the lower left corner and move the mouse around the window's
> menubar, and your driver easily transfers half of the screen or more for
> nothing.
Talking about cursor, this hardware supports a cursor plane and a form
of lossless image compression, I might add those in a follow up patch.

> Therefore always iterate over the damage rectangles and handle them one
> by one. Don't be concerned with overlapping damage regions. I did some
> tests with Gnome and could not find any operlaps. It appears that Gnome
> already submits an optimized list damage regions.  Overlapping can also
> be detected algorithmically and filtered out by our damage handlers.
> But a merged bounding box cannot be optimized.
>
> ^1: White lie, as we use _damage_merged for ast's cursor. But this code
> really is different.
The hardware seems to only accept 3 damage rects per vblank according
to my tests. Since I do not know in between which of the 3 damage
rects the frame is being output, I think we should just use
_damage_merged to avoid any sort of screen tearing. In this case the
compositor might get wrong feedback if the damage rects are small, so
should I pad some extra rects so that it gets correct feedback of the
current speed of vblank?

This kind of behaviour looks to be quite common, the hardware for
ms91xx only accepts 1 damage rect per vblank, so _damage_merged is
mandatory there.

> > +
> > +     if (!drm_dev_enter(plane->dev, &idx))
> > +             return;
> > +
> > +     src_rect = drm_plane_state_src(state);
> > +
> > +     /* Match drm_atomic_helper_damage_iter_init() rounding. */
> > +     src_rect.x1 >>= 16;
> > +     src_rect.y1 >>= 16;
> > +     src_rect.x2 = (src_rect.x2 >> 16) + !!(src_rect.x2 & 0xffff);
> > +     src_rect.y2 = (src_rect.y2 >> 16) + !!(src_rect.y2 & 0xffff);
> > +
> > +     /* Clip merged damage to the new resolution. */
> > +     if (!drm_rect_intersect(&current_rect, &src_rect))
> > +             goto exit;
> > +
...
> > +             iosys_map_set_vaddr(&data_map, transfer->urb->transfer_buffer);
> > +             drm_fb_xrgb8888_to_rgb888(&data_map, NULL,
> > +                                       &shadow_plane_state->data[0],
> > +                                       state->fb, &clip,
> > +                                       &shadow_plane_state->fmtcnv_state);
> > +
> > +             if (trigger5_submit_urb(transfer,
> > +                                     width * 3 * drm_rect_height(&clip)))
> > +                     break;
> > +     }
>
> Good to see that the worker has been removed.
>
> > +
> > +exit_end_cpu_access:
> > +     drm_gem_fb_end_cpu_access(state->fb, DMA_FROM_DEVICE);
> > +exit:
> > +     drm_dev_exit(idx);
> > +}
> > +
> > +static const struct drm_plane_helper_funcs trigger5_plane_helper_funcs = {
> > +     DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> > +     .atomic_check = trigger5_plane_atomic_check,
> > +     .atomic_update = trigger5_plane_atomic_update,
> > +};
> > +
> > +static const struct drm_plane_funcs trigger5_plane_funcs = {
> > +     .update_plane = drm_atomic_helper_update_plane,
> > +     .disable_plane = drm_atomic_helper_disable_plane,
> > +     .destroy = drm_plane_cleanup,
> > +     DRM_GEM_SHADOW_PLANE_FUNCS,
> > +};
> > +
> > +static const u32 trigger5_plane_formats[] = {
> > +     DRM_FORMAT_XRGB8888,
>
> I suggest to support RGB888 as well. It's not common nowadays. But it's
> the native format and does run slightly faster is used. Can be a
> follow-up patch.
>
> > +};
> > +static enum drm_mode_status
> > +trigger5_crtc_mode_valid(struct drm_crtc *crtc,
> > +                      const struct drm_display_mode *mode)
> > +{
> > +     struct trigger5_pll pll;
> > +     u64 err, ppm;
> > +
> > +     if (mode->hsync_end <= mode->hsync_start ||
> > +         mode->htotal <= mode->hsync_end)
> > +             return MODE_H_ILLEGAL;
> > +
> > +     if (mode->vsync_end <= mode->vsync_start ||
> > +         mode->vtotal <= mode->vsync_end)
> > +             return MODE_V_ILLEGAL;
>
> You don't nee that basic stuff. See [2]. Just test for hardware specifics.
>
> [2]
> https://elixir.bootlin.com/linux/v7.3.4/source/drivers/gpu/drm/drm_modes.c#L1652
Nice that this is already handled. The checks are actually for the
fields in the struct with /* minus one */ comments.
> > +
> > +     if (trigger5_mode_buf_len(mode) > TRIGGER5_MAX_FRAME_SIZE)
> > +             return MODE_MEM;
> > +
> > +     err = trigger5_calculate_pll(&pll, mode->clock);
> > +     ppm = div64_u64(err * 1000, mode->clock);
> > +     if (ppm > 10000)
> > +             return MODE_CLOCK_RANGE;
> > +
> > +     return MODE_OK;
> > +}
> > +
...
> > +
> > +     ret = trigger5_alloc_urbs(trigger5);
> > +     if (ret)
> > +             goto err_free_urbs;
>
> I still thing that URBs should not be pre-allocated and you should go
> for something like i try with udl. But that's fine tuning for later.
> Pre-alloc is fine for now.
I can send in a follow up patch once the udl design is finalised,
along with RGB888.
> Best regards
> Thomas
>
Best regards,
Jie Feng
