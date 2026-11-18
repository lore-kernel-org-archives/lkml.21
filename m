Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974028;
	b=TlaaU3MUfZ0V/E410eIyr+H7AnctQ0PQkMCdqMNNDpHiH8sg4IpAQgVo+vgAasaGf8DA
	 KvUHNe8ElaSHSLj7sCg0QRv6PwmyIEoQHDhTnrjOQ0xI+GIkCWaLVL5afS5gpyp6qTroT
	 hyhIcsfN4HNjYvIkV6WPZts0TIoH12YAp49/zWJ7ShsgEyLBPMRz1viD7494pr/iFDDKZ
	 FYgVoyArZX+RKeurDqGnnHal9dcQgExyUgvzOj2AUDfomMJ+YKY34yfwVIMM7/Y2q44o2
	 2FgxCRVIPnWHWhwUpuS9izWZ4M4n38oDqEW05N8VJg9CFUXf25blqIE99rRbsvB5ASw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IOskFv7B1qRwSI1xnDutWFbR8KW2ByneEJ1ja9wWCsE=;
	b=yHg7hiMuw/AAXPg7hzXwy8LR+sskRbZGWRiKlsVMYNfhov76G73YQqgop5ZkEb0mkbDM
	 YmHypQYstOzmFjDM9EK9X0Zj/9YV7XCKEZ2mWlatNO+jiE6RVzV+B7s9xOOp5djrZsQp5
	 iBJCtsde1vBh/xAnJhpvuLzkhfdviaaIhMJSFbvBkk8ihV7iagTl1y25c9p6ItZdBf8dO
	 xmnX160Jnx/exgh57Nuxh0xIpgrV/nrfYP6eduG181L46kn6WZAfs+026t7N8SO7cQNxZ
	 9JPniBQYoVR4+Tw1p5/gFUnnmHwTTC5ULKEidHcEObS4vX50BUAizck+ig3pKi68k3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TKEvq4C+;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36612606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36612606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TKEvq4C+
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso1789983a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794974027; x=1795578827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IOskFv7B1qRwSI1xnDutWFbR8KW2ByneEJ1ja9wWCsE=;
        b=TKEvq4C+kOu9XoWlOvQFsYId9LIonKAfu7yQFn+byhF1WREmZTXURSPDhli/1iI0nU
         vt6pJ6g34mRZL0z9z+NKUfMr9ybCLlLU2lNuk12lxVGJRGEFpdybPdQJe8SaX1dOLyL6
         pvrIZM6AIDLUM4zYFHSbs8ydDBtGgT+AfYiGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974027; x=1795578827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOskFv7B1qRwSI1xnDutWFbR8KW2ByneEJ1ja9wWCsE=;
        b=ZHgsC736KacOdkkZ8S0hPXvgZS1daFdbzyER32gEL8jhwdoGo7fcGvMViZdeWzYK8E
         SB933FwDLGyfWecu64Aqmn4L/OGkr7ysK3744iYyRFlGk/eui+KWdvajbxNY9J7WzfCZ
         Y6Trj9pVL7Sp2FE8rBSidxCrJD9HySPC1ImMjMcSOF5WlTs2RcSNWwjaUA8MPr8ZtueQ
         pDzqtMLkkm/yUsCsdZhA26Yn8OkFIxb+pCanqRO+7iS5EoKRbrUaI5dnb4FvPVylr1JM
         E1sI0wPhR20Hl3QkIk8DUGURYnblYOkAKAFaeiJnUQCJ24ExOsFzNzG7+x/yNNFG1mkU
         DTMw==
X-Forwarded-Encrypted: i=1; AL+hErEqfEIXDvIgXXCVknAb5ETw0KHLi8vuIMHZPwBlhz1frmw5xsNXwvwj7GQa4Ff+psYmGJHvc31vriLlV6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wScLHbBLIrhZdrycqioqij340j4Vcfun6SkU95lHtkeCmrcto
	BRclnya3MmZXOU41xAK7Z9/v/4D1oCyhbjmwwdXEKa4KGqo/dgcLcb7zLWZeUzNsDZbGdbA2EaQ
	foV49TZdt
