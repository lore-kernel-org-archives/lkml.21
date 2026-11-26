Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795735036;
	b=qlcHD07N+jGuAbepI/Wl/XHF0sFV3lqsdM4IjWtj+Eg29zIl7CqPS1sE0HcRd0DJqWs0
	 7gjY9/OWsqiNcm3NsucA1vz8pZ8YuJ2qu73/z72+7QnANz1vj+lTHzDUsrf7HDp0V91gU
	 bNyqi3NigdDMn0gbjGONw9LyUNXd1UKaQqtcheUnmxKgrRDpy2s65vKTbV/CcqYhHr0TY
	 8cQhg5gPH4moR1RC8zn5g/awl9Hu+OzytCYaNJb9wo5+cYvUvRkY1vcHgrsfBXdKWyDh0
	 B1xTS7rwuYd+oVXl3DUniiCX1ID2xts+I8DxVN3pLueZpi6xh4sDPm04OM0ROAuwCzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795735036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bc6pDRpdQwqOkvZRQt3j3RUC7mrJsd/9trXkMnSGJNY=;
	b=D0hdHArzi1yzFNGvitF0N7BsOaYDoOjhHqfvIpgPVMWo4sjc2ZS6gQoqk9KdMXCkAGzn
	 z7RKbxQJtMKpVNtMGWtCAhby8A3qMkugv+MeFBMXdQn269qyS5K81pE4UD+An3kUbtlkm
	 Tfr5k5j5FPjJ5HsP56VNNycqCRmVoKzcAo6IP3w0go0/5tf4npAmWwyjQMt1766vMSOX8
	 8AauthJqC7l7i2fsDR5u7Q0JLKwPijdT+O+MWVNS4aWcZl3w3O/WG4m7hTIfrAtamYitK
	 P4/I81igoYqxTZrIrCK7+rp0UuuxjvQFWgFw/RBXY5/pAYTmTL9JNCwXIlfaJAiO1cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OGVAiJO/";
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6466F606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6466F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGVAiJO/
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04f61282dso34254105ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795735036; x=1796339836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bc6pDRpdQwqOkvZRQt3j3RUC7mrJsd/9trXkMnSGJNY=;
        b=OGVAiJO/9erEoFU2rYaPwpE7GjZSgE8FmzOBt/rjQqzerVEfuH2LfHUzEv/GMzuOxO
         +/riH6HvCxVIv460w8apng1za4DWMMqnrO1/KTvQkMEFsAC4oSBurSAI9l9W3kaXtFKn
         FmwJ4y0MymiZq+EIgFVQIqF8XiTR4Hid5OSDEQ8cYV/naO/ZskcYD6rHUsuZzzXw0KHf
         WKKIjbYqdZfLJWgF9OY8hDkwjqgIIct0mTHZHXBDbrFjcfqFlaGq4UlaCeF5KYJla/PG
         1foaqTxoQH54uysTWdZzVbVxM37JsxBdPTbQT4AsPg79zX4SxFZeeKyo4q1XY/bUA/0Q
         EuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795735036; x=1796339836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bc6pDRpdQwqOkvZRQt3j3RUC7mrJsd/9trXkMnSGJNY=;
        b=U42srK4cgtdMOCJA30/Xhz3r4zyLzyy1vHmhwJ+5GY5NiJY/eDhOkbq7hCG0++JcXB
         ESexcnXwC4Sja0mBhlMC65X+IdihwF+O838SP18r3V8gvfAq6lHRpBJRIiq7/+ng4lJ1
         ImDKTgeCTxX1bHcqU3ctP2iak3VznRYR3sCv7foc4DI8Jxzk03pds7GKKXYlvvX2XAfT
         lsmJ8UnYsiDf0oRbQVAcTFv+lbIfSkPx8sJCb3ugmdWROGvq2uy42roGQHzFT89lgGA2
         N54mcivhRlxgRhqTLRvIt3cdDtj+0ZYIDknJB99xWATuEswlfpdQhEfmMgs2xVWxDBSC
         v8rg==
X-Forwarded-Encrypted: i=1; AL+hErHpOBjV7TRP7IKIGYAiHc6cC0zHynHpms6Swoq/2QoPVD06lt8dWcnXh4Gq3+R1j9P9Ejli/yXJnyj7DHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1mE5TydoFNB5j+5rsgPTmp6bWGI7lVwfQr8de5Cpx5QDmIHz9
	rL6cSptFcpHOQnrszeI57bYQmUN0MU8DRcT6OA4z4xeSsuVMtx0DyEZj
X-Gm-Gg: AZFdTZccpP6+pQutoyHutPZUWVl95MQ4ZvO/kkO+s3OeQ7ciLhvT14308F/NVTEiuSB
	uDwKbAOA01W/skFwf0gjOaEXEcLUz+Fv/94yRBuFRnhk19ZSvwG0KKOf5r9wO9S2aWhDdcTVERA
	GtPrrnMKTrDg7XGzPT+wadGD4J0QUbkGUo+ucTdtoZK6pRlnXT+/fFWWHs0fc5f5m1HN2YhfkOX
	a9r/kRwFJUJ2Lgwoqb/5OsuPJQSQBduQE47XBjv2vmIAjJuZ/aixdparOB5/hEfG8O6CFqzvJry
	c0NdJfeQ4HShkFSDtdsXk9l7dSvVm3escL6UFIe/h4+IajvUoWyIEbtbzQRUZiJgZVlV3m7UC/q
	k0WIL2cV7XyQyYPPKoApDxGT5ngv0SO7PiKd3K6VAuLctvT6cy1bwhimjbkgQEvvHKO+Ye2wbFP
	HsUPtLMmJJy6jFk2+gATEXF9xtjBRehbpGGK1GpaTBtMlAIQAKm7IINOPjAsDzRWwInx6jV3m4Y
	2FxW7h5Yh0cB49eJdnBogO5SGEnnbImClv/IQpMXUhLDInYSRj++kqG4wtQYI0+MACGnw5jIpUf
	twBwEekwuGNERPTQy3IFMEvx4OVj3bP/aJeqrgpFtrmLhstqGA==
X-Received: by 2002:a17:902:ea04:b0:2ef:e946:cdc with SMTP id d9443c01a7336-2f03f1f0ae8mr246999455ad.56.1795735035597;
        Thu, 26 Nov 2026 15:17:15 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm81242895ad.11.2026.11.26.15.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:17:14 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] drm/radeon: add missing newline to sync error
Date: Thu, 26 Nov 2026 17:17:11 -0600
Message-ID: <20261126231711.65592-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Terminate the disabled-ring synchronization error message with
a newline so that it is properly formatted in the kernel log.

No functional changes.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 6416f129e090..aa7d99a46a83 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -135,7 +135,7 @@ int radeon_sync_rings(struct radeon_device *rdev,
 
 		/* prevent GPU deadlocks */
 		if (!rdev->ring[i].ready) {
-			dev_err(rdev->dev, "Syncing to a disabled ring!");
+			dev_err(rdev->dev, "Syncing to a disabled ring!\n");
 			return -EINVAL;
 		}
 
-- 
2.56.1

