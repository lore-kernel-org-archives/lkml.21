Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660278;
	b=o5VN7CEEd8/BZc1By3G/gfBM9/MIhz95HBGHnjMHoAN9GZMbK3ByDsU9SJnN71T9+Bm4
	 hAx/xCGpdN/RSFhs75tCbwfWmJ2oIqu5maOvwMQRxYmVjOrqTR+j64ceKxN8DCro5QuSH
	 iLd0dDkAJ7VnGJEKwhQWalgPepBC4VXMEz9ZQKjLJ48pL9CcQ88uGUOdcfCdvoQliyJ/i
	 Zux/zNNJ4lhEZdPMpEJRbC3nc7IBQxz/MZ9pQUudXav+skvI0hIQwEN9oyFHSAOCBz2sL
	 ObFc0xqs2j0NtO2uzL3+Ho1fGUYXCaFj1nCTuUabv9tRFEPDxpGJ1lUirLOkGJFWFbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660278;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=x6RnEWdTYTK7Xk1wAs9uasJq7hXDNS8kQYggB9k9i20=;
	b=U9H1GgQ5VrqVVg8FAliSYUVTJ27Q231Pet2Y4ROGwjEOIlTsmzIpxvCRIPa6kY3dfz+x
	 qukBrWAp9EJUcvnS8B2u4wOYitvpMV6A5ewa/Od07O48E+iGyzjKr9RkRQow7dyXnkHq0
	 zXccv1QFRCTMwzwQ09TmJgKXX9DA2KtkzcBYEWRqbqRBAc1iFuyfoiURiTdX8hrId2bAK
	 PmWbj53R+uT1jclRUZiUaxudiK+mHwAWhO7gE7/ijGBNpOltOf0esUgduvkh72SSMBMHT
	 R/Rrl83qDrrlSz8wsl5dyD7WbI1mtAaJ25Josj8uH0QzcBo5uZ/35T+vxflrYMArAfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lip8aObz;
	arc=none smtp.remote-ip=95.215.58.53
Received: from mta1.migadu.com (out-53.mta1.migadu.com [95.215.58.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DB3606A697
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DB3606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lip8aObz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B95j5ov9JJOnmmZbalvHGaiXevFwCPV/nXL1BTEaITM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795660275; v=1; x=1796265075;
 b=lip8aObzsujux64pIdTlFAEp29ewtAljnU9YBt06ykMCL2meMp1CPXYna5vMJEI8vuTxkVwF
 tSHMl5jyZWL9i20FfAZolpa/Uwwg3R5+pcoKfKSRkYWPUidTpLoqOdfskox0daMxst15j6266jx
 HenOW3aBhiQfjmcDtv/ajmd8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id a17f42b5aef994cf;
	Thu, 26 Nov 2026 02:31:15 +0000
X-Mizu-Trace-ID: a17f42b5aef994cf
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 26 Nov 2026 10:30:56 +0800
Subject: [PATCH net 2/3] bonding: update slave array on link change for
 broadcast mode
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
Message-Id: <20261126-bond_broadcast_updelay-v1-2-188e5538d6ca@kylinos.cn>
References: <20261126-bond_broadcast_updelay-v1-0-188e5538d6ca@kylinos.cn>
In-Reply-To: <20261126-bond_broadcast_updelay-v1-0-188e5538d6ca@kylinos.cn>
To: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Tonghao Zhang <tonghao@bamaicloud.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: "jiangjiehua (A)" <jiangjiehua1@huawei.com>, 
 Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

bond_miimon_link_change() rebuilds the slave array when a slave's
link state changes, but it has no broadcast case, so broadcast only
rebuilds usable_slaves on enslave/release. bond_miimon_inspect()
then derives ignore_updelay from a stale snapshot:

  - if the last rebuild ran while no slave was can_tx (common for
    batch enslave with updelay, since new slaves start in
    BOND_LINK_BACK), the snapshot keeps count == 0 forever and
    updelay is never honored, even once other slaves are usable;
  - if the snapshot still lists a slave that has since gone down,
    ignore_updelay stays false and updelay delays recovery even
    when the bond has no usable links, contrary to section 13.1
    paragraph 4 of the bonding documentation.

Add the broadcast case so the snapshot follows link transitions the
same way balance-xor does. This needs the revert of 45fc134bcfad as
a prerequisite: with 45fc134bcfad applied, bond_set_slave_arr()
discards the refreshed array for broadcast.

Fixes: e0caeb24f538 ("net: bonding: update the slave array for broadcast mode")
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 drivers/net/bonding/bond_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index d6675e87d06b..b1efbdf597ec 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -2780,6 +2780,7 @@ static void bond_miimon_link_change(struct bonding *bond,
 		bond_alb_handle_link_change(bond, slave, link);
 		break;
 	case BOND_MODE_XOR:
+	case BOND_MODE_BROADCAST:
 		bond_update_slave_arr(bond, NULL);
 		break;
 	}

-- 
2.56.0

