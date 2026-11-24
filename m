Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514059;
	b=LJO5yf+Z65K+8Lq+/PMJKu1PdFyXGJfCP5X19Mx2oxc2FWfEAqeEyN5zLU86OnbLV39q
	 WeAaKh9nBCd5MUo/EhtQKyYSoOpdXsfMIU/JUxZKWu3wl9vjwzpcYCJViCyWOGzVMtqLj
	 awzKvXfmsPldz0U8riqYcB7FJAoFec4u2yEm4txYt/14E2aHzJZcs3XEOUkm61rHoDmK8
	 QtzuKsxzFmcmEAl6A8wsvtcyeR1Yu7seS9/DY47sUGiMTGPlLfrZMfZOzJrQsHcUpordI
	 7bCma4buWg69yYULc1UTt2d9OWJX4FpxbcFs3KF2G+seRkEkjAYH12kEk1hoUw9xiRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fJ3JKeUaCakN7r7cr85UYuo9cA76onoVrZv6mAvryU0=;
	b=JPPQW8Q10LM9LC0IJUVuNSsZ1YPJOOggEDmoSBjXXUhpFhOcuHRg2ceHfAzzq/DjnD4c
	 hCfP/JWO/0yDJCWVk9bfqB4koPO7V48QMwvirVjhAhf9u9reX6KP3sM5Q4EkL3G56xiPD
	 J76FZkr3R0JoImJh55wPXUrF4JOa66polNSPmL7Fi6vBVmU8jSx/lmNKoITnFCDDPjZxe
	 +z11J3Pr1wNtVwE/v3NFv/K2ERaNpe042kMq55/wSkxqFwru3ZPxn7nhiwAZv25itqwQE
	 JwJjiOn5BOUzyec6zbJ3HgHlyYjlHcoCAmY6Bd/FomZ44Klpd+QtCIpu2BAOzIow8mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYvLW7Et;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D118E606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D118E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYvLW7Et
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38699cf08dfso4678904eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514058; x=1796118858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJ3JKeUaCakN7r7cr85UYuo9cA76onoVrZv6mAvryU0=;
        b=GYvLW7EtY6bkCOR6NvKJ1Hf72uqK0d02l2YNbW2RfH6Dpj8iv+dwbosi7qpatZHZFs
         RPCZlSUNX8kvHUmXiIIcxnyBAlSIxpxLgapSdHmDyajkiBD3xZEdUuATKXoETl/B2Zkf
         GJuDRvL7107dSfetWrSKDsd1DaT5TJC5E/ylpXHf9WW1/n8jwI0UcoQ681i1Ppsmy8gs
         h9MYjWc4q39/qkqJHGxSejLnT9Uqv4ZAX4aMyMmC/X1iyNy4UJNYXscohq/dm0zNzYQj
         YFV0fiwrfwDqoOfnK0ayMRD+m/7++eZzSdt1o4ANTvf8fT0sSk5Msi9SQomxxe866Ryx
         lCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514058; x=1796118858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJ3JKeUaCakN7r7cr85UYuo9cA76onoVrZv6mAvryU0=;
        b=XS1ifcu2U8TbS6F3Wx6y1tesg4auQDAXFrT0AM/4/j0I/5HdFP+gTZqXI8Qqklvnyg
         7CoTY97cLXnDNHGAasPA90PjlUsvvggnwP0KO2KatgyyD29LnaY6usnec/GDNcwoPt99
         GBIboLGysQfxXstAUugEW/TZRzWhdcWfUMbuD+Io3BNFKH9S3qV3J0hRIyR6aIGb2vzp
         r5wgTxkMCeo919hQ1hIjmN9cHNhpjdw6+DT5+zjTtK1gR63XHYvbcP/bhdQwq0FIumXi
         ndf7CgTY+l2SHX8KNBxiB1eOtTvqe8DMi5KGEpB56H08krZ/f/zytvDZUtNoSU5kLJRV
         vfiw==
