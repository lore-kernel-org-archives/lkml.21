Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020073;
	b=LT1qV3jmvGyNidxanXcQxgKYw5BLqcmAJhrdTUyn3+s0XXF2cDaS2WwRX4faibDbk1zx
	 jHwHVdnancaF5N1ayAG+DGsl9kb5xk4UYpnuZz0YTkfI1JAhrfa6voQmL+Spm4iLVIDoG
	 H1qtVW9716J0bP5TpnxJn/RPTx9fewvncazn6Zs+LWfQrkF0M+URuVPhm2rAuNcOzW7PP
	 u2DxmNon+sNhPgpE033ZzQb2U19n0UpKb5sNDghmmWZPQNxz9kdDK4noXIM0X6q1SGhOk
	 yLjRn2aY8Ye09bXilK1hGbBianiOK+SllPdKoA/YgiU3RnmSnLznlPVaa8XlSi7wE5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dvAzJc66WDQmGpxUAtDLCtw0eHNkjSaLiA8bjaXpai0=;
	b=aS2Uv50lRjj6gRPamIbQMsuae4Jcv6p7fBBeJ+EYx0BZVXif5I4Vcb8E/CjWD7q233tR
	 vk5IpO9O2s9Uim2tLMXkjS22B5EDAEdIyAJDqqJHLMCwG6ddUwphRirhpamatzbsXPdyj
	 PS2eGA3eLoDWRFb7lOOVGDP/JjH9C6muoNuPzwAzSANGiiZcpvbRoZXC3T3XMguQuyUZm
	 KcQ6KTM/whKP1THv/E6SxpQf11SG7RPDwma1sPB5VedJ31xA1AostDLOlF9F3iblwY8uP
	 x3qlC5Vwwm6xg3GbS+VHA0a2AwTWK6uLklDpbRf8VWN5AIHmSAQIMaR1jjajpAIXKWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rXhvMG6C;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8703606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8703606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rXhvMG6C
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b546061d58so1797274c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795020072; x=1795624872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dvAzJc66WDQmGpxUAtDLCtw0eHNkjSaLiA8bjaXpai0=;
        b=rXhvMG6Cyh05y9uIqxkR4ZKq0h0kgeiEZTS34LWaJ1SvJAdSsoHB+zIpzHEF+wSb1n
         kWRg4AQwFTDq5s2oPEXpuxQlFYjZVd0OpllFBW6/hcKNWMDdxGATPpktI2m6gTRhd9tR
         BdYMrhJI1I2TrB05zND+Xmb/thS/NbLA83tL6jam2JouBd+f6c/ue1D9R3CIpx8/Uk0j
         2uNmm6D/CBTz8jPnPbuv/CU5sp8clNXEQ0qIPTqClGhsHyCgcUJwKeE16kVr8Cu8ooNF
         8uj6cN+sldH3DO0noqZiLvOcjFbfbPAZQvR0W6zJR7vriCsCDOiBTC79yk8qXHK9fLj4
         J/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020072; x=1795624872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvAzJc66WDQmGpxUAtDLCtw0eHNkjSaLiA8bjaXpai0=;
        b=d/bYXOxHkVwftwixvWUDWukwuGH0fil4pZpTeVWyRkAmALiUbNQgXmuYhfZEYD9NOy
         mhmD3MjuJT67aYY4rbJtId5pHggYRBmoNmDrte1Q3fDYNJK36KLcnss/AXf3xZMN6/Kc
         J1N04VG9+ibvkKT8RnUrzJV/yCpz2mCdE+X85NtjTbsZrJ8hoUSEeiQSTArg4+RNBcY2
         lPbR0BttHwX6wi/GIFl9qsznWkp2FVUFk2yBytA47zI4jctena+D3wRHWBYAHHhwDc7J
         znOBkjKcGPRqcn7qeF3e+C4n8faCztCUkLGjWSZb7fdqf8oPx4FfoEuEtbxeo/eobk4W
         tVng==
X-Forwarded-Encrypted: i=1; AL+hErEHAKSqt8SLK05aRlBxLGVv1T0ZxLSIneyVuScQ3/WF5qNBNj5VNJIGBNOefCBfr12GBLYWW/WZMrsx7BQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lBe0keS2Qb67tqNaF8VWBtu3SjnkOV+ITaqqGPm40Zu7w7L0t
	IWtX4dEb8JytdTrDF0LdBhR1IgzXPK8BuS/zjmH3bdlHLTNdKlAOvEbH
