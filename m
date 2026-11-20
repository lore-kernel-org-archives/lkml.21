Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164271;
	b=1bNC5nBZqXvp1USdrCBgZFgcBEc4ajcT+dK/vKjMm0ts8UWI2YzdL0AbcyE43HOBQqGK
	 7uWeTrSvPhui05aFsla4wYCRGewVwSd7VH8F/hOgMP3wNJ+mYSU1TbjgM4pM8smXGfRoE
	 awFo4tLiJsl1bwZpXpLLLkbYlYlCWdNMxdobntX2K3PGYK7m1f5BI1fA6vU+k9JTU/QAI
	 8NfGgrE0BUXZEcpIv1dkmdLEg9dLixxoJ5etZCH63ZuvPed+Z8jxDnBvOzYhn+ZAjpfov
	 q0+aJoCUzmOBS3SRbC7ncb/EqXiCPqkeYBjVWHILoJt6SKu8dMoHS8lQnKoNUAqQyOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+/fIbMmoDeQ4OJN2SfBB7j/uvxdVc+I0eSEPXeYB26w=;
	b=efNbAvwF5DaO0RjI9yV0T8RQqi1sfna1MJfZk1S+XbCqcG1ToKxy7TuemhjLuvIJs9Q4
	 kvo0yQhfCc8lj3cAFx/+R62nin05txhxRUA6mx88bvVFnUJ9N00Hoq7y7fWMVWP4Fk8eh
	 afCiauk5zr52sp1zal9YbMZOF81jldxMndkb0+4/Rn1ISKOvPd/aaTrbgBG3LWH7udqGL
	 l30PiJw79QJ4hQlZ06QAFq+c0iEtz2eZB1Wvm6XXOTwAHg3Ob+vMH+dbAXCQjPoTtwAk6
	 Ql7xv3iqrSNRvyxaWL3K6HsTAfd5G2qiHQcMoUZ0RSYCn4IPa3VRbU9vis6sHjGbzNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkbU5zsx;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0D9606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0D9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkbU5zsx
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3b4944abeso571269c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164271; x=1795769071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/fIbMmoDeQ4OJN2SfBB7j/uvxdVc+I0eSEPXeYB26w=;
        b=hkbU5zsxy9xVcanTrGwWiC1MtJOYnpECyoOjtZ75LVuPDrJQpvsnpVZf+vmLX3e2li
         Uatk+1kwYAh7gu4oe4TOUHuOZo2Vz298RLYm8xVboKVHbAcOPTEEUkN5L877PfY1izWF
         1zLHRp5vNDbTca7V7adiRs7c+79Dhkn2NiZ6zTFCS3phsMLmvwQfc3XqTidzE9CqkUpo
         KNd/urq/brBqqldQYYpP60n4lI5oATEIs/xZwzSn3YHlgCTPzNocjteoBPorVOGrY3r5
         SaJS+tjI5iBvtf7hl5L2eU80X42UqorpfZQjZcv8boCRDzePbPPlsHb15YDkKbYJwErF
         h+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164271; x=1795769071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/fIbMmoDeQ4OJN2SfBB7j/uvxdVc+I0eSEPXeYB26w=;
        b=JoC6GZuwIv90LEaCYHPKuHNBjOl5fkWB/Zc+WWjM9fyecr0prsm0V0XfLwDv8MOAZC
         NNkI7Kic255lgLMDUNJPRrEa3m1P81e8nCgxyqfD2cf9D4zflY1u1Y840WO4XektjCA2
         QVzDmardiqFpsq5QpspinSJlUe0u6b5QNOXrtpyL31VtWtk53I5h4rkA7b6IgXtV90Uh
         t1mNLbLlnL6MHjDU66/XvKI65VrZVtjhYqyOKnd+tXaWWx7o5KKw9os9D1WgKp8Im+CN
         EZL0XvVhh174iRDtqdTcZ5nmU22MmiZ4ryN7tkIOIgqOKZOYqxffivdjcKSpAU+2cM5s
         w+uQ==
X-Forwarded-Encrypted: i=1; AL+hErEo0+MbgZGWuUWimPi3G7CnrLSCH9xmV6oOr23gDF9mWJyKFwgT/F+8xfkqSxL0x3KCUqreM9jWLrIp5WQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BXy5GoqA6+DGmXIAHpy4dJhFd97qX2Xb5OH9ZbcDDtNNY8459
	5ASt7ym6GF7YWWzSDixp5Yqgg9oOfhef6Kjze+lu73rZGZ6zGH+pt+gz
X-Gm-Gg: AYBFou0c4DbbmMy82xqcp91lUWW1ceuaf7Fv6bbgD36gi+FSPlzgtAxslLjOghZzCmf
	wZO8OIw7ZfNcTd1GDjMXQgGzjon8mvXN9fG3/a6iH+eJaleqPLCTrH+Gmdcx57IVVmtq5mWkInN
	vVqX45asJWXqswyCVDu8LjLccn7lqH0CAE9aTxzOVw4CM0tAD/6DNBJludoC+JdmFgse54nbfFq
	4zfIdI9r9tBn6JH8ZQajbiA/ojvr5F1Wq/3rzwnLzj3rEZMfhvzRU5wi1qon+vlS922VWrNE/1s
	vOnZTLEt/z5h2A+LnewdkH/8dxwQMIptLQ4RccR4ggGtGObL+/pcLWOv4qpZdpl8bHP1DqbcQHG
	c8/4wQZ/ABOZkbdrlNWO48ZTVibi5fBJs/+N8Yxg2Y71mtmykACp6fp3Mn+B9FwfgNollGwDeWF
	2GM5WjS8CEKwKGdxoARzoFYMPk2qWr2HIZEY5kVJbd5hr3J8QFYDoZfgnjqbGf2/oqs+09FT6lX
	ggn9dZRgDFzxJdwOG+qH/b1452H+Qs8SsnEmrOBNdbRjs+klbzAhyj1ebW3jAbBXWgpK/dfAErF
	xLx0Geww7QKSBfzEdlqY1fhT8om84iyfldJkhvWZhN1xKjruDo6Csjji/4Q1otHNSBn06WTWJth
	lch/GGg5QbDBps38cYg==
X-Received: by 2002:a05:7022:e986:b0:1b5:58e:b544 with SMTP id a92af1059eb24-1b5568c524fmr2528962c88.18.1795164270862;
        Fri, 20 Nov 2026 00:44:30 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:30 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:44:04 -0800
Subject: [PATCH v3 13/18] HID: logitech-hidpp: use guard() for send_mutex
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-13-ba39242d4336@gmail.com>
References: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Manual mutex_lock() and mutex_unlock() calls force early loop exits to
break to a shared unlock path instead of returning directly. Convert
hidpp_send_message_sync() to use guard(mutex) so lock release is bound
to the function scope and busy-retry exits can return immediately.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 053cbfe8cb6f..49f21d7adebb 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -380,19 +380,17 @@ static int hidpp_send_message_sync(struct hidpp_device *hidpp,
 	int ret;
 	int max_retries = 3;
 
-	mutex_lock(&hidpp->send_mutex);
+	guard(mutex)(&hidpp->send_mutex);
 
 	do {
 		ret = __do_hidpp_send_message_sync(hidpp, message, response);
 		if (ret != -EBUSY)
-			break;
+			return ret;
 
 		dbg_hid("%s:got busy hidpp error, retrying\n", __func__);
 	} while (--max_retries);
 
-	mutex_unlock(&hidpp->send_mutex);
 	return ret;
-
 }
 
 /*

-- 
2.56.1.750.gf70dc682cf-goog

