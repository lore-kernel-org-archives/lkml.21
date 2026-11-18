Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975452;
	b=tzdbFosL5FjZyZzQmfKth2ctqxbMEsfDRrGYfv4OMmUUygwXLY8/31EvdCNRnkvjnLAF
	 1xHTtmYQfxcRdqnF3jGrrLztLyIvr6avuAOXzKI9d1aPFbNrGz0rb+O569WryzfFPc0ef
	 U0cLS8QPgqhg4UnNwHdFbvh5xtqUNAQsa84bknfg1HPznlkiByESYUOaJJ/S3BKCQgjES
	 UTAmIhJ701+3SvznVHKpL5NUQogXigeyn4jivofPIff5l7WMi7uUeNTXnW4RbRtVa6/uk
	 grh1yPAVbyRwhe/2PPhhbSMO7hVvD9G4gIJd46UBJhWjfnQPGblW5R2HN/URomLNMVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+jujJ243QVTrYG17pj7lkbHGYx3SfvWrc0zUwmud3CM=;
	b=Z9ariKUpafHzj5/jLRaiRgEs/5lnRt45aN+1fLsVpVd3GpfLXv5i+PdoTEi2QGI4zb+b
	 ukKIAzSeJEI0t0i5Vqu3g+vGBaEzhzEa28FvLv9QqREm+IpAqRfTX3RuI55jCKNKo1enm
	 vtjYzpVSxP4QEsKRx3GHvHGhydjS27ypPI4JRZVRWmrHVB1ZHEVHfCYcqHvpd8BWJtRd3
	 Pt1V1eVDxjCF5sFuDnW0bDBOzc6C1p3YLYwB8+Wv7HnDnf3SIN5VYVDZ7wXyPb17HiA+G
	 VSEaEK5nQWGtgISMC+KK5S8LG+YQg6JB4L+pVsu3EDDAGWTkwXLx6I9CuwX34U4FyMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EIIgHh6M;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593E0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EIIgHh6M
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso352467a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794975450; x=1795580250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+jujJ243QVTrYG17pj7lkbHGYx3SfvWrc0zUwmud3CM=;
        b=EIIgHh6MpLQjDv/8P6oXJz4LaTgwzCxBIJgCCam9R9jnB3UKgTh0j/IupDZTDDUEIq
         7S5e1igOmOLWcVcLyWcGSPGQpoRG4Vele5hu7JX1/a9gLxEktBb40d1nyDOQ9SG19inw
         JRXBPHCP5HcF3PDK3v8OtVW7MTznA/7vb2omg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975450; x=1795580250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jujJ243QVTrYG17pj7lkbHGYx3SfvWrc0zUwmud3CM=;
        b=X0S6aul65AAiv/Ca/GKTnP8bwF04PEyiChG0dF/d/ltmW4K++6/q+zWKTI0K2Y3KCJ
         iGhXe5k6UYeY1Bt/aKeKP6MU+pCyl6ml8rzbY0iuq50ECBttyv0Kvq9CekTMZH3cRCG5
         Ch4V/FuC23HtuKI3h6njygZ2X6TG3UqfiCjBq1s4+5BKlnDjJ61Yl2X4+y/0lgJLxPuV
         PH1h4FdN2TdzcEFDlG7xNmdWnr4sYSMO26eL/zTGMaP58BXIhg3b0B/WVHepeBWjc4Bu
         6uBVUm2XQ+IPd6OCxWBtpHi4ArUmk+i0cMffdVMjW+ajJ4u7yfZTsDzXc/XatoFge5id
         enqw==
X-Forwarded-Encrypted: i=1; AL+hErE7ikmG1wBcfTx03175L8xXbIjazQ40f/qoNQYKHEtT/LtecSQXNzu/zG9HkekkmLc2J9J+pTK8xFuOv5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gtPHDbIb7vzpKdvHT0wwFQmAjBAfj1/1op5JPd5uIf6u9SnES
	kxLDvl6kyBuK9p+l0p3iyTjiZ2lWm/YTQwDiEyxu1csJ1tXMhO1/4mUp5q1bFme5gRD8KKkqU1K
	DhmyLwHur
X-Gm-Gg: AYBFou2DKR08gPqWTtYlpuR3iKB/veR4ihGLYYhW2tt+oRksILReJZ4KqlnrYd3+EE3
	VHZ4iwYmwJQEWFmO8EbwYoFGnzP5J3CAmWoq9kV1iC2V41X+PrtiJHhn6sM88WbMHeC7O7iFUy9
	01/iEJQBDfWHBctdJT7JZwjwiMiHHq2zb8ovz6XI3dEYwOSPJPb7RzDHoWs5ArXBafIKWIrHEQD
	6pI9a0QV2T5RgOzxJ5ecgFN9wr9xOL4N88qgx8gnmiluxJi/9QHuDQ8g4zKTjSrfPf/NdJVm4z4
	fR/G7lEqWcXgSoBKG6jp3sjRq1WgdGzYwKwE0shFTiowS6tKmebJNmsytXoefdNYA/3Q+ejL01b
	KT/PMgzpi71mxraRXTnODtdiqVR2DEoNGgeaj9oIyojzBfFRfEd7DgGjl3aok7vDrTeL1Js9EsI
	fDmCkCkSgnFmmE+qJCcqsDt9EJsrtLXTXteha+8U9RmkUA4XUj4YlykzZ5Z3U35nABtca01X22q
	RemRNDlKfp8hWtg4s7WydjI0mZWDowB3Gu1q/425AY/qjH96EMYpei3oEmeEFDqOBqfBoqwInzi
	w0wVfItzrpQ4xo/IZC/VN+2vweolIoFVYquzwCduPUWlvWIW5cIRQ+is+TfhrsiyGbWC
