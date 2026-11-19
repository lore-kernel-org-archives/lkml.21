Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108085;
	b=oZBxNsAc0+cbbl36si6ZrDGB66J95SJ3cMcYdI+TwfY70DTXEn8Wx/AkKEWKDcw7+NDn
	 WaFd+gxftGQUhfXHFhvmNb4BfMWxHqwrViCF3QevPIvO8J+zvi4DOSs13RS8UWc+rV241
	 MnDHPsJfKTJUoH50LJ+RVXd0Ux9v6AAySevCKWpx7SQJAm8YfLlTQg0FoyRMdNR6by5c8
	 o/8c1ZKvmUgT9P6huFnTpH1dhXeAkX5C5mRKx28O+2LAWuYK1d4QXHjFn4rUUuP0B3tFu
	 D0LCiw1uybn2f2CGxlwehP5uw+YVSNLJfxzfFkbU83OPON00UtEvBhgJgawYjTk4miQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/yO05ZhWslsHUsLICn50QCqN0v7/0NGOtpyXnFxA9Yg=;
	b=A4zsEsPFevZlxLhN2cJ2BDupGamNmfbi5RobM2/qmMFC4zZl7gA+C+ZH0nhrCtoJh5IY
	 FrPqVD/u3RsDVLQ7pDvGwmj1gV6zlGy58ccIPJDK6cmfwY9sav0W2Fur6shnHtTpDZ6D2
	 rRo0BKPBkCOIo6oCROuFZP0K8+xnQt9xeKsK5pq/9IagQAYtJbo292ry57ScY1o4jyNoD
	 uef9kch7R62kqPRqwjlrjbB3gU3FLhAWsuB3jHXoEJICxBGRZ1JHcmzSqQuPdeLxvP/F8
	 /36FBr6aVTHNIKkVqEcI7S2ey9h7p3EEbKzygAFRka+vrc2i27B37fnRfJO5u2RpyBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LxGOfYTI;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C628D606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C628D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LxGOfYTI
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1573113c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108084; x=1795712884; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/yO05ZhWslsHUsLICn50QCqN0v7/0NGOtpyXnFxA9Yg=;
        b=LxGOfYTIQUdp4BvstsQzdRlDDDBEeN7//lrx+SIeNyZozXK5Z2dXYiejZYGuw1gKfE
         W94z6v2dDqiJWdyFH8Ug38FwPUmCqgWPb4FJBLNqo2yOnzGrnlwkKtk5vKsU3QhcTi5/
         fzZiQt2imtcRqKFqiwNTJ6qwYnIkdTvFp5xr0T6VvYFd8l59VmYkfBRJQw2PTLllorLR
         liJi7C42MCIzYBHbqKjVSr3iu2OZDGmumZtyatjMrIUEnYaMz42nUT7UJHrkmb8ozBYc
         wNRbc/FBGWl2fp16kuo55OCsaahfOPc4+r8BAz+qH8SiOjc8Anc/bAH07t7o1XFqQpOU
         taxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108084; x=1795712884;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yO05ZhWslsHUsLICn50QCqN0v7/0NGOtpyXnFxA9Yg=;
        b=jqpt5zRfCLFWaDG7ZldDqQxKG4TePe97Vy9Rn5OSi3GtIKTrOFFj+214wmu1ScDdKP
         j4u+zdtzLv085ue3/6HpgSJwX6vM8JIZviUKNcYm7+iUHzUSLqt/o6aFaQr2ODuL7+Fl
         wafRlVszMx7eTE9FQUf55q7IDWO/LyvJbAfkDBLUoOfQbgct4070RGbeYlkoptXkt8TY
         zEjiACXuJdfdbsSSTc0QKu3B7+L3mK4qSmXHLETWC/YBPjRyrBdOBK7pv7IRah9pzdO/
         L63LXLLw/UcG7hlPyClG8ebIfspJ4O9Q0Qi0RUFPoijIULSbs58mU8dtVUGOzh6aBjsk
         JTkw==
X-Forwarded-Encrypted: i=1; AL+hErHXRhJv5xuETJgt7onEK8GmRz38ErOJkY7mbzdAmActAu2Ijf6CkSTuiuiBJlBMMSQZUaOOrxt0Lnuv5aY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LIOekWE7cjQjGGK7uXm+pkeXDdGFAUtvJzhYqIN0UQs+Fdrfo
	mIp5oZTcb5OcNQKmC6zh7d6nvuvmWA6nDN0wjYQlbpSECFiDmxkmqNjEVagLPNazT+zKzgRtSig
	ShJL2JaNkZw==
X-Received: from dlar19-n1.prod.google.com ([2002:a05:701b:21d3:10b0:1b2:48db:23f6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2215:b0:1b2:42db:8a54
 with SMTP id a92af1059eb24-1b5568b3154mr212363c88.23.1795108083489; Thu, 19
 Nov 2026 09:08:03 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:57 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <cover.1795106962.git.irogers@google.com>
Subject: [PATCH 0/2] ASoC: qcom: Two fixes from Clang warning audit
From: Ian Rogers <irogers@google.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Two fixes in Qualcomm ASoC drivers found while auditing Clang
warnings (-Wconditional-uninitialized and -Wassign-enum) on an
x86_64 allyesconfig build:

1. Return early for non-HPH interpolators in rx_macro_hd2_control().
2. Return IRQ_NONE instead of -EINVAL on an invalid DAI ID in
   lpass_dma_interrupt_handler().

Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on
Qualcomm audio hardware.

Ian Rogers (2):
  ASoC: codecs: lpass-rx-macro: Return early for non-HPH interpolators
    in HD2 control
  ASoC: qcom: lpass-platform: Return IRQ_NONE on invalid DAI ID in DMA
    ISR

 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 sound/soc/qcom/lpass-platform.c   | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog

