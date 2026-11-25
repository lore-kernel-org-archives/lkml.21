Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613768;
	b=2Ktn1vYD92xoP7w0IwUvmYRSjaWke7eONmdK5AZ4SeVNalbrXhikZqXNbeUM+mB4BecE
	 7Wodak/vJy1KN+f/cCudt1vVV7iEa7EmI9Z2MU//uIRHk93nFq2s9O7lp85EfpeP4OQyb
	 LlyZ9nQh25tFXtq8tH33Hmd+HuZiflwlQCqOpZfjphv/4EcT+2ap95LKdKlZbjzoLDxT1
	 6P4KHcZIUoU8cMrRY7eo+POOS0oZcoAP5BFd0EnlI9jT835AYP1f0DZ+B+yPIPNkhJ1rj
	 dGdVN04fS5leXfk2HHUwLgYWhbC8JMDFbJfB6IVoO1Igoh7Lvjq7h3es9a0YZn3PJmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=z9IyiHWk5YT0ur+hZ1vAc0ptXVYVk0hZTZCVHyQQNQA=;
	b=Yztpt/BSDjKqI1OX90VK8Z1M4UgvGsP565gvkOXNuOstUIUDaPvZdW2ArCvfObA52jNd
	 q4rgxLkswVx9Qc/qPepdUhxeCWE54w9+CW1LQqPl7FKgb9FkQULoQmm5pN7mcVpi5zWD1
	 NKWzQdQ/i+u88sK9g0D7Kuj2ePxVTxthg2jU67LHglYCThsnlLk6731YRVvKlFwgLScPa
	 y29Nn+CI2WuNEb//xoW7ajBHMIVnoqMj8EyVjGoQM+1OMUNY5k8xvE54SD4yBnb8wZOrR
	 Ebi2FzjufcO48yb/pUIfGsoBsvT+7FddNJe2DoRQP7OkDPC7i9b35gyMWYg8JvLJYbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BgLI+qVI;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CBF606A339
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96CBF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BgLI+qVI
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so59173565e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795613766; x=1796218566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z9IyiHWk5YT0ur+hZ1vAc0ptXVYVk0hZTZCVHyQQNQA=;
        b=BgLI+qVInO/I71PeCBAAo6Ngaw9Qe2Uis2IXDJCOKI8btpox2rXKwuizWuO+lUSZUY
         iOXMpeYdfAbIFR8qRM2RgUeiypgNE2yzTXvhC2wuCw0mZrn9itL9AYGAxzoIhaEIbkJx
         78cHtx8XDfkvWt54AB7VEhqqFGg2JDi8uNLIwSwwl1Wp/Ha0XdhI3Fx1NQOpvgXcVDjo
         N9Y5H76i7gjkn9tGvU0a+LLGi8stOBJzuTXm0HkBPfG0WzPUcIVtmb4ThJTR17Xqwqkh
         qUr/ElzXWecATSu/ie2x8B5+u0pfAfmUtD4MbUbb3nPIR6Jb7Yyi6rHpZBqsaBgjU3ry
         qNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613766; x=1796218566;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9IyiHWk5YT0ur+hZ1vAc0ptXVYVk0hZTZCVHyQQNQA=;
        b=OXDjevbTI6NW2wnJXZhZ7Qe6aVpTMh7lKdLVWAcyieuTbjB0oqzH8Fz2lqV2W3l/uU
         aZ11JVTlXnlL6SZ94F/BdZqAd7ixJZqjVqVx8Vyl2x5j6ZJttT7YGR9ed9Xun7R6hw2g
         1Bewt7lqWNMs5QhMbpADagEb7b6/bR/+oxG+8ZZ6xFe0ojr27HuzLAc9RxmHfPGnsW1/
         xXKEnZRN78typce0J+CUOkIPTjP18m9ufFhdR2M5hpn7SmiPrhp5U8gX9uAXWRD3gtBr
         ZrOP96o7LLV7kFEm+A1yyOI1zpJDb+NVtlsaAwcND+BpFlMmu4Yq3Lx35vl9EYnF3e63
         0rJw==
