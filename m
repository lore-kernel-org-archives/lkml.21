Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452794;
	b=I4xVchLk4mGFAonUI1gcj8R9UqYf1nhCBt+JVT8AznOpSuXNEATz6U6pOVjrr3b8Ssos
	 b56wINdUaw5HSj1o7g7PwArP1Jv+3nIZiq1Y8miFQkR672zl7TjtXLIPu5kZKSvHJF0WI
	 JYDhr091SVYWMfZC909PsI5nC82AbwFThBYDp3LUskPHjsg1QrfyFeDrPeoU/yjICLfrP
	 kQu8Y/EKcDCcS9ASf8vTlX59u/Y0lr+ESLlgJSn+W+fZyEQF/lsz0xxVpJ8vT6KAmvt/o
	 EsmS1vZs3zwuElPo2gMTexQmh6D6ncFumNdcy/DHmC0MMa0EdpsILwzGIlpGc6FoK0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TUxLuuQ5BDvgDBvVo0cr4CFNouXQkFS9YLCQcvchztE=;
	b=NL9IWInnjvqAyPCgjE0wEPaZNFBGazDUK5kRZjZ6kuqC5ao035V1ureRNkEWHtFZZHqH
	 gH672tN6iqeWVhzi7ufVwjsGuyxE545OYGGSrgzH8oud9dbqoV4dxyg4C7DsHpu5fZI/c
	 S5AQ4anZuWxtu4kh7k1HHBLcRbdbWFh0yT2PNEiTt2r97t6+zv4IMDtbNc1HiyoB+BJ56
	 9UqGqZ26aDiat0p3m+7XtMJ3RiVaArf84GYQY0Fw1iqUR6h7pEYxRKlqDC16LGyUsgbD/
	 tcX09OzwmvdJjztiR2TWGrWVcgF/jpnBkJgKkCDvqOlT2kgnwANQtldSepnlNP+TU4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAo5ihZ4;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BAE606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7BAE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAo5ihZ4
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385c497bf94so2530969eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452793; x=1796057593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUxLuuQ5BDvgDBvVo0cr4CFNouXQkFS9YLCQcvchztE=;
        b=YAo5ihZ48I1v+Pdk7t4OH1oJhmBDkUx52bBmNd+J1+eFDYPHZLCWW67QOyk//vP8m/
         IzDkpNJqfx2I9Co6wktYpobWMcTAmMA3/JCsgtWmG4kgwWRKTV/E8RJIDvBkBvEE+Qem
         psAsriBU8ztXG4oW6msy9cckQdJ8TVOaHzVpNCr4SIgf+EUhNIa/17k5L5TJMUIrwZTs
         xuIUHhNFsB5tjdx9MWQHHYLnenV+NxGFbLAFgP2L9xFZbnn8N/w0QXCrJgpYXAp6uWbT
         38hQE56ZzaA8zwnrV/XtVO1Pc2ezSZnZ7KRUH51zwRs/F1rczSESvVPmPYYhRtW94Kae
         ejlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452793; x=1796057593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TUxLuuQ5BDvgDBvVo0cr4CFNouXQkFS9YLCQcvchztE=;
        b=Dq7uJVw6HqK+xQrCeBOzYoqx/xaWH9F2bkcQk7zAXd1ahsVOSSGDkeR6wvkJhDtBIg
         GZTY8RZAQRw7dBjpD+eN0qZNSA3LCZq3Dvu7Z1sU9RZxsFq6VBsSbePPJiU5e4F6rM2Y
         7ygBp3KU5pmJm/Qi9tmEl0HgtukmWMSd9g+kBh3qIdkXJqdri+GfgpLr5NOFMae47hUj
         X8AI5xr9BfGlk/t7c+uxeqBCPKYDEhExpM94A7jgKhRGtL8RgmhE+Nnh+pL4Nv/o7ak1
         MhLNpQlwh43fdsr2Q9zSJh0fPJBbU/SjJYptsH5RfB2XoqDsX3kbuogpLG8B+21W3qDJ
         wAjg==
