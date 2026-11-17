Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794942765;
	b=NnLWlO4AQq3TUvvcqdINPEiMFXuY08YDvLLasNyiNrBrCYrjIN75KJfLATdThP3SsJ0d
	 YEI0jDVaUGz6P+HpAWhAAVuE5NJoRtCBwvLCc9QJ1nBNidhyw/D86BuEuCveOnwi0BrSA
	 urudbcjGcVbbbZ5kzpcu/ln3a/Wg7iRxM9bLMwbp5InanKzOMPToRfDkXXHyIbnC25HUI
	 ZsPjo62vGJhz+gVG9T82GLY22ChfptyYayrxCmp96w4pm6JlNgsY4cpKI+mFA3YTnRc/+
	 dOOngwOiJjTLNZDWl6F/aQ/a/qR49lG2lil3vjAAM5VFhU1wpwKeh6sE4XIzXMcQt+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kYPA8tarVAEw5Z9vFPCpKVSX5tG6DYwzNUtP3jq7kk4=;
	b=5aPfpB3WHOPLNKxk8ChegObzNWuqDGNbUMLLbJGE2/oGtTJNx8vcQyFwpJQNfOkf1wFy
	 +2uNHg9XKLpi1MGtoRUbmS3m3IfzKCxc+6k0TiZsJshMtrapvJnSW9LIWlGyAYp8mAinh
	 6yde9DG+I0tMWy7j7+Cpdeqr45ZMjdQfSk3SDURwTcbV2c5i8ICupf7nDNy7gBEGqc0e7
	 l3Ok4bzhUSz5oq1imDnJRQ3XkMoxPmhD2NPGbNxQFxMaILku55J2UTgNK5BWDJ/r/j+Sn
	 /FNQWgI+TpfZ3tTf1TKO/futLu9gYgCDEZFEaB9dMTIaHOeLXI3E4vzRgSnYX6cRwQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=VKrpXdj0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0509E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0509E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=VKrpXdj0
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-705cb6ceebaso144250eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:12:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794942764; cv=none;
        d=google.com; s=arc-20260327;
        b=UQMahV9U4IJq+4Ye5FJxbq9JIJnQsh89fOZpiOWWpL05DEK0O4bkt/IXZCcPkmWTlh
         9pLwmwPvU6hV8dhAX4+ogAHa94hpe4SkF+F1mXTxdSS5i1FIRCNGNsq3I7jLrCAkzOwL
         G8+t/Wg/3fHKZNfjTSCD4APgNHM93rq7Ef9X3LMcKtlEszkQeqQOsDRA65FcnqRnkILb
         9Sao/n6GDNWbT7kzcYxq8PaclshIK28q2A9xowW+qgjF1pYSxKZSRpttUWbqwtW5GV4D
         DfADLBqQ405qV9amO02aM36ug+Ti1EAZVyGd3sZxgY2xLBVdUPsV/98vHBU1Z08T8i1Z
         Z3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kYPA8tarVAEw5Z9vFPCpKVSX5tG6DYwzNUtP3jq7kk4=;
        fh=tD0IqS2qzJxjOF7hOowT1KAyZlseZuM9/9N+8Of7rx8=;
        b=Pal3W04Jdndo5vH1fZI1Ge8NocuIah/xbZA2/y7ovWpojZeWKghstv+Vel9uBOyqZh
         XC5HYkA6TAtalu+jvuKtqctezu1ggzbQOaCCiNkjYdJH059SkefYtb6MWZpiRE9lTqGn
         GOByRCavPhhNN4BglunlTkicw2H5tdkfszcmNi4DGvykNXoulqN7AnymB3Ldv3xcWOB5
         Qs6M5Faykq7oux+bZHQtK8ZTNdSTRkmIw5M+2Ry+l+bv6gNUGj5olHgiu89OQd7/rjWN
         REonk9d9+hbWdfLc3lj86PZ7pVJOM4J8WOADPt2DSGKRyB2TGwIGnEkqLRGfBJPMu4nm
         jDrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1794942764; x=1795547564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kYPA8tarVAEw5Z9vFPCpKVSX5tG6DYwzNUtP3jq7kk4=;
        b=VKrpXdj0I6Dh1CNrvpWHALg2f0cEeSMvU9VfPjiQ3XJIc9/FxSHWMk7H1mCojRdKat
         NHnAiLHrN4N61ozSzF0JlQBwvI9pF+ZITYR0VS5zWxNuen+CqSPeK+NE5nOZHvev1nqC
         P7WDPbt3rzPqLrY0Bww0NedNHJE/KwyD7PQV5yBB2cQhO0zqZeDPAJUx4f1dKDjR2M0P
         rQq9NnlNOaVd+pzJxcL2yPyjp8nz+YcbQwHe8y8+LQy080aN7U8P1Hlm/9blNZhZbFU+
         fuet4nG0QMdLFuxIxfb45s7jewohiysVEy8J54yRcl/E7Mk8L31oCh3Q+2d4Zfl207xR
         GYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942764; x=1795547564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYPA8tarVAEw5Z9vFPCpKVSX5tG6DYwzNUtP3jq7kk4=;
        b=wEAJLDfoyZNjn5LUBVlBPQ39/+ZUuku+pS2r0RREFC00K2CgUbxKMkhc2bwZFedQme
         AGN7dfZae7eY5CDUyVaECRvOyTssVFfGQdEw7LwcmxNrGIh+cvV5klbkVIpgASIw1gk0
         5vjBtoWjV1g3ghwVsOdteHWt6rt2HLmVWniw+5T8H4guZ3Ppero14EjjJz0AEcF2uEyZ
         nhPIJpD2vX6sfZZEm97vuixoHrSkRVE9GE/1i1osFqm4Nl9chbN6cYy7KryhhpGxy+8V
         a9qMMQIjnbO7Fqte7XIFGaqWvLM3usQa3AAdzymSS3OuUzQpGrBnYj4JmbaYifucQYnd
         ebKQ==
