Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782776;
	b=HG1kKfBOODBSD8AdlB65hDzO5KP+yTs/A4acpiBfziQI4NTa4GBBKv50kDp+egRfHK9H
	 sP6zQJi3Gpw4TBGhatgKD9v6O+SKGm0JlBjrI9I394JIjL1SsJpZllDNMVUESL7UMsBk5
	 J8eeMri3yzNknQ3k2xEsxnZ6qN4DYGtqVF/Ek0QeVBy54xKEViEI2RTHgNtxB3dA01uy3
	 kfts3lyKKTTKOZJQV1JtWKdA7WyliYhwvJ+XLd2N8STzjnGaSXIIkw4IAmFPai4uqaJML
	 z/s85nwhZTJXgcRVProVc7GcArwjmVxb0DgfuoRf5MJJdhFZwkip6SMvsoiqgvrZPyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6wJPtmDOKQWl0gKDtiuKlNF32reQWcBhdrSBFhz15UA=;
	b=MgfRRjprn4ivaKocDd8p6kn2iKCS3WklH5R9z/7H2ER89gVSrg4NWE3LZn8UroTUXxM/
	 yF0pgRRxbHSkSpWiKWyfGpvkzmaJu3tSNO4g1zOPqqnU/D+G9WbbJvX2aebQBWekH2ZzA
	 KifV1wAc9z78bLU3P9N85MmCfXvfLMUqtjaE8EuwiwYdlUgBt+REpnu9lOX+CzzIapQ1y
	 t0/gPYOd6RiY0zjIE/Z3BznrNBzRbm/fRoMB60n5pslVrgPLs6KylwbdBC8aQNlW/D/Au
	 HMyqQyI3ry2Ukkfd4Vov7hXA7u6jjEwmTfyGCBRALGrvfjAbJgz9hn+G/UnjOhKMg3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kkgrQHbI;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211D5606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 211D5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kkgrQHbI
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5363c8de563so80678231cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795782775; x=1796387575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6wJPtmDOKQWl0gKDtiuKlNF32reQWcBhdrSBFhz15UA=;
        b=kkgrQHbIdvfgdwpldWPMquM4oMzpisqFMRqFfu2eoEgG8jdwgBCpCznC5yntqnamzL
         1SGU4YQKR79rIveTm9FHGAOkZ2JcpmO7A+6kjP0pJeItNiX/+TbasMbGCoDZa1t9rSQp
         z/1f36RyCkTtC132W71S72uUS9HX85UOJsk/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782775; x=1796387575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wJPtmDOKQWl0gKDtiuKlNF32reQWcBhdrSBFhz15UA=;
        b=vV57CO3FpBH+ljo/0ji2tXzDlnuA8stv2ZJ2WSJ9vE9J8tDL15r7AlG/LqmM7uJepu
         0fCtlnn7DPcflQlvH73z8dNsqwfU9euCol2nnl3LJkA8ULbn1D7N08YkmRrdbfReIg9M
         8ab5OlgdcfF9NEALFA0M9SFgyqjivyVEa/xEav1iqYlCdvjXQD1AuJVjq7Ulwz/33wBx
         C0SwsbNQGslGmDJ9pv3fsvJIxSbRKsDKo526ihQFraSaBJjWFWFl24nDimtrt0rscbgu
         rC/TivYBPs9PbZ0sQobo6+5+g9uXPjQj/q/B309S96bK8pjGKogqVbb4XLxQqXGXVFdG
         WpuA==
X-Forwarded-Encrypted: i=1; AL+hErHbrLI3Z5iHku3/6CkQfytTxSXqF5BX5bp7XGd3pwbI26KSUa29yHJb4tFYUw1UkseJ3pe7DK8e4Wv7VYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j03tycOm3vINzF3Dib4vM43ZUQ7tgn7jGOXDE2ZDF3tFHqTio
	pbLl8qt28dEiw6kCI5cGDjJ7dpUipLSWhMs874mJPuRl3xym+JfORO279OMZiDP/Y0rGEUbQ0zf
	+bKn9fQ==
X-Gm-Gg: AZFdTZev3hfKqpXNzRhtyw15jR4JBxrRHzmWTV4cRoQB4MKV/+GKrlWqdiSxaVtowif
	XCQf/tecF6NQNuqrXmUZFCNpy2T/1d5rLE+18EIHy2fXwXl+YR14Qx8Z9cHFQigxBljapqv+NkU
	k6gspHYOmzKNmv2SThyhGw0A8rWUDZidj+dgS9meImvczIfYQ4FOlo1GDCeYGxUPRhUYazMjC1o
	kslyWq5wpikZis2f0yJRWu7LiHPWQBPpVJqYcfSQroIpt6cOK0WUKT4yjyWO58lk5j3pe+6226/
	StCNSiQtQxXfwvmsRgcEM8sj4JKFEpj1KRzReLqa8oGo4PzlZhZxXQdNXACkTis7s44gNoBu0ma
	pQDsBVAzMelVhhH2ev1k6ugGFNwFZRBFa0186eLpcP9gMqxHuqs+eY8Q3dxgYo/ejQw3DZrW1ek
	RLuBW7knOGbKal5jr/ZnKEHPI/H8DrIGWe0STx0vt9lnhoCFH6ZU/BKETqLgmwLMoDRF59M81Jn
	f2OHnNY0lmgH3nNZNdGfF7+0oBadQxUUsRfbxqRa+YETT2lPVjBR9+AMpEHEBsr/R6AnlmzQ/EP
	QqoagiPYX8ZIixVkhp7KhWxWfo+U7CaweTR8yfsqeajGFP8saj3kJXZSQZGp9wHC
