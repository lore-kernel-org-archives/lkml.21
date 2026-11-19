Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107843;
	b=n9rAYPBnLBQ5RS4osG6Y+DBf0ToDkw+OjtDcOKcGPGcPpLyOmy5VNBeQVpzUthW1I5Z4
	 3U7py49n5Ogj9jJXkQMmYs6uC8nIiAjWdpLzk8fA32yyW0OxvVohoGcM155GEXgitmN2y
	 bXN56exQV0kScLXCLpjQFdgbFFgF3/WrOWwPXy/ZeBVGhAsLT5slVlmB6XjIfTa5AREjS
	 soPW5fWdyY8N5iQ2FVY83UWMnh/RsKBOwpZjteUqSGZfQOGaAbrDj4rW3jHnRTq52KpJ2
	 MZrgaJPyRtTiFa/cfL3MujXDzIxgQ1ws7Q8j2Xv2pWEMQmHM2jivKVbUYcVP3J9Dkyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=PpOydH3EiuVYC0JIFAKpgbAxwR7+WpJ/TuK8OmPVRpk=;
	b=Xh2cMj7QE9rudF7vpdSX5jZd2lGxurcTrPvclMuzg9ZZWnj4+isUXpoDIOazk5DQFhOk
	 Zg0sV/oXMXx9bjDqdBgqAGInJ2qSmKfVt0uWeTgcFAd67iA/VJf7lpaQL6mNg8BKqfgxo
	 5MeutQf4JFX4RAfIa9tlSjSq2DdL0/yO2cxFtpO0Ye7yHGD+JF31i3X2/siJpxGJgdEuE
	 eey74sQbZzYtdVW1LET/1RrtIUjkPzxS3raournfoJchbuhewx+uN01FcX64a/Ir8I4fA
	 BYK3zvPPuAnPdCPv+Iy1EHkL0XpksEXNYm20DE9GDI14KQsp+k+6Iz2uvIonm0L8yqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c+eDKi3L;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528F2606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528F2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c+eDKi3L
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so6011536eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107843; x=1795712643; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpOydH3EiuVYC0JIFAKpgbAxwR7+WpJ/TuK8OmPVRpk=;
        b=c+eDKi3LTJm6cFF6rASbBDr/CmzWcIUhH1m4ZM8WmjSvbhxTB3mW3dGBefJP6K9DrO
         N/4d4Ev+nV47c7Br9ILFObmEnYKBJ3K90Wq5Oo02BH6CjgLUNpc2htZXtI5yeZbmzyvj
         gEm91OV4gsmhEgcqNVfPKvjRLDpyIS9Up2Bpj9Sbv28HNKihJYk3PA74643sSGHv0k5F
         3RVwOIUJaBz3mgg3PD8FcsHc4fiRMzVRL8AITNxSgFF33wYP7Lg7p8j2hn1V++OxhTQ+
         tbNdDWr+TQCSCZj3ra5515+xr2/F4cvbIXAAiT5pJyoRKeKZMTGtrGNc9M2SduuxlkfK
         GTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107843; x=1795712643;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpOydH3EiuVYC0JIFAKpgbAxwR7+WpJ/TuK8OmPVRpk=;
        b=2o3Yd505nlj+Zr6aLvkbPQOBOIA4r3iXVV7em1yJ84Aiy1eXkf5dKBBv0rwsu7JtmL
         dF6l87XmMc6FyKjPxU9iiKXroELUxwKroQO79oLmr2pZsuKI/HROrvVZDdRCAvkMrwkx
         M6EJxhOQM1sAJf81r45jQkQ11gmpoED94SJBEcE/sW91eP3PKY+NQyrNH87X5tXnDrKc
         ol8Z6P+OIUhdoBVuQdNCHGfQRc0xVaHJbWNNKZJ/lCOP4L0yO/8K2SiteEZ9hR9hEOIB
         //p4B/4BQw64RugNvUXSaIaywIS0KTqPPMj3JvwJSeJAPIL1Sw45wxR28r0Fio7qWAT0
         vhsA==
X-Forwarded-Encrypted: i=1; AL+hErFpkXZmz7VQny12Ut7Co4N+wNnH0+CZN52h68uB8dDE6MWESBjiJkwzWHYci9TyMKUNygawkTrBb9jyLRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1YlPjMdnxOt+3n+aowM5CGzer9I/+KdHLT7dcLPkDqphxvJF7
	pJ4NsgCFnqoKCrS4+o3nv3V+Vi8cqvM0k3mfUMKV6Ksv/k/Be/4H7HnZ41NXHioee1NXJ7xd4xl
	VtzEG7Gj7WA==
X-Received: from dybml48.prod.google.com ([2002:a05:7301:1530:b0:376:328a:f96a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2113:b0:37a:a9db:6bd2
 with SMTP id 5a478bee46e88-3828026960bmr6552673eec.11.1795107842263; Thu, 19
 Nov 2026 09:04:02 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:56 -0800
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
Message-ID: <cover.1795106937.git.irogers@google.com>
Subject: [PATCH 0/2] drm/nouveau: Two fixes from Clang warning audit
From: Ian Rogers <irogers@google.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Two independent fixes in drm/nouveau found while auditing Clang
warnings (-Wswitch-enum and -Wconditional-uninitialized) on an
x86_64 allyesconfig build:

1. Handle NVIF_CONN_TV and release nv_connector on error in
   nouveau_connector_create().
2. Initialize primary_crc before switching on src in
   crcca7d_get_crc() for GB20x RG CRC capture.

Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on
Nouveau hardware.

Ian Rogers (2):
  drm/nouveau: Handle NVIF_CONN_TV and fix error cleanup in
    nouveau_connector_create()
  drm/nouveau/kms: Initialize primary_crc for RG CRC capture on GB20x

 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c  | 1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.56.1.708.g77570a6a1d-goog

