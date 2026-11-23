Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445314;
	b=jFRql5Z+yO0vq6mqKg1YxuFpMXNBMB83qvvRvGPn9En3hWeGpJOFusltBwYV2M5K292G
	 rajMp5RRELY9A9AUf89ZDm2+6xPOf1pVnYhG8JMeVR8/gS28bcQhuHuYTmQ/W0lS48HU/
	 9Uz17TIH469nFG2sTc4al7HvLeVthvW6thWwNcUom8z5VfPnUwYZ563csGMwa4oeUdvxr
	 WlujRwW2Uj4vqMQqo5KxMT8ULZixXBeOXV6p12+r24vQ4hNwQIMQmQxPt07EdF4h3rs6J
	 w5sEuUfDZLOxDN/KdtCZZyuiRyZ/5JyLMKtFhfDjGm+9Zu8jeHVIgdPpivkDxt6fq8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xZF0Y2fdOckMYZ5OQvo53Uy9aotpRIWurFGH1UvKcdA=;
	b=t9aIWUl6n8YmOlHrTMYw1s+EmPImh8AOr22ZrW69TfOWugY64Xn+f2MGgI/LyH9KTe1M
	 /DHWhiTKQvZDwtoOGxqAPZeCpL+xUEBhXJjT27RlOPNI27ibmu6oDLA87i3E13MsRpivD
	 0Dlz6ihsCO+FItE0T4KAucuRfvG0+5bU/TtxyIdoUKC2vadJbZzEwwzyL7dzOsRYUz8j8
	 RRk38Vc3A+dgbZ/FhKS6OjjnFigCkSgkSeCfS9+6x6NkbmUvT96rIh20dzl6A9g1DIgMP
	 nibByrBQ/WgfJsPBw/tylmFp050qSAk8hlkFsq2ymdBldPXwyTJ03IvxI4oxP8HmCfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cUfdMJJY;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F265606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F265606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cUfdMJJY
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so14888465e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795445312; x=1796050112; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xZF0Y2fdOckMYZ5OQvo53Uy9aotpRIWurFGH1UvKcdA=;
        b=cUfdMJJY3f/reliHpqxivdPBRUxH7MRW6dVHwyAPTsQMdqU+KijZ7gi6y7j9Z0QY5B
         HXhu8F1ZgdCCe5jq4rt24Vt7ZeafgB4hhzhK1PN/wYw4R1j9YK8ZpYBtZ4NeTy5RpblW
         KaI3DyruCrqOUSzmOtJQJTLXeoipzGvuZSUeiE2VRKlZdb11jgQyJF4nsv5gUDhDc5gu
         r/SVIsRuuyFDzGMVJeaIlZATYxJ+0wH9VMOBWWnvt4FVJaS+ZHk6n3CTnc5R5Yh/qEha
         EDeG9XS8yG8TnQSocyLmA9mswbyGtmlHpnBCDD0LvfZ9LuVGn09EoDawyCAaAODsrr9p
         /r9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445312; x=1796050112;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZF0Y2fdOckMYZ5OQvo53Uy9aotpRIWurFGH1UvKcdA=;
        b=lPgi3vfHsIuMyPm3cC39v4fdPc88C3aL24FLhG3oFdOAnh3NTiC5Zuc6LFlq4Byjnk
         y9g5WZsE+iclQ4X/sqJ+7V47xKltRn3i7HbM85GnO4tmP3vLoilq8+QRY8P/NLAe98ox
         yLRKPFAzNyl9k+0fgskaEAq3/kcHe9XjgdEACKXOO9N+v1s+I6gKKNNjVrXsJv9ahKwm
         A4IfIOmmkLZRXQnGGHHxDncIY7craxrwXFFXz8g7QT1okmjLSeBuHzzBetJFxLoIWO7L
         c4QumgsHBe5OJvTeYBAanw2wqGgShOqks46jEjRwj+aNyLh4CGGWAv21kmOrWSMChceW
         whwg==
X-Forwarded-Encrypted: i=1; AL+hErFObY0gfshr+hjV7HQKDcAqLLFb6LiwwYsDkVRHUWtm1KzrBBz6hYjfzo+ZCFrLS2ajpLBGZgorfxTYtow=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H7sePtauNRuk2WZ8Na4aIXtX+Mm5PcN7wlZqsrOBZ3/eT593S
	8Bw+GRCAD+FWXCjUkTEe7qvCZWhk1UiTiWyQYvU7te7jkrnNdArPUNTDQmPdwACm2/E=
X-Gm-Gg: AZFdTZeulN3QuJNg09Ef/4WqkFgOy28Nt40bYzOZa2RZEcYEGx3j3QDcFLu1OVdo/GM
	OGj/iDTzwcIsA6hwibfIpyPO1e4DTB1GtSYlGdNoIc5iUYVhGq/OhS4G7Cc/zvgM3oVYFHllkMD
	my/ZQCWQA4LbJV2+DjLwgMeR5VGcKt68MSGEaE5ep6Pjr8lS02rbo5PHqoi6qsS4f9zrnZLz9VD
	9Ye3sCB4ann8Z7Jt7a+eVzdYyncEiIZWfwhTPztpl1BiZ88ZBh1DPiED8rNMjBvBKxvHVX0/s8Q
	mPlLtDng2JLIzCpYWpqOJoROX1qLAyhqdtrw1Bw87izPn4Y2swTe3Pwa3pP7fKAzbLqmr1vV5GI
	gSK5rP3UEu/+ii8ZyP/5nfHb6hKTjMIaspK5KWMdMnva67ovNPlhKvzhxy9Njd9yE+r9ZMJOR24
	99LdBhKCOaxRo4R608YCaLXszyrs9D0iT76dXkrS06I4aIChn0e+th+wZBjwIxoTj2csvqPOsP6
	66T+0vETXOt2gGlXzXIhDMOagFU9wMuKwbCezMYaz2gTeB2yEgAW1jZx2UdFpqXXVFWMwPNtygG
	D2fZFAZCXLQFIJ3Dl0W8f9vlIAhBh7seX1kqOYZkybqBmxLG53c=
X-Received: by 2002:a05:600c:1c11:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4bb8881c357mr274976895e9.26.1795445311988;
        Mon, 23 Nov 2026 06:48:31 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860::e1d1:d182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm22471477f8f.42.2026.11.23.06.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:48:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] drm/imagination: Fix the value of
 ROGUE_COMPUTE_FLAG_PREVENT_ALL_OVERLAP
From: Guillaume La Roque <glaroque@baylibre.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>, imagination@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Brajesh Gupta <brajesh.gupta@imgtec.com>
In-Reply-To: <20261120-rbrue-suez-pvr-compute-overlap-flag-v2-1-ca2b0d3adb4e@gmail.com>
References: <20261120-rbrue-suez-pvr-compute-overlap-flag-v2-1-ca2b0d3adb4e@gmail.com>
Date: Mon, 23 Nov 2026 15:48:27 +0100
Message-Id: <179544530793.3861580.6891548435680251826.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445311; l=806;
 i=glaroque@baylibre.com; s=20261019; h=from:subject:message-id;
 bh=00LSWVmN0FB1IQwX/OYvVQBvFJYhXx7VT3sxIQ7c0wc=;
 b=MxhtnwKz3q5p0JRhWOpgCiX3vyfV7rQQ51LTmpRjQM20hO7cKOSFMmrLXqJpDYOF7v7p+++iW
 v5Quzv11UhXD5dm2KIb64yezSzKCo6+m+F7XOlWpmN1sM7cpfqQ28Q6
X-Developer-Key: i=glaroque@baylibre.com; a=ed25519;
 pk=nMpSg4NT6M6q143E089emouMc+MXpHO9CWmnEUfjhjI=

On Fri, 20 Nov 2026 12:10:21 -0600, Ryan Brue <ryanbrue.dev@gmail.com> wrote:
> The firmware takes "prevent all overlap" from bit 1 of a compute
> command's flags; bit 2 is FORCE_TPU_CLK. The kernel has used bit 2 since
> the FWIF headers were added, so the firmware has never seen
> DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP.

Hi,

Tested on a TI AM67A (BXS-4-64) and a SpacemiT K3 (BXM-4-64) with Mesa
main. While a fragment load runs, a compute job using a workgroup
barrier goes from 19.1 to 8.8 ms per submit on the AM67A and from 47.6
to 20.7 ms on the K3, and is unchanged when run alone.


Regards
Guillaume

Reviewed-by: Guillaume La Roque <glaroque@baylibre.com>
Tested-by: Guillaume La Roque <glaroque@baylibre.com>

-- 
Guillaume La Roque <glaroque@baylibre.com>
