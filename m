Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333620;
	b=WrkDbgo1Tr9E3xGjOrzsM8saTu4F87JQ5al+P3MAO1NFSKIxJsaXjl6K1AAO95N7ajS1
	 lzHPkRr7IVqxyfEg3OYstGLq9xLV8Bgo49lIqQyfkOUOYBC62iDZWqRYwEa5ySyTQfLC5
	 fhT1cMcjx+41keT5Ph/NmBYgXXrdeqcXpukpzLd9cyQCJV7Rrh1bqZ+fL/vU9VJ8C6q27
	 cdSocEu9D5WX/lnk51ReQLFhfLMpAMHweAs67tDFCGGT7Cr6G3xW9OXjSLENQ2g2tGF/x
	 JMIfw5AcdoK3yKZjKxf2JPlDpC14FBMk7wJuT9x/2iQrjcbsiD+t47OAj+nT8blcxig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TMhXNQvSk1ZT1vxyOMFjrXM7IipagBQQHRtItyPgUsI=;
	b=dmGdTFpJQD8gIXAUDaXLz1lHzMax+RuK47prc2DVRDflzBDDBuAklI78lislO3/vjMZq
	 P7HFmVOQjkPOAXx4RH5NB+QPPrlvCkpOQ4Ln/kxYQd8mD14YMa2pFAQNnFYyos2f5FDwM
	 vfmnjRcQHW7eQU7aJOG5CHq9n56j9ygN/cy4PqEuwn8YwwbBFYSaC/2XAbKlG8E8LtrFb
	 MRPBzsKvASQMECATF+nVvG2hKZBgC3hvCFIBBRJ168e3mJ6OPrlkTIJ9kg7K3h00pIIQW
	 NlF682VfD105e0y8n314oOK7+eJyLmrJ0MVmOLlJtIyoLw7SisOVmtsr+Xqza6i9NEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFsohZYl;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44213606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44213606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFsohZYl
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386ab9ab619so214515eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333619; x=1795938419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TMhXNQvSk1ZT1vxyOMFjrXM7IipagBQQHRtItyPgUsI=;
        b=iFsohZYlRDBl+bsZdG33YJfLJmQLCNGocWJGiaA0HfuIUp/DT4/bbdmPStil+7F2yL
         44hqNK/+BBWJBwGmwuIP93Re4btz43WbSOXxL4ZOrrISZYI3veZRb0NKzIGaOp7+bR8O
         w8JZprLA0/6+nTi87P1d6704Emt8hv9o3+Xmfo1QsWeLIFVvt+kx94FuYU8pmZ0h2yot
         uU9nO5mCANWGG2hSoIYJZJ0ckOe6M2o4D57pWKJtazF7BXbAiaO31AufgXWyVi0cqFVu
         cof7RpfpB9P87bOfih8QU2cyMn8kDENJfgdcL1D849Rg+R0QjwSIlsX7cROCNfLSupL5
         3zZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333619; x=1795938419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMhXNQvSk1ZT1vxyOMFjrXM7IipagBQQHRtItyPgUsI=;
        b=tmMfJzHrzZyrgf3/Ns6S9K2hQBEWPy1YrdHVQLp7AhFKDjwZAzBdOuU3glFc8N5pVP
         C1DgGe27x9Nlou1Krlg8P9sCoNhaBr+DK2EM4biGN2NU8gLWQo3qQz+ewLHWji69spiv
         hZgsZVpaZn0eSTLssCACdpC/84DTmKpo67lsowq/g2GKXvJrygbpZc4qZh6t5ynDVphk
         rEjZpclqHNxnTmPNm+2YHmOIwq2qK3JW27TC3zAPqRvDkFrmef2glfc68l2EgqYnRMA/
         GKsfgEA7W9VKtIKHQWppj0WvPpAiT1fB4nVcQO+ejuTnrMRf+DWOPkQWfJ6jXwnaN3z/
         gYMw==
X-Forwarded-Encrypted: i=1; AL+hErELo4u3SuxMqjblRsWCmkLTkPMm0go/1nWeTAwYf2wPfGKTz1Ss/Hl5suKvUP98gvs/pHOiLPS4N8sMQs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BVPX5ZM5g/PMnJz6Klecvr2shAthSI0lOFOpe8OiuScXO1x90
	K+DQXXc0iCPz1aNHlDJ9sF+RxgM0ZGcSo6k/PgyYva+wvOVvftiy+zZ/
