Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397169;
	b=Y/QmJE6rzUQB98z4X0VMJj5RPsgT0A4FNo3PjWYAhkQwG3TcOFd87w1WgsEtu7Gb4V6Z
	 YsKGG6yQRrbkktMDzelVv2lZFkN5jFUHWcRwoWlzXgntOKSHGDsYw2i2UPkLvrximT/0H
	 8UMbDfGIKPH68obdSZMeVhfmAX4SXMAsgKMISknyYhv8VgCj8kygKKlOp09allOsMHR52
	 YKBT6xUixt0ljyTUZNIMbzbNc/b82X+4Gs+KRi/EwiOJJssLrJ36lCrtcYuzANss+Qt1B
	 j6XLT5cCpotz2olnH7PWbWBSScn60XhFJ8FH0qwhgKXqL2hI5Q1Ahn4AadjWDhxQ89g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cimu9nETKTzANnWKl7CZH/+vQCY817P3+er3bcrePiY=;
	b=yM2hD3x3uRQL19w6TOS10SqXfrShfv1hA1WSQU+XIkUKJ/CrDD8YDsQj0OqMIFnWl50k
	 22m83N6IhK/S6cMMaC4AJwV+WM+ZariJmJlMuUv6d+Cg5OfiDIw7fvJGByURSjoOBM+CH
	 FytaBSQsRa5wCp+k+VugWoKOwEodQ42nvdhAiUgfont4KID07HweSqQ7ozDAXDQX9KwFL
	 OUGx997NELtuMvUiNUf4EuFSNJGHWDrN5ZMWdmcIVNltqRk/5tWWDYD3PwJkORVG4kELF
	 hAr4XfkCM/2VFdWICWx1ZEYyIkeUZ4udZvejcYxbgH8SD4Rt/zkIqTOe99UR7xk60yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mmsn573z;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42178606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42178606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mmsn573z
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385d8a00598so3738252eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795397168; x=1796001968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cimu9nETKTzANnWKl7CZH/+vQCY817P3+er3bcrePiY=;
        b=Mmsn573zLheQh8oecKAu78QRWle/qzYWibG16asrWsi+UwbDBwMBR9bDeN9ywoAUTk
         2PR0jNM2P5NlsaTFf1Ut4ECa2JDS6ceEoNfEqKCqYCr+55hJUWNwEoAYLpn/1VJT1UzA
         6HANYQFaIMMmHBWp3aEcswX34AYhB0LU3nVCH0F3XNqtOqQYni151IChhqdXBqiIOhIM
         jIR1Sv14ds7J+t3HtjcSE5IRDWiv7vY8d0Bpi9QspvRonPwfhUIRCzbfFh5PQm+UEOf0
         +NObDW0mJNotVXwgR+v0XSGzWaAw5axVGfs/4yMDQE9ZkAAFegCTESZel/FdzHJPbCZ0
         8DMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795397168; x=1796001968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cimu9nETKTzANnWKl7CZH/+vQCY817P3+er3bcrePiY=;
        b=e009/iuFpT+aLtMGiw5dPuxs8xdlIP6lY1Mp/PpnMbuvMJhVJZY6BKH5Jl28xeF4+z
         IyutNQg2tqlomCRqcZJ9vu/p2Ldy+iezErce+h9l8ZkqSrfVVLY/17PM1LxPQYoyDZ4N
         ZhtK+e9z1KKindOSIV5my3rUSTdWUVo5Hh46+M89UmF6tT//aNYbW3w/qyxmyH+kAUAV
         ZsQB+glDA+uoRVIEsGTWdVcEnDCX71/QM7kffkpHkUinCJARIWNpEEHS4RAMXVlGib5A
         sAj1DLdn1Er9wRYhs2mKzFwGWq6mdNF+KOp5aMEWTa6pxXTH0O/2rNWH7ntyvQum1/MU
         0pjQ==
X-Forwarded-Encrypted: i=1; AL+hErFHC0qLhiiTfiFbmRSNTySwdfVqVc5sQrU3jxPUh8qGwTmxvX3QOzPSL3om14qaTFaUO+PEVUneQ6tkpzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gaqJtrMr0Gv2fKEj85aED8ArgiCUMiUL66/VgDzF3cYIwoIgX
	6d9MSNU9XoBll7VwFX2ec3HvQ8mjHr9nebzwa6lfAhh0Xq2oqs1WiNBu
