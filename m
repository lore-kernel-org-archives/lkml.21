Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025465;
	b=bGFnaW99LRWujMmmEb896bXaJ9OfRcRYB6XpjNdfPefzoOrmINU4nlwg0leIzO7tr97L
	 du8Dd02DMXtbDhs+zG4mwJPVKk2I7L++IZO3W0fFk3cPr2bZaiMrFkH+DmOsfWouMF/A7
	 E3ArHHU6ZCnIk8CBB9XK0KEhCLnD+eSOHomfKme8YvTIJky39TETBtGueXomqyjXzJj0O
	 g7x8rg57Avzgb69IlFIGk8YTztTT1KHbgCsSRBNvZahUtBRLLVDyn1qk/o2Xo6cmCLQ6V
	 dydu8ktepYu/9yzLkxuvC3TbWdsEccODe+pgeFmonu+0kCWy+nl3PeM8rdoxF4oa1KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025465;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=H7dLH2BIJVLZPnIXhb+HK7dBjMiqLcTp24uFPDXf5JA=;
	b=YB3pjXMD1XHIuvudOAtwNf3shJY+77WEupr1M34jtz3/AladFOJ5+ngWpZYLq3adIo3t
	 tKOz34XfWe/ANeR6AZHIz8t0AlraboaffuDX1Kox096lr4icd79Lz4X+a56IYo9JrvslZ
	 gMz9lp4biMh///2FdUEIPkem2m3uWa0SOAefu44xzahvtKKBxPH8erMlpLUr1X8ee+CgB
	 rk1c/kkb7QcPLSL+Kj6HNc3CgXRnNXCX4/2mor8QZJNhsBFn8AyZun25/CKMZCBbqfe76
	 GnyyaObsTcKXlTBmQVsGWSIdr3Z1ZTj2xj7x9xFUGo8QH6Ud7uEMono6oRvlT9rXF0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ix+9RyPK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC44160A2617
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ix+9RyPK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D88E1F000C4;
	Wed, 18 Nov 2026 18:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025465;
	bh=H7dLH2BIJVLZPnIXhb+HK7dBjMiqLcTp24uFPDXf5JA=;
	h=From:To:Cc:Subject:Date;
	b=ix+9RyPKjrJ7S0KVQGWmXKHexdPPUqsHdPbQtjeXBPVEbJXVaQ5Dm8SZR3lJMd3Hm
	 VPYwZgShU4gMuHY0lG6dka44V+eKWJGenQnSBHggbE7ifXkaxFXs5NKwOLrxmDuQXD
	 d4elR62ye5vSGKfBU2v+N0wTNAcAmjh/dmhC8IvHImoZbw+FRAZkNNj/3bgkOvMPWP
	 PnyE4Q4Z2CBEvwK6ba9YfPyxUM/YBv4N2H5hxTAGpI7yoR8/CzkMoMhg/euR5LeFTV
	 hwJXpqCmxxIBZOf9Vo11XNy0NbBt+jLKtQkILY9Ru2+20iJY76J0XkxIope+jmRD/R
	 sUvWioq1yfv4w==
From: Thorsten Blum <blum@kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] parport: Use kstrdup() in parse_data()
Date: Wed, 18 Nov 2026 19:10:34 +0100
Message-ID: <20261118181033.666623-3-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523; i=blum@kernel.org; h=from:subject; bh=wjnYBEY55bSmgiu333N3t5fl5bNO6gstDqW5WeauGJU=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFl/X0nKxEfNZDNWvKd6w7ieKbeLNT072SXl+7pSv5gHz FVXjrV1lLIwiHExyIopsjyY9WOGb2lN5SaTiJ0wc1iZQIYwcHEKwETmvGX4K3Pm2p60hTvXsU1/ pPC7cfIWaZYDh65e0LnC2JBQHunyLImRYXqO8h2H9xddOfZG3FCuDdhqfE+zxG2X2fsnJn+rU79 v4AUA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows.

While the current code works correctly, replace kmalloc() and strcpy()
with a single kstrdup() call to simplify the code.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Andrew, this hasn't received any feedback since April. Could you maybe
pick it up? Thanks.

Changes in v2:
- Reword subject and commit description
- No code changes
- v1: https://lore.kernel.org/r/20260727102422.412065-2-thorsten.blum@linux.dev/

 drivers/parport/probe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/parport/probe.c b/drivers/parport/probe.c
index 5d1b9aacb130..bf9d81c0abaf 100644
--- a/drivers/parport/probe.c
+++ b/drivers/parport/probe.c
@@ -52,7 +52,7 @@ static void pretty_print(struct parport *port, int device)
 
 static void parse_data(struct parport *port, int device, char *str)
 {
-	char *txt = kmalloc(strlen(str)+1, GFP_KERNEL);
+	char *txt = kstrdup(str, GFP_KERNEL);
 	char *p = txt, *q;
 	int guessed_class = PARPORT_CLASS_UNSPEC;
 	struct parport_device_info *info = &port->probe_info[device + 1];
@@ -61,7 +61,6 @@ static void parse_data(struct parport *port, int device, char *str)
 		pr_warn("%s probe: memory squeeze\n", port->name);
 		return;
 	}
-	strcpy(txt, str);
 	while (p) {
 		char *sep;
 		q = strchr(p, ';');
