Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795557969;
	b=O6J0qY1dZ+VaiA6nagPQACEpTG3Ey9vEciPOOPJVWGwWPZSvQTHqlFYajm5Gn/yqNkzC
	 J3TKjQ0yQNOCXeVSziwzXRjSmtMbTzw/V++rb/AwwS5pB8lNk4btKCrl1BN+MZZ3bV9h1
	 NKmOzvNhANwzV4FCOJGa1wD4REFqob5swvv6cE0qaaAJ4gyyRUNE2X+cSoysk5tIH8aX9
	 UTNueSmF+NyrBqfnU01W6BiR2A2jWTgbIE8G319PJKzpaLO0ALXIXg/Fip2RHdKasjIEP
	 lav1w7kYvqloMF5V1u2ClaDAQ3U1KwpoTc3hgBwBmbXSHImFRN/nHhBFU/61LFcMbwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
	b=YuAl95XBBDoaV//xA9zZja6pvFKDGQqSJ4mVl0PITCcAd6QWWc7DDf2SBb0fIaBCwPhG
	 LWh+1WSj+OcgD7T3RRDSRP756Gq6UhtTEQ1RA/k2RYDgtUYq0qTn8SOfouoN8ljhFcEmL
	 c0884SxRD24nGAJwkbd3oVu3Y6mK3juIuXMUpO6lKj3a39ISKvZJiMbxgGrrqU+gebqu/
	 qinaV6D90WPSxgxoudBBQ5bS96Ne9+QakFDzejZJthDqee89/kGfhT4/W9ITYbHgVUI+m
	 bWmXjfGBdc3QHItpSXbICgKUSBUnsZwShzRaDNfwP9a/zmkmccoqN6Jd8bThexLdkEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=d27cduBR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23607606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23607606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=d27cduBR
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b360828905so46761797b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:06:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795557968; cv=none;
        d=google.com; s=arc-20260327;
        b=FQxqeLw7jVl4Wsaw7/Cfe5XGDGjF4PgYolnfbWpYkemPbx/4Rkt4cUIyhOjESG/3bx
         1T1A2tSIiZgjAjgaNHZd7K2br3LsRgqe1JdTkSvy2/fW5EyMm8RYQAj1J2BL6W8T7dJl
         nxCYcqnHUBOH1HRJPNtLPErTuu0VsrOkMqp5vdIFRC8F7vCEGU6qJLPgT1NKyLOKBz7c
         ifp+ul5csCOqpHGLbL/SIZMiJqiggru0ahv3+we2FpqI0rUErukPGZ0zOBmt03eTTFma
         QwTrIr7LQlr6uaVPL0A4kS3Coa2nPOYCZAD5DDeKiA4P3MrivPnKLUY0zzx5ck0jLlT+
         gRYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
        fh=tBcOtJsyo/hVL/u9vx7l4FRDVT7WQwF/8GwpDSMU1Jw=;
        b=dfjMiWXy1rZPuwdY7sJ4b0a/L6XqClN7EGjysmXBbLHja7PrwsXVL4kq7jMxKhC+ei
         Wybb3ar3gFD3agqmLNgoECfeJLqbJl6YQwZhvgZrYKsv6bXt3xxQqGy9ieJ1pYzdkA6P
         qtzR+37CFWjBNyRIg5b2qzbfFk+RioPU5rcIAldR2Si8+5OAef6qpd2kXwPRdFGTwdGY
         2/dXIgVT7BBT6U/PUo9foWYQSTleQb+9DyA1jayRz9xf25Ks/bZHdcqcCfG2kJjKyfVT
         2JqoA1df0s4K7S6feQMZ5tsj+dU14oapmGiZF+53u3dv+LvaniX6iSLEN4Kl4ze2Veho
         +ehw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795557968; x=1796162768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
        b=d27cduBRSCI4Fx7E8JEwH4YkEnonereNTCPDQf1MqytROJcGGGMvHL3Zr80JbXggHB
         E0wcnOWFhVTUKUD0qU4PYjj1VflQoE5ZSxKEd+KccQRNVtKdw9S27TVP7NcGTKSV7/KC
         2oqwPsUkDnZNq1Adzg5tpDhVrgwbH5B3i08sVQv7zGMCmfaxhcJiAAg8b726Rpsr5klY
         lGfmGJlIEYS/AL74iTCcBG4GzGy14qSYjXFjr17lVGwMVGoX61/OvSCSODiZDouWm5XR
         fGn7on9CLOGvLFpcz363wjCsxy9b9KK6GE9dxwc6kQlypkH/RvLMRh0ly0GRsC4yElhb
         ZMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557968; x=1796162768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
        b=lmyyx7Y9y8phHe32B6l1G+jvxNXY/rdSq+7GLtO+dR33RR43QWkTRqgCdB+njG4GJy
         8E7Qxe91h+8Iad1BWfSMgRimdxRQ8VSsa8wMEnKGVjUEPpfaIzR1kw1Zwp4LPz0oLH3z
         hHnzekuiOf/jZ3AyzU6Yvl+j8xSBDOr9g3CIJHXYn5EF5XLxIKpILbv0HqxUCln+QHJJ
         ov9/3LPEWmbhSz1V97b5Q26cv2Ps6tD2lbs9Okg8wuMUQS/Kb2cot+uG59jGgda1t5q2
         NoU07YgL00iC0FKYC6iXLlP5Y5CbbWS4DWjwqEkg9k5U+3ShpKC3kOFZrbY7L4srvNhr
         INZA==
