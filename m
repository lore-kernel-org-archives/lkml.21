Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503026;
	b=F9LQtQEqmFfZoluj1D6olI9VKlBZTvpyFsyNSFFWOtdN6RsOvNreriU2Ai2syrXXEJNd
	 XVpJ2Ih6bFbPt/HV6Dcd/jrLZoQJBiAUsclJOsnmrWHUipy8YbCJCxDFyfBoyWt+l5EX9
	 BHvZu2PHXXtXQDE5Ftj+Bqs/wUKymiwfkX+mCqLhVrwPlhJ8kublLDA8WFyc746u7/5Z5
	 lN7MIAs5RuhrKEGJnnDGcrLNyfRrxn1iqTQ55yw+ltOWvS4ECXzxw8xwpEK0ViEP9mUbt
	 jxIvP93a+iiagq7wSSjLjNFfaCaRDjeEUJF/IO/ZZWF7AAJMszne1MuaK2XPmhxoN6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nWMZNkQRC5jUVx3esiXyQgwopDn0rW/+vZ2bONYX6sM=;
	b=oqjRW+oNnNnTfzrYV6Zv/SqgC5geK/T19Nav/DjuYy0WECjPp6lHInP9OJrCRM+CdFTq
	 ubuktpGBt6j60M5ekrUX3udWjC6/YEDMzXKDwMSRwrmudiosidDA0o1nBy3vQ3ax4OjLf
	 Q7vZPmPX0TwfmeHmULhl+DFFYEQS/+qp1XZ30R/52o+J2D/cQ9uBc6zhyh0KOnJ9ZoWZc
	 0MhFSi6+sbvMWLEsiBu6+NrCxwW9GCU+BPCFIWrgIpoA0ZryNAQJd3CLPFu8s5y89c8NU
	 cuh+cvAc7ZYrKTrV5d0UxcKzah5HlEA+rBXjeiGWZYZwHrNSg/VXGEby4NhGK9yiiqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iisovWYC;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CF2606A688
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11CF2606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iisovWYC
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bccecba199so3946036e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503024; x=1796107824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWMZNkQRC5jUVx3esiXyQgwopDn0rW/+vZ2bONYX6sM=;
        b=iisovWYCGb8jYZuLMhelnOxG2FxoVTuoo3fPFkhnN+wnLKZ9CJVF/9oiQrWrKjIuxi
         joFuM5G6z3vi1NLYNXLf3ZwQVQu4cwrHPbZbDIYAysNNzKfl/31wLQLsrkMauJTQFZ+m
         gaAm+LDIStJY7gGLWhtyp7qnlEQdmbm2OlhmXUAQNu+W0+odg7MMl4mS/HV5UKZUsx3I
         1XOtGHdx9YbimrBUaZn9hcarQqWuZXOMt/eGZwtyMmm1ZHRC8r5v44UV6E+zkpOYfanW
         gbnfxpK9FKx6h1YTr0m8G14TkWnCPiD++XaWH8cC8a+Xinsix8984ufgal9+DNMFVBCC
         AvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503024; x=1796107824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nWMZNkQRC5jUVx3esiXyQgwopDn0rW/+vZ2bONYX6sM=;
        b=OWIOkHEAs+jLkPOvxMSWFpTOouGHXOxl75KY6KMQTDiUQk44z2joCwu4Q6sbh4BHAX
         nobzabZVrl3vxcUZmYW4OzlKJRtgRsXKHMDed7FRriXjRxhE01Cj/uk0ouRKCddU/lTD
         M/skn9p1MWXZiPzkaxDvixd//+zsY55fve0vQpBN1SWWbu1MBM/ugDsGgZ6GhpD8mMqM
         UENQfXJV3v3oXn4HmNOHtoUedrdbKZYvpNdJSxDZq0UVXvqWKQH6R4U/66hCboCnNtuq
         YRXzO3ezwGkCSWZhCAHwxUyz1EGsvGamzSsL7NRw31zLNEdcGH4a9MMZHGq8jHG76hef
         RhgQ==
