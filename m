Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866979;
	b=L/Ye1fOKhDtiJ4b01RfzKozCJTSvFsi4wHP8zcwzUZl94LCl+xSgO47Hj9LCVXl1bQ8b
	 a5kISWvLqdlcg+xlI6Ml/jJMzHh39FcCe6ZMBb5hRW9C0P0b93CZIHGZlYH1dloeXkJg3
	 d//T+sTMSwpcBNLnvQBQ66NA6ImYgB/8CGo/r1En0eNIfBlANXaGztHEfdhwM3MJYpsO2
	 kueaKj83psyFXLup+VfT3nMPZOL0S1FQt7auasqCxqHHSTJ43sop47awSLKojsXCgdJZl
	 z/tw+FzLnL2LZufngZoteFr8cAg/RCn5d0fGM0MIlKoeb9R2+hMUjU/9UnwNMYXJuAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IKfrKBdHp1p/3dKcSiRvczq1zRYGfEHZWOwCgXIb+40=;
	b=WRFg/DLtFpGlPCUrvYwLUuTW2WQArRfvgYXK0aYpyjvHy8ZSgAuHXqCb8VAkgKHrknai
	 IMgrZQ6Q6Yp7dtsY8F//UiwIe9zj+2suOLsJAUmwvS0E14nYiuD4Kr7+K8l1NjF1I/AN4
	 M045TfkBGUcbXFCPoVB8txBjewezrBEmSR59URd8eT5W37QsWNtMmsWW2dd67U6xSm35L
	 Iag6DPu8NF7K2MjQSz1gNAfdjC6vcjF0Dcu3N8j68IXntZbbrBt7iMbGa18TcaBU/gpwZ
	 cwlF5IHxBp6Z8iDOA4EmNyjB1vo1GfjBufW4bJ02SVAQImMbTH+fMVCjhX2bpTnFqKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e4ZvGN+v;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3040A606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3040A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e4ZvGN+v
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38190551625so16962478eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866978; x=1796471778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IKfrKBdHp1p/3dKcSiRvczq1zRYGfEHZWOwCgXIb+40=;
        b=e4ZvGN+vto5zXBUNPA6YbVWLUF/1ivFDEsyf9G8oshmjO5VjoW56dNfcyUFBP1DrwH
         BTQRsLhr5kkPKTCUOUYEUEURmuKMICwSmt/2dsCD1K7mGfOTxgVRJ0sSOuTauyxrb6kw
         JGn931WeC5W8+OtDZvSVqlBlQXGg5VAWwHdK2i8Z8vV5vwwTcsxtAio0snR2gprMgaE1
         2a5TgTTpbSdSJDnD0RKzRDSATmPpDvFvJTNK+2oY4khqGkMCeD1CYYeH3cmhLTpgwSU4
         Ia0p0bxaiZNcFJj3M1L2rTjjnn0vjBGmQ8W8yoE8g0G5mDV673WQ17/D4En7Z9QyR0/p
         plvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866978; x=1796471778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IKfrKBdHp1p/3dKcSiRvczq1zRYGfEHZWOwCgXIb+40=;
        b=jrkzFwBrxCpio+LAB9QKtK5TkYrpBe/QLFMGkyQ8S36LDigNUEJHqVN4GT3mmlCuZu
         lSsozX2SWw1ZsTgGoDvPSsKRDwjmMekYAbqGixxDwPtEbp5zgRDYknV+ZB3sDhjo8nfr
         HJHyGcnrDBYL9EOTFqCCfzyWsO0KSC88VGjJxiQZbjmKi7YTjjJ2ZVTJZWJR5ZkZpu8b
         idqw4gLwfYwfZ8s5bf6Rj/SFolQy8zhw4HD2bnE/vKWJ3O1eHMZsxT6u5Yzx5U75rox2
         byBKHnc+5Qz1+xYPJLX/40syBsO27upqXFeF0WdXML0JKvZ63u9INNPZ57J3SOF11kT4
         cwJQ==
