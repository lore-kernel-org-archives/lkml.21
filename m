Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513600;
	b=ysW15rWGGGtJrwikm3kAVHNMY36+j0DBwCYNyusNsBG3I8l0AUFptjCFeOoz1xcY5BHr
	 e21rbsG74k7fCMfwEzL/bptVYEoUvH6SyIRQAT9xrunLegriPAwTCTcTzztx3Q45Eh9Uy
	 G1vP9VfwvbXqrx/Ogqopp8P0LWbh2Odx15VNxeJJRXp1t19+qz9LUvfReuXLihFh4xN9N
	 uOORSjDMr9oQbdx+Zt7xPxOdo2FbZlDfhRWYSK0koNP1Mq65EPCS1oQ4jYKmJ3k7wBrBF
	 W4tS9VmVnC0KHxbeBR/o/lJ+RfyNd/H1dLxU/HRrAYp++UQYgRWofZIZ52008FBuuTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oaLF5qIGw2nyY3NabfPF5nK44+ZydS+4SbcKbcg9WWs=;
	b=DFmel3G8wH9kazhOV0LmM4tpnm+ihFVSOV2gidxNGaEhTUk9kTnQHaOBdYIk0Z7kmZ/y
	 WTQ/Mc/aqW2oMN1EBpknflP6XtZC4GTsWiRXBnQiboMUIkWM0+fhybv7tpdcrMQhqgGhN
	 zHNFwBWletGZxwBpMC3Hhr5yWM1a784zSGVKnWI7VmW8NZsJgpD7fSgFRNoeb8Nr1C8z7
	 /oaVDpkch2yQ6IQj9Ofr+Ni7gaVDpu2uN6PrRtkDpqqnvbfLW/i+jjkZ9C3tEF+I270sW
	 ObCZ5LAh7A8tO4zqXKaGLCfJ0Yx+6K/tITukyF35OuMCRS+lvVtug4+R8ulrFMv2fmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="hDQ/Zwnp";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E033F606CC22
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E033F606CC22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hDQ/Zwnp
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so27355985e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795513596; x=1796118396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaLF5qIGw2nyY3NabfPF5nK44+ZydS+4SbcKbcg9WWs=;
        b=hDQ/ZwnpSFaBpYw6vL86oM48gvv/PCcWR1a3lXgn9Bq1G13dDdODKUnQy57OgrcMJ9
         1asTrnjUSy28E9N/SaG4tcI5J3RhYuQFwSb9zJFuirJ7d4bMtxHowLKM0Bz198y6c5qQ
         Q23v3HNoqpvXrfKIyYvP9bVdE9DA4b/QVsJbguQ1Kztphpo8Oy+IC0+9AC3Auf/QBAXT
         n2AyetudKrb8XS0lA7g8HD5/wyiRJXnv5RNhiXrGpw3pnTvR4sOLjqTF3zLCaaV99zZB
         dbs8ozO1zRDxVh32Quz9H8Z70ctOv8gzXbMft4p5cYAIFKig9CYX9pcstHarT0R6FHLS
         oEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513596; x=1796118396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaLF5qIGw2nyY3NabfPF5nK44+ZydS+4SbcKbcg9WWs=;
        b=1/WZvUEfPnkj24rYNHVA0CN2bR6mtNO+0RJVPUcliW0gW3d/GnbP98VxiG/EpqkGUO
         ykTwONEetNpVx/xiywD0FRXEMk2m/F3NWyQCLElxa9XC/qZyJ+c8Basa4KJUYT5VhYeA
         u6I+zUC7C5gHwmX+EQYU+m89QlwKfLeIJtW2aZHmyopy20b7rH1VoCq0fBlRb7///Zuz
         zPqaEnSKFv/ibc7G2QExBY+NCd4ej1nVgFQ2iWgwqLl1HkGANwcKo7xE+18YmwZ5H+et
         oa6YsGamET8xNXVD4/ml+ZBzsuEy7rqzdWuqL3ltlOaFUm9mCTRXPehEF+g2mPwUwsna
         qjzg==
X-Forwarded-Encrypted: i=1; AL+hErHKKHULK1D/zdE+SnS7bQK46R2jFL2MSU9J9Tq58JhhHz0sTs0vZoaOh1GQ1zeWEyRTK4U0XPs/l3SJr50=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jxd4AqsSrtkXwv7GZSZQrWkqfTtyMikf6fgUFZCts/LRwHXOx
	m/J9EF8UlVFonC4GELr/YsS1/L+eXDEe3jm8lj1e6I1Ae1gL/J8wbRqc4zU693E4TkA=
X-Gm-Gg: AZFdTZcoC9TzCxSkXPeqY9SIh7NIAeth081TGgt688aO1sM6gFT7yQwuFlHryMlybEq
	7TEQyO3gyZrXKCjFbI3n9TdY7wE6//LZg7k/EcbSf+ykS0g7lqZ1CDmEPSxie+yIASkBe95Xvn3
	GVkJfgmnRGWlpzUj4MLVGush1ZGSEDhM3nVMmwvAZm+2isUeqy3JVgwd/abdx3wW78PcSAHbXYg
	tLdQ6h5ixihvSFvZ/UQUudrZS/dR/oKXeIiD2N+nI8A38GT+U1Ujrje31QpwzVOSoKkx0ZnbtOQ
	KlbLXDUhTXbSDoa48HQvxHBlEUGQqC1G/D0wLVFSd1+8rsziPsaUPAxvZJ4KQnRS2Nxq4i6eJ9h
	NHyLcF3ZgGvnUEphbtG6qT43HiiVjt+Ws0UHM4BaIskNx0cnXtHUaSHXXXXWRJ6Bi5KJKSKVi1h
	Ywtmc0YrnQVhR4jU6sCuctFYfy1UQopc+xK5doZIjAEEEQbS86FJYl8Xa1HLkhYeAoQY7RmEskL
	zjtRcNrYsZZx2t8brm4UgV0mWU1aJk8SmCLKUuPw9qpMFTH1dX+Y/nQM3ikYJyRoG75GdptSSgg
	FhCzaugrfsOh5ZYksWSYrTChXeJyWqyIbFKNrWo9D+OEWo+BSQFIKu+lfko0XixNCsk7tQdWPED
	CIEq+OJ1V5h4=
X-Received: by 2002:a05:600c:1c1f:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb88814510mr348413515e9.26.1795513596142;
        Tue, 24 Nov 2026 01:46:36 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm431782555e9.15.2026.11.24.01.46.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:46:35 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 2/4] iio: magnetometer: mmc5633: Reference the datasheet for the SET/RESET wait
Date: Tue, 24 Nov 2026 10:46:30 +0100
Message-ID: <20261124094632.8879-3-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124094632.8879-1-gerard@teslabs.com>
References: <20261124094632.8879-1-gerard@teslabs.com>
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index b651f01e1b5d..8142ba741ddc 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -63,6 +63,12 @@
 
 #define MMC5633_CTRL1_BW_MASK		GENMASK(1, 0)
 
+/*
+ * tSR, minimum time between SET or RESET and other operations, per
+ * Operating Timing Diagram section in
+ * - MMC5603NJ datasheet (Rev. B, page 15)
+ * - MMC5633NJL datasheet (Rev. A, page 23)
+ */
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
@@ -144,10 +150,6 @@ static int mmc5633_init(struct mmc5633_data *data)
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

