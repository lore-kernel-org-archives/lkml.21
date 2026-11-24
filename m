Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555988;
	b=4lH00KGjdxju7SwZBrKGF7BAP2QKnHMrASZC7/ZDwwEi+sZwRGlzVs+hzUPb1M8ii0oR
	 4iU9fo9nTatQrMPDQjizjNcYG3FK/ufw1iYJxwbVnAcd0rEwBqhN3Cg/wH3OeLL/at15I
	 qDpYJpNv722vjKpfTOc4RDWe9tT1h1IZSJrs7t8SzFhnXC/ZmCR/GQZ7Ik7K9opKlb7nW
	 HQAcwxz8A30XT+mq49Pw+JoRY3QgIJ+lP138YEhL0b79jEwYWioACWEdJC6nSDnZ2St1o
	 BSzsVp+0eAPKUob/Sg+qSH1RmeuF9AhYzB6hh+UT9gS6JXe2LSB1JPllY5i39vNc+ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3jNvKr6YKssr0KC6PP+aBeDU0LdpHAs30F0i3S3i2H4=;
	b=FG8W4iPDfbTFJcVcmdadTwfcteaVsrXen0pnaRbBfN+Dcvl1vxUMcSkQpTTTigfG0tgA
	 gQz1Uu5liZZrm52zpY9BPcjzHMgaP2WviMYPuBoX0FQqcYeQ8wWIs1uh3gMu861IjdKG9
	 pHG2o20cSTnAPC9MmDJbutt8dQMGvMfPul1GbfzPoRfDy9QSX7//9e47N4G8b4W8VgDQR
	 k0nnyP/DObCHazVoju83djJdJBlXTEj3G0qMlbS3uoogsKFEKsOBz1GPtl6nCphCFmX5X
	 tfVedUJES2iH7Rf4XWa7VZysMvERtQHmTD/Bl9xRiI7cOFGHqHJWhrIHRN2MHQoQSsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezt4wIi+;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D98606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23D98606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezt4wIi+
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4b76ade741cso9345325e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795555986; x=1796160786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jNvKr6YKssr0KC6PP+aBeDU0LdpHAs30F0i3S3i2H4=;
        b=ezt4wIi++lL98PEYPo7Owc743QvyuZWXP64xqyUYB0rI8NKvS8r836Hvk2PZN1XEay
         1V45ldPutTYcf2GtXFZq0LqJ3FHu3k0TpH/LIMulAIJRazwlcOLb8wDUv/9xnck1kQ78
         AkD49mJkZ/Q0WV1nCVy75nIlMW9Lt980L45hcaL14HQMcKCleE6ZyEbrQzOaaF5WSfch
         lE8bY2Q0dLGYrrKFI4osddxXk3ZfdH1v6VmdpRQwCJ5bNcbyH9ipXdQ7Es/uYYfF/Jui
         KF4GNRVllFYdu1QIOCzqEv2q7WPsgn5i7HVUub2NvMf5m/8qqojAowIPFiIlCuKfHciw
         nqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555986; x=1796160786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jNvKr6YKssr0KC6PP+aBeDU0LdpHAs30F0i3S3i2H4=;
        b=M6Ry1g/vAdqvKWdGFTN1OehOITb0D0zLqFR8SYCKB76k2WN5iIqM+AwDTYgdOlorQS
         LD/svLsEMTa8P8q+VrK1SgKBOLTLb5BI9fzFze3jgiEYoJ08cYcewEIgy7Of8+WiIRNa
         /Gg+vWPaQfHM6OnI2jV6vg3goOp8lqkcdtR41jw5IDZDOQzT1+Andg9sF6MBSgZvut4S
         faTFXK8RB+g9rI9pTQR4xHZbW9E3R+oaZSWokuM83+fKeSFJpC+9pc7XifkBu0JlYhjD
         xeFxsxd23nxoM2tLiF6us7RxSVQucKVghqOoGhWY67aWAFr1QH9LdThwl1Cc38YYDuKQ
         +C1g==
X-Forwarded-Encrypted: i=1; AL+hErFsWpXqcJKKhwhYt70yK9mfx/bu7/UYVIqURnw0rErs0POmKAFPLs7KQ85TyZ0ftsR9gyq5sDnBxvI7NZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TKdGz1bGzTFmOLQJYp/UrhBLjnVZGWTb0K727GiwSV84pJbkH
	w+H/4ShJsOkSlVE4uCFHvQ/umuxmCzWTILXFBEEjukeeSN8t2ptzLfjO
