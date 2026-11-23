Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456071;
	b=YMne/pk0BRRkBbYzHLZI7X+ZE71JvfDBPLvp2DLa2xVegrntl20sZhXWy14m0B/zM81l
	 JpxCP1au3sKQXn/BnfuVVufvvDgg4/NWNU/pmHB3aeTwIe6pkEtIHV4NihEO8+Hbe+CVx
	 NkCuUeETgw/o+UP6cExxzM6VYOrEp8KFZBn+dy/BigLIV1B7g/TaJTOCX9hqju+O5dL+b
	 9cyh/EywXDhf2sFJhS4MA5PEv6vXdhLYEovDCV4zXeESxkZw66EU+Dc9iNburOULZhCmQ
	 B7ZYwDJQFl6JvnGyvoL9IVm3htC0qwH7mZgzPrkQpUxXS+o6mCnqbbrfZmms4yaR2Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EyFKKviFKEdPA1/mTIAZMpdo9jg03KTsm1zg5y/5lIo=;
	b=UJeVoKIZDA5P3BDK/RZg98MiPOF0t+tosEEWUxuwz+xz6ZOyiAhqKiCXtKp12AiHJVV6
	 r2wDHqaTV10Uygw4zYFzE/iEbhRm/Qlu7vguqc8dNVTyXeMw2DzKgaAo7lYEyCbqot8PI
	 ccBf7ibr/Um/ViwkHNhSVS1myTYGYLVmy2/Lkxad/HCzLeNSmwKCurMdWqcZjWt9ML4+H
	 3Rg3pX9yTZ68lAGufbZUiosTIOhNQ7gCHgS2Q/16d0RBYT7tt6Nt/bVBaHi/uAXul24Ut
	 vurbwyEtXk5jRJAj36g9SYbXxiqTG49UE2ozk+8EEbjC5JWZqS7Qjv6/ho5OFGiJF1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="k/THwyR0";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DDC606A680
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53DDC606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k/THwyR0
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1958613f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795456070; x=1796060870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyFKKviFKEdPA1/mTIAZMpdo9jg03KTsm1zg5y/5lIo=;
        b=k/THwyR0d/kYN8jVRNojARRFxxxiAO0kuqrAtLFFTSpwtPjuxlq/wBQyJQa31ZNuLT
         H6E69lTaU/KOobsWmEdX7ZgUyo+oCDtHwBBcSk0wwThIN1JbRTc9F2LuNBFTst+Fvh5T
         uK4lCNe1leRBVxygJGRawJOHy76JfYj+mXsbmy7lH+tszWJBwKxaTtYPxtHqYSc7mz7Y
         her70CVbo6pYPt9s8sB5UIJPE2UJ6sXRO1W6oDfwnF28e4PAHBlYI+0jPNfCmXhbj95o
         4TXIjElcCAOMoFZBRJeGqdKyWR9NYGgO/7DNxmyaLmOHp9CPrbgzoW4ptKTl47qz4dnu
         +q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456070; x=1796060870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyFKKviFKEdPA1/mTIAZMpdo9jg03KTsm1zg5y/5lIo=;
        b=xWWOsqz5wAE7od0wnATzvBlUPx/0FSfPyUEr7NWA1VfYktwk3xFLs1+/FV99Z7sI2s
         Al+Dp8DeFcUanRRtqF1kdhaqh4/aokpsPCnD4e+6HcBuTCoY+Dq/mX/VA1LCQOodkvYF
         QTKI9NXNFd9/xMsvoABeo3L9SHDd9IqPF5YzeJ1U7uNxyLZLmywcc7g3dk2/aWSJQoS7
         /T30bmZ/c4b8lAajOH8leW44deSORVCYoNH7gJ9y8ltuECUZKXuX+hVBTHwpWW0pkPCA
         yByU3DZhWGj0a/7oEXmzUHS0Y2uvWGSmJx83ZwHMtLOZhufJVEBj8fS2T+t4uxAN6RRL
         f7mg==
X-Forwarded-Encrypted: i=1; AL+hErGN8by7LvdQMcC4nbcxT+5LwqNNTmyifCZplxFt/rzskiY552XzcyumLwvMwTVjRltVzSegM52BnjDYxY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wojxE/Pv+Ho+O93rWRSoSuQ6wIwurn3SZBCO3SNl817b1CFdq
	YoIbARrCJd2ad2bQCOj3kqjc5Q1vzRkc3FtltLRWjO/mPZL45DShc/aOOHDlImE69zI=