X-Forwarded-Encrypted: i=1; AL+hErEd+vrqo4BzhE9W83GFcgB+lU/XHZPQk7ZI6Eq3nm8RT6W0KEVqL2aazoaD6S12gXuiLtyg6/UOkURSYZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BSwDpQeXpzwdmpaVBJY4HUCCyuW9m7KPGoDf2MqmbRqy5FOJD
	nEBaMdkhoJ1Zc7WRa0E3k8AqB8RClESS4+tPTicehDSLLBhxenjMxlfM
X-Gm-Gg: AZFdTZeTPpYAzXvFvWQWrCWWPsTHgW+EvLyGO7cV2kXVF7d+IBeDKRgX8NtaEW0I2uD
	DVj9JD9jyZCqzyfACf+gjlWwWwijwedrRB8mYX3cgiMLIc1gJ3g0Bj916F/LuzKTIXXCVtBBDjc
	MO13PgrFtNyR42lMrUhWGrhhM57qoShyGwjOtvuDpZcbDMEiY/8ECg25pjWGUM5v771kuJhyVaQ
	rWFimu5zvb6fDJjmCeqnFVrKPkBeIGA3xopsEKOXAzJyRvpmByHBPedGXGPyUASu+8Gcsj/kUdW
	/PDDScg0Is4JFB0rokF9Q6s5bwdNnqEoN7fWQN3YHz01z/l90rYRGbvDtAF5sAYpqVNjJ1uGMg6
	HPSyPNJt0FBXMq3AbBid1gWJkGSxDknAJWoPg3k2Zcjl8tEM3UXso71D1PAGEhyBrsPZ+X0Hngi
	AlNZtAqocgHLoADObZCz1m2NeRKj3aKUSclKLcsSVFYznlpxZQP6YNrHEVjMThAKqP+xGOyuiy4
	+E/xUxb0lN+2rhvg1D85qdXWqJY7CnGglRl8H5bRLpKj7+NNzaahrmkNV1myxuC1YQe4rvKEW6n
	UFM17CmOaiTmpY69tJ0PeT1gJvL1q8xC+e3M2ygIclMYoFDJHyDrEmCfxyuJYbSGX4rXfQ59knv
	s+7Xu1f7nutLlFxDBhyh40DK/6sw/zZciVEfgfYUnzQDfmJ1YC5qTz253CQRpSsMiXsyB17OzRY
	AcCmWxeyCztUr7trDxvXqQg/M5cpkymtM3yvVL7UjkhQ==
X-Received: by 2002:a05:7300:1899:b0:386:b6e2:9fa1 with SMTP id 5a478bee46e88-386b6e2a02fmr3281767eec.34.1795452792857;
        Mon, 23 Nov 2026 08:53:12 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47196668eec.5.2026.11.23.08.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:53:12 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yasin Lee <yasin.lee.x@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 2/5] iio: proximity: hx9023s: check the sampling frequency index
Date: Mon, 23 Nov 2026 22:22:48 +0530
Message-ID: <20261123165255.239490-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123165255.239490-1-kapoorarnav43@gmail.com>
References: <20261123165255.239490-1-kapoorarnav43@gmail.com>
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

hx9023s_get_samp_freq() uses the PRF_CFG register value as an index
into hx9023s_samp_freq_table[], which has 32 entries, without checking
it. The driver only writes valid indexes itself, but the configuration
file loaded by hx9023s_bin_load() writes arbitrary register/value pairs,
so PRF_CFG can hold any 8-bit value. Reading sampling_frequency then
reads past the end of the table and divides KILO by whatever it finds
there, which may be zero.

Return -EINVAL if the index is outside the table.

Fixes: e9ed97be4fcc ("iio: proximity: hx9023s: Added firmware file parsing functionality")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/hx9023s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index eaf962c29256..364ad2fd6095 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -681,6 +681,9 @@ static int hx9023s_get_samp_freq(struct hx9023s_data *data, int *val, int *val2)
 	if (ret)
 		return ret;
 
+	if (index >= ARRAY_SIZE(hx9023s_samp_freq_table))
+		return -EINVAL;
+
 	odr = hx9023s_samp_freq_table[index];
 	*val = KILO / odr;
 	*val2 = div_u64((KILO % odr) * MICRO, odr);
-- 
2.53.0

