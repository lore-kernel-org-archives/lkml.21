Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996960;
	b=hWvSsiE6t8WAe4ag7QfjSCPuajzZ8PPsVkq2a7IDM4Yxgif/cWDIElBJjOAMzphNuNuI
	 vCo2C6VYZDmDA0Wk2PBWSzDzzLYtlpYWYNLmEDbg4fZYj3ABmEMbWIO7YpEE4DP7V7TQD
	 e7oe+q3vVffxmow8uX4sV1IzR4EqnGn+mYPw+9ZirRpet6nufB4UbFMgOJzBU19r4WFRT
	 5962BpluYUf9LdV9OozGsBGK/2x5ytToQYPY0S8+VNqz6b7b5rucNq9Sepps89nJf5026
	 1BjsohaV3SMzbEAEVUYWEzeIjQkvDJq3e+Jn1z5AEG+tOsQ7+rGKelkzRjrx7sqfRLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fv3I+O9hDJ9zZ0P3XgSXSVC2IJuf4Bq4HQpsFJCZlL8=;
	b=EkesRT0iTc4zB27C3DoidtAMvD1GFZFWOLv+j+h1hxNti4r9eyOlNjYFaGdR9q2NobDo
	 LIwKe6JLOWRx8OCcaBuZwhfXZbdgQW9O3HY8lhlQobylaSI10z2QhYpYb6whZDLeHlgNC
	 ZUx8CLT0Ge+lL1ijfu1elF/ppqUziqQGYLR3i7c+B6YDmq/u6RM04LupWJpblPM5ChuF1
	 WKNJrc5oE5wI2LbU6XAtKtPLcacQPKAysvtB5B0bTs9zgKkboflJzI8wXxxUdNwX7LlcN
	 S+Bj/F65Fg/4HaLKtPe1a9pZ/rgVNQ8HB8GjY2e+UUy3CE0Wu829YdFUx6TWNTflLZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqGRCHK9;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F0C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F0C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqGRCHK9
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed2bfe3252so3244495ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996960; x=1795601760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fv3I+O9hDJ9zZ0P3XgSXSVC2IJuf4Bq4HQpsFJCZlL8=;
        b=wqGRCHK9piPFaNciF9nHvzxzSkoIZ+XlCyaF5JkjzD2zwmNx3YrOXT/2p4AZFebyy8
         w+sDqVhPpkCxCClH7igBbWOOBEC4un2LVJUkTZkMbkoXsLF77xYCVMcOeY6LpwgqzjrH
         eJPqBxDJCNEau1rGTi7d11fuotL5vDzXqXCszdMJhchDjhIbDRBHYsNOy3uR4ShAmfV9
         GjMPhrATDXfSgbpW/ByRddGhcZGK1NT5Dtq/2LGpajmSkvIR4MIs9sJ9fMRiWaqwkigz
         vn+1ApZPhBY7VuW2aT9NnNjq97v/oOkrV4bp1UFxUjN9vrnYBfLaKFJd/GIyFRQZ6P3o
         FGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996960; x=1795601760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fv3I+O9hDJ9zZ0P3XgSXSVC2IJuf4Bq4HQpsFJCZlL8=;
        b=EFeg+YJwYATegOWUnSCgI3QroumLrK0gntEwmBkeLyq/FKf5h440hpb9Sti0CT3usq
         B57VzgqfrKaXauoItYUZiSq9b1xLMz50M9dUVkKlhwl9uoubT6UjTob5XKlMy14g1XfO
         mra86MGzYzRlubdiCIcFuxn7uUxVyKIZ1YIeNVPZlgZA+BYT7RdEbcuKm53mjPSk9mNf
         r+CREfZxEiWN6cXA5hljf7tDgEY7WX/C6WwRuJB06P54HvmDL1hjVmevMo0rjwL7Rpss
         k5UPqt8akskqiYrYibG+CTwKC0PcDnfI6huvtUf7Ep24hh7KlNB1RiGkK52vH4TDUI/L
         Mmkw==
