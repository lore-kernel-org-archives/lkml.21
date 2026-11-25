Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625743;
	b=DwaykOmAKFQG0Ec2tTsrL1UPLebEIVtboi/0LgyiF7TeQgBrgBHv7cdpaItFMx1AKvTO
	 RdidqIqcn+CKP/X4VbT6zkL80DZHtb0CTPIGBNae0+e5UWwsRs5bW70ss/80iPUKvzv4E
	 EYACr7eswDjzKLQS3Abn1UrslJCwh3nrfObxYolpDAWgXRw4BNxmboUa8UTYnR1iJHKOb
	 CAoxQueqkFnjl4cJolVSrEPtdRoXQ8BAIYEVKLFESYFooPkbStDDO5K4n0EHVPBWQP5zR
	 i52P/4s4qQGcxmdn/UcMntQuQBLQJIbfVKyGZquqUxAFYmgWzl9pNOE81AGbOPiCYvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ti7sfZfGPPJrK5F0GmBVTG7Et9txrUN3kqd8OJyVhig=;
	b=3aPBbkxcCIJzOGgzp+wKNSdb95ywtgv4z6jsgda00+l2LFqU3jjs5ek8FC7XRobGaSNK
	 KhaewS1N1bnZhxHtxYb8gNxtusPZZOVYK2uQ5OYsIwIEuZOAWEZgp8V5Rdk8BVxBuE+Kb
	 n5kcycUVNPrILY0hz3Iv5DjeqJ6NuGb0t+CYbqb8uz0oMJM1FAN5U/Sxw/HGRDWBEGBye
	 3UCz6RCza1Ij6q63B9J7GjzsFJ1aP+a2EGwP6nAfSgjNT7i0iE0yGh6rPyAaEbr7Cj6Yx
	 ZmfBQj7UHOC2Q0n4o70ijRVHqUFF5TbDAL2Dy7NdNE/XBY8D45OyW/Bg/o2aYLYiiLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waFYYRUg;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21D60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F21D60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waFYYRUg
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4d26094beso54062217b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625742; x=1796230542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ti7sfZfGPPJrK5F0GmBVTG7Et9txrUN3kqd8OJyVhig=;
        b=waFYYRUgzOR3OaWGAmN3MczRjyxRQAHdEnXubJH2//F3rx13B/6Riohtw0d1ZvUNda
         uMNl4nkqWNklr0WkwPK3S71Jho63eaOvq96hfBkRvYnfVKSKMUmjsaT1XWfEf/xdO9si
         xUSXDmeHTIiKK9geArjCRYjZuAoceLIWyUv2+dNV/AyvMg5vj0h1LQP7ktr5Ws5FamRF
         ku2GoCIT1zEBllpqIS87vKCJ1eAYvvmmw8ftBstZOXPXIqfpMDgwYwcn/sWjJtbseS0W
         tDXY5gEo3bPGNDjNn5nZQorfe7RCWoNpx1UPzWSJkO+AnaUJEOBi6vwjdxoz9k20vdto
         ZFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625742; x=1796230542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ti7sfZfGPPJrK5F0GmBVTG7Et9txrUN3kqd8OJyVhig=;
        b=H2y+y9+2EmRtD6NK/jmWRzBaKaQLbRE0y15H15aBjZMnCC8OvtizvOTEl2vcoOHETB
         WE7w6wpUQyJs563HprsGLook2NGpK/4i0MzIMjZ8Qw0U7CbcoyjVrGSrg82D2ZZk7p5R
         VztL9R/U0NfLL6bVquCKPn7hrlKlqAzatSD3uld3juRLPGYAZ7uSCARK0/weCzs43Xpz
         vuPS+uvf7zo+OaeNsinrXFT2RJJ5KZ6U9o1Ohw2+a23Kl/kldkJ+L4cEJw/CBjXbqrBC
         nRp3t+6gPTsbnn8RdyC1qteY6SbGIbeYTdv9pW03H/uo2amoBSjbV/aAk+Y3zV8ZD6vn
         MiHw==
X-Gm-Message-State: APuU4Z/w5op/HsZbhZwsM2T2ZybilevGPwS4T1HQoqF4t8PVuiJXuWeW
	ol4lu42Dk2RokhMeC4JNOwlMQlWlTvw+iNO3PVWqZKVInQrKIrgkiOg=