X-Forwarded-Encrypted: i=1; AL+hErGIhr0QoA+OnCs5EN37Mh+R7rbmNwcrAfRrRuX3e3HKeUgv3O0LMDk7I3ld3inaWTSGuVX2l4ohRCRZtcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z//C4lmFxoF48wa90/DwvGIlD0S8BsB7S5DzksfelgiJLwBWrRl
	ZbtYFG7URd7xl8xdxcMZX4OzU1lDImBIwfc1cceVwbA98Z5eb5+NqCFrUbZAo5+uaKMz0Pid8M3
	93LJbZXN1WEPjbEzfK4bJlORyTzamCsONBzg8FKY/Pw==
X-Gm-Gg: AYBFou1cF2zzDt9XjlJLzb778v2igHiePWc5GZ1bJWi25URuVxDHczIf0jTa99tHQVV
	tsURT/ChPa8pmc/fBk1lKIlhJ66kngv/ebJ4ZVk3ICLGZbct4PT4+wsI2KrHNXXZoK85XFgpJIj
	ujDUqyrYE3fjV8pIWH9EQi/LMg6jNAIu7WiaQ1LE6cyJScJkytJbnm0pEar5kPEzv0iCK8s60Zu
	9jFCE/n4ow61o/9s6fHSCYsV0lMHl8wEsAOt0xzIzaoeCNpq71L5MegRqXY2YdAfKeS4tLarCHL
	q4zMeDjFVxmlkDExzGG+BUcOTO8Y7h/wg4hjLC8b8r+W7KHFjMCJy2MxR3MQSFkK7Pn95eZyHjF
	47A7cOCjNojH9JEJku6VfJkZSjLJt5XssphDRGCzW+r+gM5ySYja+iamlQLuyf8EK4FPv+S8FQh
	eTLPEbkEL6Snrtt4Ih4S6kCJOEjkY8CYBJMhCUEsjyItMI6yiFadycxw==
X-Received: by 2002:a05:6820:55d5:20b0:71a:fb4b:a988 with SMTP id
 006d021491bc7-71b184ed86emr177842eaf.47.1794942763873; Tue, 17 Nov 2026
 11:12:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-drm-reset-state-flag-v11-0-378b3f7bef32@kernel.org> <20261116-drm-reset-state-flag-v11-6-378b3f7bef32@kernel.org>
