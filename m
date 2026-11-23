Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427203;
	b=aRz7WTb3r7SGTX9Y13BSf3eKLZSrcUyf4+rgQ9OuRZiiAYxoD2dyrYhK+oOIPERltEE7
	 83KHW4D6G7hBwk8MwG+YbYoglg7DL5CC6dTznz3qsFshIb+/6Xb7v1ivoqtJ0uYOc8reR
	 TQTSePe6wR0gi7aNZOspHCnBs9I7SMNn7fbJ0KPCKQQgXn+YG+nbecq8d/iT6J/hPSjkn
	 Z6Wlc7vgJzESka3BoDzx2Kxk9CyUVcB0kd/StMILtII9/MSkVZ+3iv4M+Gj1FIBw/zAjO
	 YbDmrjPmPdFc9FxGlFwlPTHMpLbusbmxhgoPcQnwl0WcCvQFkK8Tb06oay/9+vFAbLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Ow1Q+hWzDlODuPLusaf1++hR85dplAxGuhutVEfabRA=;
	b=NLdzlmWKNCxq+AqvX19nxP+OKPNMeMW4RMNWvcrhxtMcEyCMAnxYVt5wAB2/VyhDEROD
	 SCEEhzTvXjV2RGYRhSe1mYlUTP18nhjSpCk/Kbc2+tEV4+ROaXO2AlV8kQS9jPYdsy11r
	 FMdcuiYxbKZ5neNF3PlmESN3gZ4VSoEd0JwXTkZ+ViXOfi2vVRtW1gpT+MSHSoMCQSC2H
	 QNLaAGQ2Qt/mdBYs43yZDRz6XV45dIrRnyyToIOCnfblbYipElpIPqjuftKABZiH+dQq1
	 V+MuGDZwctCBcdu+5vF4VPoQ6Qw9LAtQdtTRUe4qqS7uuG+3RVRasoofVEEsM96/pDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XU+u+Y1b;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBB2606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDBB2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XU+u+Y1b
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso2118930b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795427202; x=1796032002; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ow1Q+hWzDlODuPLusaf1++hR85dplAxGuhutVEfabRA=;
        b=XU+u+Y1bVIkzE+Jn/7sv8BBlxJGNLKyIXYrYC+l4oPb5VV5mYga5Gw5+2XnC8apCGu
         J+E7f7u6opcU8EwEIQXrgM5XrfRdqHt7U9Gmr+PBhVW1/PIw76n8P7xecj52XtT9iq7P
         iX5v8uSxtp57pinHR3X/LSUEWITf6hLAu6PhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427202; x=1796032002;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ow1Q+hWzDlODuPLusaf1++hR85dplAxGuhutVEfabRA=;
        b=PCsSXPMd7WQYxM4TrERqx+omBBDn7ZJugotGecg2Su1rAjdF50mXG/RnJRdnY2+iJx
         XHnMx4yiik1+6z+A2pf8YHjCLRHQEF7locmujHPti2XXJkr/sikLbPJ7btuuYNIqCOU0
         s+9VL6zhB9JWpEux5mb5t9gfBsPONvgtwt80iMScTaXbpr3MPPwBq5xHekrEA/hNQG4x
         i1BAyA/6uZE1YkgF07Qoihs2MqfBLKBV7ZvpfUPg5afmUwn6YVH5tgTEkPgqN84QnufK
         QhpyO0s6NT83q5xBIb4+nNc0SAITsE50+MnluG0dWjgG+JwtCpmsDhdn6gq4IS6RriDH
         SS7g==
X-Forwarded-Encrypted: i=1; AL+hErGdmr1sH9EBcCGVGHS/wz/unOa2hie0hOUSWIm57P0VzAS6iTqyanuF7ouXFqqhk9JoWD4WhswFjamKK7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kocM58ciGlAeWF0k373JbWsXVtbgXCkBlB9j6J1M4H2NDS2pF
	id0yoxDV+eo9EeEjFN4HelC/WJame1n5EbLlR07UJHjNqr0jAZwc05ESu9jE8mHfXA5zRACyLjP
	HIWY=
