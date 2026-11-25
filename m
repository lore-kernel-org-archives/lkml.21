Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645532;
	b=Qp0N5bcLPKy1SIRLVhgJHPhcbq0tnvw40ye3Bf6qH9H9HK4B2xwuCdkBzqE49fxqVzu4
	 wcxuCQLLWJWYVuY+Nnlqdbjs6/9WT0+TdaX6XpIfsZTpZ2Gscqoq1ipwJvB3YbJ8zr97o
	 xzwg4FM/FV/5TjMrUJdrYTBnJ88NPY5xx8NVguUKAO9P1gJrIkPwTnxQo4nLdgDUGEvsa
	 RzJO1/Cgc/40icKrL1MwULIq8uXo2u+aj8NMrvRsfm8LZh4+6CFgK4kxkEMNLZEVzpZjv
	 16Y7qYVmZL5vNfxh7xugWS6C+ohXJUnhp3avv/2Mi/JityL+o0s0IcDPzQzzKCiZ5Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2kzPKo/9bX3t4mDGI1xxNnDKhyKkNyEfJrqaFNBk7E8=;
	b=H/1LxM7Ing9y0ddGcKGpogw1DGbBhjh1ELmjn4tBvUMFlC7urCXPEmGDoyKQo/UQIoS2
	 rERj0QXiM1btDrXK9tYyS8Gu49h6Demw5Rx5QPPWK6OQl1vOlqJOf2OmjI0EnDhEgXleR
	 Fb6DvfI35w/kXr30tECKWejD2DTj/kpqAU6Vb5CHhRgD5OD9y3LhtHYYJRgF6pv9TcCHS
	 h3t9Gf2yw7QD7ssnU1pmuck8xZqfM2wOLf2JT006z0Ffy6vydSYigQ07fA5rrNKYJo5UI
	 KLugWts3OQ61emuRoAn78lJKJwFA+8JmAHHriRfaCq1CUU9Xz7eJgSChsar4VQj3YCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ca3RSXUM;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FBD606A69E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FBD606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ca3RSXUM
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b587ffea77so705739c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645531; x=1796250331; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kzPKo/9bX3t4mDGI1xxNnDKhyKkNyEfJrqaFNBk7E8=;
        b=Ca3RSXUMl02HyLwVTO1+yXAH8DxlqUG2ZQpMBV4XUCScKtlHbhVwa5RPZxxyvmDi5f
         F6+0RTS3HMhRu/SpHMgpjpnCBuxQytfqeuMQMxUMdgdNGa9nNgX5eomHus3oD7inw8IJ
         RpbaIPfjQCHEAYCFS7Q44ZWx/7uUVUBlLo9p0/R+Ghsbb2/cMQF3PK84fzA8BXckQwTx
         fkv7/Fbt08fyyf3zQN+GXzKD0kb73h2ExJife1AgRkDNyRa/iuxfNSGXxDUwh5jzyAvn
         m3bqkcdIab+EQ3Z1uvSOThbgxlB7d+9st22Q+1QZYrwoQhp/vtPCPYE9pYgVOcbVJwvN
         lF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645531; x=1796250331;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kzPKo/9bX3t4mDGI1xxNnDKhyKkNyEfJrqaFNBk7E8=;
        b=agT0mBn9uMnL8Sd3rxP+4bjMTB36PUxtoJBXz/hOnGda/8w4Yemg+Tv9fqhv5bxnoX
         WlyI+3BiAH2MG0hbaRj5PGXZ2OPJ3WhOB/lXLECmoXRyGKEa3wH5GKcG5aFyObUKubAe
         s4rFSRDYY8Hk8cabB8UnRiaOmo6VtWv2yzCvLz1Qf/EaZ5gSdMhmC/6p9pm1wea6RigB
         9WUVFs2SEUaUlZ4sZqbcNLQsNwPmuT+96OtK3W9F3+8agD6FfC9Ry6dUj/PcntUWT2eg
         QrtqoUwJFlh3D4cDy2G1QqigBLL1VB/33BQvhvh/R6N298469f2gumHMDcFsufKBeUoz
         FPOA==
X-Forwarded-Encrypted: i=1; AL+hErGiKK3hxYE4EKOfTMTHhOPNGha0hptyI9LPljTGu08M2o4b8F5bxs3CGmV1TFojHhbmuJG0vWxmqy+hw10=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KdnhBcdA2/38vcEFol9aHbnr1IBRiDnkeNFMm2qt47aN9GINP
	R2i33mSFj6uNCzy04sUFNb85SWovHBlkAOo0nXi/8KqHkGHhtUg9lZdYXre3IPw63n1u91kNYdt
	pBQ==
X-Received: from dlfz25-n2.prod.google.com ([2002:a05:701a:8459:20b0:1b5:897d:6e5a])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1585:b0:147:8a40:cdf3
 with SMTP id a92af1059eb24-1b5568f00a6mr18732225c88.24.1795645530462; Wed, 25
 Nov 2026 14:25:30 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:10 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222513.1446099-1-elkin@google.com>
Subject: [PATCH 0/3] drm/sitronix: st7920: fix SPI DMA buffer, unplug guard,
 and row address
From: Elkin Cruz <elkin@google.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (3):
  drm/sitronix: st7920: Use DMA-safe serialized TX buffer for SPI writes
  drm/sitronix: st7920: Check drm_dev_enter() in crtc atomic disable
  drm/sitronix: st7920: Pass u8 row address when setting GDRAM address

 drivers/gpu/drm/sitronix/st7920.c | 48 ++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 14 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

