Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465583;
	b=k9U/Wr3pFPnaEDc+fUy1WBkSlVviQCKTrtu6z6r/eMUeJijlwSXy08QWkXstHhc7TXhe
	 kjps2kbrbP9Hb1Kmod4EACZy9Baz/iB2EaM5aLK3iuURnMxl4+w9FNoNyTBC0XF3nM5Dn
	 YwfOG8C+pIiViqKST3LVzZy1myoFCuI7RftiE3Ua9wwBVGImBeuTzkM2aN1rJdGGiJkhd
	 +w8cV4O7CFbRCqriVDfLzkqR4UCwIm7vMI5cGvqRdwxc6DwOtlL8P8bg0w+u0C5iavCMf
	 BatVSVtkVL/tNCiUHzonCxE7JLrisaikrVxVFDBcoVGw6MKfPYMGCl1YdoUb0sQL86Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Upecx+X/9IYkl/xM9lhnS9+bzajsmI969q78+kC9B7A=;
	b=p00SbQtwcoJcAEHG2Jy+NiPn5WLtNxJ6QS54qUu347bm/j2zHnqbxr4S/ZO6as7SOFR+
	 CQOQbzzjUNEoMLwAaTlsfeqJCbfaLnMr1tnqxdiVORR7m4jP8eVx2yfg2tlHsi/wGraAK
	 FtaMFmrwVeWz67gsug4do1HnVvdDX46jNXcTA45ulC8CGcYQ0m048Pq/qhxCxhl5irchm
	 1IpC85ECG2Xw488JcpauFE7Th1RyQqY3tVlbLR+2zjo6xrvMl2MZqmxE5nuToWqRK1+h8
	 XFWyaaZZMx5MVChT9Yu6AYz9J9rWxuOpteMuQuNY0wroDg84R+JITgflcn4AVp6GVQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b6V7vY+6;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2C9606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA2C9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b6V7vY+6
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso573645f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795465581; x=1796070381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Upecx+X/9IYkl/xM9lhnS9+bzajsmI969q78+kC9B7A=;
        b=b6V7vY+6rwZ+oeHCGn712eE0DPm7e9WdpitttblvNBO+zocl0I7NsaNXqMP7lRxAtC
         oyi2aHqXACp0d4X+FSwZhi/nQutuP63pZYuA5DMkytQjGRxJnj8eQKV+253Mgnpr4JXD
         GVJQ0gWwLpbp0qkHWAVGHvM9eLwx/1PQr49XyvFZeoI+iHMTvO39HdFnDj/E2ighaqf3
         QXd7Q94BKD969uHAxueDHk7T9ItmGHlx8cZ1KAE9YrSsxZa50Ue6ZZQsb+Bh2+8dzM4v
         EL8KyGJsh8kGKK8HbaoB4jWQVvyxliOtKvcR0GoeCLiKV+cy1iU+4Ml3BOkIFgz8+AI7
         KynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465581; x=1796070381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Upecx+X/9IYkl/xM9lhnS9+bzajsmI969q78+kC9B7A=;
        b=TpFcLCtyusdn6vEUjyxIGSnzJ5S+ASVfyeTaDnu5ALNY0VREo/K5vnwh7ZhjSm4wbj
         3d2GXGuXvlS7rG87FPo4FLE11rAeP44shRrM3pMyeXToG2ZfwElzDii6E8FSjGBt8IBo
         j1uatWStVCrbe2ijHMIejKSBDZXAX0cj3+Ig1IzyuChxXlyy7CZjLF2rloIHPOev6M5/
         f9UGLbg3SYyfWW9y9a1Lpqt3KSWbhZArAqyfRdTz5o/DA2s9mlFsDnA8lc/CUo7YQRdD
         3NLWbsV8Vjv2Y7PihzNdYB1S0ChD5byQcl5A5vXi18W82txiLOMuj8fLGAlj/d3Ubogg
         gRmg==