X-Forwarded-Encrypted: i=1; AL+hErHfB4eYjABoX4yF5Ay8i8Y9IBfhdssuTPJ/GSj2V2OqhlH7n91VEQF0nysnbSOzJV0KXzUFloNpctTDJ88=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I5TZzz0Qmr1WuLxwUTD3eX+cM8disBQdYjFtYbNCOYotr84F2
	HthMR0ZXvw5vx5bQRNBi7gQRZGoeQnXIrJz3/wtN7Rxddi3mvC4wZIgW
X-Gm-Gg: AZFdTZczMF9JPYL1Ew+JheoqM6RmjHWLZEKmglj19aq9N6QysseyHkP66tBQkmw0p31
	G7Hj5LpgsVYtnaGqxk4EENdCo85bb3kDZYdA67ZiWivMZn5bl/4fggUK0LUosGtjZVlJCgqoEDW
	RRJ8XsbLWw9VIzr6LCcuMisnxKUfqLUVX5CTDbkjbDtUAdzcuRwHK+loxfQ2BKYou6CzlXKdBaH
	qSFxO8aSpq/+UNCNm0KeB2TvSM5Pj/uNjEtICKzr76w30TZLHCL2squCPnQdlViZRov0yu/kabT
	/HWonVuIk6gq5LFgyPwA2AzK6W40jkOroK/4e4oHlWwGF04uK+EkG27dRcS0n9DYS2Xw6UY5+mM
	r4ASxssORW+uztEeWPOqeCLbi3FbDnbiQys7wTR9ciDKbXeoz7bLneXm70my0dp6Xws4U+hiKmC
	cXLMCLZHkNuBaTKp+TiOWtVR4i+RRwjUVXIYxzgzL/mK513npatEQtld44Yz/CmfgLic8AdDsfi
	roFAnqutjPPSVHKntiKAbABgtpsXpk0MTTwf2+yj0WiMQnFpbqxrbwCylHKt9qwTvPO7Iciqc4S
	QUMuCFXa4Wz4C4KwMGbRdFC0NIzON/kusrFvLyJ25N6fReE5hX986BKIrE3l25h5JFVMdWUBm93
	v+4RqSHMRNz6Q5Vj+IO8kgJcFhP8aSQf5A3AGUsSEJzZ8Ja0YXJm8n9wJCUi7aztMGBQ5dyS75+
	dhDbgvgRsnQuJAYK4m745kc5uaGW6PoXYNkkUiHDrkag==
X-Received: by 2002:a05:693c:69c7:b0:386:b745:ac60 with SMTP id 5a478bee46e88-386b745b019mr15169711eec.18.1795866978349;
        Sat, 28 Nov 2026 03:56:18 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm76783178eec.13.2026.11.28.03.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:56:17 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 6/6] iio: proximity: sx9360: reject negative hysteresis values
Date: Sat, 28 Nov 2026 17:24:54 +0530
Message-ID: <20261128115534.558478-7-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128115534.558478-1-kapoorarnav43@gmail.com>
References: <20261128115534.558478-1-kapoorarnav43@gmail.com>
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

sx9360_write_hysteresis() copies the value into an unsigned int before
comparing it with the threshold, so a negative value becomes a large
one, passes the "val >= pthresh >> 2" check and sets the largest
hysteresis instead of being rejected. The comparison is done in
unsigned int, so this happens on both 32-bit and 64-bit architectures.

Return -EINVAL for negative values, before converting them.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 2d1525547ce9..b03149344e69 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -545,9 +545,14 @@ static int sx9360_write_thresh(struct sx_common_data *data, int _val)
 
 static int sx9360_write_hysteresis(struct sx_common_data *data, int _val)
 {
-	unsigned int hyst, val = _val;
+	unsigned int hyst, val;
 	int ret, pthresh;
 
+	if (_val < 0)
+		return -EINVAL;
+
+	val = _val;
+
 	ret = sx9360_read_thresh(data, &pthresh);
 	if (ret < 0)
 		return ret;
-- 
2.53.0