X-Gm-Gg: AYBFou1l3S3PUTa8gK15BBjrU4cgNerh3AvcQKpbFOl9qxrPNG6k+XJXPGyjUe5cQON
	BI8EuGAMuhfiYHyTLnDdiS08tbu6zZQSZqSQ08rZyTAFPe4x7GaKUEoqABXb3RsIQvmGHmJBBFX
	5z4YJn3JL7y1PGkX7EpMrQxXltkrtYsXYy6qqCUKzZoKUm4qzFneAkLxEAF50CfzuqifnTFuXfK
	4QYpM/Gw5LpkTVepu3eDu/ZoSoQhcGWC8BW2NOP7dh77yduLnG/6v9H4KzZE3y911t6xs097H7W
	UyO71Ny2u3SJpJXDVdBRcq9qaYPBsM8k67DALUtnAtE8vyVTfOpF8/PTnhSJt2Z+kvp7VFbN9O7
	eEWLRSe+YAarciLvQbh0aPPq/jGgDpcCXnxcw8tyYok1rSicjCRcwvelSPR2HYCnJ1B/dgqtggb
	T1On+iPpBmy7n5uKpUT/D/d6zW1zHKyJgtF6tkzEcbePDjw/vxGVaPOaqQEehHhA70etlxQL26p
	8AZU+DRFGYU/0DNPyGW4vx8UFxb1IDK/FKzzBgwAj4Xr4WHZN1hw1onHhdxxP2oA5e0f1UXxmqg
	27UXzkPRa+qlPS3LR0iv8+R9XyE0fR76ggZ6D3X7yJ83oUG60RG+TQ==
X-Received: by 2002:a05:701a:c961:b0:1b5:2bcb:8691 with SMTP id a92af1059eb24-1b543c447e7mr2952861c88.42.1795020071657;
        Wed, 18 Nov 2026 08:41:11 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm11140414c88.11.2026.11.18.08.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:41:10 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Song Qiang <songqiang1304521@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Praveen Kakkolangara <praveen.kakkolangara@aumovio.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: magnetometer: rm3100: check TMRC in rm3100_get_samp_freq()
Date: Thu, 19 Nov 2026 00:41:06 +0800
Message-Id: <20261118164106.4108794-1-maoyixie.tju@gmail.com>
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

rm3100_get_samp_freq() reads TMRC from the sensor and uses the value
minus RM3100_TMRC_OFFSET as an index into rm3100_samp_rates[] without a
check. A value outside 0x92 to 0x9f reads outside the table. The driver
only writes values in that range, so this needs a chip or bus that
misbehaves after probe.

Commit 792595bab492 ("iio: magnetometer: rm3100: add boundary check for
the value read from RM3100_REG_TMRC") added the check to
rm3100_common_probe() after a crash on failing hardware. Do the same
here and return -EINVAL.

Found with a CodeQL-based static analysis tool that we are developing.
Reproduced in a userspace harness under ASan and UBSan, which report
nothing with this patch. Not tested on hardware, only compile-tested
with W=1 on next-20261116.

Fixes: 121354b2eceb ("iio: magnetometer: Add driver support for PNI RM3100")
Co-developed-by: Praveen Kakkolangara <praveen.kakkolangara@aumovio.com>
Signed-off-by: Praveen Kakkolangara <praveen.kakkolangara@aumovio.com>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/iio/magnetometer/rm3100-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/magnetometer/rm3100-core.c b/drivers/iio/magnetometer/rm3100-core.c
index 46fce2978d76705..2fec02e5679eaf7 100644
--- a/drivers/iio/magnetometer/rm3100-core.c
+++ b/drivers/iio/magnetometer/rm3100-core.c
@@ -279,6 +279,7 @@ static int rm3100_get_samp_freq(struct rm3100_data *data, int *val, int *val2)
 {
 	unsigned int tmp;
 	int ret;
+	int samp_rate_index;
 
 	guard(mutex)(&data->lock);
 
@@ -286,8 +287,12 @@ static int rm3100_get_samp_freq(struct rm3100_data *data, int *val, int *val2)
 	if (ret < 0)
 		return ret;
 
-	*val = rm3100_samp_rates[tmp - RM3100_TMRC_OFFSET][0];
-	*val2 = rm3100_samp_rates[tmp - RM3100_TMRC_OFFSET][1];
+	samp_rate_index = tmp - RM3100_TMRC_OFFSET;
+	if (samp_rate_index < 0 || samp_rate_index >= RM3100_SAMP_NUM)
+		return -EINVAL;
+
+	*val = rm3100_samp_rates[samp_rate_index][0];
+	*val2 = rm3100_samp_rates[samp_rate_index][1];
 
 	return IIO_VAL_INT_PLUS_MICRO;
 }

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.34.1

