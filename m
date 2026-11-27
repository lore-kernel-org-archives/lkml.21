Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761469;
	b=uGVQaWI4L2qSMZ1h0HwjSyIRDcbOlEV5wHVf9xQdDSy6b+6XMxPyrN8dYQIbnjGzfLAq
	 /voaFEAFFfqFZpHvR/gQh/S2adOEayn/sf/5E6p9DUd9qpukKpOVDoBrfG2lwwtVxyUqS
	 9kuy5siBDm/LLb+PmE6ym2i1MJ7e99u4qb1oWE5t8kqI+7yAtepcynsBrrpQV6wtCsMNE
	 elQjM74+gurEweNrGEIZj258ox53XVRYV93pUhLMPCjhJcQ8UkDUU/N/gQSFoCo4EuQdO
	 AyqDldVGZkPI5FK8ko8wcnMn2FXErl/4XxKxTgEVL7AHnXzAz7JKze838cH5T6rRviA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761469;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=E2wmtb0wcDKKCs321oPWCjIyUWd2kHhLtPftKss7IzM=;
	b=v7wsCP/PftWoBi+bWDCM0mHzVdjsktZlejS0YSbEycUkl0zDf894gwc5GF+lMNOl9JRM
	 6RwMYtFFXUnIE9CmJWLJcu1FGEssDsbVb67FxQLwXknvhDNbUBB8nj6NSDfLudRfozBfq
	 Nj6BqWwC3WEcwxeTe7TjCJ4iyQX8nj/GDPUQ1lygmRYIZADpvCW+8DmRIqpzOk4Dpq2Ry
	 OB1Ssq/THQpSwRR7tunUxMem4i1DjOAgMaIoAVgfvgRDN1ZCrDyhGtPm0/C5WshNF+jJk
	 flKxhhHs8m2F1LUSh6ucQOqr5P8RCP52qy/Iu/vgI5Wsafk59g7+yt5AtuK1Tpk0/Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TvhJ11L1;
	arc=none smtp.remote-ip=91.218.175.216
Received: from mta0.migadu.com (out-216.mta0.migadu.com [91.218.175.216])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25E1606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25E1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TvhJ11L1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hbTakbmtjSC1ddEG1VRWcdm081coIzduXAdgrdbQ2N8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795761466; v=1; x=1796366266;
 b=TvhJ11L1NYTdAaLzhMpp0g+J72SYeZc8KzWekvqX+2lNy3bsHrs7yNcxJ6mt6yzN0N9Mes1P
 qdFFKkHOMTd2GnO1A77FZ/UG9vicGi+lWNU1OyEYHOp3KbP2+8e/KkgonRAtFII177kMM3nqCY+
 oeWlRXdsMRQMJSNBCSoBAFcg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 6e902a76121439d6;
	Fri, 27 Nov 2026 06:37:46 +0000
X-Mizu-Trace-ID: 6e902a76121439d6
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Fri, 27 Nov 2026 14:37:28 +0800
Subject: [PATCH net-next v2] bonding: check XDP support before enslaving
 changes state
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
Message-Id: <20261127-bond_xdp_fix-v2-1-1e05818a41ef@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/21NSw6CMBC9Cpm1NbQFFFfewxAiMMiomZK2Egjp3
 S24dfXy/is4tIQOLskKFidyZDgSdUigHe78QEFd5KBSVUipMtEY7uq5G+ueZqH7HJsi1xFTiJX
 RYpT3uRswesE4e6h+jvs0T2z9trZlB3Le2GV/nuTe+H8ySSEFFqfyrEuVaZVdX8ub2Lhjy1CFE
 L5dGfHRxQAAAA==
X-Change-ID: 20261124-bond_xdp_fix-3f5eb6533f50
To: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

The XDP capability checks in bond_enslave() - ndo_bpf/ndo_xdp_xmit
presence and whether the slave already runs an XDP program - run only
after the slave has been opened, linked and published to the
datapath. On failure the slave may already be bond->curr_active_slave
or reachable through bond->slave_cnt and the upper device list, so a
lot of state has to be undone, and bond_xdp_xmit() can observe the
slave before its capability was ever verified.

Move both checks into the validation section at the top of
bond_enslave(), before the first state change, so a rejected slave
returns directly with nothing mutated. bond_xdp_set() repeats the
same two checks for every slave, so factor them into a common
bond_slave_xdp_check() helper used by both paths.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
For Sashiko:

please ignore the bond's promiscuity/allmulti/ns maddrs leak issue
when xdp setup failed. It will be addressed in another patch.

