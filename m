Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804003;
	b=Gsqhtoea8hiOxQDM3rWAprxn/2ye0WMyLK89i6XYeCFlJUH+0ktgRjUu03VFHn+/OsEF
	 TK64xE71E+5kgWslc7QQpWGQHZqzeDMxzU10z2bYT486hIZn2vYNpEv5JigBSG8jwbKJz
	 S0kbcTLEXbJNuUjqOh22AmRXsBdR0fVawdsBwvtrelkk1sYTrNfW3i88kGTJXZFXyBXzr
	 4ZeJHg0toODvKKcZM8UJGiKpupEzFhpzCQcHRo+UxbSsBlmOvKyyAx9mLvWlKULBWBEVj
	 c+cg144kcdSAOor3EaIr5bNcret6ES5clIJpLZkZKm4/zk4lOjZCexsz/bio9zmfFrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oC6y9f/aOyEQ84R7NW1NilnGjZfRr+uYTRuXBDVTwZQ=;
	b=2d7zzHH0xnZCbejZcStuRuDJmpITdDtuwOG5/f5xPJYExv+LOx7sBM8Etsv6fCvpKTv5
	 eEqHdFO7dFVz3RAH6YAG3EQGynTJ6Ly+E7XykTFlEzzWIS+gtYxIaHqi8MKChj22kaCmv
	 VDT38F3WzpeFt3bV1pSjDPfqn7KEyd82EuzQL/jKN67P4ngtJtERhSaEFRMekI81BHr0D
	 oYm3/dOnrPp4hr/CeWus2zg80sNkxGiY+nX27oCEfaceq+Jz7cbPmmhcQ8HNS5kLfXcJS
	 6iG7H04eaVLcnKWH178GJ+PCLnwZ7/1JD/+VThMa9qM8WbAKyzaRiD7lSf9hfDiI/4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAQFA4K0;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C84A606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C84A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAQFA4K0
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so4427432241.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804002; x=1796408802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oC6y9f/aOyEQ84R7NW1NilnGjZfRr+uYTRuXBDVTwZQ=;
        b=DAQFA4K0YADPKk88P83P3k+L/k5se6/c5g1BtEF6IzUVy+T/AGYRwb2YvTHEXhZlcb
         GQGMWKV8mlfYkgnzP5hpdrPRAB3HMmTgBGUOCyRkJF9QfK1B9X3qGdgE2ZvL5pOIgQkp
         RXs37zgnW2zFmo8tZngTV/KnREJSEfZ2egqZCWR/C6N/mCzgJMisveReEq0DEHEFRKnl
         0g/SL5SkYshvtiZ0cdl64IkG6U6ZZFz5hbwVJIKPT5m7lXz2LJ+P1GIiVhGko+hlgaSv
         jm5sdLzRmOE+bumNkAwbqyD0i2gB/SncGBrM9G67KlTtttQGPC/O8b9X9AXw7g50Ax3Y
         VSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804002; x=1796408802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oC6y9f/aOyEQ84R7NW1NilnGjZfRr+uYTRuXBDVTwZQ=;
        b=VxiZRqtJ+Em/byUtydJK96FVvJrXSjNi5NTlAgRrXbza9G//n2U3CdmApxdjEENy99
         k9LISn31G2pZnLfWhfvqrqfIE0k8NSCnbDtlDVEGfpEcIbX0UVBYlomg7rrF+ZVTbL8f
         p22ntMMgKdnSDzdvJlZDDtHtSHxSTLL8N2rfJBvuVQEPkCZXd2ZJXDxZpQXreMqS0+wg
         aJf0zJLV+oFc04YKTf+wBpmZEwFR4xUc3nCe+3GcxQ3GgpPV0DqqL971dyq9+WGwrfqI
         QYUKb6ag/GCpSMiNm0mpCPJ5lv97qKC12KcrFop/xn+sMRTXtRRk19TIAvvMOrpGwzHk
         00Pg==
X-Forwarded-Encrypted: i=1; AL+hErF3+tLFa6+cdUmxvvzxRMoG5YthNRsElC+ynSLXMB7Ts/CcsYd79kLrXOoYKlKN9LMeK5XjSTtUKTmErZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z89oG/iUm3XO4tdLFBi33EpMzQnym4mba/6h2KW7x/RhhavqhZe
	naLc44omlcs0Ow0+TANsPRavlmqSIfqRwb1TnYrW0OQ5upAJzrUQEla+