X-Forwarded-Encrypted: i=1; AL+hErHjYiMM+e+P87U5q2LGPeE1vgtnhmsXQkk//afTLLpKE6uRdn03TglhnhK0A7B0nEXQpKqfCJ/QG3Bemuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z87EvszvZvsc+wFSxbagJJYQDgLdpbK3fGWth7jWtbfKw9yOFuF
	z0SxAsePQa3FWwVseKPvE3v/xMhKZ0TUOyLwT4dxKjqmx1tylevNQEFf0j9HxS1b
X-Gm-Gg: AZFdTZdGor6i0xZfecjQfq+NpPkov0A2TL4uJ+6LiYhnAmzaBP4/ipS42rBkHReNm6n
	fM0Z2H4w6+StTS4fOP8aQIcNStjBSErrO95lhUsPiU3+owbAPkWPELKa4oAXiHzpdLoINKwcPG6
	/MwAS5TFkHULgYY6OT61bVj3UdyMSf+YOuYIilwPm6LVsrzEdRryP4iv8fe+LY6E3Bdz/fervsu
	NYJ1eVJSLQj3pUspV1hXH+tOD7OwWFT8RxfI5pkBNuZxmxF9pS8UqFOZdLjv4PmbOEGbQsVoVcO
	pKFjxnHK42EybN4goA78XwbnCsVdtnQMBC12bHaqxSVRCce0L3xh/Wl2SZozN0ynYuL7nKTkPH0
	luBtvCg/NfLIRwbEqOdJoxsrje88uOkDr2Eew9hCM9UFkUdtl4CXzmwi5gGCnVj0V/veI6ZROFY
	pH9X/jUHEBwJS58KfvckPblY+r/Bd3Jo4JcYaIOtg76mfXtGiunI3tLW/nHd3kzI+hh7HIfIpl9
	cB003+cWOYBBl3m36iO/W+s9RJfy0WNJB+cYp9runHanllt2xM9HGsmZcUrfw/lXjVCnFH9L4zw
	l09KMspEhBcU8v4uuk9SMxjFg+NYg4iU/cCcMlcOKk78MjwBcYYOSBLlZMX1e7mvphG7hAzGmxN
	hEb+StsrOMQekamyJPF2gxjXH1L99vRab5vzoUL8=
X-Received: by 2002:a05:6512:32c9:b0:5c1:5775:d1ea with SMTP id 2adb3069b0e04-5c1bc7c3c50mr4798419e87.11.1795503023960;
        Mon, 23 Nov 2026 22:50:23 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b45sm3538556e87.41.2026.11.23.22.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:50:22 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 4/6] iio: accel: bma220: use iio_debugfs_reg_access_regmap()
Date: Tue, 24 Nov 2026 08:50:14 +0200
Message-ID: <20261124065016.185124-5-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124065016.185124-1-zoone.rupert@gmail.com>
References: <20261124065016.185124-1-zoone.rupert@gmail.com>
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

The debugfs callback only reads or writes the regmap of the parent
device, which is what the core helper does.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/accel/bma220_core.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/iio/accel/bma220_core.c b/drivers/iio/accel/bma220_core.c
index 23eff578158c..d2f21c0ab491 100644
--- a/drivers/iio/accel/bma220_core.c
+++ b/drivers/iio/accel/bma220_core.c
@@ -369,21 +369,11 @@ static int bma220_read_avail(struct iio_dev *indio_dev,
 	}
 }
 
-static int bma220_reg_access(struct iio_dev *indio_dev, unsigned int reg,
-			     unsigned int writeval, unsigned int *readval)
-{
-	struct bma220_data *data = iio_priv(indio_dev);
-
-	if (readval)
-		return regmap_read(data->regmap, reg, readval);
-	return regmap_write(data->regmap, reg, writeval);
-}
-
 static const struct iio_info bma220_info = {
 	.read_raw		= bma220_read_raw,
 	.write_raw		= bma220_write_raw,
 	.read_avail		= bma220_read_avail,
-	.debugfs_reg_access	= &bma220_reg_access,
+	.debugfs_reg_access	= iio_debugfs_reg_access_regmap,
 };
 
 static int bma220_reset(struct bma220_data *data, bool up)
-- 
2.43.0

