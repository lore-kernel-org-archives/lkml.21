Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157882;
	b=F0FH5OqxWVVLJJI0sSOQ8OqNpEiFmUAavY8b7jJdiSegTpJMBC+jv2Aqqx8ZBCbWBR3X
	 JiheKWF2kKaTt8uf0XwRoy97c0GkLmgRUeT5Eu/xjmgLy9VGrGmYN+bsZKDvgGkUKjmh0
	 SrrFIHLTPbTlg3PKu/KHobyPOudsNX7YoZ9BT9w6JQZyIEcpRX7/P7VnlSfER2xajJOjY
	 nzIstmEVeCNTXu4Z0kVTUn4xYd2q6ntjNJee9r9AZeSLpt2nYMBztrRGt9yr0nyrbce4F
	 iq2PnmlUijWr89EAfxh5NFY/PlpGnCu2nwMboQKqcJjILiSbXPwr31fPOqHfpNIUenw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZVpa8bveNQUoF8hBZFsntHBuieSxDrBoOl7r8tSBYPM=;
	b=g6FoYk0KSzKX/4TxhUexLPmB5AJ8wmaGgDoS9/yQZ5dLiJEMXa3LxPOtKioF8uaGpTtM
	 o3bzCwzHCQ29HiV8eGkxfe3Bn3b+kecaRABl6yBir/LhR8bsipcaeEr9HyvCMinxQJBv9
	 joK4kyHs06hCDGHLMX86MDdsYvYsdVD5tobL5huJJq+Yqc4Yy4jP1vEY0NS8Z003gmgZ5
	 9dbfkI1y4qTcNfto1WIINxnJ+OMQLPfLJe6RpvNCj6WDy0ThbQ4hGldwkZ4Wd8Vd51Xh2
	 D61ZtSK1eAfPe76ZWN5O8zYJI15hE9pxRBmrig9rJGLnQtqUriFV6N1pd1VXz4y4V4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Fqs2Lawh;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AA1606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07AA1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Fqs2Lawh
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a9be758734so287263f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795157880; x=1795762680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVpa8bveNQUoF8hBZFsntHBuieSxDrBoOl7r8tSBYPM=;
        b=Fqs2LawhrfmjHFt0TwOTf/b3Avrczi1UW+HtHVl1gfPi8kos949p1mvwnoq9jkGCET
         Nq86gGhLMStvAAPMJJU1tp5JHbW2PbN+OqSeXSpKvSM3q9ugrK7Re2JMUG/+Q9NroZGI
         HQoayp/xpu1ibdlH1xf4HCPIfVSr+c05dsTZkYQX00OsV9/V8XULu/KTBpaT/zj32/yu
         GXKzTSpTYQHDXN/XgilgvwyEmx/iJgLTYohJvZ8Cp8jM7lV7Ixt6nsx6+eBRZiBxKhbj
         26JWqfKh2KnvalYsiggZYpsgjcL8gF2CAjBJ8jiWLGjX+5qTmy+m9iVun94S7ykqm1KT
         tOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157880; x=1795762680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVpa8bveNQUoF8hBZFsntHBuieSxDrBoOl7r8tSBYPM=;
        b=LxYs5k6USPbthMglb/lTkdIPPacT4WcK9SB5z+8XFi+Sx2eIZR2X+oPTFRMGrMhZoM
         xT63uHr/hm42tIAwkkAef3ll29C1jXkXz/NGJHntOVZNi/aBr9IvFfGYhlLNtBMwewI3
         s2cfRb7hEemnvIGyd+xnCzf4Z0hRs1y8QsJuI7tvjk5hjZoLCoWHQ89EuvvUm0ZoXC+Q
         RAiXz0LqBxE3Au3CidX5FohIff9in3OoKindDEjiHHaTFBuR8fuRpKpjtqp4pvGmpDTC
         STNNUe2lSYA5QW9/6zJ4FuBj63fk1vuqOW/xE42Arb67s+IJEoNXQe54i0+Z3qn+isbR
         1GyA==