X-Gm-Gg: AYBFou3J+4ysuWaY4Xoj0qoOHsPuI8en2rBg44qOuSNotSl+9H8YyrcD1/ZG6BZM9xY
	E5a+W3tL157FtN9Rio7WLa4KgOBLdTpHER0k6ITTwG5yjcTHde72fquXZco0SAe6gQipfmhfI5W
	yYose2QWcY/PQGlh7Eb/fYKfBVs8y/A4RmCy6XZKmNlArnrX/dTWX1SO7xpop5Gm+oxjQOvv1Lt
	igZknqLO9pitS27+cPkn9sIvLfc39D750F2q7c1SJo/GLJubrjNN+91vD0NrBD4AYxAyIy87LLb
	6uEpu8ESmn6/IobOieAfNdUz8mm1OWtMin7qf+PJ62Xrq3sbFHUZ5A6msSDF6aUuT9ouzALwsMg
	INrjIgnNsJKjJTsKOZeiFwCXmWibBt1VnnZ07XGr8bwO7Kf0H6V9TpvLypK5PlxPlktl9k0MX7x
	3WaXHuCko9+WHYCMRtAXEGc9fYe1uc6dnRbfVfDdThqRPZ4U9f3Ig1rADc7i/HPYtxGlesodh5W
	wTmwwgfaNIgEHWZZipyd2MyYROP7PzBvBwJaDjsCOCCGaE78R9xX07UeNa0BSoY/K9rDHeHHUOv
	Ho8Q4IrZuzPQpWygDiPSvjy3ryACSczz3Ifp/Bqc0CHK+3xLN8iGXmOBt5RiWRazibO3
X-Received: by 2002:a05:6402:565a:b0:6b4:8d5c:f8b with SMTP id 4fb4d7f45d1cf-6b859b6187dmr2436376a12.15.1794974026637;
        Tue, 17 Nov 2026 19:53:46 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88993eba3sm513644a12.13.2026.11.17.19.53.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:53:45 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3edaso219587f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:53:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFunTYNqDJAskUWqufL96K6FQr3AujTTjY9UycTQymx8qQ6WTlSplFzfHMs2YVKDymMxgb0GaT+cmmFA94=@vger.kernel.org
X-Received: by 2002:a05:6000:2893:b0:498:364d:7509 with SMTP id
 ffacd0b85a97d-4a3774cbbbamr10035694f8f.24.1794974022637; Tue, 17 Nov 2026
 19:53:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com> <20261116-reform2-internal-panel-v1-1-765cf8d5ff4f@igalia.com>
In-Reply-To: <20261116-reform2-internal-panel-v1-1-765cf8d5ff4f@igalia.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 19:53:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XQ0Nw6tuUjr_pC_DQnWQZ0XD=jH+_djvbduQSd3XSrcg@mail.gmail.com>
X-Gm-Features: Aa3M54pcJVKrzVh9hl7PlSfdr6bBBDt4Ls2uHxZOi9oF_y8egwxD6E6UxsIqAlM
Message-ID: <CAD=FV=XQ0Nw6tuUjr_pC_DQnWQZ0XD=jH+_djvbduQSd3XSrcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel-edp: Fix Innolux N125HCE-GN1 mode
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas Stach <dev@lynxeye.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Christian Gmeiner <cgmeiner@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 16, 2026 at 4:11=E2=80=AFAM Christian Gmeiner
<christian.gmeiner@gmail.com> wrote:
>
> From: Christian Gmeiner <cgmeiner@igalia.com>
>
> The mode has a pixel clock of 162 MHz, which is 70 Hz. The EDID of the
> panel only has 60 Hz and 40 Hz. Output of edid-decode:
>
>   DTD 1:  1920x1080   60.001038 Hz  16:9     66.721 kHz    138.780000 MHz
>                Hfront   46 Hsync  30 Hback   84 Hpol P
>                Vfront    2 Vsync   4 Vback   26 Vpol N
>   DTD 2:  1920x1080   40.000692 Hz  16:9     44.481 kHz     92.520000 MHz
>                Hfront   46 Hsync  30 Hback   84 Hpol P
>                Vfront    2 Vsync   4 Vback   26 Vpol N
>
> On the MNT Reform 2 with i.MX8MQ the picture flickers at 70 Hz. Use the
> 60 Hz timing from the EDID.
>
> Fixes: a14c6b0eef77 ("panel-simple: add Innolux N125HCE-GN1")
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Hmmm, this worries me a little bit. I know that on some boards people
purposely set a clock rate that didn't match the EDID because it was
the only rate achievable with the PLLs available. It kinda seems like
that's the case for at least one user of this board. In commit
eb893e34309c ("arm64: dts: mnt-reform2: add internal display
support"), for instance, I see:

> Clocking
> is derived from a system PLL, which provides quite good rate matching
> for the single supported display mode and keeps the video PLL free for
> usage with the external display, which isn't supported yet.

By picking a different rate here, you might break someone's setup.
...or is that your setup?

FWIW, it would be better to change how the panel is expressed in the
device tree rather than changing this mode. Can you change to using
the generic "edp-panel" under the AUX bus? Then everything just comes
from the EDID anyway.

-Doug