X-Received: by 2002:aa7:c719:0:b0:6b8:7e86:3e90 with SMTP id 4fb4d7f45d1cf-6b88810f98fmr649484a12.38.1794975450516;
        Tue, 17 Nov 2026 20:17:30 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a1eab52sm540729a12.25.2026.11.17.20.17.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 20:17:29 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so264544f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:17:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFfL7dxBT+uoDe0tEjbA4gzGCUmpGKR0qsdDq9QXx27FfFREjPYrP0yBaUiGBzzgf55OmF6gDclgGz8eOA=@vger.kernel.org
X-Received: by 2002:adf:e00b:0:20b0:490:7fb3:cb41 with SMTP id
 ffacd0b85a97d-4a63d2cfb02mr1975853f8f.24.1794975447625; Tue, 17 Nov 2026
 20:17:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-sp11-panel-lgd0779-v1-1-1020a0f2f83d@gmail.com>
In-Reply-To: <20261113-sp11-panel-lgd0779-v1-1-1020a0f2f83d@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 20:17:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WYhz_DoF5B-fJ77FYjPR=7+db1dgUsm3mmSKfFd47fEg@mail.gmail.com>
X-Gm-Features: Aa3M54qamHxziF6HUYxZrhm7gL8MsYoWo8lFKfy-Evpfhj64S9u9ILsI_5O3Rbc
Message-ID: <CAD=FV=WYhz_DoF5B-fJ77FYjPR=7+db1dgUsm3mmSKfFd47fEg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add LG LP129WT332166 panel
To: jimmie.lin@gmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 13, 2026 at 7:05=E2=80=AFPM Haipeng Lin via B4 Relay
<devnull+jimmie.lin.gmail.com@kernel.org> wrote:
>
> From: Haipeng Lin <jimmie.lin@gmail.com>
>
> Add an entry for the eDP LG LP129WT332166 panel used in the Microsoft
> Surface Pro 11 (LCD variant).
>
> No datasheet available. Delays were not derived from ACPI or firmware
> tables. delay_200_500_e200_d200 was copied from the entry for the
> closely related LG LP129WT232166 (LGD 0x06b2, Surface Pro 9 5G) which
> most LGD entries also use.
>
> Tested on Surface Pro 11 with ftrace (function_graph on
> msm_dp_wait_hpd_asserted and gpio events for panel power).
> Tested 22 cycles DPMS off/on, suspend/resume successfully with no prep-
> are retries. HPD asserts 179-182 ms after panel power-on within the
> 200 ms hpd_absent.
>
> Cross-checked that the Windows display driver qcdxkmext8380_DENidp.bin
> waits 500 ms after power-off, which agrees with the 500 ms unprepare
> delay.
>
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 30 e4 79 07 a1 21 00 12
> 00 21 01 04 b5 1b 12 78 03 f0 70 aa 50 4e a8 26
> 0e 4f 53 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 fd 00 18 78 f0
> f0 48 01 0a 20 20 20 20 20 20 00 00 00 fe 00 4c
> 47 44 5f 44 56 31 2e 30 5f 0a 20 20 00 00 00 fe
> 00 4c 50 31 32 39 57 54 33 33 32 31 36 36 01 48
>
> 70 20 79 02 00 20 00 19 3c e6 24 79 07 a1 21 00
> 12 00 17 0d 4c 50 31 32 39 57 54 33 33 32 31 36
> 36 21 00 1d b4 0a 26 07 40 0b 80 07 00 ac aa 50
> e1 f4 a7 62 e2 0e f2 f4 52 b0 60 b0 60 99 35 13
> 78 26 00 09 06 00 00 00 00 00 40 00 00 22 00 28
> c0 e9 0a 84 3f 0b 63 00 07 80 1f 00 7f 07 4f 00
> 41 00 07 00 c0 e9 0a 04 3f 0b 63 00 07 80 1f 00
> 7f 07 1f 08 41 00 07 00 00 00 00 00 00 00 d1 90
>
> Assisted-by: LLM
> Signed-off-by: Haipeng Lin <jimmie.lin@gmail.com>
> ---
> This adds LGD 0x0779 panel based on similar entries for the SP9 LCD
> panel (the datasheet is unavailable) and live testing based on a
> v7.2.11 downstream kernel for the Surface Pro 11 with this patch.
>
> Thanks,
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add LG LP129WT332166 panel
      commit: 742f7adf11338f41fb171180638b1d10a69b7014