X-Forwarded-Encrypted: i=1; AL+hErFDkl2W1E4zrdpkO/uccbL/LfoieGEzNsvjG+Gf1IxVIUdu0oiQY6PhDZuLlYmF2sNrbuuvUye05fx86Wc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D+LP6hy4Jd4TirBF8kmkMR983cSVdAgnPSLJ9HbdEJbBfw1vS
	I9B70uy9lhxNSQwTDe4RSFktJx66ugwbXVWTWEzt6h/Ms8NIweuCVhX7MHFOyAeG9Co=
X-Gm-Gg: AZFdTZcAnhUNuI3v2VXpna2A72dT2ncnzDOUmLI7U6TC6cLriIva44Mt6AAgGrvUZhh
	ZXftS75kbxKQiUbAC964VQiQff1LT3GAXojTQQ6sLmJq89Lf7aFCM+CsBW9LpDbyZ9OPUenu19+
	3BhtZO0FInvN+Lb7wKf81rTH6AqBqRwwgs8Yy11WY6G0JvzJElMKkb+LZx1tYMfIEFvateVoCc3
	RVEzFP+cIViYWNENmGvlu8axCj3PYJlviYqXhrwzGfmQC6/OFvIjGyrkkJGB9ugY6WOBDCmkfAL
	w9o1NAp4GdwYSnw7re5s25lGThehv5RuiODF58LwOjhw50QgeAiFsGXCYAp7JzrETKiL3BYNdw+
	5sKPqFeQMN17l+P2UeGbvbjqh9zLnO6aWr5cLJmdA68AdDN5ZEzXPgwWEptPNbYwGFmP2nnG5/D
	M9TdoP38xOsfM+a3aeFoQfc+xS579u7+cAL2Q0LdkVAjG0e+/ysXMWeEos+0HVPPtft5ydt+Kyl
	60hbQYV1urVpKuODQeIq4CpsIMXtB5gtsNyXlVfQsghSdJjztCbj1T9rZQRI2ycGnbJT/5N4Tlp
	3OWsoR3vGaB4Xdxj5eTJyIh9ygJfy8mejwnvMMA0J+pwbw==
X-Received: by 2002:a05:6000:2c13:b0:48d:f95e:6e8 with SMTP id ffacd0b85a97d-4abab02d26emr3388137f8f.1.1795157880406;
        Thu, 19 Nov 2026 22:58:00 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm4190080f8f.21.2026.11.19.22.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:57:59 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	amisiurov@cloudlinux.com
Subject: [PATCH net v2] ieee802154: keep the original error after a netns rollback
Date: Fri, 20 Nov 2026 07:57:49 +0100
Message-ID: <20261120065750.3274661-1-amisiurov@cloudlinux.com>
X-Mailer: git-send-email 2.43.7
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

cfg802154_switch_netns() moves all of a phy's netdevs into a new netns. If
one move fails, it jumps to the errout label and moves the already-moved
netdevs back to the old netns.

That rollback loop overwrites the same 'err' variable with the result of
each move-back. The move-backs succeed, so 'err' ends up 0 and the function
returns 0 -- success -- even though nothing moved and the phy stayed in the
old netns. nl802154_wpan_phy_netns() then tells userspace the move worked.

Give the rollback loop its own 'err' so the original error survives and is
returned.

Fixes: 66e5c2672cd1 ("ieee802154: add netns support")
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
v2: shadow 'err' inside the rollback loop instead of adding a separate
    variable next to it (Miquel Raynal).

Found during a backport review.

On debian13 6.12.88, "iwpan phy phy0 set netns name T" reported success
(returned 0) while phy0 and its wpan0 interface stayed in the original
namespace; internally the move had failed with -EEXIST, but the function
returned 0 anyway. With the fix the same command correctly fails
with "File exists".

 net/ieee802154/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ieee802154/core.c b/net/ieee802154/core.c
--- a/net/ieee802154/core.c
+++ b/net/ieee802154/core.c
@@ -255,6 +255,8 @@ errout:
 	list_for_each_entry_continue_reverse(wpan_dev,
 					     &rdev->wpan_dev_list,
 					     list) {
+		int err;
+
 		if (!wpan_dev->netdev)
 			continue;
 		wpan_dev->netdev->netns_immutable = false;
