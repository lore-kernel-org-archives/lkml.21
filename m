Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082776;
	b=VZenXqAphMGAdjfHDrO8yYIPkAXPe7b1I3XwZp6X5rSbKVki722P9z2ewkqbfBakrv0y
	 C19L7ZooDFnkbD/dt0GaCHBuILM/VEGK8ZJ1dFpY34ab6j5e96E12kSfqE13MKFGW8xM5
	 33ddUMdXNN5CV/ffbQ3kvq6PTiar4IBpw5WTeGBrs66eRaafksNxihQrulOfK5lo2pAjJ
	 Hxn1Rlckd3Yn8nxHn+XqFWwZ4B0jor9ISsfl4y/A+HRfRPZXBmQYw3XLyoRRtZwtgE2c4
	 QfUeDoI+fuNenRlxTqAWmvH5d6EdxKrWWdrk2T7aIMJtMU0brbvMNXb9VkNJ7ig9h8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G+yf8Opi/PoX6Tds8cSLMSM4duoTp3+4gtT19yIltIM=;
	b=P9gW80A4vaZ2QDPTYxW44OlTBxVmQvqnBVNWBwyZr2K2dW786bH5EuWstVIhBl4NUh4S
	 VHNIvyZZk+zaIsiHE52qy4gq5pb1kJ7/HxrEpK2mnSQ3xb2hXV+O6vUtI3duru1LoPBAg
	 0l1ygyDCkyIObKd+Qq6Oob5Wv0fEWNBb6WZXKNzoPIxmVm6K9kaUb9v+/ty7epWJ7xsJY
	 XYhA4fJ5//RPeZPE3fctdWXCws/St+WDQGpJFv64Wnj0JF92MqPBhQoDrbb5zECuD0jgo
	 zXBG4DOPNL1xMtIlrsYlAY0X6VrYyrJqJZ2M5IjYTF1temwUNpteogXXsbt3tZi8JVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vYiDeVvD;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E34606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07E34606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vYiDeVvD
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1224279a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082775; x=1795687575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+yf8Opi/PoX6Tds8cSLMSM4duoTp3+4gtT19yIltIM=;
        b=vYiDeVvDZZwO3XnUHlYSAYnOM7R82X2/ZhQ30J1E4KOLubASfUN0xid/RcP/M6xe2e
         VN+Z2NYlzDCwj9pQE13L9P7xalWnZfAnwftfOEo4l+9k24BfjxYk2hExbx0dkgRC514S
         ChaJikPDl98E03ZSoONWrIPvSFhNVO/tFZehVH2y+xiLi7TFIuZ0910eMcUfBsEkSxhQ
         +y52k4tm4k++EffDiRQMDmwkbsyAWweUpaVtMUvt4JIyrBq74KZqmjxR2StMkkCrUtjT
         I+1aheebLQcWNMZfvCld/GdoKykFW4AhBEgoevqoRv6//N8dE3w8+8yaM9pvY6ul6s8c
         cTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082775; x=1795687575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+yf8Opi/PoX6Tds8cSLMSM4duoTp3+4gtT19yIltIM=;
        b=mD61p1yPyVt9SzVYtXs9aECtx6ZVSXERpkU/HK455Sc51fRcbv96c096AKJxNyg5yf
         PVBAhtSOpNsuZRE8zZaZA6tdhvyRTNQE18pCaPdpmS18ChuEBqnFu/acn3Emr/QRkxFS
         zfa/BNJeBmgsxdgECrOhO6NLLIwHBfUuW/lvrcC4XKJ5Y5MrQ3ESTQ6v8Fi12H4kjK4S
         9IaPUy4r/oVKop/4NU7B4A0EFG1g7QIwrrpLiVmnR87VjT6ukzATiOYMJtPavwsIsZsm
         Djo4f2hJtWJZHGGAOWB8J9rGDJEKY73UxEvMS3uSHzhWtSwh00ZqNrO6v4iTV5oIe5RL
         DgOQ==
X-Forwarded-Encrypted: i=1; AL+hErGGZPrdBWYkJmU3VomWMQy9brfxMyXVEytSUEAJ8MreyazrubxyLByGqPMzubq7Mq3kR4HuPyod/dFRI1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GTSq8awqWZ6F3FyhgFfv4rqvBbuJOB1DlC3K9R301tBNhV51X
	qnOHWcdIgPvOXUA/bP1TuE2OUcM1Dcm4kOxd47L6xUcUUtt0C4an7LE=
