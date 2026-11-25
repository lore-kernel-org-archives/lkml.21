Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615201;
	b=elouKFkJFL5qGtUdwTovbR0nr20V7QldiA13wQJgebnw77rBAB9URLEUkYW86iCz3kqq
	 gnUuAzZAVQ9UPj5ud4W8G+wUCXVwMP036Inx1fN3peEPJuZDTx5vawr57apvDlhu2omS4
	 4RVzwTfTxthidiJMaNs9iCFNof1XcOHhQemXxr5M9xnMe+fFbsRPH5qngqDOF97Oa8K3i
	 r7ril13NdVx7ffCtrK5jAPw4Jk/3Dfn/BRlU+Z7AUkPg1zJL+ukfjsZk4OS+vEF0AEr6a
	 e1pWFY77qC2t9oRDv+iF/OLVREFf8Zhhqd8zH1FctHHgPm3ZOreEoiSZbUASbwQnHpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615201;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=c36F0F8p2Ddwd65oCk1NI1rN77BvZN5Hpjrmjl/Cndo=;
	b=1GDQyFUOHQSXasiXoSkybsfWVRHH2YsQdjmV/VCIOo3wONh12fvVV8aCa302LWvalfoY
	 o3AwaKJhSnBSIQsbWXy2n3B2eNyQBNBPeQEj1AyRrEbk8lNXXzLUS1DBpfir4hBgOrb5F
	 lEw4vx+M0J8Yq22SCoCnXG1ySaY4JRrnOYEdwGKTSIuvVOoWpOFFnX57vvKAbZ6K1Ihsv
	 eh2Bm8+Myca9lQZyILya5F/KLVgdilE31LNjBN3whYfVc9aURqTnqPlHgXOXtBMUC8LKT
	 DZtGse3/BZkzrTr1rhjmGxtjsdcQDirVFdaXVnNbW+OQzvbnjPSVVCwrYLl+hTMhmDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="i/U6d6Pj";
	arc=none smtp.remote-ip=95.215.58.223
Received: from mta1.migadu.com (out-223.mta1.migadu.com [95.215.58.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40567606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40567606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=i/U6d6Pj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=i4tUwqwMir5IjVvCuxmG7hNX0r3y/xTdeN3ZJkJQ49U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795615198; v=1; x=1796219998;
 b=i/U6d6PjTW3HMgxo8xfWs6lLZYcXJ79TAwrEZIzhcKNPdNNvuIw33qY1vzxWc0HsBUqf3+ye
 AjVG5oNXhithahJ1BHWi3BTC+SBTGUwW0wOL5JZVBd8147EJZ2kKNajXTuqbHvjpGRaGbuGa6b9
 LWa5Zl8IWfK3G6hHUDLtSCo0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 1967e28d8d3ce78c;
	Wed, 25 Nov 2026 13:59:57 +0000
X-Mizu-Trace-ID: 1967e28d8d3ce78c
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Wed, 25 Nov 2026 21:59:42 +0800
Subject: [PATCH net-next] bonding: undo enslave state when XDP setup fails
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
Message-Id: <20261125-bond_xdp_rollback-v1-1-35dddaa337ba@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMAwAf2Xk2cJSpxN/RWSsTdToSEdbpTD27
 6v6eBx3CySOwgnOzQKRP5IkaAXcNeAfo97ZCFUG29ojou2MC0pDoXmIYZrc6F8GT71ve9qjPRD
 Ubo58k/J7XkA5G+WS4fo36e2e7PN3Ceu6AZbR5Ql/AAAA
X-Change-ID: 20261124-bond_xdp_rollback-187c07d3125d
To: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

If one of the XDP checks in bond_enslave() or dev_xdp_propagate()
fails, the error path jumps to err_dec_slave_cnt. By then the
function has already incremented the bond's promiscuity/allmulti on
the slave and synced the bond's addresses to it, and has added the
slave ns maddrs via bond_slave_ns_maddrs_add(). None of the existing
error paths undo those, so a failed enslave leaves the slave with
stale promisc/allmulti counts, synced addresses and ns maddrs.

Add the missing undo steps at err_dec_slave_cnt: remove the ns
maddrs, decrement slave_cnt, and - only for modes that do not use a
primary slave, mirroring the code that applied them - drop the
promiscuity/allmulti increments and flush the synced addresses from
the slave.

Remove the ns maddrs a second time at err_close. If the new slave
was selected active before the failure, err_detach demotes it via
bond_change_active_slave(NULL) and bond_hw_addr_swap() re-adds them
after the first removal, leaving the addresses on the slave as it
leaves the bond. This second call runs after that re-add; on every
other path it is a harmless no-op, since deleting an address that is
not on the mc list does nothing.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
For Sashiko: please ignore the possible ndo_xdp_xmit null pointer issue in
bond_xdp_xmit(). It will be fixed in another patch.
---
 drivers/net/bonding/bond_main.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 776afdb9df43..a3daf005b444 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -2364,7 +2364,16 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 
 /* Undo stages on error */
 err_dec_slave_cnt:
+	bond_slave_ns_maddrs_del(bond, new_slave);
 	WRITE_ONCE(bond->slave_cnt, bond->slave_cnt - 1);
+	if (!bond_uses_primary(bond)) {
+		if (bond_dev->flags & IFF_PROMISC)
+			dev_set_promiscuity(slave_dev, -1);
+		if (bond_dev->flags & IFF_ALLMULTI)
+			dev_set_allmulti(slave_dev, -1);
+		if (bond_dev->flags & IFF_UP)
+			bond_hw_addr_flush(bond_dev, slave_dev);
+	}
 
 err_sysfs_del:
 	bond_sysfs_slave_del(new_slave);
@@ -2390,6 +2399,7 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	slave_disable_netpoll(new_slave);
 
 err_close:
+	bond_slave_ns_maddrs_del(bond, new_slave);
 	if (!netif_is_bond_master(slave_dev))
 		slave_dev->priv_flags &= ~IFF_BONDING;
 	dev_close(slave_dev);

---
base-commit: a4c450594f5d1dc0fc4daacfb95d40554d99dead
change-id: 20261124-bond_xdp_rollback-187c07d3125d

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