X-Gm-Gg: AZFdTZfxaZ97FJHmMfm7HAfSuubaa3QJAcOMF/E9QAmdDB5WBotl/m77ulBeSW1lBcV
	P590H9mFcZHtr89KUxMb8JCSP5mxItfGVi+Lwcawhu/YIzdGWlAh5NM23keJKAmyV70Ae8Cnosz
	Te8V3pkfTrNKnf/ouxGJFNOTXlKC8mYtPsCQemPdLemQPWvC5v76uXpw0nscNrK+Ti1ek6OCR5/
	IQeubfgqqM91sF309NgH6DHSRDL+BGtbZbh6i6eui4ygJLaSTqO5TjdHSc90m6EMuY4C6eIdZgE
	KTFI4trj1IpEJqIPghcEhmrj1fM5Y30IYTTQyNzB5i5CrgVEddrcog/aeNQXCfVwvnIzJiml+Qi
	FTyv2qGN2eO+hSEyatdzD33dbOZApIWG+v4D7c13B6aU39EXsv/Grlw1InW1IUX33yYEdsi5io9
	nDun0xqqb+6NOTzFaddxNpRKAY8L17zNHBsbjH/TVa8xt2Xvlly/5PKeuUJcGxlKvkqLlDv4SZ4
	WOakUvISH+HU4k40GLb05AfkbUpT/jT2sZzEh3RvodbZ4CF8rW2SwJKE8+YGFxBjivSGEnOq/NW
	PUp+W+6k0itSoJlpv9kw7LmSGnp/SsowC4A=
X-Received: by 2002:a05:690c:7206:b0:8b4:d6ad:55fa with SMTP id 00721157ae682-8b520456d68mr79019317b3.14.1795625742039;
        Wed, 25 Nov 2026 08:55:42 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bf474sm74766167b3.21.2026.11.25.08.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:55:41 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] MAINTAINERS: Move CORE DRIVER FOR NVIDIA GPUS [RUST] entry to sorted position
Date: Wed, 25 Nov 2026 10:55:36 -0600
Message-ID: <20261125165536.792563-10-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125165536.792563-1-svav2021@gmail.com>
References: <20261125165536.792563-1-svav2021@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CORE DRIVER FOR NVIDIA GPUS [RUST] entry is out of alphabetical
order. Move it between CONTROL GROUP - MEMORY RESOURCE CONTROLLER
(MEMCG) and COREBOOT CFR FIRMWARE ATTRIBUTES DRIVER.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf2817dd595d1..597fce78b0629 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6875,6 +6875,18 @@ F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 F:	tools/testing/selftests/cgroup/test_kmem.c
 F:	tools/testing/selftests/cgroup/test_memcontrol.c
 
+CORE DRIVER FOR NVIDIA GPUS [RUST]
+M:	Danilo Krummrich <dakr@kernel.org>
+M:	Alexandre Courbot <acourbot@nvidia.com>
+L:	nova-gpu@lists.linux.dev
+S:	Supported
+W:	https://rust-for-linux.com/nova-gpu-driver
+B:	https://gitlab.freedesktop.org/drm/nova/-/issues
+C:	irc://irc.oftc.net/nouveau
+T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git drm-rust-next
+F:	Documentation/gpu/nova/
+F:	drivers/gpu/nova-core/
+
 COREBOOT CFR FIRMWARE ATTRIBUTES DRIVER
 M:	Sean Rhodes <sean@starlabs.systems>
 L:	chrome-platform@lists.linux.dev
@@ -8578,18 +8590,6 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/nouveau/
 F:	include/uapi/drm/nouveau_drm.h
 
-CORE DRIVER FOR NVIDIA GPUS [RUST]
-M:	Danilo Krummrich <dakr@kernel.org>
-M:	Alexandre Courbot <acourbot@nvidia.com>
-L:	nova-gpu@lists.linux.dev
-S:	Supported
-W:	https://rust-for-linux.com/nova-gpu-driver
-B:	https://gitlab.freedesktop.org/drm/nova/-/issues
-C:	irc://irc.oftc.net/nouveau
-T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git drm-rust-next
-F:	Documentation/gpu/nova/
-F:	drivers/gpu/nova-core/
-
 DRM DRIVER FOR NVIDIA GPUS [RUST]
 M:	Danilo Krummrich <dakr@kernel.org>
 L:	nova-gpu@lists.linux.dev
-- 
2.47.3