X-Gm-Gg: AZFdTZcIFsafLZN74nIVlh8QAbvjhtSj2P8voy288HvuzuRM3UVWDmUBTDE3lCPpfBV
	0If+VQ0Tca5YA7kDPZ9rN+k4E0pFtmPn3b3a0IRvFYCk1VUuLzhILB+f427Yg0VPpVwiNGrQQ7x
	R4i80SCBChJ2zh33UMvCqQXhC/WxQhHf+fP1U9YLZqiwbYxYW8mYiFq5W1y4xO+cVL4DKckpOXp
	8I2uxDih0RALSP0+x3RLYY1jiT9va2cAuaA/nZI22pokFdoLWMEBuUGvwVtyEeF0A4W++1Y3+hr
	PiNrdEXIrYtR7Nbn/B0gq/Y/50MGsbSS5XVpC2bo2IZEcHd99bRkxCrO1KxRsJFM798ELI6llnG
	5ZisID6Fof1dRaVwF0QnJFIBCjTYVDLR8V2E2/4xjgs4pN1lfQWduV8bqV3Jt7tor0PsSYFEsVX
	DkKSSTdRBmDjjXRQ3qhOfwMr0o8cGTuPndWcdpMdzce3gQRxLwNo8f+UtXtRBixxMJyrAjVhUYv
	QHGJtbnhWHWisfn1KCeu3ufNP8KiwXhwrayArrAe4fxvmewY0Hns9t9gG1i+WkJI3JRaxPKSFbx
	tq8hJc7RuMcox8pu4GPCQ/0IQenxrRhJa/VevZEOfKcESsRyJoPLW/Jg
X-Received: by 2002:a05:6102:a54:b0:7bc:1de3:39b0 with SMTP id ada2fe7eead31-7d7396670b7mr15146004137.32.1795804002520;
        Fri, 27 Nov 2026 10:26:42 -0800 (PST)
Received: from localhost ([2600:4808:5693:8201:394e:8b9f:994c:b59f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921787fd72asm83361756d6.12.2026.11.27.10.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:26:42 -0800 (PST)
From: Marco Chen <marcochen.dev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	pmeerw@pmeerw.net,
	matt@ranostay.sg,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 1/2] iio: health: max30102: rename fifo_count() to fifo_ready()
Date: Fri, 27 Nov 2026 13:26:35 -0500
Message-ID: <20261127182636.83803-2-marcochen.dev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127182636.83803-1-marcochen.dev@gmail.com>
References: <20261127182636.83803-1-marcochen.dev@gmail.com>
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

The max30102_fifo_count() function does not count anything. It only
reports whether the FIFO_RDY bit is set, or a negative error value.

Rename max30102_fifo_count() to max30102_fifo_ready() and make it return
a bool. A failed status read returns false, which the handler already
treats as no data being available.

With a bool, the use of cnt in max30102_interrupt_handler() is no longer
needed, and a do/while loop can re-check the status after each sample.
The sequence of status and FIFO reads is the same as before.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Marco Chen <marcochen.dev@gmail.com>
---
Follow-up to Jonathan's comment on v2 of the NULL-dereference fix from
a few months ago
https://lore.kernel.org/linux-iio/20260805015826.2b558119@jic23-huawei/#R
Thank you.

 drivers/iio/health/max30102.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index aee96167f01e..a553c0e011e0 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -235,20 +235,17 @@ static const struct iio_buffer_setup_ops max30102_buffer_setup_ops = {
 	.predisable = max30102_buffer_predisable,
 };
 
-static inline int max30102_fifo_count(struct max30102_data *data)
+static inline bool max30102_fifo_ready(struct max30102_data *data)
 {
 	unsigned int val;
 	int ret;
 
 	ret = regmap_read(data->regmap, MAX30102_REG_INT_STATUS, &val);
 	if (ret)
-		return ret;
+		return false;
 
 	/* FIFO has one sample slot left */
-	if (val & MAX30102_REG_INT_STATUS_FIFO_RDY)
-		return 1;
-
-	return 0;
+	return val & MAX30102_REG_INT_STATUS_FIFO_RDY;
 }
 
 #define MAX30102_COPY_DATA(i) \
@@ -291,10 +288,9 @@ static irqreturn_t max30102_interrupt_handler(int irq, void *private)
 	struct iio_dev *indio_dev = private;
 	struct max30102_data *data = iio_priv(indio_dev);
 	unsigned int measurements;
-	int ret, cnt;
+	int ret;
 
-	cnt = max30102_fifo_count(data);
-	if (cnt <= 0)
+	if (!max30102_fifo_ready(data))
 		return IRQ_HANDLED;
 
 	measurements = bitmap_weight(indio_dev->active_scan_mask,
@@ -302,14 +298,13 @@ static irqreturn_t max30102_interrupt_handler(int irq, void *private)
 
 	mutex_lock(&data->lock);
 
-	while (cnt || (cnt = max30102_fifo_count(data)) > 0) {
+	do {
 		ret = max30102_read_measurement(data, measurements);
 		if (ret)
 			break;
 
 		iio_push_to_buffers(data->indio_dev, data->processed_buffer);
-		cnt--;
-	}
+	} while (max30102_fifo_ready(data));
 
 	mutex_unlock(&data->lock);
 
-- 
2.56.1

