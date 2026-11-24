Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503022;
	b=uza9P/aT+uS0ICD77fSIhYIjHE/iC5sVy4rYFXiVzxHotJ/kyBl7CYAdIDP/dD8k/9W5
	 7ttjnwL17cRooSa1sIKBsLDhfK3G84RZKl641Y/J67xQ/2duHz1BFKeGUBLVl0Xk1Mv5K
	 B0SAYN3MxYqAkkPNTL44u9wG9xlu6K7KM+mTo1wK5qEM/1MUM4ZiquMeVtymyPMUUbOWR
	 MHrcrPIzoNIbqXDBtYMF6wQrI/naXuMY+tZMJzTxuTTGCuWASvNYotpY6RvS8lgt1V3yC
	 TclAaVZmS1b0wg+cx0cVVUZdUmRLZEYeNGZc7BitZZ66vMT4mDv8djFRJVu0bFTB7xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HENiTwapNaU7NbNMtbDzb4zDBCZlFqydguAonmAa+ZY=;
	b=BpQDlp9/1Vq1yXwvEtEDvBORyG/W5xnSizubbEtXlI83dhti8vLX5NsQQvVLUV/31fmL
	 FcM3Ovg9KVMk/7HuEtbCIuXskgXP2qaz+q81fviUBonRCR22QFY0XKjoVaGcx17cIf+sY
	 Iks9sa9NyVEXPb6LuZG7YiSE2lWrfEdqfvzoo2S9FuAWYhH19EDzn26GzJVEolsl4KCZ3
	 vIEL5x+kL6QuUXNcDAGei095mZRFQ8S4pIhHPHfjRe6kefKJTtY63yBOQepGa0ECboQQ6
	 pWabE+0TPr+g8ncR1WIAA2DYaL8MO8K845xl9Vef8F13X1qKtNrOIilloFgqWK/pRHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mS2nLBcx;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ACC606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1ACC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mS2nLBcx
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c26207ee6eso1726785e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503020; x=1796107820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HENiTwapNaU7NbNMtbDzb4zDBCZlFqydguAonmAa+ZY=;
        b=mS2nLBcx/X6705BUxPUz2G/dvtJ9frwUyGwvOP11xr+LVW4J+T7aWZ1xX+Pfptulcr
         1EKi9h4uWpkmN+uC4v4kb37U2636Ru8/6yWwp2i8XkBdj19eRqnr9LkdTypC44YA/wKl
         z1YNL3NVGanJFWCE+1WrMSgeAG9NDgaUOV47tfB4HmFVXLGr4aaSc7JZ1h9VA7Qd1dyV
         9cQ/KvhUYY2bwjy4YL+qDp+5wXsxbBwtHpEKXoU88/WuV9cV0R742bLnPugIj5NEdyt8
         W3qTLMY8/sGc1Re26/W8oVd7eR6oeYnQ8QbZom9PPaul5zNdlyDzBs9Sd7O+/Yr8axIa
         Oydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503020; x=1796107820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HENiTwapNaU7NbNMtbDzb4zDBCZlFqydguAonmAa+ZY=;
        b=EBcvGH676qTFERpaig4QJKqBbJuiJ/k878zCEwK0WiPCLFPdWXDHEVqtevdyRH0s22
         2NAAUhBknjHYynWlfN7hCjvBenRhsiGD0H5xC8qmTvtMfeX4hNx5Qv7Ecj+UHT9Ip+M9
         /77R50UDFW46hofUhUF5eeB2GJO+BStUto/Oyr3LZBQZAlB6S/HNtXrcI2pgl2mYnNxE
         aByZisB7vYfIUu2gE+TYnEq+f8kTltuPqH9JYtcJdTFK6Eeu5rUcGXMsem+a7FhD5dF2
         xGcp5PTUJzbUN3HrnB8OHP+d+WyK7c4w1LzQLyB8b424P8XaoIsOcKxvPccIAn14oKcq
         q8LA==
X-Forwarded-Encrypted: i=1; AL+hErEXR+uS5t/jOgDi6o4Qw3OfvCWmFlOLWsffvnHkI4SezSVm/BE833O7c6VmUUaUvQKsSn1ziNbK2QJ2h8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qOIiEHsoakQe9rv69kyIXJMngtt7cotFm70syjqt5L+cI53Ul
	AGpEyaV9tsLh6B8CYjHAE6e+swiqrryIk2ip22wxar7gvlQqrtAg0kM5
