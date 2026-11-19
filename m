Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795119135;
	b=MsYj664HIN6jGNvuNWdlpAcCqcYDyyMLG7aPUzH6rt2RDupFw51X6wN7WG0IBXNd1MDb
	 e76teAHF0y2ZpGG2w6Ynb23LYK6bcHzeMGGxnDZne1eHQCFjV9Lm/0arEsrD3wzNfMKHs
	 f471NITc13n8B3Wk7lxw6hy0unMosUCXy9yn1KjhtTwumNYv0+p3U7OpdF+EIpF5eltsQ
	 PhqtVWHpd2XWvZUcI2lKQxs7nM8nOgX9SE3hcepqcNx770c1ga0jhMSb9mN9fmB63Rthg
	 bzFkAetpi7IhLjAFrePC1X6J7Rr1oRslcRiEHcm0aRWoStY6n5M2Puyv25trcd+7BfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119135;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=j02lMfhI7BbUOkng0nJUKj2HAp1hKNzc+uHY4NPEkjo=;
	b=b9pRybHTO0YTalhSj6zkMw3IWSZZy9ytjMewjCud1jmB0IgTzU66vHUE6CXpFJfUmxRj
	 aQf74Wvh0KB1SupcO3ARTUxNFWM49LAxOW8A4Bi3uhrFHx3fQ4kIvX7cYcrdy5P4yvtqy
	 9z/5eWOjgko037rUvECykJH43gvKZdn3Eq4BpU0JDLfHbV1hIPlTonVeHKuAR9De7UjQt
	 i1OyehCniThZ+ouN+IUI5GRtGWtaiGybCHyZkgnNfPjVQ6EKGbbjOsZyu9bjLyoHbfAPi
	 oFQzfVR3+F7VROKowkmLoqwA2AK8PPRl6AQ+YyMeD/VX9l6lsnzKl/LXZKrS0KzdM/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PNCUaB/e";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3423606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PNCUaB/e
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795119135;
	b=uyj/Q+iT/H/Pp2uTR8nHBZwmZtSKjfeV9ZPlvoCkCH0kVaNoof1mGdsNiArSUba7kPsy
	 Od5VQXI2N4n2v6chnLzVo/41nzXkWpeWOQtX0IMgLgDB0Q3QyhKRXu7bI+PGVeAHJth94
	 /GJcn758HRkPF6tyQdtvn0JQCzj2KEt6Q66zcr/txpX7elpraixaufhsjHKBmT9a0dykY
	 rCoYa0cSa8louyLxnpTrXLhx7qFLCNZY1OmUKAfb6ejZQ7GfgVeo2Tqg1cdr1pX/B1vQd
	 yTEb88P/wmYpXnXQ+2F7SRmGyW7K7STMg++KjvS85XbBmdTGDWTyT0svY6NLUaixDEQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795119135;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=j02lMfhI7BbUOkng0nJUKj2HAp1hKNzc+uHY4NPEkjo=;
	b=MC8YJnBAIV19wYI0ayOBeeLmpeQ3jhQxNDQkqmTszp7bBqD3Dkz7WR2vpAtZIEW9Q45v
	 rDTVwejcuTHj0FiA2kl7vqdk/0Wzi7EdFw3UZziMjoekza1xKzcylxQMxbRAfztOc+tTz
	 uJ18hRgM8Z12/wkdNjxQAj+lD0DBMIK3OZHTMZYWgZcPhXLgfl7K0SMJAY6gfo7j9AAS5
	 VudrupWqqZo0vY5KjVu+vCLjumgNTxEGK4NlxGdaiSVHpjtLukFPXdYVSCmTh1mahztgp
	 4jaOtt0gZaoBLz3O1gTCeHQL+g2pzyMTmVRezjNGzL+uHUDyUMZZWODT9wDBHGqn00Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A0FF1F000C0;
	Thu, 19 Nov 2026 20:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795119135;
	bh=j02lMfhI7BbUOkng0nJUKj2HAp1hKNzc+uHY4NPEkjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PNCUaB/ej83IG3RhhiZLIfe0/U6UfFob9AcwFUndQqVrVSSveCB05xwGQspMhiwUc
	 YuKlZQ9MLzD+oR/yr4rhvYS6sYOC6gjbWreFcU0hpiqSIMggOggxhy6zzfcqu0ru0R
	 8tgSmBDfNbgzEl39Yr9Ix5zdiLmdET6Ck5r1pExtpn2mcBgn4W1ddTSOhcsY0mT5ku
	 NrtVGed/TAPtGP7me2MqqQQ5bWEBXXHf7fC6JkAh4ZlbB3Ugzf7b1OrnUmIxpHt1r+
	 cC9XkFJekDXTt7muu1cNSGzIeb5IpqQYfYSd9tOheQS8GD/BROf+K+9j1PPxeHGsCM
	 67EML0atEsZbw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 059524B41C;
	Thu, 19 Nov 2026 20:12:14 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 20:12:13 +0000
