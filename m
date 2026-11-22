Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333637;
	b=bSkyTpuU9LYQog5WZsp1LPdnFCQ+AA0d4l321Ze/by2feKRzHZoL95oFyIRuE78KGrql
	 VKJhXAs8xAN4NgPlqR8YJje+gYhzo2T6RpXivzIhFm84QpKyslu0y8iaB55UHfR8DOu63
	 bItX73Yx42kDf0csGveYFBybG+Zrb+Vu15NJX0bGE/VtGg3ZUWBQvoReqQgceNYrN8oSI
	 8ZvZH8MfFmgYwUX0cdkC+WvxioLETMJ7acJee5c9yvF+TW4uAhBxd0qEWJkY5b9K2LfJZ
	 J7nJSQlIFk0Rlybt7v+cwdp+87sDy8twe/s1QZxlFbcEDOqWVYfoLDKvOoKpl9PXltg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qh/0vpNrSDEiGO0ko4VAWXQlYcy1VNvUoAPW9UaESQA=;
	b=twKAVk+AxCbNNKUYjqtqbSon3x71wZHysM619PcBwoDRGISMQxuL2EXjiuwHtm2CS2pP
	 Vdn8BHCtoEx6csA9t1869uloqL7RKymt61piHhG5rNqW5PfJiRKxN/0TOT9+YHO10a6Tf
	 9SCBQLJ15JIjeAgnhJpb20mCgfDua43k4+8gb8nFVrRDc9MbGSNiqvw21+evbU8+4rTFo
	 G3HIS1PqiY5O/JZGZVqJ3iCfKd4qA0qCx8ZXo9F+klcWbSlzTg4F7xskZNcpkj/QP0IHV
	 wGNDVp0Xtot5GYKpcuQi6PnRL34p3KlXjGe/t6bgZcFTWFawPUuAtS0D8uKCJsCNXgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUO6YFsg;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C2A606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C2A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUO6YFsg
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5045141eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333636; x=1795938436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qh/0vpNrSDEiGO0ko4VAWXQlYcy1VNvUoAPW9UaESQA=;
        b=gUO6YFsgVInPkq+IHrqj6D1z9R1U216T4pEOCjMUgzcFOgY3gWsOIj+S018b/g31Ji
         IX0VUXdq8aihKF+5ijdIE22fdlPaJD7axF/ITBR3eOLm2mvwZyLC2b3zrcqtxh44c59p
         /aCvN6McHAKLu+mu9EmFLGUqOhOITihumX6JzytvBF80O5DrKU2NW4HG8DFlfDghuT8c
         k6Bvig6VSAKRxa+sRt6xEe2rqcTG/VtD/BN+TKLCTqmXGGLQueNp/YuY182F3dmfldJz
         qexMOav5RQoIuWJjCCO5RaAj+nMnDZptkpQG5cEyUCN2BHxcigbonbTxNT/eijq/iRbB
         SrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333636; x=1795938436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qh/0vpNrSDEiGO0ko4VAWXQlYcy1VNvUoAPW9UaESQA=;
        b=ftf/cDte+Pk3a/4RUvaUmjblYmOgxpfCxc+tNgVzobFhhc6dbjiRMRO9CBpoIlWvHL
         Mw90dbcoS3Fi7nMxsdokElT132NO3P3OotFnjjYzZPKkbT2A/BabxMsHbc80/r8W3DE1
         V5v6ahwADg5J3UIFtxFLLUngqTkFANkVrPmZ3nM1ccdpCFbc41S1gV7YlUckwY75rStK
         KryzNuzwSH/+S7qVeo6rAJOHE0i5uAmMJQbJ2bASS4ktS0RsQHz5cxRgrHtiUxx/qqbS
         eN56eyrcaaRzk6Ndi0FlPAPcNwwSHc/WlMdIYrFhr2EAX1yk1akAEQvhysOLCGgT/N3y
         Bc8w==
