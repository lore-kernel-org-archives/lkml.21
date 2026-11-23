Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452807;
	b=WST28pRuIZTr5wq5sBCwTS4lc9EfB7l0UPEMgbhyQ2u3sQbrd4/3TiZB2hVQ0rXCOvMr
	 mO9HaFs9vxxAJmOlOO2WZw/JpFpIoWRM1CxaufkmnuqR7FXkV8Yq871BQOzF+2sKBFAdD
	 Sf/jOkXYdkVpAI6fqMEBzkSfWOrzcPE17vYA67gr4LqrNh88fQSEZV/3a1J0XKWFyst9d
	 LBXTBU0lLrr0jW18byMCh4DTsZgwTiWtWysL2Wg4HWeY/6rg5IX4Ed854swWGhA/gxuWq
	 +qmDZk90XexIXSmIoHbqWb4RBiPcuFK/wQgVYCKhU9IxeLfi/qeQ0UP8S3ptfRMxhnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0hMDwGIZ1CmuXEKexNJFNnVKPQDIFLNJNbZG3fq5Pmg=;
	b=WT6uQdD6QAsEHUYMtITEGN3FMdCFJQLeSmAFU+S8T9iCRT6NAvSjyPKSPeg/6T6UKetw
	 yClMXdPi11eDiEfMXTzIKE+XUlaMlKQQ+13tKOKzZGHiCL0Yn0mFC0XztvBGYIc+mMKEV
	 KeL7FII6eNYXYcqOB7zvkKFNbuBeXEJkdbpNFf3k8RMWnwj/0xBNwkuKqoSi/wHHIOzcJ
	 oNoVwqdNaaVjsS63hc+r+qwqcceXoWDVVBmobUk104JyGDjesIMYuTA3iXP5Ynp9foBSJ
	 Ex9jeyDp7pnV+qfmZqY3MQ9qLAH9Lpyc8EXBKwTBKMgCSb8+tw/lW6uEO3WOcCUYX5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAgI6mQ4;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BC3606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38BC3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAgI6mQ4
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38431138772so4522945eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452806; x=1796057606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hMDwGIZ1CmuXEKexNJFNnVKPQDIFLNJNbZG3fq5Pmg=;
        b=QAgI6mQ47O9O0YdUtk9FS9leGpox/ZYcHHkWibAZkpfGQqG1sSwiOMdvLdbbLdQcZP
         DViA1VkUEfG1Y/imndnV/yi5HD3WdhDB8a7yVsvX2tZgxK94FgWjdHerZrJvmgWflGfk
         adyh8wjnKg3JF+LjWlv3ttE2KPHzqgNwnqx4a4xOGan9xaHRvyiTUpJ8p2Dmqd8DOQL+
         PrZg15j8FhrVa3aoOtWE3xNsSTZ2YsKN6g9cOlGNExVNB2efejhEXAHFpzQaDLQ3cbHU
         s5nJZU2fV5nMtYIHQdXoqYV6YCOWfM00NgoJE0hd6xjNZo8tKazHUq52qWYhWakfarNv
         JiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452806; x=1796057606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0hMDwGIZ1CmuXEKexNJFNnVKPQDIFLNJNbZG3fq5Pmg=;
        b=UAoLVc3Ngm/3DCuypOdqnk9CnNjNKJ2Q9Xww1IqTvCkcg8ExbJQCxLblDGK50VibqR
         GB+Q0UK6Z3ekLvTx2Tljfpofa3JBZot0cgSDJ52Dqqbxgme4ICkunnXo8UJEguyudd6P
         kAdM3QonS6A7ZbqizYUKffwJBFoMePD15dWPe5jXNUki72GjCs210FWBlFA83J8J0dg4
         cqPNk2Ino9U/fMcB1baSPKSu7HszxTv3UX9CVTZnzSlfs2YMwO/V139759VK3R/famf3
         k6b8jD68uDKeRDvbs7hKFB7ATY1rEP6tYFWSfvbGjRq27A7kChrhxHi7J5FmSvv8IITZ
         Nu+w==
X-Forwarded-Encrypted: i=1; AL+hErGNwJIo4zQA6qTPX36RJfCnO8FbJvFYVNhaG5M9U8aBSOxkm7NTEMk3Kqtgyr/BvQZVlvd6ShEv+wpxl5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5F16Hlczgs18aTTKcTFIaY2kXonaC7Fm8fRGCb0bgbMBBTPNu
	79yJubj+Zgp1IurJEBBlBD2qbenIPKTL4jqALj2UUVaora35coA+FTim