X-Forwarded-Encrypted: i=1; AL+hErFZNGy+2HI7nFs6ZUmANk/+cII20qWpbJ3kwXMcmw60feSMwr7+67ope5KPgggTeOWcRP6WVBQZ2Kq1nBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PW/RXaLVOB9EmVvsEUEoGgijxF3iHbcgKierCmpmby71+s4jC
	n4qTd1QUONJx04ymlH9K/+7B/tcrK27SG4nDjkyTEACL5PjUwDuoESIL0mtoE7lHArg=
X-Gm-Gg: AZFdTZelgy6BW4dbpOIfQzNz7caYaB7/y0uWYsUvYqDPcRT95Ms71FWvnAM+ffzJx1N
	bqQHOcjSq/R+jpifef7LXPPHm57j2g6nWUmKWf1LNYjPpLU451y7vygQTns8YBPLWCsTuf570zu
	zrDfVDYX8puiT5nm7YtwbwfUL9ahowNiN89djoEu1XtJi2soA0Cm5OqAetvg5nYfi483lLc1rFC
	g0wyF0/6AnTcm+MANWEkr7Q/WL8txSmdppt8ucSmmMAcRoo+AvJGx1CVK0iPFt8sHrJTkUrvL5g
	rxq9AC7xQ1cvEocF3qzOAkbZvMdL7GQ6snhtsdERLVVRX9AlIiz1GGaqioE2bN3kH3LoD+/R33o
	KsnYzkFTMRLb8chPTPuvJaXf+SBdTabBo/sIm+UGgu417XdWaeu1LAOxW7WQav513U2SKhJYX7U
	s+bWEdc5pvhUYOQjoL6eySgb4QmAvys61ycRAfy28kJIyi6+sB5Jh/jei+s+ByxvSYXUp9RiTZH
	q4mmQJMujPpyREQ2VbaOaG4sEbT3/7BF0qQfOPaLRqxZPLj6jRfhZfXcBHd8RS4TWJF+1dtXzYR
	i0sgQVpD5o9bo4AkyNplkmTNqumrids42bb3hRnyLr6CjPRRZPYwOgb3LjBEmTZMTfX2Luutrxm
	j0KJG68mMfjk=
X-Received: by 2002:a5d:5d87:0:b0:4a3:2ac:26a4 with SMTP id ffacd0b85a97d-4aa58527c76mr34549229f8f.23.1795465581118;
        Mon, 23 Nov 2026 12:26:21 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm20108713f8f.46.2026.11.23.12.26.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 12:26:20 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] iio: magnetometer: mmc5633: Reference the datasheet for the SET/RESET wait
Date: Mon, 23 Nov 2026 21:26:13 +0100
Message-ID: <20261123202616.17334-3-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123202616.17334-1-gerard@teslabs.com>
References: <20261123202616.17334-1-gerard@teslabs.com>
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

The 1 ms wait after a SET or RESET is tSR in the Operating Timing Diagram
section of both datasheets. Describe it where it is defined, with the
revision and page of each datasheet, in place of the comment at its use
that pointed at the datasheet without either.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index b651f01e1b5d..92a09316ccdc 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -63,6 +63,11 @@
 
 #define MMC5633_CTRL1_BW_MASK		GENMASK(1, 0)
 
+/*
+ * tSR, minimum time between SET or RESET and other operations, per MMC5603NJ
+ * datasheet (Rev. B, page 15) and MMC5633NJL datasheet (Rev. A, page 23),
+ * Operating Timing Diagram section.
+ */
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
@@ -144,10 +149,6 @@ static int mmc5633_init(struct mmc5633_data *data)
 	if (ret)
 		return ret;
 
-	/*
-	 * Minimum time interval between SET or RESET to other operations is
-	 * 1ms according to Operating Timing Diagram in datasheet.
-	 */
 	fsleep(MMC5633_WAIT_SET_RESET_US);
 
 	ret = regmap_write(data->regmap, MMC5633_REG_CTRL0, MMC5633_CTRL0_RESET);
-- 
2.45.2