Subject: [PATCH 1/2] w1: Free the slave from its device release callback
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
Message-Id: <20261119-w1-slave-release-v1-1-c2948c825d08@gmail.com>
References: <20261119-w1-slave-release-v1-0-c2948c825d08@gmail.com>
In-Reply-To: <20261119-w1-slave-release-v1-0-c2948c825d08@gmail.com>
To: krzk@kernel.org
Cc: josef@toxicpanda.com, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795119133; l=3501;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=h00RIfaNaF6buZJJbs9syNwkmQRRBcWSBtsJmdwtlnA=;
 b=7OLNMn9Ir4zOshS9QgYQTJmK8jJyJkZYGm2mG/g+CbII57ps5MS3QThx3vcz8JB1MWazUu71V
 1tvP/q+GdKIAYH8YX7nAXD6dNzwh9v+Xj7wxZCnkREd85P4HAAaar3+
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

w1_unref_slave() frees the slave right after unregistering its device:

	device_unregister(&sl->dev);
	...
	kfree(sl);

but sl embeds that struct device, and w1_slave_release() still uses sl
(sl->family, sl->master) when the last reference to the device is
dropped. If anything else holds a reference to sl->dev at that point,
the release callback and the kobject code run on freed memory.

Before commit 9fcbbac5ded4 ("w1: process w1 netlink commands in
w1_process thread"), w1_slave_detach() waited for the release callback
to complete before freeing the slave; that commit dropped the wait.
The attach error path has had the same problem since commit
0ec4eb71b495 ("w1: use put_device() if device_register() fail"): it
frees sl after __w1_attach_slave_device() has dropped the device with
put_device().

This is easy to see with CONFIG_DEBUG_KOBJECT_RELEASE, which delays the
release: adding a slave through the master's w1_master_add file and
removing it through w1_master_remove gives a series of KASAN
use-after-free reports (in __run_timers, __queue_work and
w1_slave_release) on the object freed by:

  kfree+0x176/0x530
  w1_unref_slave+0x38b/0x510
  w1_slave_detach+0xbf/0xf0
  w1_master_attribute_store_remove+0x137/0x240

Move the kfree() into w1_slave_release(). The attach error path now
relies on the release callback as well, and no longer reads sl->name
or sl->master after put_device().

Found with a static analysis tool and checked by hand.

Fixes: 9fcbbac5ded4 ("w1: process w1 netlink commands in w1_process thread")
Fixes: 0ec4eb71b495 ("w1: use put_device() if device_register() fail")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Tested in QEMU (x86_64, KASAN, CONFIG_DEBUG_KOBJECT_RELEASE) with a test
master that has no devices on the bus: write a slave id to w1_master_add,
then to w1_master_remove. Without the patch KASAN reports the
use-after-free above; with it there are no reports. The attach error
path is not exercised by this test.
---
 drivers/w1/w1.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index 8b33d933a582..bead2fa08c8b 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -80,6 +80,10 @@ static void w1_slave_release(struct device *dev)
 
 	w1_family_put(sl->family);
 	sl->master->slave_count--;
+#ifdef DEBUG
+	memset(sl, 0, sizeof(*sl));
+#endif
+	kfree(sl);
 }
 
 static ssize_t name_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -761,10 +765,10 @@ int w1_attach_slave_device(struct w1_master *dev, struct w1_reg_num *rn)
 
 	err = __w1_attach_slave_device(sl);
 	if (err < 0) {
-		dev_err(&dev->dev, "%s: Attaching %s failed.\n", __func__,
-			 sl->name);
-		atomic_dec(&sl->master->refcnt);
-		kfree(sl);
+		/* the put_device() in __w1_attach_slave_device() freed sl */
+		dev_err(&dev->dev, "%s: Attaching %02x-%012llx failed.\n",
+			__func__, rn->family, (unsigned long long)rn->id);
+		atomic_dec(&dev->refcnt);
 		return err;
 	}
 
@@ -806,10 +810,6 @@ int w1_unref_slave(struct w1_slave *sl)
 
 		w1_family_notify(BUS_NOTIFY_DEL_DEVICE, sl);
 		device_unregister(&sl->dev);
-		#ifdef DEBUG
-		memset(sl, 0, sizeof(*sl));
-		#endif
-		kfree(sl);
 	}
 	atomic_dec(&dev->refcnt);
 	return refcnt;

-- 
2.34.1


