Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448149;
	b=0Q8I5qG/7YZsb8gxsVT1jKhtK+CknXX+lkOtUrc7GkJYEkPDAbQ1ZbUhXTxs0Jf8JBbD
	 relzc/JAD1Q/c4CH5QJHFOFCskZgBf8x4cE9WtuFiqC2tCrZK7HRGLRZ54DrogJXXFZOn
	 sZEGmOmLYzSjHVwpJgazkzKovNeEBui4v3v9wb6qH+RFHWOUCbFkL0rwbj01fWl/ZcQPF
	 FPONW9KDrPCgChTrt3r2iFjbiuJeIgH3SyM8GShuFjSTy6x6Kf7oWw4NkHEVH7RJXfnRo
	 tMANBM7EnbFtmoKC1/68mDwjo8PxGmwNwgwA9VRj5Lb02hx6mCXeUVtGOFupwv2Zb9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aHa4P0YtaZuvv8+v7789rnOLQIKeJc0wIhDUBtVf6zY=;
	b=oGSOpaFWKPO9o3ozR0FmGnVIyIlmpKKtMG2TW/kf0JWf1FRFSfApp85yTbfVP6drf8TT
	 YCvkVXEvHZ0429F9QMK2CtRGIuFQOLT883hYGXVQjaDsoutBrOVewznXGbww5bZtOjGYa
	 8B1Hp8uA+EoqjWLHbbffwRZpTM1xNtnS61BF3FWhpy6A9baGYp2JP86ulp1ufQBHVrKjx
	 26gksysGp83Ai8ZNokQu2fmDHkvBvXhd4AFfpbU5p7cQYVHshQIOC955u2OE948xSiaGZ
	 1Ro8u8VBHlRO0xPwX23FEdp/AK+xY5WxpPnBH6ab/FtITzBTwQ8gEu6mTxbNMAEHC+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=XQonE5Qm;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD31606A681
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CD31606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=XQonE5Qm
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so15308895e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448147; x=1796052947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHa4P0YtaZuvv8+v7789rnOLQIKeJc0wIhDUBtVf6zY=;
        b=XQonE5QmTSyDMfonUm0D6odshnwM5tHOIljHA3Fsj/l7JPAQZ6yqeSd0FBeqomnf9p
         2IvE5oSqWzvd0pOwxvL4nJFAQ7W983UufoZYgzJoPuvjghxpFNfAfZ7ANEd6N60lzSpK
         4M9ezOaC/V0jPwP8a8u/KPnz16oBHIZcqc96L4RXOv4O40sM2TfW5/I8tJ98PPypty0n
         OQH1ORTWf7ObcFYZ4mCMk7PMEVTPH221p+hGglE9y18vSSDkcRnr5WiwQ8H4Bgnsiyie
         9CEZcYw4ETZTN08iJXmc3LaxJoTvhTOSm93lmJuiQKIC1S7xrlG10KEhmElWLDZYRmAN
         XFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448147; x=1796052947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHa4P0YtaZuvv8+v7789rnOLQIKeJc0wIhDUBtVf6zY=;
        b=bnpc0VTp5Q9MPLRjIYoL8rO5OTs89M5H9YTQT3/ke0ZzVYcl5560h4Odhv6VTq//DE
         3enllSC0tnmASv7kUhtehMLEnHX3sV/9CM+yOOloDaNy2RlzNmXp6lx1EgK4rhPBMKF0
         1hR6LeITm4urAUfIH8UtGO4JqUk0dPHc0yTGr0ZBVVO3JdSP9pvWocTQVMymuVeHG37t
         tm6dNX6QvEBu+1+kYPX0Duk8w17dHJALQv9ps0UHNYXueLoqz9clfinG1uLal4xkPM0C
         sOdMitosE1EEXP9Pwh+m/IRl/d0gKdoXGeFpX9gjM9C3gz55tJfXWNu8TewOpzM+1V7g
         7JAg==
X-Forwarded-Encrypted: i=1; AL+hErG/RCzXqZg/kwfjxYv/Ji9BBzwlNx3KYB5fAW5koPUbE6p2941SG2GF8tQOPGIn7U399Vd1CuDi1kjIMoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dORdGtkPnFOa24Lx8HGKWyjrlIa5GITMnV5K2/9Jtvm1WChXP
	0NDdWkHAIGutXj4yRV84fPzniIhdgeEdmzscKqBY+YCjtVFY8BZX0Z8YfIdCJsH54LM=