X-Received: by 2002:a05:620a:4012:b0:93f:1f22:96a4 with SMTP id af79cd13be357-949ba9c6654mr4553912585a.29.1795782775039;
        Fri, 27 Nov 2026 04:32:55 -0800 (PST)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb4219c4sm1820992985a.41.2026.11.27.04.32.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:32:54 -0800 (PST)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9217800e7f3so30238916d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:32:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHahayLkxpIo+madxaNZt/38iThBXbaNiIOk89BnihQXRvVJaM6i6H9974w7R6CBFbXUsnAzeVLSAC4NOE=@vger.kernel.org
X-Received: by 2002:a05:7301:4d0c:b0:376:a6d7:8f6f with SMTP id
 5a478bee46e88-3856ec3ec8bmr25649718eec.17.1795782385135; Fri, 27 Nov 2026
 04:26:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-47-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-47-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 20:25:42 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh8TnQeGfW+At1vCs3ie=7EYiG2R9xSTyfZ1A4mW0+CGQ@mail.gmail.com>
X-Gm-Features: Aa3M54p-uqcPZ0BTjnlZ-C4P_vANwYAAc7cv53pfujMjetYD2ahEumQx7Kd9jG4
Message-ID: <CAC=S1nh8TnQeGfW+At1vCs3ie=7EYiG2R9xSTyfZ1A4mW0+CGQ@mail.gmail.com>
Subject: Re: [PATCH v2 46/46] drm/mediatek: mtk_drm_drv: Fail init only if all
 paths are invalid
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 7:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Up until now, if not all display controller paths were valid, the
> driver would fail probing and refuse to bind components: while
> that was a good idea before, now that mediatek-drm gained much
> more flexibility, it is finally possible to gracefully handle
> this situation and register only the valid paths while leaving
> the invalid ones unregistered, without any crash.
>
> Count how many output paths are found, and then count how many
> have failed probing: if there is at least one valid path, avoid
> erroring out, so that at least some outputs will just work.
>
> Of course, any path failing is not a clean situation and must be
> resolved: in this case, function mtk_crtc_create() still prints
> error messages so, even though some output works, that will not
> go unnoticed, as a quick check in kmsg will show the errors that
> made a certain path not to register.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 82d844b6abf7..7c9cb50909c8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -394,6 +394,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         struct mtk_drm_private *priv_n;
>         struct device *dma_dev =3D NULL;
>         struct drm_crtc *crtc;
> +       int num_failed =3D 0;
> +       int num_paths =3D 0;
>         int ret, i, j;
>
>         if (drm_firmware_drivers_only())
> @@ -460,15 +462,29 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                         if (!priv_n->data->output_paths[i].len)
>                                 continue;
>
> +                       num_paths++;
> +
> +                       dev_vdbg(drm->dev,
> +                                "[CTRL%d-CRTC%d] Path Len:%d, Controller=
 Order:%u\n",
> +                                j, i, priv_n->data->output_paths[i].len,
> +                                priv_n->data->output_paths[i].order);
> +
>                         ret =3D mtk_crtc_create(drm, i, j,
>                                               priv_n->data->conn_routes,
>                                               priv_n->data->num_conn_rout=
es);
> +                       if (ret =3D=3D 0)
> +                               break;

Since patch 38/46, mtk_crtc_create() already combines all controllers
(`order 0..N`) for `output_paths[i]` into one CRTC, so only the leader
(`order =3D=3D 0`) should call it.

Relying on `if (ret =3D=3D 0) break;` instead of filtering `order =3D=3D 0`=
 has
a few issues:
- If a follower (`order > 0`) appears before the leader in
  `all_drm_private[]`, `mtk_crtc_create()` gets the follower's `j` as
  `priv_data_index` (setting `mmsys_dev`, CMDQ, and `conn_routes` from
  the follower) and breaks before reaching the leader.
- If `mtk_crtc_create()` fails, the loop retries it on every remaining
  follower for the same CRTC.
- Patches 38/46..45/46 don't have this `break;` yet and register
  duplicate CRTCs for each follower.

Skip `priv_n->data->output_paths[i].order > 0` in the loop (starting
in patch 38/46) instead of breaking on `ret =3D=3D 0`.

Regards,
Fei

>
> -                       if (ret)
> -                               goto err_component_unbind;
> +                       num_failed++;
>                 }
>         }
>
> +       if (num_failed =3D=3D num_paths) {
> +               dev_err(drm->dev, "No valid Display Controller path! Goin=
g out.\n");
> +               ret =3D -ENODEV;
> +               goto err_component_unbind;
> +       }
> +
>         /* IGT will check if the cursor size is configured */
>         drm->mode_config.cursor_width =3D 512;
>         drm->mode_config.cursor_height =3D 512;
> --
> 2.54.0
>
>
