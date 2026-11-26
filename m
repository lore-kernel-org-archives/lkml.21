Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681411;
	b=fkct8zVn8NZlip9+ogRkC4GqKOdPabl+vJwZy51z9PM0I3hIaQpvnEJgKfqWpEmf4GIV
	 Q66bXL1gOprCLAt0E/jefliJFQk9Kgfchvdqz+u6Vh4v7+jRe1UlgFAkbr9uAnl+fXUZS
	 IAYYFV3HHo4FnNJE6jfkOW04YxIfUWqlEiu52/T1+1ImctBIA/jkkH7ccV72Pqw8Tmspd
	 MXFKaNdZSGvOQDWNImEGKGhMkdDPP6ckF+Kx4U6CHCBndjTHF2xt/sttaMKsqvhDHKF2D
	 Qh7rMuPAZRRh59ywQAJjFyU1JqlfS2TCxBa3wNXUtBXdHu0UUcMSoJZPpqMyra6h21Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mDPiQneaNeUi2efSk5eylep7jPHdMpeW1fG4LwrvlbE=;
	b=XV5yc8lnv1B6UKyNTrGyYiFhgQYr/FILoL8xirhFs3GquR3rGOKLFVDrdtZfA4x8lJIa
	 2LfcF/TzFfYFprzWdahUG4crMnyzC6oJ7MdhkaerJMchsnR+WbujdhUYc4qMlpr+uYIvm
	 pd0hDivGYAP5EaW+j6uUTieUrR/DZZkUbS0//n8ft2WpxQPFpGas8GqGQ6Lsv5WyetDnq
	 psEbe3/UOPk3PNHruH0qzKnwAEoidBeIAVa+4Bwn3YZsEllBn/ButKE1ZrEtdJWw8G96Q
	 0mfz+vF+5gQ4D1EplwElNg5dyGfswbKzL2ijf4blKA5RwB7KnjX6KlzUA5RGb/hQNLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jHeAog1z;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D1B606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D1B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jHeAog1z
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so3378985b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795681407; x=1796286207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mDPiQneaNeUi2efSk5eylep7jPHdMpeW1fG4LwrvlbE=;
        b=jHeAog1zMgDnWkFecSJzxo5h5l83jlIlWAtdUJt6MU71fUD6Qy6OA7grdcYYu4nLdi
         udjwlR0pic5ZYPP24doevBWlbQgipPhFGLRoK7ywfFRPQ1HB0AZd4fDHRlLuUrQSHgX3
         rrfN00D4ktT0gcjCcO38o55KsoWU0OYf3gTNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681407; x=1796286207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDPiQneaNeUi2efSk5eylep7jPHdMpeW1fG4LwrvlbE=;
        b=BMPf5du84euTIPO12K/RaWlTuO3m660q+nJadCcdvGL22BuvdaJ+aIayU8QgtSKaRT
         wUE/0F0Ty/fB/7DkbV5PDVBKrP/nToaAzhVjjW11NTi24H3o0e16XIMjy5Vj56DHhbZX
         G9WZQpwqDFTzNBzegEy2x883Gq4xmZgFJ14iOw4ZhhmgXR6cq+/KaQ6/T2ccsTWrvqFN
         +sywOqDlOE+IsuauNYy4goHdqoKssIyzZNG+DgyLV4KeF9Is698SEhjj6reclgpfsrxr
         sLtQSTuTqYmjEgMfkSvDoO44ke/BFrj3mAGT2XHMT1JqhfKJzIlbOy9c6V2jB0Y/E+ha
         gtCQ==
X-Forwarded-Encrypted: i=1; AL+hErHRZ43kprHonumI3htmRsV1q88bN8pIMbJo/elBGOwMrAG6ymAWDqWTBIdYbrJN6zV2TqCsKgBA5zdBa+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z99Azlye2UWXYx7cIhZ76mlBKJLRF7kuaFuYLvBj2s6diGWKtMV
	DVdbPHyN8yp5W009+/Z4Pqa2LYxhIhwvWUn+xuZyJlmF84dCxaXp7nrjncaod5guDwUhRqRPtoc
	WC4sw/g==