X-Gm-Gg: AZFdTZf+YBOi/fD3xgUjQBp0UTPJ2I3v4qT1oh4MfMx268o3GK8meZqJrvnYII47vgF
	TcdHI7MxVOMpMHrAgaHBd0SDUAf9P8yLmbFzhhyvMsekjoZQYR7LMhEQXiI9Q1DyY2hzPDvPFcj
	1pnTPI8ehrgbTAlQda09NeaV0gaVx44ykkv5iVgFyuCj/bBg2kwPMcFKiTK9GHx7zOloE0hrdwH
	3+4IzsF1lDH+2BtyViKSvAt08uqtkFGT0jsDdGfnE7J568BpzWBjg7098VyFQ8fNp7dwWDYYRfp
	fuGye5lV/Yb/in2YcvDcmNA546njgeK4wZWozRCPFuG3Pq0DY3GRgAt5RMaqtLhzUTjnY8ZEjT9
	+HXEGoZ7bUdfNMnpH6Ho2xGgK6o1sLgvFwHr2HyUJ/zEhXCM2v3wLW9i/rEJs2zcJfGwa73oLWP
	2Xu1Zp5TQIkN6+zZP0wYdra/0+PxkadEkaGvglsOQxfhlWRzLTBM/bV9QmtF0VNFtT+1/8uFtMG
	Db6W1YGf1fMA7BdCp0BUro44Qkh6Z5uyzkIfr+VaYepwhsXLCTFkNiC4K+rKmCIP1SVk3naPgMW
	ri74Nz7VejUH2v+d4CRtbbc8HlB+5yZ/zBBfZ0qdOQLQ+FN5syB+CKa8xbcJXO38Lw==
X-Received: by 2002:a05:6a20:7d9b:b0:3fa:12b9:862a with SMTP id adf61e73a8af0-400aae3c1bemr8664066637.6.1795427202111;
        Mon, 23 Nov 2026 01:46:42 -0800 (PST)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com. [74.125.82.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm4869615a12.25.2026.11.23.01.46.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:46:41 -0800 (PST)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-18818daa3e7so1786306c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:46:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGJGk3aEFGJk2bJgM4azdbg69f8+XB7e0jP+vSrOyfHTQMx6q8VVBKEXBupLKrZoEuZp/0XMhLUeT08rOM=@vger.kernel.org
X-Received: by 2002:a05:701b:21cd:b0:1b3:be0d:696c with SMTP id
 a92af1059eb24-1b5567e661emr11015754c88.1.1795427200278; Mon, 23 Nov 2026
 01:46:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122184500.7c9f2e1a@protonmail.com>
In-Reply-To: <20261122184500.7c9f2e1a@protonmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Nov 2026 10:46:26 +0100
X-Gmail-Original-Message-ID: <CANiDSCuBmdKTdCuGp6qxQZC0tXbZ+iEimnkw42wjw9G3ukOK5w@mail.gmail.com>
X-Gm-Features: Aa3M54oXNIs-f5o3vjrQJVELrHbbr79FTM5LygD5kvlkzrngvrhAxhUUIoxpkSQ
Message-ID: <CANiDSCuBmdKTdCuGp6qxQZC0tXbZ+iEimnkw42wjw9G3ukOK5w@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: add device entry for Logitech C920 (046d:08e5)
To: Bob Summerwill <bobsummerwill@protonmail.com>
Cc: fernandezfernandezpol@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bob

On Mon, 23 Nov 2026 at 00:59, Bob Summerwill
<bobsummerwill@protonmail.com> wrote:
>
> Hi,
>
> Field confirmation of this series' diagnosis from a stock, unpatched
> kernel, in case it is useful when considering the patches.
>
> Device: Logitech HD Pro Webcam C920, 046d:08e5, bcdDevice 0.21,
> directly connected on USB 2.0 (no hub).
>
> Kernel: 7.2.15 (Arch "linux-omarchy" build). The camera has no
> device-table entry here, so it rides the generic UVC catch-all and
> uvc_no_drop_param is at its default of 1 (deliver error frames).
>
> Behaviour matches the commit message exactly: intermittent gray
> bands over the picture in applications using strict JPEG decoding.
> Setting the module parameter nodrop=0 -- the global equivalent of
> this series' UVC_QUIRK_DROP_STREAM_ERR -- makes the artifacts
> disappear entirely. With it in place, 300-frame MJPEG captures at
> both 1280x720 and 1920x1080 sustain ~27 fps, with per-frame mean
> luminance stable to within 1/255 across the burst. The camera has
> been in daily use since, artifact-free.

Can you share what app you are using?

It likely needs to be fixed to check for V4L2_BUF_FLAG_ERROR and skip
those error frames.

Thanks!

>
> To be explicit: this is confirmation of the failure mode and of the
> workaround on the affected hardware, not a Tested-by for the series
> itself -- I have not built these patches. I am happy to do a real
> out-of-tree build against 7.2.15 and follow up with a proper
> Tested-by if that would help the series along.
>
> Bob Summerwill
>
>


-- 
Ricardo Ribalda
