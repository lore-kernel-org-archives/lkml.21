Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866963;
	b=o7Dl3gd9GNn2xvlHlR3Ts9xU7MEbKiSL4YQvwygcItObMQMW6RGhCdw+sVZ9eYaIu8J6
	 a5uPgl9JTYjs2d45dUdkEpGFp+auiiTpo4dbrFt2aBCuUJFTP2BqJpJdUs7WiP03K2InK
	 BLPKxbkgbwIcdCzwbRQ4rnX93YSE1YSZzko8nO89uqKrOvajF6ty2lHpwFFiUSOpiXU3P
	 5N9cni7H4+0GsSePNF3n/RW6Uz7HLC8gbhU1WA6mRwE38UkC+gF8SnHme7zYgUJKNBxUM
	 tGdBJuOFMS8DyoRrb7SYgys/VL1fGpD+TFODdCtYspht0l/wKSP8CNQHT63y4tmCkxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X1Hzhs8fYb1fQ1oUlgenfJRROOf7RMffeqTjveqBOaI=;
	b=DBWUZPDwjhb4fmH2weNGp0rMqbgfTAEgYB2GyGtrMLpIulKO+0z3MKinvcHACtqTTcke
	 ylBLmf+qLLzpKiWhuclrAvEUdrLhgDWgfP2ich/1ngQ5JHDhz9plbKUc8n/hSsPWgcml9
	 F3q928I5lb9iJaDdIiaTUjL2nhU3hjU1OI5rM5RFJXEzkqLjQ+1a9tGG5TGkKiX0jB777
	 n+dSPQLJCpBSJFD94MrA4QDCtDdirrIxLbUGthw7RaT5551dFZ2VGo70fV2q2f9yzKXOi
	 poJjmdgrhsbnXNbwFO23l5pnb5jzhHDGUbQ6qS4XztwlwA2CmUQCWgU15/G2vIledwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oy/klHni";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3524606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3524606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oy/klHni
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso7313306eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866962; x=1796471762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1Hzhs8fYb1fQ1oUlgenfJRROOf7RMffeqTjveqBOaI=;
        b=oy/klHnivdkIkK4JB9jm9eWj/LKK6kc7sZ3NPnjPizJux6HKVdh4vIUuL0qZZlSTY1
         abggi/U9ATsPi/1pHINh8jLMilecWtQP1Ip14CTJ5E+PoEqlpvB66yZA9ezpzFlYfn7C
         kN3s7H2ZKVLsyWcDrEjLWIpLPWxXUMW10v24ZZ5xkOFLzgbMWsYcZ5w5enQdt1kHrqIx
         sjWXkOHJmAxftvqOsSaraFP30Cq9a4H/ploNhKVO183VVtwxuq3+A4UKM8xO2c2sIkfY
         ALAdAOuYOAHGhpbJaQw/RZd5lPWNxJlV79cDpY/7+3Nn8wB6yprDAWJsxjkVE2cA0u0j
         jh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866962; x=1796471762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X1Hzhs8fYb1fQ1oUlgenfJRROOf7RMffeqTjveqBOaI=;
        b=JFM5F1XTO5HAJO4FL2lxWqMSFNfjOWB4oHG3QYUbaN3C8q1aDGDImiSYGFxjLag+zR
         eJ3gipm4dEG4wrQSWoAi7q4bCtM/efpsc+iv0Fle4/AKA7QUnO4kqNYMQ5KS8wND7LKP
         rqXj2pIJoap4PqPh3ezSjEG3Y9wnJldAHLNDt8YhIjpXU0j2vMnpc0f+DXXq6Xk0+ODa
         3+gmap9+bC6tCCibMwBThSAbU1l+Ldk4x2JB9OlwGnkkprA03H4xR5e5ddzSotc56fig
         9Vf6MWoruroXujNxelJZukKn4q/92HPAh9cm57QDleHs99F63ztKUclzU2b+eI1vEzPc
         0ytA==
X-Forwarded-Encrypted: i=1; AL+hErHk2WAEV4v9ca6ECDk/eZKeL/CMJkqoKjNNkEG6uuEmofgYPZCVQD4b3drpBJ4bk5krWOg1bir3W5LsP3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hyTNC9pGNb0FbgN9WM1nqVAPzUrKI6KA5RDCKXQjuRUV52KVi
	StQZwoWWLkpMf/GUIHxFPj1g9fsDCAkjhDWTPKEuTplGfKAh4naqAapC
X-Gm-Gg: AZFdTZdjcu53l8qiQzbjRePY7xlc62cCHyf89AyLPptvvKhbxCilqDLag6jEhVs943x
	3GRE1QnfCoToQ6vPFQqgsildcl+fo6BxGTSLqJhwwNG637E4hxtvnkm/oQDWWuWPezEpppJlv8f
	tSTJUY0a5WKlQ6o1VXtzzCry7wjUTxuV9gK6JPw7GCixwcyL/v0qc3Ed/L8Jo2DqG542PQ1Ncbt
	3fHCG3TCBTQDLojhdgbEu7yrXwM3Uh4ZOoCXGckBox4ts3Hl3rJmU6N4B7dh2xTqP3DZjyTJkVH
	R7Yfl1g/F21s8Y0Aw+6Zqv1Urmkx9uvHAYJDulYmNO6ERCMblfctqc3iV0XpJ/LoVNx9/ePwGng
	m7/BpbArq3rS4kNHuOrQlwLf41hKSTIvP9NdGJDYpwBMksSuqUC5yCQu0Am7zIPUrHWOEMhNyb4
	HzB8biNR4vNT3mKEQwLf7kfL0RUjBLvCl6HGT27aKl/MMXy2V7Bz4PdgRaTvZ59K/R7FaD3+1Ac
	1YqzQXyEDgZ7cbLTtA2SYqOfMaaou67u2qbzBeBQPHiXdyQvsjI+zan72DMyWvhQX1Rrdh1IVJ0
	txGcLQwOKpOloBx8Q4cdtiUSG4kK4/419oTWFln1OFWmOCDJzRpnqDqFx11mRYIutWiRp4xafzo
	h860Q/JGQH5qbwXrd+MZvZlvaBlZmeTz9vKcNvojSxBCOOy0jOHHzpwfy3x7GMk4n1YC2eXXja1
	tgZnV3AIsaW8v2ctN3DKFK3w3q2IWjycRAJSB4AnQs4w==
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr17117493eec.21.1795866961878;
        Sat, 28 Nov 2026 03:56:01 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm76783178eec.13.2026.11.28.03.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:56:01 -0800 (PST)
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
Subject: [PATCH v3 3/6] iio: proximity: sx9324: reject negative hysteresis values
Date: Sat, 28 Nov 2026 17:24:51 +0530
Message-ID: <20261128115534.558478-4-kapoorarnav43@gmail.com>
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
index 3f2f15d237e9..ef217f055472 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -646,9 +646,14 @@ static int sx9324_write_thresh(struct sx_common_data *data,
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

