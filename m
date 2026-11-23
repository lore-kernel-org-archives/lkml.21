Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432755;
	b=DD7hYSU6/nzmXTel1K4fpD8+F0Td9pWCXyeuowcJqmO0+Ma05tb6I8ec7F1YZU988uU8
	 VeZ77Vc8yobsZzlybloeM9sgRHij0x2zExz2tzmtPmbJ6aEluak3s3zZ+UZ2Lh1UCxXtz
	 JVYe1WuOTVsDWUo+R9uYK/O0DQRfnseEPxGOEcXg97k8ED+G3qMyyZiUVYBw7wswNL6tr
	 2mj8R4Co6mBrzgFfDTGMayoLutf8hBK5Cmg1TQQqY8Zx5eNus1OrRP4d4YrUip7nhMyKQ
	 jhyB3bcUmw2L2Ye1YviXwzVVic5NrmA5QfetCuHyy+kWjyfHalSqN1vFyLg6hOVJi4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=tsoBXjOa7hArC6ZxKTNtqNgzpzMWZ3WS6d1t6Lz3KOk=;
	b=VFfhfbrQlf4StLsbGr8CSvvO8QurGZ+9vxh4A2gHrGKlr1YaqxDz/XPo+eIMLWWCYQjR
	 Ct2f+bas3WRy1o6a6D9OcF0D2DdRr/14mzpfcIBmZ5ODzaymE4jl12PC3LF4rzHuO9ntY
	 CZuQz0ccEbm9gFYK1/dtDigML48OhB2VPJ+WmOhsBbte3iyIj88oNb+b7/X4taudy/aO7
	 e6ZeJ/WSZSq/H0d5D92SIbu3EIuFP50FCPBIqwbjuoYWtoeHW3BUyNL8amMFbBfKEZPlI
	 SgufkwPyVfdTIq8obGf05EDPxzPweofnlvW4F1tm5g+9VMlZmvQqU5B6euqVf/33QaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FYRxtT0I;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39589606A335
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39589606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FYRxtT0I
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so25846815e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432753; x=1796037553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tsoBXjOa7hArC6ZxKTNtqNgzpzMWZ3WS6d1t6Lz3KOk=;
        b=FYRxtT0IT8qgigr5nclKZ0tW6RQHbihW3BIM7pVYAaewAqheqbm7oe5nHw/yjZ62dh
         O4H5A1H7wAqAbQVkE+v0PupIjcl3dnQ3DLICH3nzd/r4dJi2kU/pD2zJeXQgiDLhdpbJ
         SAq0PdYaGy9VzM0Ql4AnyI9cVtrY8Mc1DgUErYiVTyPCDli8vyO3o66ErdLQOboYJOFz
         4dz4Cf+kLHTmxJUbwsJn6mRpedkqoNs3UNhqaIW2jIb15vtL2tRvczwSdtKIEjTXmnHZ
         1F7bkKWFaDHyBAKlZxy5DedLH9WMlUGm2SG5KNgnjv/lEQ1XlTVVOV0V6547OgGo4ZLb
         2M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432753; x=1796037553;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsoBXjOa7hArC6ZxKTNtqNgzpzMWZ3WS6d1t6Lz3KOk=;
        b=QklPYHExieAMjL1DdpvqnnTKRCO3y0w6vIzhwg7jF3cBlMFeHspPJuAWpdj3HMgl8k
         LL69gnpy6Eg5EdAYn6rEgTagD48L/YyywrK8bwG7Gg118mjhI/U1fjUtsrdO0iKWde5g
         nPUgh9J6giZieZ6+C394ZGrp3FHeikom0goJHF8Wt2iTD5ySX/xW/v/mekO+fnivsVyI
         xQOAsx6Bm0K3A1NA5HA1PW8btNZXFngWlEBQRv3u3sl48uS9bmabeuwRutXKllwCicmy
         FuVIG9bqzksO1cnJ6GIlC0xzGql5QMpebAOliHRYUeGCobXqVg0hpMTWn5vdgY2nn4Ye
         SQ6g==
X-Forwarded-Encrypted: i=1; AL+hErETN9r34ONIJ6rWysgUsi1akEaX6RVWdPS7C5X713Vmc1u/iFLp6vKOKHbH+eatPs/IellLVowDzZwMjAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Uv9UdL0ehqzSB8hWBKt4qD96pHKcIeXE+hiuV9t7ZBMNHh6i/
	l/awxI1NMySAapLiJWeN+p/8HLV+WoSmSBSqv4SgVyybRa4Wx6LR6KUw4VoIKF3QrtQmv8IZ+8m
	IepYa