X-Forwarded-Encrypted: i=1; AL+hErHKXSEPkvdt2FCEgSEGf72XjA4SWmrUJb88HmAt9rNe6InQaf4r/LV29URN+ady/Ol67Kvo9Ifb2TYrdSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UzFah4vLZKoec8QLXNNU0HxsXK/tfdPxXeEzkDHDcpgPB/Z+H
	u+Mih0kr8BA2xjC45VRNt6AEpN4zNqJqTzjIm9jaSsCgeZUeK+m5hx3B
X-Gm-Gg: AZFdTZcIQoK9vnBteGW2ch1P/PhYrIw5rOEuWW9SARtGFEp7IllR+aPjGIpR1JCXJfG
	YM3ePm5NBejX7lE0e3kPL9hiZ+UafuPB4ZRPFT22x+wBBEr4UQQx5UUpYREBKPEUfWLytKFlIj/
	JPHIkkW3j1HOj1ADzraiBo+0beI/BFi6OFTyHJoaGElJi9ETxhSK4wDQhC10wC0vx8ApNvb81pk
	4bcQf1Fhk8iNW5JSK/pvBMuMzIl4zZdhS8qnP0SAkKKo8ZqrrKGhNratKmvJ4FQb1IcEl2xu3Ht
	Txl++6yM8mwJWqugC3pFH09ITqkF5Mjs9jJEjcq0B24sxDlLUKvVjnvQXWOkhGePfJHHOwo9HdR
	B3wj54cRGywt1AC1W2BpZ8YyBhUNlYXRLiffNa5pguFCIG5mG0XGDKWRNVwEJmYW5BB/ZH2Nfh7
	QmRrKxrwa4Mi+/XoxqOW+9474KqetyboT5B4oZY37x5cWADzDn/yNQp5o/g4p04ZlvVzrSXYBUx
	E+nwM/iVURymyu1eF8unvf9oZ+4vQH7Bft+qYv0Fl1N7Ue3BBu4y/Efiqng/tHYsMFesEEh9bn3
	4woB8cbP4m6qObHJ3ECPojRvDBzXBXvA5vviuthMnVNuxQ0ecduT5tyZTu9EeMck7tgy
X-Received: by 2002:a05:7301:d183:b0:386:a728:6c11 with SMTP id 5a478bee46e88-386a72872d3mr8372043eec.17.1795514057856;
        Tue, 24 Nov 2026 01:54:17 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm32041395eec.1.2026.11.24.01.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:54:17 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Fenglin Wu <quic_fenglinw@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] leds: flash: qcom-flash: release v4l2 flash devices on torch clamp failure
Date: Tue, 24 Nov 2026 16:54:08 +0700
Message-Id: <20261124095408.3842986-2-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261124095408.3842986-1-congnt264@gmail.com>
References: <20261124095408.3842986-1-congnt264@gmail.com>
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

qcom_flash_led_probe() registers the LEDs and their v4l2 flash
sub-devices in a loop, and then returns the result of the final
regmap_field_write() of the torch clamp field. Every other failure after
the first v4l2_flash_init() jumps to the release label, which calls
v4l2_flash_release().

If this last write fails, probe fails without releasing the v4l2 flash
sub-devices. They are not device managed, so they stay registered after the
LED class devices that they use are freed.

Jump to the release label on failure of that write as well.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 5974e8f6c3e4 ("leds: flash: leds-qcom-flash: Update torch current clamp setting")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/flash/leds-qcom-flash.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 1003ba060b42..b335784fe68c 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -951,7 +951,11 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 		flash_data->leds_count++;
 	}
 
-	return regmap_field_write(flash_data->r_fields[REG_TORCH_CLAMP], flash_data->torch_clamp);
+	rc = regmap_field_write(flash_data->r_fields[REG_TORCH_CLAMP], flash_data->torch_clamp);
+	if (rc < 0)
+		goto release;
+
+	return 0;
 release:
 	while (flash_data->leds_count)
 		v4l2_flash_release(flash_data->v4l2_flash[--flash_data->leds_count]);
-- 
2.25.1