X-Forwarded-Encrypted: i=1; AL+hErEzM/Yo/eLUThv3heWrQDCckZ91ANtTcUEyndxF5Nj4Wt7DsMr+izc1RhOpZ5+QMA7AnliGGQbNUhme9+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8heyxWF3UFrCaCMieJ0qtYQXgFY9xxCEbAqxeXtfDIY8ugZ9S4
	/lo0uLsUFEWL0UgBHMBWEs7UYRv3SvU+sUJjl2wN/B0LkgG5Tv6E4QD3
X-Gm-Gg: AZFdTZdftKVzNZEPJY302xcuV5SYC+octdh2LOzBl0ZyeJKJpbIWUkrPxyRmK4t5x/h
	VBc59OJtglDA/X0uz79bLrQZbWhK7nVO9HWPODmixaJKuqiopDFpVn5DZYxZf6CDfy2nLJpZIvn
	iOoXPhfgiKixD6eFTpvf2fJsD/SHCpkBgy8aA+A7aEZHqrFODyObFz0o38Ww1ulq9eNzi9UEdEr
	AMmhgBhxW4g/T4vW2Ok7NYTei+x9uc8fEVr8IIXgGPTirdLsVdR7orVImMKeC4jtpD1kji6xDH9
	WNGFy6bbxJT0X7GSzUO9mbX9WY4vaU50EY69AD1q67LIKdspu35RgG3zKA7LLmfdNsM1iVv45YI
	N/SWXSA47MpwL4ilg1p3dMaB+oVV8zJwH4JzrrmVugTmJCpmdFAgY4EsxlJs3bIADKvZ4TF/S5l
	t0rEqb+/EQqj+B+5S6f3tmxCDW6vmFgnYDGD4FcYw3M5TL0QY4JrTnUVyFgTtMPQMLxT1nQ7roE
	6xOqcUxiUl0kQB+RppPpMe9cnyLLbo7vNitb8nrZF5aa90jBa3uotkjjz486GByQDaqiFMejIpJ
	byoOnkt3/z8umFHY66DQXuiRKC//77eCbEPSwJOi9R30DKabBjMYy6RjCS+p38TzOe8OtJSSeBj
	kbQ==
X-Received: by 2002:a05:600c:820c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb887876c0mr387545275e9.0.1795613765902;
        Wed, 25 Nov 2026 05:36:05 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm310990125e9.2.2026.11.25.05.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:36:05 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] drm/tilcdc: Implement state readout support
Date: Wed, 25 Nov 2026 14:36:03 +0100
Message-Id: <20261125133603.509063-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <7783b523-3d37-4a10-b541-bf9ae8013e78@ideasonboard.com>
References: <20261116142707.1299360-1-maximpedraza@gmail.com> <20261116142707.1299360-4-maximpedraza@gmail.com> <avs2dagfmQkv00H0@houat> <20261118212114.150992-1-maximpedraza@gmail.com> <20261124141119.441163-1-maximpedraza@gmail.com> <e58a5ff5-9c1b-40cc-a65d-c7fbfdaf18d1@ideasonboard.com> <20261125101541.463585-1-maximpedraza@gmail.com> <7783b523-3d37-4a10-b541-bf9ae8013e78@ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 25, 2026 at 01:53:23PM +0200, Tomi Valkeinen wrote:
> If I had to guess, the hack helps on some particular panel/encoder. And
> breaks some other. If you remove the hack, you get it the other way
> around =).

Thanks a lot for digging into it, that's useful context. I'll leave the
hack alone then: the readout just undoes it, and on this board the panel
DT leaves hsync-active out, so the pin ends up active low as the panel
expects. I'll have a look at the old sources if it ever becomes a
problem.

Thanks,
Màxim
