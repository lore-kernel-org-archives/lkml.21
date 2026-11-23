Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441190;
	b=c9GItQL1TjsOzYQNwKhX+Yq++fERLZbZjmuWYuZgIm2xpih8yoHdiTXZqVONZIuZhxQe
	 O1ieJN4JMaCBMI6G0wlykFBOqpYi6SSeUS4o4DQhZ3DH8oyhx0hbneoexita5G1pweLtZ
	 F5rMiRI5G49EXvz1L9QcdPQ3th783iGmH8fcijJ0L5HfyQV5BGJxLgAE+9jiSy8Hy39KG
	 fNo4IWJfzz0C9He1nV3IsrcWU272ED3GF2chLK/xFGiNw3cqK0CKjIOA8Ol0h2A2PqRMF
	 zBOAVYC+ATs0vOfP8RXy4ows4sx9fonQM25OI6gRmNFbes8ZYml/vP/r0lv4q/GErPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=bAL0t2TGrbFIeMgy/8ZLqGke+0HtmGCWss+5lXHsJKU=;
	b=2ysFffJA4BS5L6lMELJKk//q5aApgbt8PRC4/8e3noBUZUbzCAg8nIVeCsfGE/yOMDIN
	 VakusKW0osJ6C6Ez7OYcnf6dJGwxptQ7N+Se2PPZ4ygv9YGnnV8Z68k6RyJK/NgC+FqJX
	 Kij1yNtm24in/xJSmMO6ALHoTXI55wP5baIwoRN6SJLpGTWel1rzfOAX57Mm0aWSZSiWP
	 Muq+sQFYGbbpw9v8gtLLy4uLK9ZdWo6jkygwK0NwE3fcBAV8j8Qjk1NBd1Aba+L+2wxb+
	 Gm2mDTkjRxOYGput6k9BCHAN2HBC86C9FH6YPb0uSU9X63fnvgCNlmxL5WYXb4vpc/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D/rZn9iL";
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4104F606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4104F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D/rZn9iL
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so3820979a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441186; x=1796045986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAL0t2TGrbFIeMgy/8ZLqGke+0HtmGCWss+5lXHsJKU=;
        b=D/rZn9iL7SvQLhKaIC13oOloWU3T6jk/laV5o+SF2tzXaGFCYDNQlE7/NaEDs8iqf1
         7dYSobf+5CdcDfZ3xvm9tSKC4KgUWrVziU+kTiDtrWQjrmYF/GKeT+2ZDfW+rB3o8WKI
         gujciW2akjcBxGAziH9CZjbxLR4QVaZbqDsgeNRBkyMeM3dGJIBcAiTYq/18t0oGOWs4
         5Hl86Te9ihOqZ2ZYukXC+8PnVdMvPPlSZAmxhYPl17D96Hp1hxESJ8Xc8YhVeqd6yRiC
         cxRINzCUB/qzQj5e4OyivB608aFwCvhWSzEKLeAmafS9S9gTYZZr5QoFOO12KO3RgA5P
         DN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441187; x=1796045987;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bAL0t2TGrbFIeMgy/8ZLqGke+0HtmGCWss+5lXHsJKU=;
        b=Z77Q+QwAp7PJVOX85mSiC2YIwmbYYx8rRro8aAMF9jMJ11e+i8o/0nhcpg5i0BgXy/
         Qyo2Wn+DT08Z61OarSzustDlZEd1zxKP3gSsjR2V8kVoVb9jjjJdvUzW7jS20dJVxspM
         Aau4HS4VzhIp9884UK6dOpoiOwTp0GtcNbZpFPcDrvhQKFPAmQT/BH2lsRxEPSMPP9x2
         TrifeEjzZjWESLN/9mHWa1XIJQ/k0HJ2UJWKz9d+toDmTnDIdpHb1c/76d403jqw5uR4
         oREsKF7gnzHAQADmJc42iyX/xgTiV9LhR0lHJqM0CdkTG2lU0LiZxmQz86FJKJoLMqPf
         fQQA==
X-Forwarded-Encrypted: i=1; AL+hErFLZ+jtR4/tPBDJXW6NPDoRE5T6mVbJ3c5c20+fYewbXHsS7Z4FmEXYRiogP24K2Q1ZefKgjl0EyNuPIKU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HidVNCPO2I5BjYgzoriQVPp+ncEsa0F3JvUBvTaZRZSkxqfoU
	T8MxVYPgEayKHC3jtyBpdR8knwDvrId+/ybly+GtcLJ0aQuXm6ujvHL2
X-Gm-Gg: AZFdTZdURDWfi2CNF+PkbQadCAAJ1O+L0/zOI4WFBfTdtuiPMsntNcWN/WnZmgOS5OY
	IU8gTK2NJtQIuB4j0SNhufJzTiQHMeVAesTxQRwwlzRswd4g+PI0JEOn/SCicu/h+pI78enCC5A
	lvj9DC9Ix5X5tIuiLWaH9hYWQq3PTMB3aNGaL0gQYE7QK7nBUlQcFBG5UInng+0812bDRHDoJVq
	M9evRotWW7hBeSGndwmExyHtJ9Q3P655wL6lTTZHJDj9QZODFWs/06tfm+ko1xuDW07rMonib22
	W8RBzIDs8WrFGwn97XXBF8bBvqkkYsI/UI2pANIedOJqtWedkVJ95FVFFGBVnYMRXiGnUH/88sV
	2qkxoFq7UVzjSr3udS4AGJJO6B3fetRU2kCmNKmNJYtvObBf9bKwDf6XoSKr2PFcU3dLryd+h1f
	m2tMv8TP6hszNA/chf4RkzTo4FTM7qqU1o8+zOUtH/pZjvh1Hl1spUA9VvBAB3HrFE6ozsT/7VW
	KhjNvWF0337DM0cxOzZZuqgOgEyi6wc7xxgu/C176DP19f/ziswPwPN40d1yTvaQDOdwER9iyLM
	vWJqqugHernhsLwgTlJxKL3IkvUZ6Y5eT1Rr92qSvjbuU1eoaIg/6Pk=
X-Received: by 2002:aa7:d351:0:b0:6b4:86e1:cc67 with SMTP id 4fb4d7f45d1cf-6ba37ea0b91mr5687764a12.27.1795441186526;
        Mon, 23 Nov 2026 05:39:46 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm5212663a12.3.2026.11.23.05.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:39:45 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito@redhat.com>
Subject: Re: [PATCH v6 17/43] drm/vkms: Use enabled/disabled instead of 1/0 for debug
Date: Mon, 23 Nov 2026 14:39:25 +0100
Message-ID: <awRBxApeQdS0tPZn@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-17-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-17-78ace90f4fc1@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 06:58:59PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so display human
> readable values.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 44ded8a86a6e..4127fb176a87 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  
>  #include <drm/drm_connector.h>
>  #include <drm/drm_print.h>
> @@ -397,8 +398,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
>  		seq_puts(m, "crtc:\n");
> -		seq_printf(m, "\twriteback=%d\n",
> -			   vkms_config_crtc_get_writeback(crtc_cfg));
> +		seq_printf(m, "\twriteback=%s\n",
> +			   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
>  	}
>  
>  	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
> 
> -- 
> 2.56.0
>

Reviewed-by Oarora Etimis <oaroraetimis@gmail.com>
