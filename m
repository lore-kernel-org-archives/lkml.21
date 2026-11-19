Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060925;
	b=sqRHgN51ITuC2SvPjc6hwxYkUMMCnFvjGBJhJPEztoF0z0HZMqy8LHhrdq1gfYOUVgqR
	 u++sE09Mr6lti8i/FRHiFRyStXrbnL0EJKX45/ZEEcsF3FaXJBe/J8LbNX0esWhg70PeR
	 zi+ueiCOE7HzGQQKolKO7LrHjJ9EZHz+129yIeiyAfdSABCzJMC5vQa83mTsOqeNHh390
	 gZ+FTR3ERQx4oj0+WlvoJaGDNeZs3CpmZn7JgNEARZSEJl31QXEzQP5IR46vq9cGMfTWp
	 oyO/4lijcs9KmwEXumKSQDKsX3L0MViySGwm/VWH3Vh0oJkJ6YhwqKe+L6pgT42hXnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ki+hym5xBnLUsLIUPy9cHW9nYAaIrxILlRLJC6d61Q4=;
	b=eerlT7EajFXMtB+O06iVpbw+ut6wfRRzwziMdEbzCnX03FjMicN1mWEa90lr4Fybk1EL
	 bu2/O0sxuKN67TMByrHvloFQeQkcD9lZLZ0EGehbypB0RMvGngGWxSOsudVFDyDnaPaN2
	 3GHxONdXB44sxHG8nyw2EOjVai/98AvwvkvEMfrHcXy6kxyMDSXEgKjq122lXYWC05qzi
	 g1czs+pvr3+X96u44sfO2jX2ZY8Dmn+hkV2+M0sadX9xyh5MeYONpdDb188aKRoWyZ7h8
	 FDw091Zo/occoOVtOBP0DLpxlQ1V7Utesdy1q0JhusGcn58HuIea7ORJ0lHZBZALNrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhBGpxNL;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25B606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE25B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhBGpxNL
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-71b2862dbeeso219353eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795060924; x=1795665724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ki+hym5xBnLUsLIUPy9cHW9nYAaIrxILlRLJC6d61Q4=;
        b=YhBGpxNLOS65RBwZNOx35XebtNQustjfOo9inRNweNvTqgNnl7g1XXs2Gic+Z+ZZJa
         BPzBkbQintn+wN81KAlk1T/Gkv7oYnoav65I0tImgcgL/Ed4nW0ptb502FMzsOtKCdb8
         g+qgRBISkIFyNkZu3MtVjmArSPJQ0DmEZZL+CbPTgFYO3/CLXQX5Kt9rK5LEN5jdeTyj
         mK5Hta1lq78vTSLehnS5Lj3rqmxGbzQNZpKkbgs8wPgqouv9ie0RlFnQX56L0ikhVLu4
         zMTgo2vr2I53eabkOhPc2DUXOGkJDS9Y05lgQPahHwUSNCBIAnNek94k9iJcdPmILs5/
         xX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060924; x=1795665724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ki+hym5xBnLUsLIUPy9cHW9nYAaIrxILlRLJC6d61Q4=;
        b=Yf3hvpyTMXwt0WwT+TNF2VblRthGWwr/3zl9NVG7qwxf5/kd2ez1qsD7bPjc7QHdnI
         CDkdpkugcREtCVrsz6ceeiDKiovMW4k5TLTJ1jlx8P08XeynJtRx9LUvoXvy2dX01TDT
         NDKAk3EDmhk9FfbAAdgzfZ8DwtmsSIkaXxK/gGZ8BMAdp8w+wdGguTGWJJ2HHdX0x5Jp
         DNEJZnNUdIyG/KqQMruqfF/rAaqni/fkSXOAkgZKhqRQ92cTuO4ZNsev7XbrEduCz8O6
         XUrRWKaAd3VCG4Iy1aHJTtiaDoXer2EusyTP4BF31nDhbcJlRuCYRqGoR9i2hR8YKxkq
         xzzw==
X-Forwarded-Encrypted: i=1; AL+hErEkmDfmpcpqeMJq62G4hBQC4MOjeOR/g0K6bnim+K64H+lrrx9oqx3GghpWA3weNkBN3pOeoR4OQk8UKMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ByEp9Vt3MofFnZEzkRNXcPU/0q+1yX27uGdSmTdw2MAJP4CxI
	Yz79g5o88706a6hYpsDEXKwf605vTdbAuFKoPZLwhb0dtVVdeJv3sLTV