In-Reply-To: <20261116-drm-reset-state-flag-v11-6-378b3f7bef32@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 17 Nov 2026 19:12:27 +0000
X-Gm-Features: Aa3M54rMdloF5GPfjbPDu5yqWWdIpGB-WDV67sxUG3_26RmcuUfnvJjLKvmFoZI
Message-ID: <CAPY8ntCyverGKsrzGVAnSeVokVFF4wxBVvuj1Cx178GctPtWwQ@mail.gmail.com>
Subject: Re: [PATCH v11 6/9] drm/vc4: Carry the HVS channel over to created
 CRTC states
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Haneen Mohammed <hamohammed.sa@gmail.com>, 
	Melissa Wen <melissa.srw@gmail.com>, Daniel Stone <daniels@collabora.com>, 
	Harry Wentland <harry.wentland@amd.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
	=?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>, 
	=?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Simon Ser <contact@emersion.fr>, Victoria Brekenfeld <victoria@system76.com>, 
	Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Nov 2026 at 10:17, Maxime Ripard <mripard@kernel.org> wrote:
>
> drm_atomic_commit_fill_with_defaults() builds its commits out of
> states created through atomic_create_state() instead of duplicating
> the current state. A created CRTC state comes with its
> assigned_channel left to VC4_HVS_CHANNEL_DISABLED, while a duplicated
> state carries the channel currently in use.
>
> vc4_pv_muxing_atomic_check() skips the CRTCs whose enablement doesn't
> change, so a CRTC that stays enabled with a created state keeps its
> channel unset, and vc4_core_clock_atomic_check() then indexes
> hvs_new_state->fifo_state[] with VC4_HVS_CHANNEL_DISABLED (-1U), far
> outside of the array.
>
> Copy the channel of the current state over in the skip branch, like a
> duplicated state would have carried it. This is a no-op for duplicated
> states, which already have the channel set.
>
> Add a KUnit test that enables an output, fills a state with defaults
> and re-applies the same configuration, and checks that the CRTC kept
> its channel.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

