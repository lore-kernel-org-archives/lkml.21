Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795119135;
	b=1sQYdSstEu9vt5Nzp7AYJZFN/rA/4cLeB7k43NcRBjiPO/hRT74ZmYuaYT+Nb1+vl8CI
	 OS895j95C0NqLO82v7x6e+4SijdJYxPCy30FhDMgfH3NDzIbCIbDo4GQk7qXOV1Sf19HY
	 VYjKDC8FPnHlGF8BmxT6IhomDIYu6WNtN5G2uEmrw7rlOQiCwEIerJ110Tlq2H1MYIyP6
	 ePhvdOMHsFHGBUTzYiK1sutMIONcUo6en+L4RggeJQMFgIcowEGSEYUoXYWZYTynnkn43
	 0W4ZZfWVD+1ZR8AULwzGv0p5ZjZS5aXw4pkxfchInHQyMb1CE17chFEA8A2yxtQQIwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119135;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=r4OUHOcaDs/mss3vP40Xm/9nYvkIKRfKVKfRHY+ZAgk=;
	b=ENMY8F6SqPHPVZdG5G85mNnGtNnhzF95GQiL3oG9LF4jcLldDjICoGzCkDKSs0Mx00+7
	 lFVb/oxyyxXvvSYN0u3JQBSaLU6VxTuhV8PxrpD4ht0tpEZoM2HTOMFRE+547xOWdOF6v
	 ex4HIxgZMX72TUpuPD5qSZyjC6v8gnlzLWrEJe0znbyDZ0ztCKXJBql+ai1D+kCuNcCTW
	 Wl0rujTAwxlf80wrP3G+imDroY3ZvH2prcH5HpPclYOHRwU/KT7aaRn0idVBLv8rFIK8c
	 Wxp8sgHU5nz/sjK3N2beoKDuPn1scv6+bRCrhW0UegZ6Nuwj7rBj2BvKNYS/K+Sajaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ErXLhu1W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33FF606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ErXLhu1W
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795119135;
	b=hT968uCwdDppwjdWKF3f0xjsN6LRinXe3K4UN+lBVjNgtB7n+teF+FvhcvXtatk+P6TP
	 MAmFL1Qma/BvXg9FVcpjTmcgQDgdYJKkyIAWhrTlBxcpfkB41m6rUJhuMyf41ZSEIZVPx
	 9FIgziKKXfZw3Hk1iIaB2JIhFkIzGMJADswovrwb3naVo7AzTThb0X+HX+7PkFlF3PFgr
	 IJnQ/IbnPr7koy4hfasjV5R6esEgtx5/xuvxWYw+0FoWppGEZoYFlsaKpiLav7IyQfHnb
	 biET3A4Ce3nShBp3YhzXGoFIBmAdhydLyA0/9ae6OUmBjiCa1yiDq9ax49MOuPu0JcQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795119135;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=r4OUHOcaDs/mss3vP40Xm/9nYvkIKRfKVKfRHY+ZAgk=;
	b=aE7tQxfV+v7kMEx6Y1twkmBrG2BZaIy+5FMK0TEgQaYGllT6ETElXFnqWvqteCGywNKS
	 0UOyYWuT9vAJUWMNNgvWOMmnZUbwKLljqZaeg3+qjw/oue/DuSJH52pU9ez+Dx2UiQ0Bg
	 rQW6fBjcGPBieOECOrvzD+0aCK++kLjzUT7vIbqEyhlvTEzu0TtldiNJBF3gIvCcqW/na
	 ZuY2fVIUobEEERkakUpK+eiD7NQLMohBNmxitJG7RLl/29LDCL2LOKfvmeUWkYO5AIkR8
	 HMd4W87r8atEKlC6F9rqX9tMN1qx61+1xopCkWN10CFQVbzV553FtDrhV3YfWhGX/TQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95CA01F000C6;
	Thu, 19 Nov 2026 20:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795119135;
	bh=r4OUHOcaDs/mss3vP40Xm/9nYvkIKRfKVKfRHY+ZAgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ErXLhu1Whmi7n47WdPY4/BKGEJjHRKCzdGvKEGi7vDfOClYP4jcA1q0SGB/sRgKMc
	 KmCwqNnwAlf/FPtl8FhxgTqgGIdYwFyIyeMbjuBuWpT0tSWgUrJ7PlfaRa+NLGkOzR
	 4gzwbuOQnII/A9yW2vxvsPXiLhVQskdlfDCeTXrne7gYND55E/apdlRJ5HvFF600+4
	 w4V1a/p2pAhqxiciUAvjIubEUAYWbG2OETYGWLQmbGEnODkkj4P/XqAv3JbRf3Xz7Y
	 dui4pSoyVUej37NmkbcLcVHGh4iJ7KUc+r8Iu0Zzupp3prUZUtaeMUs1vFV5sxOcs5
	 IWZtegvcNgCsQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1D7084B421;
	Thu, 19 Nov 2026 20:12:14 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 20:12:14 +0000