X-Gm-Gg: AZFdTZcI1Ed7MfUa6SF2UIesne+JrFjgFqrG/cDEVbe/d2RIvG4RWZS8+Wz0V0KqaLj
	gaygnKMI9i+TMJlxIhWdKE2gNAZ77lWDVDbqO2WH0YgLWKeeliQbKg0hziiC+uCBTnRzGfxmfjU
	bsF+ZFBdO6TZpatu3p3C2WdmhUNg3jl+rmRsUupkg1QGtKDCRRqjFVNY9LpU+Ru6IjlYQZMdzA8
	doqN+FO8DH8Lybe7MQQM5zQ0tjnIdjzNaRx+IFIgDi74vg+LOCHSTbWSGK91QHVbX9ZJ5R05+Nm
	rv6zjxsoaHAb1IN+4iu5hnbBrjRx6tME2pLPLdEkiPxU/YBO74t/x+le0hhW+uLsNDGjbK6/HFV
	hnhvsvY4DeUVj4quAC8Wz9y8yCa55kAnseEQO/Suw9EbIytCzM8UdWrlc9KPdDjlAAu80ggexSg
	K3w5d9Ja1cFb8cKhjSKIG0J22+DHeazfls+1pEQ8p7bpaI0fa/X/mOvihABB1twoCwZbKI8+BaI
	frIAvIW6ry6n6f/fPyJKXrFJhjjZhXkMZ3ErlGSYIyVrZ/D+hts7tUIKLj79/h1rVcqUAnxRZzV
	ykjcGRmrZ1/93puzx7b0eLvTXO6avE/SYJf7NIqV4ZqIptKTaMcD1L+O0gqUwEI9iphRBkUwPry
	qW3v2TZmRR9mWZ8hvqHIjVxRFyQO11ttPNGO78pvSqdFQFR+Eflq9l9jnilTNNMiaYJA73GXNRr
	XMquc8hIBjMHyaml9yP2qm7s2whRFKYXzWCz4f6zYOwA==
X-Received: by 2002:a05:693c:6010:b0:385:849b:7899 with SMTP id 5a478bee46e88-385849b7adamr9485945eec.4.1795333619120;
        Sat, 21 Nov 2026 23:46:59 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm24898071eec.9.2026.11.21.23.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:46:58 -0800 (PST)
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
Subject: [PATCH v2 0/6] iio: proximity: sx93xx: fix raw reads, thresholds, hysteresis and gain
Date: Sun, 22 Nov 2026 13:16:40 +0530
Message-ID: <20261122074649.239441-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The remaining sx93xx fixes, grouped by driver.

1: sx_common: a raw read can return on a stale completion (left by an
   interrupted read, or by conversions while another device uses the
   sensor's trigger), and it then turns off the CONVDONE interrupt the
   trigger depends on.
2, 5: sx9324/sx9360 write_thresh() lowers the threshold by one register
   value when the value just read from an odd register value is
   written back, and lets some negative values through.
3, 6: sx9324/sx9360 write_hysteresis() turns negative values into the
   largest hysteresis.
4: sx9360 gain encoding, as in Semtech's own SX9360 driver and as
   sx9324 got in 108e4d4de2b5.

Changes in v2:
- Rebase on the current iio testing, which now has all the patches v1
  depended on
- 2, 5: check _val before it is used, and before reg is assigned;
  val > 1 instead of val >= 1 (Andy)
- 2, 5: commit message rewritten as agreed with Andy: drop the
  (r * r - 1) / 2 formula, explain why int_sqrt(2 * val + 1) is right
  in integer arithmetic, and say that the negative value wrap happens
  on both 32-bit and 64-bit
- 3, 6: check _val before it is used (Andy); say in the commit message
  that it happens on both 32-bit and 64-bit (Andy)

v1: https://lore.kernel.org/all/20261116205320.26070-1-kapoorarnav43@gmail.com/

The threshold change was checked against a userspace copy of both
conversions for every val from 0 to 65535: all 256 register values
round-trip, and every write picks the largest register value whose
reported threshold doesn't exceed the request.
Compile-tested only (W=1, checkpatch --strict clean); I don't have
SX93xx hardware.

Arnav Kapoor (6):
  iio: proximity: sx_common: fix raw reads while the trigger is in use
  iio: proximity: sx9324: fix proximity threshold writes
  iio: proximity: sx9324: reject negative hysteresis values
  iio: proximity: sx9360: fix hardware gain encoding
  iio: proximity: sx9360: fix proximity threshold writes
  iio: proximity: sx9360: reject negative hysteresis values

 drivers/iio/proximity/sx9324.c    | 18 ++++++++++----
 drivers/iio/proximity/sx9360.c    | 39 +++++++++++++++++++++++--------
 drivers/iio/proximity/sx_common.c | 25 +++++++++++++++-----
 3 files changed, 62 insertions(+), 20 deletions(-)


base-commit: 42d25ad999bd60b96b227c2e54391c82cb03d00d
-- 
2.53.0

