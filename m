Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323203;
	b=1ZYOsNH5H3go0PJ17tpHKLz5izIBDxjmUZ85ZZDVF7Z2unN8tsxKlIeW8zLZe96XYNaK
	 2BnZY7OnQ+koDV978+XHgUkDenXtTPheTA354XPyipjhFFzww4vnBbtQv/zUybfRhBOFn
	 uo6VtqYDoSll7bJAcpwj8IvZqbVpvF/vG7MnBAi9egUZnjp+ee8nuDoNP4D4izGRnhJwr
	 PIc/SAIBiCVCm8ahe4EgWpYJ2KLLfQ8EkY4gHBLflsEkOKUMipkSe3w6mNGFfzKRDD/Te
	 /e0+Kpz9zHWqDSmH7O/TbakObkXY6Crx0tbGAOpuivoRzS+Kc5duOwurVnCqFcdjrFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=C7Bdw0hKj9JbfhPi9A4wuP68QPesnRTG6G8CMRtqhng=;
	b=BC/M48GTPHvyIWOOtJtArpBRF49euoZsj71Y7fa2EnBV18Z9W4vJ2oMMneitgk251nws
	 0x4p1kh/dl/SR+zfuTPnhar85KYYix6yqq6te5kFX+tbw9Ox+U8vUiPLpkZhKVZ/c205v
	 Pj/pwcrZbcnXw4/I2QIQhU2SO8QQl9EGKGGEKTvozNBRssH9RkOdYTJVWYrdbhG7Wa7h2
	 khi8mNTdbnNwp0dihS6fCTtQIeTerHQkd+69W1P+DT7GrYXg/8AHD0HhrhjQn1cp5Yhjq
	 0YDK1LRFRzcH4ir/TATQw8oqb+PJtahvAd5n3jJcHuK47TWSAFAeaN6deQrZeuWl0XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qTvxDVk1;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1891D606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1891D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qTvxDVk1
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso3231845eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323202; x=1795928002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C7Bdw0hKj9JbfhPi9A4wuP68QPesnRTG6G8CMRtqhng=;
        b=qTvxDVk1NcGbi9ddGNZWiD/vkhQm2oLT+FymY+pudUMvUP03ppRVkE4rWSr5G2p/md
         YRDjrenUZzh3Li3Hfhf7os4h9XXWmhbfBSKjGIWoxwVpi+DV0zAEdTb1pJ8WnZpYM2I7
         1wZqmMHlc8UeGmyPXaGtdrS1j0VCR4oOFsXBp92/nZXT2B5Fm8VU3QqSvzeVz8gejSyg
         Ta8eeWcrJdlKpLOjBdWkZYlwvnbg2/bCLJlSMXyuuJH5BA7w4GMVbJcRutJrBqTGo073
         JSO3wJjO1gHQ9xNfBKfHgEGb2ZAg6Hk6qJa/woaJXzpNP7amdXiqFl6BtLUOQnrpxYV7
         CTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323202; x=1795928002;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C7Bdw0hKj9JbfhPi9A4wuP68QPesnRTG6G8CMRtqhng=;
        b=yRXq87MQtXyNuBnIOqzGTqhF/+ydjazGJPGGWbkzlP7/NPUaeNY0aRoq7k95l+Gy+L
         DJIFFZwRpt+Ue4X8Ep0u4Xn9G4dZdVs9lE/4FAb+HsjhW6u2ah21pvvQ7A7T5pQNs306
         NFmrqPpVotu1b/qeLNRznh5Mina/OYKv3yaC9mOPyyKoBv2lHIF/gakOxJlrAgTd7p3e
         zNu94BMt8eGy9YTRNAjerx0+/VB3TGNcKLzYzt2+YGe071KKnkNBEqLtpnJ8NmZcc3nt
         y55YI9OdMPwrFD7GnqDMjKZN0mdmo4vnBwpeov0lTkvdnw4/6YithCrGcQTNQrKE1MQ1
         2Ueg==
X-Forwarded-Encrypted: i=1; AL+hErEd+hCYvjOYsWV6KjTNdlS79SKQaqw0c/uwuhH8yHRlunWkY1bbQSR4NOSXQauABrIM2ugFkEswjR1IBXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TcS3DTDQq+6x+rOUJheNGZO5n9kwN8+04LRGo3O4hUbzuZ+5r
	wGTAXVr1RLx401W5V6wPe4DgF3h8EbeqPP0omyM9OTjDM+tEi9Ex262q5D3xI9MSp1p2HmNPXtp
	Cgb8DKtnoSQ==
X-Received: from dlbsj12.prod.google.com ([2002:a05:7022:f90c:b0:1b2:4b7e:5356])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2319:b0:1b3:a8fc:6306
 with SMTP id a92af1059eb24-1b55247e725mr8008573c88.6.1795323201686; Sat, 21
 Nov 2026 20:53:21 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:15 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045319.18651-1-irogers@google.com>
Subject: [PATCH v2 0/2] drm/amdgpu: Initialize r in VM and TTM buffer helpers
From: Ian Rogers <irogers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Two fixes in drm/amdgpu for uninitialized return-value regressions
found via Clang -Wconditional-uninitialized on an x86_64
allyesconfig build:

1. Set r =3D 0 in the 'else if (!bo)' branch of amdgpu_vm_bo_update().
2. Set r =3D 0 right after the while loop before 'error:' in
   amdgpu_ttm_clear_buffer().

Build-tested with LLVM=3D1 W=3D1 (-Werror) and -Wconditional-uninitialized;
not runtime-tested on AMDGPU hardware.

v2:
  - Keep 'int r;' uninitialized at declaration in both functions so
    future missing-assignment paths are not masked; instead set 'r =3D 0;'
    inside 'else if (!bo)' in patch 1/2 and directly before 'error:' in
    patch 2/2 (Christian K=C3=B6nig).

v1: https://lore.kernel.org/r/cover.1795106955.git.irogers@google.com

Ian Rogers (2):
  drm/amdgpu: initialize r in amdgpu_vm_bo_update()
  drm/amdgpu: initialize r in amdgpu_ttm_clear_buffer()

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 1 +
 2 files changed, 3 insertions(+)

--=20
2.56.1.750.gf70dc682cf-goog