X-Gm-Gg: AZFdTZc1UwqYe/zCcwpRHNZmsCioeXZhJVdZ0JamduXW5TEl3RZcKbwiTkR1tTkw03j
	wXuMG+K5ib5XoPbxzu8fp7dLTSVEBlw5qzZ+uZfv/LD9FjliAO5XaoI8zK2MWOW9/6K44IRjtbn
	9/w4Ey7Ahu/oId44JiikL9N3/AMwLkJnFkvDD6GeFnxOthZCJuiSKhcq23kzu8VLCe0mmN3K/B7
	EzlzMQAexLeUW+YmES+I68QnAqoJRyfvXhHLjieESMo2zYp18MXopFXMsZSbWZR36jzzLcYKUQA
	j6QT+iVFain9YUMWLlqISvEMgLUyvVqNPL6HgYGQkNH+3OGX0w/tw6j7kBR3eyiI2cibXySERtm
	5rsFRzYHbm3LpXhHeRujJaNFDaeNKxfXw0qZV+cHWudKDJqyxYB5lH284PPiSVoxlBRbDf/v8HJ
	9E/fqfvGm31rcc6DHnsOWGGx342bB9Ysr6DSQLNwvJV/ofDcWYNodDNTRjl7YVJCp9cTeGIJImm
	0QwVf1OLxEuVISTSiBe6IuPZcrmxpXHB+1bVIwrh3x4o3CvSGiO48S0gujD0JhohiJvvmXZurhq
	Xb0OJjgJ45UDvdFKwqlvrHg3iGb5L4TKYQ==
X-Received: by 2002:a05:600c:3b88:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4bb888078a8mr367519085e9.11.1795555986267;
        Tue, 24 Nov 2026 13:33:06 -0800 (PST)
Received: from 192.168.1.35 ([39.47.150.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b205443sm31986200f8f.39.2026.11.24.13.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:33:06 -0800 (PST)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: radu.sabau@analog.com,
	Antoniu.Miclaus@analog.com,
	Dragos.Bogdan@analog.com,
	Michael.Hennerich@analog.com,
	Nuno.Sa@analog.com,
	Robert.Budai@analog.com,
	andy@kernel.org,
	dlechner@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@analog.com,
	shehryar.amd@gmail.com
Subject: [PATCH] iio: imu: adis_buffer: fix buffer ordering for IIO core demultiplexing
Date: Wed, 25 Nov 2026 02:30:54 +0500
Message-ID: <20261124213118.63979-1-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Fix adis_update_scan_mode() to iterate in scan_index order. The adis
library constructs the SPI transaction in channel array order, while the
IIO core demultiplexes the buffer in scan_index order, causing data to
land in the wrong slots.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
RFC discussions at [1]. Tested by Radu Sabau, but not carrying tested by
tag, used iio_for_each_active_channel() while RFC patch used
for_each_set_bit().

Link: https://lore.kernel.org/all/20260925110239.59320-1-shehryar.amd@gmail.com/ #[1]
 
drivers/iio/imu/adis_buffer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/imu/adis_buffer.c b/drivers/iio/imu/adis_buffer.c
index 501da4eae..17af61c7d 100644
--- a/drivers/iio/imu/adis_buffer.c
+++ b/drivers/iio/imu/adis_buffer.c
@@ -110,10 +110,10 @@ int adis_update_scan_mode(struct iio_dev *indio_dev,
 		spi_message_add_tail(&adis->xfer[j], &adis->msg);
 	}
 
-	chan = indio_dev->channels;
-	for (i = 0; i < indio_dev->num_channels; i++, chan++) {
-		if (!test_bit(chan->scan_index, scan_mask))
-			continue;
+	iio_for_each_active_channel(indio_dev, i) {
+		chan = iio_find_channel_from_si(indio_dev, i);
+		if (!chan)
+			return -EINVAL;
 		if (chan->scan_type.storagebits == 32)
 			*tx++ = cpu_to_be16((chan->address + 2) << 8);
 		*tx++ = cpu_to_be16(chan->address << 8);
-- 
2.56.1