please ignore the no unwind for bond_3ad_bind_slave if
dev_xdp_propagate failed. It will be addressed in another patch.
---
Changes in v2:
- move the duplicate checking in bond_xdp_set to the new check function.
- Move the bond_xdp_xmit() fix in another patch and target to net (sashiko)
- Link to v1: https://patch.msgid.link/20261124-bond_xdp_fix-v1-1-e67983924324@kylinos.cn
---
 drivers/net/bonding/bond_main.c | 58 ++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index de933245b12b..757ab7fa63ee 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1866,6 +1866,26 @@ static void bond_ether_setup(struct net_device *bond_dev)
 	bond_dev->priv_flags &= ~IFF_TX_SKB_SHARING;
 }
 
+static int bond_slave_xdp_check(struct net_device *bond_dev,
+				struct net_device *slave_dev,
+				struct netlink_ext_ack *extack)
+{
+	if (!slave_dev->netdev_ops->ndo_bpf ||
+	    !slave_dev->netdev_ops->ndo_xdp_xmit) {
+		SLAVE_NL_ERR(bond_dev, slave_dev, extack,
+			     "Slave does not support XDP");
+		return -EOPNOTSUPP;
+	}
+
+	if (dev_xdp_has_own_prog(slave_dev)) {
+		SLAVE_NL_ERR(bond_dev, slave_dev, extack,
+			     "Slave has XDP program loaded, please unload before enslaving");
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 void bond_xdp_set_features(struct net_device *bond_dev)
 {
 	struct bonding *bond = netdev_priv(bond_dev);
@@ -1955,6 +1975,12 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 		return -EPERM;
 	}
 
+	if (bond->xdp_prog) {
+		res = bond_slave_xdp_check(bond_dev, slave_dev, extack);
+		if (res)
+			return res;
+	}
+
 	/* set bonding device ether type by slave - bonding netdevices are
 	 * created with ether_setup, so when the slave type is not ARPHRD_ETHER
 	 * there is a need to override some of the type dependent attribs/funcs.
@@ -2318,15 +2344,7 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 		unblock_netpoll_tx();
 	}
 
-	if (!slave_dev->netdev_ops->ndo_bpf ||
-	    !slave_dev->netdev_ops->ndo_xdp_xmit) {
-		if (bond->xdp_prog) {
-			SLAVE_NL_ERR(bond_dev, slave_dev, extack,
-				     "Slave does not support XDP");
-			res = -EOPNOTSUPP;
-			goto err_dec_slave_cnt;
-		}
-	} else if (bond->xdp_prog) {
+	if (bond->xdp_prog) {
 		struct netdev_bpf xdp = {
 			.command = XDP_SETUP_PROG,
 			.flags   = 0,
@@ -2334,13 +2352,6 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 			.extack  = extack,
 		};
 
-		if (dev_xdp_has_own_prog(slave_dev)) {
-			SLAVE_NL_ERR(bond_dev, slave_dev, extack,
-				     "Slave has XDP program loaded, please unload before enslaving");
-			res = -EOPNOTSUPP;
-			goto err_dec_slave_cnt;
-		}
-
 		res = dev_xdp_propagate(slave_dev, &xdp);
 		if (res < 0) {
 			/* ndo_bpf() sets extack error message */
@@ -5735,20 +5746,9 @@ static int bond_xdp_set(struct net_device *dev, struct bpf_prog *prog,
 	bond_for_each_slave(bond, slave, iter) {
 		struct net_device *slave_dev = slave->dev;
 
-		if (!slave_dev->netdev_ops->ndo_bpf ||
-		    !slave_dev->netdev_ops->ndo_xdp_xmit) {
-			SLAVE_NL_ERR(dev, slave_dev, extack,
-				     "Slave device does not support XDP");
-			err = -EOPNOTSUPP;
+		err = bond_slave_xdp_check(dev, slave_dev, extack);
+		if (err)
 			goto err;
-		}
-
-		if (dev_xdp_has_own_prog(slave_dev)) {
-			SLAVE_NL_ERR(dev, slave_dev, extack,
-				     "Slave has XDP program loaded, please unload before enslaving");
-			err = -EOPNOTSUPP;
-			goto err;
-		}
 
 		err = dev_xdp_propagate(slave_dev, &xdp);
 		if (err < 0) {

---
base-commit: ccb81d5e317b0ae2cc66ca1c628c0ca907928f94
change-id: 20261124-bond_xdp_fix-3f5eb6533f50

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