X-Gm-Gg: AZFdTZfN+IKKR72ZDysF++bfHb73U4DjTitzNyXTVStwY+3KS+OWJtVX9FTgkoZXkVt
	QS6MiKQI6wS6S3/fnxE4BGQjRsJ4brJVF23o1H9rC6JPxOQIXzRyPXTq7DIW7hXQzVaDWkOA0cN
	2/mkQfeKlGDLTr9j1bEL/s4ouDdvqH1qr2or0AADgLpEQ6Gc6a1LsR+ifVL+9zez/89zbFHWVDZ
	LsEYg0lX/OTdrFn4D+OCW8IIMSAGtmbFCC5hs/R9IT/i02gLEBhwLBHb1mlOL6YZK2ZPOQSZ8KF
	79IVjI/rnnmnwXl0Uey+qcUY8iwrOmTQqoFJ4OHNlj89FLjaxpdZAxVEBL05krXO3bykIGDpPqt
	6lLHGgcr26dKUScp4wMKCGBLpOgomxwQO4URMMAkWw7Q4wYrG+GVPPc3F4Svw8JKY3rKAlviaAr
	D21V4ACwuniLJYhtwJ0O5m9hxC77o/6rQP0jrj8/yx+JY2h+IEUXaIdrraK1lBSuAdtkwMo3DAU
	fXHeCyZGbnqqZ/sAEmJz4yZNeMGh+ITVMNXDndgI1e6PDYmlSsfi+4W9RSe9aR4ImHKKRa+2ra6
	nwIf2/0TGq3SZtKoUWufZ0fPwXPsYUydR68J83eAg2LrAV0EuAzWZOqstvh5eacUDUsSUhpQ9b5
	vH1PmXK1I34DliZpf9jCVjdH8iK3e7K8=
X-Received: by 2002:a05:600c:64c6:b0:4bb:6a75:d04f with SMTP id 5b1f17b1804b1-4bb88807d96mr234285915e9.8.1795448147605;
        Mon, 23 Nov 2026 07:35:47 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:47 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 19:35:36 +0400
Subject: [PATCH v3 2/5] nvmem: core: Let read post-processing return a
 shorter length
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
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-2-40c756dcf36f@flipper.net>
References: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
In-Reply-To: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3605; i=alchark@flipper.net;
 h=from:subject:message-id; bh=nTVuYbBKOZbvakHzhdzTWG9sbZJz+RCYmADvGAiJs8A=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHoeiGEsNpDQ2b79kdqy2a6JKx8U5nXE+tYzXI6xP
 M0k6M7XMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSHWjD8j7pj0Gc8Q0hot/Kan0u63S6+/brq6gyxjsg2JyYvhffL4hkZvkaZS8/
 I0Tpd8L1LgX+fwrR7gSt9plo+E3fbZyMzd2cFCwA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A cell can hold data from which a provider derives a shorter value for
some of its consumers, while others still need the raw cell content. A
CPU ID which serves as the base for MAC addresses is one example: the
MAC address consumer needs six bytes, whereas anyone after the ID itself
needs all of it. The post-processing hook has no way to express that,
as the reported length is always the full cell size, and consumers such
as of_get_mac_address() reject anything but the exact length they
expect.

Let the hook return the shortened length of its output instead of 0,
and zero the buffer beyond it, so that a caller ignoring the reported
length sees no leftovers of the raw cell. Reject a length beyond the
cell size as a bug in the hook. Every existing hook returns 0 on
success, so their behaviour does not change. Clamp the sysfs cell
attribute read to the reported length, as it can now be shorter than
the attribute size.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/nvmem/core.c           | 17 ++++++++++++++---
 include/linux/nvmem-provider.h |  8 +++++++-
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index d976c0d6603b..dde77f78e109 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -384,7 +384,8 @@ static ssize_t nvmem_cell_attr_read(struct file *filp, struct kobject *kobj,
 		goto destroy_cell;
 	}
 
-	read_len = min_t(unsigned int, cell_sz - pos, count);
+	/* Post-processing may have left less data than the attribute size */
+	read_len = pos < cell_sz ? min_t(size_t, cell_sz - pos, count) : 0;
 	memcpy(buf, content + pos, read_len);
 	kfree(content);
 
@@ -1647,6 +1648,7 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 			     struct nvmem_cell_entry *cell,
 			     void *buf, size_t *len, const char *id, int index)
 {
+	size_t out_len = cell->bytes;
 	int rc;
 
 	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
@@ -1661,12 +1663,21 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 	if (cell->read_post_process) {
 		rc = cell->read_post_process(cell->priv, id, index,
 					     cell->offset, buf, cell->raw_len);
-		if (rc)
+		if (rc < 0)
 			return rc;
+
+		/* The post-processor may have shrunk the data: drop the rest */
+		if (rc > 0) {
+			if (WARN_ON_ONCE(rc > cell->bytes))
+				return -EINVAL;
+
+			out_len = rc;
+			memset(buf + out_len, 0, cell->bytes - out_len);
+		}
 	}
 
 	if (len)
-		*len = cell->bytes;
+		*len = out_len;
 
 	return 0;
 }
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..a95529aa3e80 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -20,7 +20,13 @@ typedef int (*nvmem_reg_read_t)(void *priv, unsigned int offset,
 				void *val, size_t bytes);
 typedef int (*nvmem_reg_write_t)(void *priv, unsigned int offset,
 				 void *val, size_t bytes);
-/* used for vendor specific post processing of cell data */
+/*
+ * Used for vendor specific post processing of cell data. Returns 0 if the
+ * data keeps the cell size (the cell's bytes, not the raw length passed in),
+ * the length of the processed data if it ends up shorter (1 up to the cell
+ * size), or a negative error code. The core zeroes the buffer beyond a
+ * shortened length. An empty result cannot be reported.
+ */
 typedef int (*nvmem_cell_post_process_t)(void *priv, const char *id, int index,
 					 unsigned int offset, void *buf,
 					 size_t bytes);

-- 
2.56.0