X-Gm-Gg: AZFdTZfejZc/XYR3VlhUQ7fvhLJb6/Fc5VJl87ZTazSUSqk2Jip9hivkV1Sr/RDBf/i
	Sk3eOPE2SS7F/KCth3emqlYRhusN/Y9YmTmrmLceXqBFhLDOlczQqM2fUeBM0ykmUL3UVQvzM3D
	hjbkYSuYYUOvskROM7rnUs8jsGcxNtKE/moZFVuijR0uws8JZjokawJHPI1XgPnPmg6yVcaj9TP
	waXlB6vPjGciq6q24iL6ZvSAvd5KdfNJhgJst3+NWUhq+ACNOe3W25BKvHCEiqMDvjGsSa5DL60
	B+zFfulncnIKsVk/8V7fRdESnHCHGOMa64D3yRBG6LEGA5kDZUduUAzrs6xW5ihAKEKiHcPCPvn
	nM0ckKxRhXlQraxSEpQsj5ePtI8RRE0maywX8Fb5raFl3EZBXAgHG1cAHHX79ZloJWut9mOwdZv
	UhFmrpMzO7ZU/ea8RymuhcV7lCHEvJpZalgiYMAevV/VzL88FrUVMKwapjSnh3F8Ce58UbQzW8Y
	QdCSk6g6n1figOUiTUlUSxpQSPd/XxlUp/Lua7LJ6kWCubIgDx1u1b+DlfqujYdbuBIOhyeqGK0
	iiKvbj7jl74Pjo2+4GGtv+6rT0X4n9mXHQV3fYt/3WJ0+nuiMXCg18mJDWVN9BBfvEuuQVFS4kv
	3B3gIv6+o6HYsCe0INg==
X-Received: by 2002:a05:693c:42d1:b0:386:b0ea:327d with SMTP id 5a478bee46e88-386b0ea3549mr1277906eec.5.1795397168161;
        Sun, 22 Nov 2026 17:26:08 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm26992160eec.13.2026.11.22.17.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:26:07 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] driver core: fix race between bus_remove_driver() and dev_driver_uevent()
Date: Sun, 22 Nov 2026 17:26:04 -0800
Message-ID: <20261123012604.3882115-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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

When a device driver is being removed, bus_remove_driver() removes the
driver from the bus klist before detaching it from bound devices. If
dev_driver_uevent() runs concurrently on another CPU, it may acquire the
bus klist lock after the driver has been removed from the list, read the
still-valid driver pointer from the device, and access the driver's name
while bus_remove_driver() proceeds to free the driver structure.

To close this race window, acquire and immediately release the bus
drivers klist lock after all devices have been detached. This ensures
that any in-flight uevent generation that observed the driver pointer
before device detachment completed finishes reading the driver name
before the driver structure is destroyed.

Fixes: 18daa52418e7 ("driver core: fix potential NULL pointer dereference in dev_uevent()")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2:
- Updated the comment above dev_driver_uevent() in drivers/base/core.c
  to explain the new synchronization with bus_remove_driver(), per
  Danilo Krummrich's suggestion.

Extremely unlikely to hit so I would not worry about backporting to
stable.

 drivers/base/bus.c  | 9 +++++++++
 drivers/base/core.c | 9 ++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 396097fdb316..e7616d0ca854 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -849,6 +849,15 @@ void bus_remove_driver(struct device_driver *drv)
 	driver_remove_file(drv, &driver_attr_uevent);
 	klist_remove(&drv->p->knode_bus);
 	driver_detach(drv);
+
+	/*
+	 * Ensure that any concurrent dev_driver_uevent() that observed
+	 * dev->driver before driver_detach() cleared it, finishes
+	 * accessing drv->name.
+	 */
+	scoped_guard(spinlock, &sp->klist_drivers.k_lock) {
+	}
+
 	module_remove_driver(drv);
 	kobject_put(&drv->p->kobj);
 
diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbe05197d4a0..cc6a1016c251 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2705,9 +2705,12 @@ static const char *dev_uevent_name(const struct kobject *kobj)
  * risky as driver pointer is transitioning to NULL, so READ_ONCE() should
  * be used to make sure we are dealing with the same pointer, and to
  * ensure that driver structure is not going to disappear from under us
- * we take bus' drivers klist lock. The assumption that only registered
- * driver can be bound to a device, and to unregister a driver bus code
- * will take the same lock.
+ * we take the bus' drivers klist lock. During driver unregistration,
+ * bus_remove_driver() acquires and releases this lock after detaching
+ * all devices and clearing their driver pointers. This waits for readers
+ * that observed the old pointer to finish accessing the driver name
+ * before the driver can be freed. Readers acquiring the lock afterward
+ * cannot observe the removed driver.
  */
 static void dev_driver_uevent(const struct device *dev, struct kobj_uevent_env *env)
 {
-- 
2.56.1.750.gf70dc682cf-goog