X-Gm-Gg: AZFdTZe/F1GMUA5WEEdXs9/9hyO90rANqvKL0gT4X2KPg7njy6bQEEryGSOzjZ8tqMW
	vy+H7sYVT5E7lYE9wkC501vmGnc8YGxqxyTe710lS0GrhsUGfiWt12tShBu6X3BzJRSQUL9UV3A
	DrrsBAw9E1j53xiQ0UJnkj4fP0hOO84CxuDoEo8e5ARB6e1VWE96b0DTuv0KVjF7h+rLMRR2Gfu
	kMUzvrA+1eP/01vkZcPHUbB33e5ff1QbX7Va5wIGAp8Weu/NErgbJFnDBRQ0gk7ArDAzxRDEkba
	C6pkeX+mtCK4oe7vcZGcHUIYoxRCTaUWm5zOjayV2p92Qc1/pGH1k0/bf2/qOr9dMgLfqpg5uTv
	QpPckDdTspXC4RYk9NJGutuFV40aYx0acrAt/q3CQmrqzptKuxRDHnht082qD0wFJ0JF8/MRJNm
	xI/Jtu9Gk+2kOWZ8QcJAtaei8P2gjb6jDzRsXxDxDhcqaM3uVla+tM1PLpUwgAsdtK3BhCwl1TK
	7EX6n75TS3Ywr/C1XMvCC9qvGtOjXg0JPRNTmRHkgWR6qV5V6FFyQUpwRLf1HTbfHcCYuAQtR7I
	JbeqMmkR7dNSQ4ld7AJTc4Oq/BmnaEUZt7T6RvyJ1f7amb0ouriQ6MzBAxfELFdSbkceRGBuhWy
	rLzHbQJgtmoZv6FJuKofJfBS/K3hzrjY4YieWCF1U8+9SRzEPJwrPwze2w5BMDu7GIqbvsvavC/
	jWqtPBz+JBH9HhRcLA3qbDB6fQrQQmpTKsXVhlm+4tew==
X-Received: by 2002:a05:7300:1c95:b0:385:8851:fa4a with SMTP id 5a478bee46e88-385885211c2mr12324049eec.6.1795452806183;
        Mon, 23 Nov 2026 08:53:26 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47196668eec.5.2026.11.23.08.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:53:25 -0800 (PST)
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
Subject: [PATCH 5/5] iio: proximity: hx9023s: reject out-of-range debounce values
Date: Mon, 23 Nov 2026 22:22:51 +0530
Message-ID: <20261123165255.239490-6-kapoorarnav43@gmail.com>
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

The near and far debounce counts are 4-bit fields.
hx9023s_write_far_debounce() and hx9023s_write_near_debounce() pass the
value through FIELD_GET(), which only masks it here because the field
starts at bit 0, so an out-of-range value is silently written as a
different one: 16 becomes 0 (no debounce) and -1 becomes 15.

Return -EINVAL for values outside 0..15, and use FIELD_PREP(), which is
the right helper for building a register value.

Fixes: 60df548277b7 ("iio: proximity: Add driver support for TYHX's HX9023S capacitive proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/hx9023s.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index 1545b4ed2ead..906fd4baa468 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -359,18 +359,24 @@ static int hx9023s_ch_cfg(struct hx9023s_data *data)
 
 static int hx9023s_write_far_debounce(struct hx9023s_data *data, int val)
 {
+	if (val < 0 || val > FIELD_MAX(HX9023S_PROX_DEBOUNCE_MASK))
+		return -EINVAL;
+
 	guard(mutex)(&data->mutex);
 	return regmap_update_bits(data->regmap, HX9023S_PROX_INT_LOW_CFG,
 				HX9023S_PROX_DEBOUNCE_MASK,
-				FIELD_GET(HX9023S_PROX_DEBOUNCE_MASK, val));
+				FIELD_PREP(HX9023S_PROX_DEBOUNCE_MASK, val));
 }
 
 static int hx9023s_write_near_debounce(struct hx9023s_data *data, int val)
 {
+	if (val < 0 || val > FIELD_MAX(HX9023S_PROX_DEBOUNCE_MASK))
+		return -EINVAL;
+
 	guard(mutex)(&data->mutex);
 	return regmap_update_bits(data->regmap, HX9023S_PROX_INT_HIGH_CFG,
 				HX9023S_PROX_DEBOUNCE_MASK,
-				FIELD_GET(HX9023S_PROX_DEBOUNCE_MASK, val));
+				FIELD_PREP(HX9023S_PROX_DEBOUNCE_MASK, val));
 }
 
 static int hx9023s_read_far_debounce(struct hx9023s_data *data, int *val)
-- 
2.53.0