X-Gm-Gg: AYBFou18iBqT6XL+jofzz01IwF9mxHSd7XuefGD6kbTuWqycwV1Kg3ELtA6k0xLm55o
	JStKiLYNkDFxtowHxw/d0ek8CHw6xvhRt6Jbrs2LmRMLvy2YDJUnzmoWbCkqOvdCjmoIiJUW8Z1
	3tRE90UaAQxoBwO3NB2FFcC2rPR3kOZrvl0T7ni36VJKSbYTh/sQwrWV/HI50RTQ2KzUparsiF4
	J00i7b3OeuYPtddK0MbAIMJ1auchEkY4i57DZRLAxpmH1tYsUPRVf/39ogm0Rp7KArhMcZoxe2L
	zHYI5M5g7aWpFxJijODId1mnmtRjgabtyJG06gu+qjFexgoMSH9smmVU2RrZ5VWxkKJmKyIN/TN
	2Ffvq0QGdHjIYCjhg3Hd662n0DClyyftkKvD8t+nHNsDNcPfS7gNF+TH+ACfeolsiYOvmGZnsDg
	6fNyCp/54XF7lxM8zcUrGg8vuIP++FX2+BOvnlyHeJjCknwnftOgOX6VOij1yDjOu7L5IGlewjy
	AG/+pqnPYKo5eRSTXBZKdLcADuiW4Esr4sP4wp3MJ9ThY8HKdLJrg5/U84ofugY7ndAL2l+94do
	Y1gTmXo6AmCAsEFkc/Q5w0yddgL8Px0aTo/xmbvuUkhRWqjH47rJI6AXGknsTAYTyGIQyThvdYO
	orTUFOoQ2G1Z2
X-Received: by 2002:a05:6820:338e:20b0:71b:188a:319d with SMTP id 006d021491bc7-71b188a3436mr2906072eaf.53.1795060923744;
        Wed, 18 Nov 2026 20:02:03 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.162])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b744126dfdsm4163497fac.10.2026.11.18.20.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:02:02 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Yuyang Huang <sigefriedhyy@gmail.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org,
	Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net v2] net: zero the tail of ha->addr when allocating address list entries
Date: Thu, 19 Nov 2026 12:01:52 +0800
Message-ID: <20261119040153.158372-1-bsdhenrymartin@gmail.com>
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

__hw_addr_create() allocates entries with kmalloc() and initializes only
addr_len bytes of ha->addr.  The dump paths emit each entry using the
current dev->addr_len, so an entry that was created with a smaller
addr_len is dumped with uninitialized tail bytes.

dev->addr_len can grow after the entry was created: tun's TUNSETLINK
changes a device from ARPHRD_NONE (addr_len 0) to ARPHRD_IP6GRE
(addr_len 16).  On v7.4-rc3, with 64 entries armed on a down tun device
and the link type then set to ARPHRD_IP6GRE, RTM_GETMULTICAST returned
16 bytes per entry of which 37 were non-zero and 21 started with a
kernel heap pointer (e.g. 0xffff8188_04857ee0); /proc/net/dev_mcast
exposed the same bytes.  This discloses stale heap contents to readers
of those interfaces.

Allocate with kzalloc(), so the tail is always zeroed and a dump can
only emit bytes that were written or zeroed at creation.  This also
makes the explicit ha->sync_cnt = 0 initialization redundant.

Cc: stable@vger.kernel.org
Fixes: a748ee242681 ("net: move address list functions to a separate file")
Link: https://lists.openwall.net/linux-kernel/2026/09/10/320
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
v1 -> v2:
 - allocate with kzalloc() and drop the manual ha->sync_cnt = 0, as
   suggested by Eric Dumazet and Daniel Machon
 - add the runtime observation to the changelog

 net/core/dev_addr_lists.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index d827cc21867b..9613c8a9ed7f 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -96,7 +96,7 @@ __hw_addr_create(const unsigned char *addr, int addr_len,
 	alloc_size = sizeof(*ha);
 	if (alloc_size < L1_CACHE_BYTES)
 		alloc_size = L1_CACHE_BYTES;
-	ha = kmalloc(alloc_size, GFP_ATOMIC);
+	ha = kzalloc(alloc_size, GFP_ATOMIC);
 	if (!ha)
 		return NULL;
 	memcpy(ha->addr, addr, addr_len);
@@ -104,7 +104,6 @@ __hw_addr_create(const unsigned char *addr, int addr_len,
 	ha->refcount = 1;
 	ha->global_use = global;
 	ha->synced = sync ? 1 : 0;
-	ha->sync_cnt = 0;
 
 	return ha;
 }
-- 
2.43.7