X-Gm-Gg: AZFdTZcSuY9uUQuiqIjPh+DT1XjwOaMQreUxIcgPXf7gCK0MbTsOPgz30Pso7rMnhvf
	NCx7ex33EXTLPxQO4T5M2hLHKIV18yfIRr8VacdsAyhJp8SYXQj05CTv7hEyrnNlrML5x3mDKkP
	9rgdGzpR57ofUjm3vyYCjdqS1N0kTwXPeWHi0SK9Bp/lFLQRaScIq8mi5xPtn+2vYqSOAod4VVN
	PpYEHgz2j/R0euex3rfmTgFjLLJ0CHvH1sSciKhVHuuDiqX9Ei76OaHtjF5UEH663q9zQ6fY6RU
	GmLXf753FvQvUFTgqvMZd7Xv4AGDz3Kxvww5w/ZmdzB8xHzkLVoUFSGSfK6YpBV5bkudUt8pRFI
	CAnIPPfa91x/jNNiXo0WUdKq0QFwkNydXubKYW6KA1rFJnd2CA1pyjpHwrsVY7m5HFShoBY74+J
	WXQtS66Li1csDc/NwJ9aPxlD2JCfyNV0+yw14ljWj+nL6erPZrBIkbK4Kf0UT2fz6vlGtywIXzv
	J8Vi8jdzPdu4g98siQNAIDjNhk4+k5vBt1wh/7af9Y5DOkNs4swJMhC77FzGBfRSeT07Ay42+7l
	KhRI13iHfp6TQRjtTRfDeyvHh22LMlIR+iGkZLseOYDP5mxG0Jg=
X-Received: by 2002:a05:6000:3107:b0:4aa:1ae2:ff2a with SMTP id ffacd0b85a97d-4abaa977260mr29586809f8f.2.1795456069512;
        Mon, 23 Nov 2026 09:47:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm22961413f8f.47.2026.11.23.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:47:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 23 Nov 2026 18:47:45 +0100
Subject: [PATCH v7 2/3] unaligned: introduce be56 unaligned accessors
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-topic-sm8x50-iio-max34417-adc-v7-2-d8f87edc5086@linaro.org>
References: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
In-Reply-To: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com, 
 Marius Cristea <marius.cristea@microchip.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=VWjXeVXU6bySoahX+1zByOy26x+PcpghUtYIOiReO0U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBHxCKVwROIzlOFhKTAItsb1EQoCQGdgdGttWwo7O
 zvU7RAyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawR8QgAKCRB33NvayMhJ0TgBD/
 9KycuSjLlv5KmEbce9bO/wNf3KxVrhyzQMrEvhwhrAeChz7eZIdwsSnM4NB5Yj/fz9rzLKHrvVv7iw
 vEgi9gfVPy1CYJu4BLo8jOXJydH25WI043z2LmHlNEnVIUMVQ/lHHcX/3Vbd5lOMZZ80l9w+tJLCs6
 ofmMsIZFDjuvnQo//6TpUvIM6whhxfeJ+ZAUJOj/7cmLog/3yArX6nVrLpB9xvfS2WalcYRGKTQYap
 MvyLZRRaEtLulm41Eu0hmnnpodRhNVbnqj+w9FX+zamfmm3BdRwmJKmA+P6PfqBq/3LN1ACMXYKrqE
 ec7C7KNgcAaUqI1Lgm16fRfWMkk71iZrxa+IHTDA/k48EPZnhRDaMwk/G94lZPdoXiI/VrkgRsHNpl
 4EKIRgLE8KrQqTdQs4I+Rhmoscc2Szqa0yKXmhwfcoDlMK0KPjIdZUyOeWMKh0CHkgD3zvuH0y1Qjb
 zkLpStVbaGi/pO7bsn2ho85Zh4SZjNAKcpcwMfoj/H144pYK894GerchgtM94ofUQv16c+CoRymS8A
 rxZPpKSpnoqjTqZJ6Vn9ykZ3TlQoj18AUf2B3YH/zSxKc83R1cXlA3BcyxOKYXz8e+x+mNhHWolvyw
 EG3/GU94NxwO4M+vYDwoew10lthgjICcFnCrnlqlOQ0RjyVmnjpR+/ULT4+g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Marius Cristea <marius.cristea@microchip.com>

The MAX34417, IIO driver, is using some unaligned 56-bit registers.
Provide some helper accessors in preparation for the new driver.

Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
[narmstrong: update commit message and move to include/linux/unaligned.h]
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/linux/unaligned.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/unaligned.h b/include/linux/unaligned.h
index 18c4b0c00e2a..d7937088b2af 100644
--- a/include/linux/unaligned.h
+++ b/include/linux/unaligned.h
@@ -142,4 +142,31 @@ static inline u64 get_unaligned_be48(const void *p)
 	return __get_unaligned_be48(p);
 }
 
+static inline void __put_unaligned_be56(const u64 val, u8 *p)
+{
+	*p++ = (val >> 48) & 0xff;
+	*p++ = (val >> 40) & 0xff;
+	*p++ = (val >> 32) & 0xff;
+	*p++ = (val >> 24) & 0xff;
+	*p++ = (val >> 16) & 0xff;
+	*p++ = (val >> 8) & 0xff;
+	*p++ = val & 0xff;
+}
+
+static inline void put_unaligned_be56(const u64 val, void *p)
+{
+	__put_unaligned_be56(val, p);
+}
+
+static inline u64 __get_unaligned_be56(const u8 *p)
+{
+	return (u64)p[0] << 48 | (u64)p[1] << 40 | (u64)p[2] << 32 |
+		(u64)p[3] << 24 | p[4] << 16 | p[5] << 8 | p[6];
+}
+
+static inline u64 get_unaligned_be56(const void *p)
+{
+	return __get_unaligned_be56(p);
+}
+
 #endif /* __LINUX_UNALIGNED_H */

-- 
2.34.1