X-Forwarded-Encrypted: i=1; AL+hErGLtOKyjrhRwne5suPH2w4xxNXXBEjYfdqgfJQLH2Xr1OcHIF8NXdWya63IspBf5sEHNA41ECoDugrePwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z93WW/ghPUI35rhZWtJyXKfTsm4mktPICPljOFyPpbM3ZZ6R/k8
	GI7ZcrxbCfYLVFANARQ3qmiuIs93usJVr7MYelAyjDBUij3iykB+X/0P
X-Gm-Gg: AZFdTZdHeYwNoZge4hR9vc1r2jC3qwEthf7EHPb7zkKIWm3InIHyXJh4QvAoiVLL9p+
	pRmJIBgKtAh/6XjcfxnH96E/AiVFocmfEMLQvtBk/tSpKPKI9Yw/zfUVoBlqw5Ja3/SBOcNPYF3
	vEi7T6BVSgNBX85FmtJSMRSKYYE8d2AGBidDat13WKz9+BHbcVXZLfe7fENsytG5YFXIy7n6Gzs
	jgKcymxYvSRToQmQaQeZ5iBvlWg0XqbB48/0Q2UlclZsQHqIaVCac8Z53PuQam/jIq9WecNzosx
	nki8jjQ0h1S85xt5Rcp2CzzBwcujBH5SSTpIXMuDpODJQOimla0/bua/pQGlcnyGPpqve06l4vo
	US3lV22VsDJ7RUfVFqfYZauNZlkUhc5zO8IrsIEDCteJQK12H7DkKZeatZ7ybfTNZf476b6oFk4
	FxjGmN7mujnJob9B1g/5kJhTHokYYy6k9DwOo9zAiJg8jhWhG6/zUxX5csg2yiOCSjXNELrdXuY
	6Od2jEp/BfhKKiLeWRMjj2vIclutrdUFweRnaIFSf/bGhrknAirx6XVnPSb7FNBlRAIL7Mmqh36
	lO5prz6Xif6Iw6K2SjNltrGDFqnwyLSMIx54j3sKKRYVq2SaWYHedVaUBjTymOQgiK800LsJgwA
	ztthplwEDybCVuFNfGnnTSnUW0sBZQApz5zIzgpcgfLzDRem1C8z7vMGP26qL+pDQS2SDwYStsb
	rzirr5K1RD4QCY7Y6a26EtR65b0Fnmzv/2ty6F6Nmi9g==
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr4003911eec.19.1795333635762;
        Sat, 21 Nov 2026 23:47:15 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm24898071eec.9.2026.11.21.23.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:47:15 -0800 (PST)
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
Subject: [PATCH v2 3/6] iio: proximity: sx9324: reject negative hysteresis values
Date: Sun, 22 Nov 2026 13:16:43 +0530
Message-ID: <20261122074649.239441-4-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122074649.239441-1-kapoorarnav43@gmail.com>
References: <20261122074649.239441-1-kapoorarnav43@gmail.com>
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

sx9324_write_hysteresis() copies the value into an unsigned int before
comparing it with the threshold, so a negative value becomes a large
one, passes the "val >= pthresh >> 2" check and sets the largest
hysteresis instead of being rejected. The comparison is done in
unsigned int, so this happens on both 32-bit and 64-bit architectures.

Return -EINVAL for negative values, before converting them.

Fixes: 4c18a890dff8 ("iio:proximity:sx9324: Add SX9324 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9324.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index 57fe78089167..35f0cca5ede3 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -636,9 +636,14 @@ static int sx9324_write_thresh(struct sx_common_data *data,
 static int sx9324_write_hysteresis(struct sx_common_data *data,
 				   const struct iio_chan_spec *chan, int _val)
 {
-	unsigned int hyst, val = _val;
+	unsigned int hyst, val;
 	int ret, pthresh;
 
+	if (_val < 0)
+		return -EINVAL;
+
+	val = _val;
+
 	ret = sx9324_read_thresh(data, chan, &pthresh);
 	if (ret < 0)
 		return ret;
-- 
2.53.0

