Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530517;
	b=kH0hPijgVJ4FkKYA9RPySpKQloX4GHa4ys/OzSeAiSCgnTeTijXKkkjVVuxG3Ri8DC6z
	 eo18/CcA8IDrbMeYNu6m+VCX+6laQshMW/kDz07zWNkLDqam2yXHDVKIyWHjdznB/++NU
	 ZYJnFTRsD7B3yaXVcfP0ffW2ZkECrVCl6t1pGvbv/01wQoqro8uPAHzM9Rds7VoEpwA+w
	 4BKZsBTnkVdMfYstJ7XszUouXndZ8wxBFMwwWTPRpiOxYHQqsbdxGmhCWno7O0vxeNF86
	 Zd2UiCc9hmqNTYGgoHR12wV8SMtaSIUHYeZbxULzHKI5tCqzSjwQQG893V4lFRaDubA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
	b=HNVylVzwseHBF+7POJU3U+YWbpTZICTgjtRRhoTHshJkMwXk/TgZc6d8NsyOZpCSbVHp
	 zrEbFFn7xon5VntZEQA9ziu7++5B/z6RkKJXcUf5cFvvs6JGTwR70kAWHt0h/e0dmpKwU
	 3Q/3nXhRxYc0EINNfdSOLrc/EUBUKxq7YoNtUzg2MAs7aKchQDQvWAH6OTstWxXlVK2gY
	 rdzDkllSivgsL3gJbp/ghK481PRP2kdP0buctUwLJIYaXcqFpa4URaCJwsaOawfl6A8qP
	 C2UudUc1PtIuEez0XfsW1cYyqwvlqE9l4OIw6AJw0ZqPK8gAnDiIFQAPkW6Nyqz0Cmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=YNYNe9AO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849B9606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 849B9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=YNYNe9AO
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0414c1062so26580925ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530516; cv=none;
        d=google.com; s=arc-20260327;
        b=D5UEz0fk2i88qjfefoWNAwnbTsspt6Kf1m8X7F2sdF5lLthPwuo6+XgAI5/frwnHZ9
         8lILnowzMEiKfDwmaQCY3BJGfpWnafyS7lYJ+rZyHdsuW7zRRM3oFMLEaheglFO2dKeE
         SYYUqvNYy4zbHO2JmJn7mU8XduDILiUDYV/t9ikUK+8snt5T37c8M+3WHCx4eAttw24u
         ag7RW43pV6bQG/l0H4hWLaXEYieGoWAqXBX61EN3pmTEUy+WnsZqagugbHoovfU4AZhb
         2njGUSCszF9kwQD4KjV4buBeetIklAQf4ATsm10nGVE+ZVzHIYENbMZw1v4ED6NwHXLh
         qmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
        fh=VeSzUMBNqRoQRO7tvHNU58G/vpQ6dpj1Lcjg4ulVX0Q=;
        b=nsECxk84lUfXVA51H4UOAj9DTSdQePwFm/PZcdbcaKp2ciP6Gmc9osyCaDRMs0hzJI
         Gea7RsqVqReTgwO70UtzcK5Nu0wiJ+fwEAfZg8LSylk4zIKYN9VEiReqj02R2cSuQ7qZ
         /dPBAiVne7X2hgPThLHrjqyzng6SkAPwgGfYaHMVcjPuVk1k6ew7/iTDzLdqUXTGK5id
         OY7Dpijh5t7iLWfO8gyL/8YTmjbWRPovU5/vIAmRfhcWPZJXXUjmOMWqudqcp2Kt38wl
         L97zYIt6M97cspy6ilK/mMIgMFOlNGEm9+qec+N6GPiOHtoIHa191DBxjcxDF5OKbUF0
         9sLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795530516; x=1796135316; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
        b=YNYNe9AOmHy6n+ZYPjLzcicnDwPqfhj1Xggjbp9OkGoO/W8+8izuzcJQvG2LwUHAKY
         9MfUtpx8hVEbyjq4BeaWyonwG9VQjYQrKC7Pl44aPQ0A8xKt6XQp4CqFxdlXEngU2jVR
         Deay8NOeZ8K0tXucJ5lyOuabW5SDm06HAZBTQio9oFs0grl+PlOGCnrdFwqWDgyvN2kh
         iNyRqy0sSd94YzWobZazh+uIlMQQDxuPBmEYfJCHVk9NDGnqOyvU+s5wuqq6xD3+uzBy
         tHbrkwuhJdj1Du7r9s+toqNnCrRrEaglj/XIc39bu5cCtf6lgSVkUHyhEaZmba0xfGUI
         Okbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530516; x=1796135316;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
        b=Jtnn6ujvwQNUXMgFejGLwn9U3BvMQKt+49QmrnpFu9Q1Oj4pQhP0du62AJyV7zwPDq
         62s4m8Arqx63vIdSwrzQ7quNpo7IkqzCONn9RuHh20IUjwkGfPqVfhPrLrY9cJ33rRwF
         NKalAiejJV/4NdOqqUV2KMutkXpvVbjQRgmY9JNTO+hyKOit4agcAtQxPCaxytiuwWv7
         jhFBHY9jKsXCtTS4J3rSZf++dfQ1ZWjAuh2bneWJApVEcB4GpaeS0cptpyzGE03RZPoN
         Z65oPuKZJdynEp8M6XgjJMd7HfRFfT9P/3EjJJnHJTKXICHDMdSnWU8u49eZqXdQY+5F
         Gubw==