X-Gm-Gg: AZFdTZeCY/gMCA+1Ha+jQYc1yS+ksT8iOxh3DeLucplk8MdJC5SfzKVXvGLLk2VUMRR
	jUHoZ9NEAvgtOMgBB9YaSahbQEpH/PE9h5fslME+tZSntAWU+JQPuLdKUIo8dapL1j6dJ0F6T/X
	ubaUBN149CNnsVrgtjumEmEZ9KXyWPDH6R4O4PhelqMoWlDAKjCfFT/J+THHF5/aFO/oX6j3YPS
	jduQzNy3EL0hyuHj5wyOizafOI1DZuPZfwpPYRLaHjjuuXOo0A2EuUMquw64MDa3Ccm8QqZMPVL
	F+EhLoI+wppVYxXyYl6Kk1xaKOKq4v8lXo8ecYb6XZHgxCI4uCPU8TX9t+WVDHc1YNVJ+Xe6ubl
	SdVJdPhuwvX4hmDSeHOFzRNWzN8vksoAX3D4GVvQFpIkFo+Qo/fGCtHnEbIIYJDm5qCDryOc5+h
	nwZ+hQyOu+ATKg31EAUfIluZfw9lWo90A9qXO+Qtdrn0SzMFU9XPpNiDDkXGl6fegR62m/BW7zr
	ePm3b1WMTZ8tHEBHLHwlMh6uHpaSTZZORajP95By3gf2FalnkhnvsmfGmmW9B1OKNsf2NUtK2dx
	w9brEa8Y62merK7xsOYRmukODb9rBgGkUb418xwhaAamOjd1ENCA07JKr5EE15XtWok=
X-Received: by 2002:a05:6a00:3c84:b0:89e:ba55:119a with SMTP id d2e1a72fcca58-8c87d123bd5mr19522561b3a.47.1795681407050;
        Thu, 26 Nov 2026 00:23:27 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cdfbe269b9sm4773141b3a.20.2026.11.26.00.23.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:23:26 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386b8f2f671so3664545eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:23:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEZNMC6TCRiTLsyGWdG7HPdPEf4vvGnesiF1u0jM6Zf4T/EAJQL09w9rW9znOBaww1oabOqWvfnsH+ZTGc=@vger.kernel.org
X-Received: by 2002:a05:7300:a986:b0:386:c6e4:5732 with SMTP id
 5a478bee46e88-386c6e458eamr8946070eec.3.1795681404503; Thu, 26 Nov 2026
 00:23:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-22-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-22-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 16:22:46 +0800
X-Gmail-Original-Message-ID: <CAC=S1njgbFAsOruyi3tPecJTNnSM9xkeLqM6buvrvSTJXv1c-g@mail.gmail.com>
X-Gm-Features: Aa3M54rE91WEZuEtmgUF0iLv3_PtSqqif-lCGzmC6rPCZG5AI3LqYIpHVgEKyRo
Message-ID: <CAC=S1njgbFAsOruyi3tPecJTNnSM9xkeLqM6buvrvSTJXv1c-g@mail.gmail.com>
Subject: Re: [PATCH v2 21/46] soc: mediatek: mtk-mutex: Add new functions to
 add/remove triggers
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

On Tue, Jul 14, 2026 at 7:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add new mtk_mutex_add_trigger() and mtk_mutex_remove_trigger() to
> replace, in the near future, their older style equivalents such as
> mtk_mutex_add_comp() and mtk_mutex_remove_comp() for the Display
> Controller related MuteX triggers.
>
> The same functions will be used to also replace the Media Data
> Path 3 (MDP3) specific mtk_mutex_write_mod(), unifying the MuteX
> handling across all of the currently supported multimedia-related
> drivers for MediaTek SoCs.
>
> While at it, this also takes into account the upcoming refactoring
> of mtk_mmsys and mediatek-drm, which are about to migrate to a new
> Component "Type -> Hardware ID" mapping, by adding a new function
> parameter "hw_inst_id" to support that.
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c       | 60 ++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mutex.h |  6 +++
>  2 files changed, 66 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-=
mutex.c
> index eb5d381ff5af..ef8e77f7e2f6 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -887,6 +887,65 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex)
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_unprepare);
>
> +static enum mtk_mutex_sof_id mtk_mutex_get_sof_trig(enum mtk_ddp_comp_ty=
pe type,
> +                                                   unsigned int hw_inst_=
id)
> +{
> +       switch (type) {
> +       case MTK_DISP_DSI:
> +               return MUTEX_SOF_DSI0 + hw_inst_id;

Unfortunately, DPI / DSI IDs are not continuous in enum
mtk_mutex_sof_id. There are MUTEX_SOF_DPI0 and MUTEX_SOF_DPI1 between
MUTEX_SOF_DSI1 and MUTEX_SOF_DSI2, so this may point to an unrelated
SOF ID, Also, an out-of-range hw_inst_id (if ever possible) can also
map to a wrong SOF ID.
You might need to explicitly enumerate and map each valid (type,
hw_inst_id) pair and return DDP_MUTEX_SOF_MAX otherwise. I don't know
if there are easier way to work around this as reordering
mtk_mutex_sof_id breaks older SoCs.

Regards,
Fei

> +       case MTK_DISP_DPI:
> +               return MUTEX_SOF_DPI0 + hw_inst_id;
> +       case MTK_DISP_DP_INTF:
> +               return MUTEX_SOF_DP_INTF0 + hw_inst_id;
> +       default:
> +               break;
> +       }
> +
> +       return DDP_MUTEX_SOF_MAX;
> +}