X-Gm-Gg: AZFdTZdW1zC/W/4uo9jFJRIsaXrGGVUZKiyxWqpIYE96Q2XtAE46ylMzvaDNdhv9cPA
	KizmrmW7CUSz9d5to7yaIJbX3Yj0WCm2tEddwl/154eVR1p3bwhE0J8yC8ChWr3+3wyqTQtTRYt
	iIraUF3cjeRSg82u9pTaDNfZCPX8rZ+tWycwfgmF7McvaPawzTXO6p0luOWX4E8cDzqZy5F0GT+
	KreJUXxxCPd2WkwdfaoHMZSS5gseo1YsQ+T7XzO93KcYyOrePit91ri+nTe2CvI2Th5K/inErnP
	2FAa4O6KILdbnIR1CFWoYWaA0GT8npKnKrMLjxmUDQxggN9w4YVSfzRfpQye04k3PJyhKFJXpMc
	v6uKQ7gPNjyEF5hHtC0WZaZ0orjht/hFKVP9nyFZNbi2Gg+kb/tH19F8mQEwdYhdc/c97Vzlq/Y
	RdoCFWjEN9FbI3/JoHibNqVGQO9LKrhwYkEZsWb2aQwpKICoXBvWBZA4K2NL8IZzA08eQUuV5Dq
	sYMrXbUUE0TGOV48nmrzqxj4cnyDcRn5Dt1fbPchfEJX6W9Z27wECflS0dLqfD0oWQ1hdxeJ2dU
	6lvBaSRB4waP9AEniumgkUHPcF1cbewKZP+wrBK5j+1kCPLU1c9XeH+S1XdUkFuBUTz2VzPhsOX
	00IXuX99Pnvyj1ToR3+Y7cZ+rJuSAItjkJXa0mQ==
X-Received: by 2002:a05:6512:3e1a:b0:5bf:ae0d:5c8e with SMTP id 2adb3069b0e04-5c1bc89ae6emr4162899e87.57.1795503019603;
        Mon, 23 Nov 2026 22:50:19 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b45sm3538556e87.41.2026.11.23.22.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:50:19 -0800 (PST)
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
Subject: [PATCH 0/6] iio: debugfs register access through regmap in the core
Date: Tue, 24 Nov 2026 08:50:10 +0200
Message-ID: <20261124065016.185124-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
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

More than 25 IIO drivers have a debugfs_reg_access callback that is
only a regmap_read() or regmap_write() on the regmap of the parent
device. Patch 1 adds a core helper for that, patches 2 to 5 use it in
four drivers and patch 6 adds register access to dps310 with it. The
other drivers can follow in batches if the helper is wanted.

The helper finds the regmap with dev_get_regmap() on the parent, so it
only fits drivers with one regmap there. Existing callbacks that take a
lock or claim direct mode around the access are left alone.

Patch 6 is tested on a DPS310 on a BeagleBone Black. I don't have the
other parts. For those, adxl313, adxl372, bma220 and ina226 (ina219
uses the same callback) were instantiated on i2c-stub under QEMU:
reads, writes and refused registers through direct_reg_access give the
same results before and after.

Based on iio testing.

Rupesh Majhi (6):
  iio: core: add iio_debugfs_reg_access_regmap()
  iio: accel: adxl313: use iio_debugfs_reg_access_regmap()
  iio: accel: adxl372: use iio_debugfs_reg_access_regmap()
  iio: accel: bma220: use iio_debugfs_reg_access_regmap()
  iio: adc: ina2xx-adc: use iio_debugfs_reg_access_regmap()
  iio: pressure: dps310: add debugfs register access

 drivers/iio/accel/adxl313_core.c | 12 +-----------
 drivers/iio/accel/adxl372.c      | 15 +--------------
 drivers/iio/accel/bma220_core.c  | 12 +-----------
 drivers/iio/adc/ina2xx-adc.c     | 15 ++-------------
 drivers/iio/industrialio-core.c  | 28 ++++++++++++++++++++++++++++
 drivers/iio/pressure/dps310.c    |  1 +
 include/linux/iio/iio.h          |  2 ++
 7 files changed, 36 insertions(+), 49 deletions(-)


base-commit: f2cbef9101b9fc979a324bb1242b8b802a2484b6
-- 
2.43.0