X-Gm-Gg: AZFdTZciXpWdPBNraQHthImeNeUI39a7fYBEYP+504cyiD74SdfpqIC29+qEGYPQJbs
	5vjRfBMDY3Ujs5ZMOtoKjC8Q1WBdZIlGLJcLbf2DxXaP66Si1RVNPQx1cOtqyWv9zO3YzHEgQFf
	f/7TAj5CICyAzzNzDjSYEEY7LnWajShNzn0kQKNqp2liuIzkE2VWcga7WnPJJmlRxUNvw1TLm5c
	bdVfZV18762g/aFIHsA/+vhfWgZsKCiHSVs/8wL7r2upt2vvqb3IdgEK3C1OaulIlxbYpouMixk
	0xw9QXJ1nVohYligXeb079SAUwFMYR79OhkjYsHRLu5m3HFxfa+yXcn9FuxYEOgkLk7TqkMffct
	9m2upyOXpz+vvXgIK5vMOg1eyVEIlY0eUcwudDsuKlhvwxmO5X1PVUi35DeQ/WCaSCJETjFJNZ8
	jlak00kfmcONI5H9rgwCsppgkd9Mcl7pHI2phgUTof8nINd078jx0RnUJYHUmdtRKANGsWTIkjD
	l1s9Lxgt1AqDCeLjalUxByo3+e8tjMInBVX9u+501eOpsqTdt+roOu1TEHIrEwkE4rkIZa+LnHZ
	knpimwbvgpcvcrU14U0dpViYAF88xBFUOd8LYxhAQ4GeDoVwKKXTQopQOns8Py9V/egY4LOU2i3
	KbxMF0gnvyrmEteRO
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr219874935e9.25.1795432753450;
        Mon, 23 Nov 2026 03:19:13 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6a67fec7sm20288415f8f.26.2026.11.23.03.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:13 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 09/17] mfd: intel-m10-bmc-pmci: Use named initializers for dfl_device_id array
Date: Mon, 23 Nov 2026 12:18:07 +0100
Message-ID:  <422064899e61f8265ec9aeb73f60ac6d37b6440e.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=NyYODZOs4QqPpo8EPg0xidXW1ul5pfGAFUJrCD2s98I=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGsEIP3I49+DK2nEjPWZAx6JWaDG0SSUyR2luKCrhZwqTTAbI okBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJrBCD9AAoJEI+A+1h9Ev5O7ugH/jhi 46vSDOIzZ/yDXyWZ3cyF098qB4lZQv9TRG9Sezwhq9Yu6e29VGYrzySYPclk6kUyAzvB6kb7WeB fPodMEsZC8SELAur/fpRsoa+x5eyT7lji//vKsZC+pGYvNOApDoVCGXE5HSmqvtyonfyAKPMrYK CYTVc/0cw3ds6h2z7V9gfAru8Y+VXt+27WQjkBDdorahmwsGe5WjtNqox3E8CTQ5iRdZVbz2x0H ei5W2EMHNL78X90xrS4JkcejU8NeyR9g9kn6NZC9Rczt94ehlbV8YdWfJuVZ1HJpJrt4FW5kRqg +eqFFM+UA5LheZ3t2Ml5pYg88SvK+LubWzWmRFc=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
dfl_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/intel-m10-bmc-pmci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-m10-bmc-pmci.c b/drivers/mfd/intel-m10-bmc-pmci.c
index 825a4cfd5d98..06b2abc9d4cf 100644
--- a/drivers/mfd/intel-m10-bmc-pmci.c
+++ b/drivers/mfd/intel-m10-bmc-pmci.c
@@ -434,7 +434,7 @@ static void m10bmc_pmci_remove(struct dfl_device *ddev)
 #define FME_FEATURE_ID_M10BMC_PMCI	0x12
 
 static const struct dfl_device_id m10bmc_pmci_ids[] = {
-	{ FME_ID, FME_FEATURE_ID_M10BMC_PMCI },
+	{ .type = FME_ID, .feature_id = FME_FEATURE_ID_M10BMC_PMCI },
 	{ }
 };
 MODULE_DEVICE_TABLE(dfl, m10bmc_pmci_ids);
-- 
2.47.3