>
> ---
>
> To: Dave Stevenson <dave.stevenson@raspberrypi.com>
> To: Ma=C3=ADra Canal <mcanal@igalia.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> ---
>  drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 105 +++++++++++++++++++=
++++++
>  drivers/gpu/drm/vc4/vc4_kms.c                  |  16 +++-
>  2 files changed, 119 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu=
/drm/vc4/tests/vc4_test_pv_muxing.c
> index 7a54f46acff9..c868d2cd1b3d 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> @@ -1119,14 +1119,119 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enab=
le_too_many_crtc_state(struct ku
>
>         drm_modeset_drop_locks(&ctx);
>         drm_modeset_acquire_fini(&ctx);
>  }
>
> +/*
> + * Test that a CRTC that stays enabled with a state created through
> + * atomic_create_state(), like the ones drm_atomic_commit_fill_with_defa=
ults()
> + * builds for a reset, keeps the HVS channel it was assigned:
> + * vc4_pv_muxing_atomic_check() skips the CRTCs whose enablement doesn't
> + * change, so their new state has to carry the channel over from the
> + * current state, the way a duplicated state would, for
> + * vc4_core_clock_atomic_check() to see a valid channel.
> + */
> +static void
> +drm_test_vc5_pv_muxing_bugs_created_state_keeps_channel(struct kunit *te=
st)
> +{
> +       struct drm_modeset_acquire_ctx ctx;
> +       struct drm_atomic_commit *state;
> +       struct vc4_crtc_state *new_vc4_crtc_state;
> +       struct drm_device *drm;
> +       struct vc4_dev *vc4;
> +       unsigned int old_channel;
> +       int ret;
> +
> +       vc4 =3D vc5_mock_device(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
> +
> +       drm_modeset_acquire_init(&ctx, 0);
> +
> +       drm =3D &vc4->base;
> +retry_first:
> +       state =3D drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       ret =3D vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_=
HDMI0);
> +       if (ret =3D=3D -EDEADLK) {
> +               drm_atomic_commit_clear(state);
> +               ret =3D drm_modeset_backoff(&ctx);
> +               if (!ret)
> +                       goto retry_first;
> +       }
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       ret =3D drm_atomic_check_only(state);
> +       if (ret =3D=3D -EDEADLK) {
> +               drm_atomic_commit_clear(state);
> +               ret =3D drm_modeset_backoff(&ctx);
> +               if (!ret)
> +                       goto retry_first;
> +       }
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       new_vc4_crtc_state =3D get_vc4_crtc_state_for_encoder(test, state=
,
> +                                                           VC4_ENCODER_T=
YPE_HDMI0);
> +       KUNIT_ASSERT_NOT_NULL(test, new_vc4_crtc_state);
> +
> +       old_channel =3D new_vc4_crtc_state->assigned_channel;
> +       KUNIT_ASSERT_NE(test, old_channel, VC4_HVS_CHANNEL_DISABLED);
> +
> +       /* Make the enabled state the current one */
> +       ret =3D drm_atomic_helper_swap_state(state, false);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +retry_second:
> +       state =3D drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       /*
> +        * Fill the state with defaults, like a DRM_MODE_ATOMIC_RESET
> +        * commit would, then re-apply the exact same configuration.
> +        */
> +       ret =3D drm_atomic_commit_fill_with_defaults(NULL, state);
> +       if (ret =3D=3D -EDEADLK) {
> +               drm_atomic_commit_clear(state);
> +               ret =3D drm_modeset_backoff(&ctx);
> +               if (!ret)
> +                       goto retry_second;
> +       }
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       ret =3D vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_=
HDMI0);
> +       if (ret =3D=3D -EDEADLK) {
> +               drm_atomic_commit_clear(state);
> +               ret =3D drm_modeset_backoff(&ctx);
> +               if (!ret)
> +                       goto retry_second;
> +       }
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       ret =3D drm_atomic_check_only(state);
> +       if (ret =3D=3D -EDEADLK) {
> +               drm_atomic_commit_clear(state);
> +               ret =3D drm_modeset_backoff(&ctx);
> +               if (!ret)
> +                       goto retry_second;
> +       }
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       new_vc4_crtc_state =3D get_vc4_crtc_state_for_encoder(test, state=
,
> +                                                           VC4_ENCODER_T=
YPE_HDMI0);
> +       KUNIT_ASSERT_NOT_NULL(test, new_vc4_crtc_state);
> +
> +       KUNIT_EXPECT_EQ(test, new_vc4_crtc_state->assigned_channel, old_c=
hannel);
> +
> +       drm_modeset_drop_locks(&ctx);
> +       drm_modeset_acquire_fini(&ctx);
> +}
> +
>  static struct kunit_case vc5_pv_muxing_bugs_tests[] =3D {
>         KUNIT_CASE(drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable),
>         KUNIT_CASE(drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too=
_many_crtc_state),
>         KUNIT_CASE(drm_test_vc5_pv_muxing_bugs_stable_fifo),
> +       KUNIT_CASE(drm_test_vc5_pv_muxing_bugs_created_state_keeps_channe=
l),
>         {}
>  };
>
>  static struct kunit_suite vc5_pv_muxing_bugs_test_suite =3D {
>         .name =3D "vc5-pv-muxing-bugs",
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.=
c
> index ab551eb2da50..562f2d1f45a4 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -970,15 +970,27 @@ static int vc4_pv_muxing_atomic_check(struct drm_de=
vice *dev,
>
>                 drm_dbg(dev, "%s: Trying to find a channel.\n", crtc->nam=
e);
>
>                 /* Nothing to do here, let's skip it */
>                 if (old_crtc_state->enable =3D=3D new_crtc_state->enable)=
 {
> -                       if (new_crtc_state->enable)
> +                       /*
> +                        * A CRTC that stays enabled keeps its channel. A
> +                        * duplicated state carries it over, but a state
> +                        * created through atomic_create_state() comes wi=
th
> +                        * the channel unset, so copy it from the current
> +                        * state to make sure the core clock check and th=
e
> +                        * commit see the channel in use.
> +                        */
> +                       if (new_crtc_state->enable) {
> +                               new_vc4_crtc_state->assigned_channel =3D
> +                                       old_vc4_crtc_state->assigned_chan=
nel;
> +
>                                 drm_dbg(dev, "%s: Already enabled, reusin=
g channel %d.\n",
>                                         crtc->name, new_vc4_crtc_state->a=
ssigned_channel);
> -                       else
> +                       } else {
>                                 drm_dbg(dev, "%s: Disabled, ignoring.\n",=
 crtc->name);
> +                       }
>
>                         continue;
>                 }
>
>                 /* Muxing will need to be modified, mark it as such */
>
> --
> 2.56.1
>