X-Forwarded-Encrypted: i=1; AL+hErGiRd/+jvz4+BYgxrtLubf4d1C+eCAoNy5wg7XwuJLbtegVVbt+H8Smh5o5f9kAs8FzeivWb43g2q9Sw7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N+zN1dmN7xJz3SfRVZeqgKdQNZlqq0VmNuqc1zZaLuJb11ws8
	8qnsLiE2Uu4n1PAu0wUkEcprpmpuLF3EGmpw+yVnqPc3V3Wuj6/kklg9pWq095PkrXI00lk8M4H
	eMhJuK0n3xDw25MtZ84Gwus9ML9ed9/hd07IS/IdbnQ==
X-Gm-Gg: AZFdTZde0BsbRqRePPuudjNQwHNahs6iiCxe6yMwx/hf/4/9PMMlam+wiWLf0Cw1Dtz
	dv+3OvhyuhrCrBa10GWqufDqJoP7uZp7Jihm2Gbnb+KCwTiQzHHUP4mv5O+6+dkVVa34CO3IoHV
	bP3F3lrD4VWrvFdWTKrvkTm3xQdNlusLgZONi9SgV6mrHPHVmSLoInepIVJb31zFOOhXzztrgxE
	tfjQK5nlOMJl4qWBtB1NMF00UIfqob+ubPbWBtRrVOYsoV52YWc5mREo79hYIlBm2NhNhV2JxPY
	hzSn9Z59pn/rfu0VnEYNHIR+ESollqlKFY2DH1g1oXq80RMq+Sg9i0it/M01StsN9XR7kwEWAx8
	n9fs2CAigljosoClwpScU8Tnay6FOl4HMlA==
X-Received: by 2002:a17:903:19cb:b0:2e9:9a19:c5b with SMTP id
 d9443c01a7336-2f03f16d710mr139233565ad.47.1795530515765; Tue, 24 Nov 2026
 06:28:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 14:28:23 +0000
X-Gm-Features: Aa3M54rrDo3X7VrfTe9b69h24tjA9EEIAxDaPhgJEX5YWMApMtqcKA6bBO6NIJU
Message-ID: <CAPj87rO9saEC34+5NiYK8xyZiNytrVgOcszoY5uc7BpL=M4WTg@mail.gmail.com>
Subject: Re: [PATCH v2 33/46] drm/mediatek: Add support for Display Controller
 exDMA component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 14 Jul 2026 at 12:45, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> +void mtk_exdma_layer_config(struct device *dev, unsigned int idx,
> +                                struct mtk_plane_state *state,
> +                                struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_exdma *priv = dev_get_drvdata(dev);
> +       struct mtk_plane_pending_state *pending = &state->pending;
> +       const struct drm_format_info *fmt_info = drm_format_info(pending->format);
> +       const u32 blend_mode = mtk_ovl_get_blend_mode(state, MTK_OVL_SUPPORT_BLEND_MODES);
> +       const bool csc_enable = (fmt_info) ? fmt_info->is_yuv : false;
> +       u32 val;
> +
> +       if (!pending->enable || pending->height == 0 || pending->width == 0 ||
> +           pending->x > OVL_EXDMA_MAX_SIZE || pending->y > OVL_EXDMA_MAX_SIZE) {

Definitely don't do this please. If exdma is asked to do something it
can't (and I'm assuming that these last two checks are intended to be
on w/h rather than x/y?), then you need to reject that in
atomic_check. Getting here with pending->enable == true and then not
enabling it, is not OK.

Relatedly, most of mtk_plane_pending_state should be deleted as
duplicative of drm_plane_state and it would be great to see a patch
series very soon to clean that up. It's been that way for the last 10
years, with seemingly no discussion ever of why it exists (my guess is
that it's a holdover from pre-atomic code), but no reason to
perpetuate the badness.

Same comment applies for the blender.

Cheers,
Daniel