Subject: [PATCH 2/2] w1: Keep the master alive until the slave is released
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
Message-Id: <20261119-w1-slave-release-v1-2-c2948c825d08@gmail.com>
References: <20261119-w1-slave-release-v1-0-c2948c825d08@gmail.com>
In-Reply-To: <20261119-w1-slave-release-v1-0-c2948c825d08@gmail.com>
To: krzk@kernel.org
Cc: josef@toxicpanda.com, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795119133; l=2640;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=s7xxV1z0BqGEA94eM7oLKVSYG0/TyrMlUWouAQlJF6Y=;
 b=IYkHBgy09w1VAi/qYFgCX+/Av1jwGZk/juotQBNCxqYE2MnArmRg1E6odQJs7djcFrWIsV1z0
 pXAVa9JTl/HA5yC+1RXUcKHHOEYA7BWcIPjt96cg5Rt/BJ29BIJ8Fc5
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

w1_slave_release() updates the master's slave count:

	sl->master->slave_count--;

but the slave holds no reference to the master. The reference the
slave device took on its parent in device_add() is dropped again in
device_del(), and w1_unref_slave() drops the master's refcnt right
after unregistering the slave, so the master can be removed and freed
before a delayed release of the slave runs.

With CONFIG_DEBUG_KOBJECT_RELEASE and the previous patch applied,
removing a slave through w1_master_remove and then removing the master
right away gives a KASAN report in w1_slave_release(), reading the
4096-byte w1_master allocation freed by the master's release.

Take a reference to the master device when the slave is attached and
drop it at the end of w1_slave_release(). Before commit 9fcbbac5ded4
("w1: process w1 netlink commands in w1_process thread") this could
not happen, because removing a slave waited for its release.

Found with a static analysis tool and checked by hand.

Fixes: 9fcbbac5ded4 ("w1: process w1 netlink commands in w1_process thread")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Tested in the same setup: six rounds of adding a slave, removing it and
removing the master right after. With only 1/2 applied KASAN reported
the use-after-free in w1_slave_release() in four rounds; with both
patches there were no reports.
---
 drivers/w1/w1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index bead2fa08c8b..348edc5bf455 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -75,15 +75,17 @@ static void w1_master_release(struct device *dev)
 static void w1_slave_release(struct device *dev)
 {
 	struct w1_slave *sl = dev_to_w1_slave(dev);
+	struct w1_master *master = sl->master;
 
 	dev_dbg(dev, "%s: Releasing %s [%p]\n", __func__, sl->name, sl);
 
 	w1_family_put(sl->family);
-	sl->master->slave_count--;
+	master->slave_count--;
 #ifdef DEBUG
 	memset(sl, 0, sizeof(*sl));
 #endif
 	kfree(sl);
+	put_device(&master->dev);
 }
 
 static ssize_t name_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -735,6 +737,8 @@ int w1_attach_slave_device(struct w1_master *dev, struct w1_reg_num *rn)
 
 	sl->owner = THIS_MODULE;
 	sl->master = dev;
+	/* w1_slave_release() uses the master, keep it until then */
+	get_device(&dev->dev);
 	set_bit(W1_SLAVE_ACTIVE, &sl->flags);
 
 	memset(&msg, 0, sizeof(msg));

-- 
2.34.1