X-Gm-Gg: AZFdTZfJsNHDs7YcVCJQeX4mN3Gz5l3fj6uRG5Fyh8Hht08523t9e8p50R0dPjXCO/6
	AzqKqeYQ7FLZnC4DymXVhIjKsQ6FVzX83io+jy76ecG5ORfr8c7LVO5i5P0mqDv33zMc2nYm+T3
	sF44c0ISajxE51wZzGjUx3coGZbhpFsGWcUNLM0KOlNEGAlo+EullWyV4zg4W1ZUci7UXjsO4lz
	tJIXKFL1hPkb11CG99I1Pxav/c3uLVKC6zHB6pT99zhhXE9+kV4GNGcp5brqx+a9c6HVjExNDMs
	u2G8xzWYHPI1SC35wjC0RgGVPohBZi5jC20wPLpF7vEjTEwK+DRxgtTuZoYHIKTDEP7ewiYlnS+
	n9eViMhLoCLDNv3jnTK1FYEXPsPwEXSfIdneyveOgiJgcMXfOA32ZgsLlzrQ0T66IOBD4Cvj+ln
	nudiaDLDrnuZ5Z8cH6GFyxlgrBzCJ7wnuhjAsxNntXhPJTJWwPt8HUZ9uHTa+Z4mLz8zkNhRvbA
	iSs8wV2Uowoj/isKG9t9w31lsImET/G30bvbGK4iTkN9j8d1XAaoROzRKmFN16eFKSJXJXZh/y0
	xUxhQB+RNbaK+i1hKh6b3oN2ylaLyRXY63cZcv2e08mDG2MOUHRlKL2qEPjiAyyRSgsy
X-Received: by 2002:a17:90b:1dcf:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3b3d0815de0mr5023900a91.64.1795082775366;
        Thu, 19 Nov 2026 02:06:15 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:e9b9:3878:5565:ae99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm28622955ad.76.2026.11.19.02.06.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 02:06:14 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Eugenio =?utf-8?q?P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Francesco Valla <francesco@valla.it>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH] virtio: Release the OF node when unregistering the device
Date: Thu, 19 Nov 2026 18:06:06 +0800
Message-ID: <20261119085343.virtio-of-node-a02bd3cf522b@gmail.com>
X-Mailer: git-send-email 2.50.1
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

virtio_device_of_init() acquires the OF node reference once during device
registration. virtio_dev_remove() currently puts it on each driver unbind,
although rebinding the driver does not acquire a new reference. Repeated
unbinds can therefore consume references not owned by the virtio device.
Conversely, unregistering a device that never bound to a driver leaves
the reference held.

Move the put to unregister_virtio_device() so it is paired with device
registration. Save the node pointer before device_unregister(), which
can free the virtio device, and put it after unregister has completed the
driver removal.

Fixes: 694a1116b405 ("virtio: Bind virtio device to device-tree node")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/sashiko-outbox-203883@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
The same OF node mismatch was independently noted in the linked review.
Compile-tested on 2026-11-05: arm64, GCC 14.2.0, W=1,
drivers/virtio/virtio.o; baseline and patched objects built without warnings.
The code diff is unchanged from that tested version; this refresh adds
the public report attribution and updates the mail headers.
On 2026-11-19 the patch also applies to the identical virtio.c in mainline
4405c18c95d2. No new build, hardware, boot, or KASAN test was performed.

 drivers/virtio/virtio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index a8588d7ad109f1d65135dc7394b1dd4ae04978f1..c8be1a3f479d6abf1249f5fde66b6c93cb260d0d 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -381,8 +381,6 @@ static void virtio_dev_remove(struct device *_d)
 
 	/* Acknowledge the device's existence again. */
 	virtio_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
-
-	of_node_put(dev->dev.of_node);
 }
 
 /*
@@ -604,10 +602,12 @@ EXPORT_SYMBOL_GPL(is_virtio_device);
 
 void unregister_virtio_device(struct virtio_device *dev)
 {
+	struct device_node *np = dev->dev.of_node;
 	int index = dev->index; /* save for after device release */
 
 	virtio_debug_device_exit(dev);
 	device_unregister(&dev->dev);
+	of_node_put(np);
 	ida_free(&virtio_index_ida, index);
 }
 EXPORT_SYMBOL_GPL(unregister_virtio_device);

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