X-Forwarded-Encrypted: i=1; AL+hErHwzjF3R0gnrbedBl/ARxTmtyJbmA5zI2vZhB9dtIwHHNxDRVi1KdrGSN0sIioBmxqMvPwKvia6J5vIV68=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GexaB/OB2seL/k3htl6wFeSpCH1ms0cKgf7JcUAXgscRq5/kH
	kRDV5g56BY3miEf0khsOlHFaU4wX2lCYHf7seAlWB915O6k3t163kdJ7
X-Gm-Gg: AZFdTZfiEJ9D1tHTUbfN6kHclvanOEpAT54ASy7fl9Vw9rJxst3YCguZz9CZ2ZfxM9+
	4LQIyFa0LgqF/oKAT+JuD6uaKyiFecsHAgLOgldkG2NtvUP1NS7cW79anzWpp+sS//P08tVRd9E
	NSfqbEX1ZTTvWM/h5j0XgyCdI94j9r6aVLFYdMhYKeg8Mckbvmymvfl4rtuLDDveU07MPZuYh82
	fWLpsebVXqN+ijvqxgwa/xVTxIZbBtMB+hr6Bpk6WMU/g9Zihq49XgD/9C7Gps44Hc2QgBfTQlO
	aCdHoVQiaV0tnk9GlF9Vo+IciOIsq0JoM6FXbjr2MTH2k7QJt2N3HQacBhKjttCT6zJ8TMcgJ44
	pzLibBHTjQE4/D6uinTK2MrO3NeXTrJT2PNlrQ7GjEbqH12sWr65+W61YWSyNcZEbU5bamkrGjL
	wXDtrw21Ai8/UckfZvfd4q3vc++KjPLnMFc2foCZzt6KvmMDfaWT6PZvmFh2MGAVROqn/WVLqrq
	NLExqRmENgVJPRp2pKhp3llQDitIFaEu872FeXf20yTnt89TDV17JLEKUGIYBr39CDtBZo8Ir//
	Prl6JuL6LkKh9J+zgPOLKhRPAGZ7UVTMMA+0I8cNXxlhTtY1n5RdKA==
X-Received: by 2002:a17:903:234c:b0:2ef:e28e:8f17 with SMTP id d9443c01a7336-2eff754459dmr21917045ad.49.1794996959717;
        Wed, 18 Nov 2026 02:15:59 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff623c968sm10954285ad.55.2026.11.18.02.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:15:59 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] platform/chrome: wilco_ec: Reject out-of-bounds property length
Date: Wed, 18 Nov 2026 18:15:55 +0800
Message-Id: <20261118101555.3467162-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

wilco_ec_get_property() copies rs.length bytes from rs.data into
prop_msg->data without checking rs.length, which comes from the EC.
Both buffers hold WILCO_EC_PROPERTY_MAX_SIZE (4) bytes, so a larger
length reads past rs on the stack and writes past the caller's message.

Return -EBADMSG for such a length, as the file does for other bad
responses.

Found with a CodeQL-based static analysis tool that we are developing.
I used an LLM to help write this patch and a userspace harness. The
harness runs the unmodified properties.c against a model of the EC
under AddressSanitizer. It reports the copy for lengths 5 to 255, and
nothing with this patch. Not tested on hardware, only compile-tested
with W=1.

Fixes: 0c0b7ea23aed ("platform/chrome: wilco_ec: Add property helper library")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/platform/chrome/wilco_ec/properties.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/wilco_ec/properties.c b/drivers/platform/chrome/wilco_ec/properties.c
index 9951c8db04da065..4ca7e874804c28e 100644
--- a/drivers/platform/chrome/wilco_ec/properties.c
+++ b/drivers/platform/chrome/wilco_ec/properties.c
@@ -70,6 +70,8 @@ int wilco_ec_get_property(struct wilco_ec_device *ec,
 	ret = send_property_msg(ec, &rq, &rs);
 	if (ret < 0)
 		return ret;
+	if (rs.length > WILCO_EC_PROPERTY_MAX_SIZE)
+		return -EBADMSG;
 
 	prop_msg->length = rs.length;
 	memcpy(prop_msg->data, rs.data, rs.length);

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.34.1