X-Forwarded-Encrypted: i=1; AL+hErGDIEyPPyNuzIWr13t8wdOdvPwu8e7n2rjNpYl6DZ3kEXt0q2mmy94YdeVnW7fNQMhz1QMtFdFCRsqmm1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bdFV7OfqVMIEtZJ3ymJVWy6Dp4CWPe2+IG9HErStFlOXuMdO4
	af2AWLlVeeY0nw3MNoYdgch8r5lQWNjVcMnuntuya8mal2JdkcO2SOjFiXUyGIq/zmk6NpORj3s
	dtUKrtLGZRQwwbEfy6GCEYv095b6Vy84=
X-Gm-Gg: AZFdTZfSr5POK9idQy7c5XiS+m6HiFsb/MBHEg/b/hDsfewPuYj11aNtWPw9E2Tyw3q
	tPnIt+QvhxcUE2v+46I0134HxudIyfFcNz6wl5WLQqmAOz08uzUDPk08Ysk/DcUUDN6AurU7mAH
	nZlrJi7tqfFys0Q2zpUDSDuF3xXpiekn5VKnB1R5r+X1Q2a4WU+KNrOs/EQNFZznuXyHFIDV5GK
	KXPHY2GyGw39T6ziRCHpjXyd3Y4EQIAGYQVYIj+mfhFGaztLA9ZZ9I5mimFpQNeWug1PUecMSM3
	oYfB5s9l/rDazPmMefe6feiM89CnwptiNcX9TkL9JRtHCsP/xUuYDDScCyqhfMswnJlvvWGkEa2
	rx30r/xS7FCKqma1okwjaArroxUOswyq7eucq4meuz9W7Y9XnfiGnRVmqTjNeUmMfjLXr1g==
X-Received: by 2002:a05:690c:4806:b0:8b3:33cf:1ff8 with SMTP id
 00721157ae682-8b52047e1abmr62214977b3.51.1795557968035; Tue, 24 Nov 2026
 14:06:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
In-Reply-To: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 23:05:57 +0100
X-Gm-Features: Aa3M54obAOudEtwcvYkDuGnJHvL3A4XdBNW-oHonc9K3rZo32rUzvFY7EEi7VPQ
Message-ID: <CAFBinCD822UPQrrd_8ZbVRUVCVJ-3pGN69vbZBxUE+0yeMcysg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] phy/drm: amlogic: Extract Meson HDMI TX PHY into
 a dedicated driver
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Ulf Hansson <ulfh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ronald, Hi Neil,

first of all: thanks Ronald for picking this up!
I like the overall approach. Before I dive deep into this series I
will finish the code-review of Valerio's AUDIN series.

Two quick notes below.

On Mon, Nov 23, 2026 at 8:38=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
[...]
> Overview of the series:
> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
>   add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>   "hdmi-phy" child node under the HHI syscon.
It's been a long time, but I think we've been asked by the devicetree
maintainers to have reg properties for the nodes within &hhi
But I can't find the message at the moment.

> - Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
>   PHY configuration ops, along with the temporary legacy creation
>   helper.
At quick glance your PHY approach would also fit phy-meson8-hdmi-tx.c
There seem to be minor differences:
- two additional enable bits in HHI_HDMI_PHY_CNTL1 on GXBB and newer:
HDMI_FIFO_ENABLE=3DBIT(2) and  HDMI_FIFO_WR_ENALBE=3DBIT(3)
- newer SoCs seem to have HHI_HDMI_PHY_CNTL3..5

Meson8/8b/8m2 HDMI support is not upstream yet. That's why those SoC's
won't need the backwards compatibility code. So if you need to tweak
the driver: feel free, there's not much you can break!


Best regards,
Martin
