Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108214;
	b=CEghsV7hjD3LaaOe8Np+t/aeDHWiMoapYNeO4HhA1OLWyVebsOxyL6ZdfWv1fNNK2mdV
	 Y6PwoZuHZbaTEXppkSbqGUTCjmH5jXYBq3d9EHyeNESKCvFzljKSHdcKWu+UhV5uhYnt6
	 xxRGmBY6ILhmJTpcp7C8gzzzFca7y71YwTYkYcNb1gas7Wxx2RMA6syo1IcYg8T6RrlHy
	 w+OP/0pC+3K478MRur51OmrAJ0fT0Q3cAcyJBwr3mTlJaOmGNmr8y0JJiJaJC0wOpJx6O
	 23V9AF5rh5zB5g4QnGL5iQmG0r0gG9qicR2XMQSFNwmYjoQw4AbsK1kz6PxHm/vywfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=EiBfwWR6KMKvY7bdeIiCHUu6wQSmNF3ekT+F/c9nKQ8=;
	b=GqQKVWer4ql/8SZ6INzQFXB/QNYwzse/wnqqdxY1rp9R25Vfis+uOf3tA/Guxn3I5BoU
	 0SwumRSc1OnuzEuSP3JAuboaSDKrp7aDIgkOHVQZ3YJCNZycGsS+qBHfKzH958L5/0wU2
	 Q6hAgJwWamZZEouESae4NK3KkCsWPgTDfwJv/pTPHUd5kYC+7JQvioYRsWOFRnVqt+c6g
	 POTJ9+m2R8J4sDEkVH6pHobVv1dZUVx2RXgRoz8V9XPHeHCq2+pBLCZKWBmdukamcRAwE
	 3Siyh9Yq5bPqlHmVgPkjqO9EpiJgsWfhRYri7ck3Cho4CH3awtmk3ozV2rRhS5Z34Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=APto1++M;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246B060A3810
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 246B060A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=APto1++M
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383165e9b0fso1985264eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108212; x=1795713012; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EiBfwWR6KMKvY7bdeIiCHUu6wQSmNF3ekT+F/c9nKQ8=;
        b=APto1++MH6zID2YiOIjGdPc30YAe8iKYKxfkWDZASe0I+ni9w/i8pamAjSFUfIOhWO
         4qCO2k0LOJoC2iOOShxRGjoOI2hjImjjMj22nJIGuDU74UojWU5pXKGHtnlRLZ8j8m0q
         kyBC4KSjRWhfs05Loyy4bLmIK27sWhr5vVk6nzBSNh3EC2LdWCeg93ffUHQl8TZ5Atr5
         LjC+YjqZIvHtEaZ2LwzwhQ2fzQ3Fr1HQsky84+VT3puTIZXYJM8HWHe6TXtTxUdZY1O5
         HW8oQIlQfeMQfzd03ZJPoB/oqYVJJi3iyYjbC0JTR//bxJiWKIR81G+lruMv8v3J+4k1
         lv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108212; x=1795713012;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EiBfwWR6KMKvY7bdeIiCHUu6wQSmNF3ekT+F/c9nKQ8=;
        b=cv2pjWnfEfuuCHPWtJLJWBp3KEgnsdWHS79sasgvOmNWfM5mDnG/el3w3ceHeXtKLO
         GH/7gz84lmLECa7efk928M+Oqb5QZzM8qoXyic97ey0VuUc2afws7wa69GO9byUPO9TX
         iYzSawsPtMQjF8cPlYfH6Dg1KKr9nuKRQ9gdAsJqWsGpbErocjJCcnYvSjFUTAQLR+cW
         yyIoFy0MLIktCndVpOs/9ee+WwchJATUDaqWmLg6K5x0xbKi/+WLkP61zV4/CvRL9PLP
         yiBHNluIQzPy05iC4Jk3IN9Sn0mI/HfQ34HXSj6XNIeRArtTsF3xJWqWG28BBKLVtGsY
         HmMQ==
X-Forwarded-Encrypted: i=1; AL+hErEI8sUYeKfaSaVYM2dSlhoeOrGc9WVNi+Ne+FFu58b4ZsAMD3knBlI1JwHcyWdh//8xwPCTcc59zwozGHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wYqYoILSRa4HgEVe7aoWh2/cYhNPOnpbOxXhlmg7zcCnrktKO
	rrA+P6BCmRf/aq8zMrovl+GZnRmoJW7sI7R2/RQpaJftkZJx8gbLycpIFOhR0sfSwQuLXxH0VBK
	F2ufltyC27g==
X-Received: from dyckq13.prod.google.com ([2002:a05:7301:7dcd:b0:383:aab7:cc58])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8943:10b0:381:cb1d:466b
 with SMTP id 5a478bee46e88-38280d3068emr5688589eec.26.1795108211935; Thu, 19
 Nov 2026 09:10:11 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:09 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171009.1534335-1-irogers@google.com>
Subject: [PATCH net] ncsi: Initialize vid in set_one_vid() to handle
 concurrent VLAN removal
From: Ian Rogers <irogers@google.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Paul Fertser <fercerpav@gmail.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

set_one_vid() checks list_empty(&ndp->vlan_vids) before acquiring
nc->lock and rcu_read_lock(). If ncsi_vlan_rx_kill_vid() removes the
last VLAN entry in that window, list_for_each_entry_rcu() executes
zero iterations and leaves vid uninitialized on the stack. The
subsequent 'if (!vid)' check can then proceed and program stack
garbage into ncf->vids[index] and an NCSI_PKT_CMD_SVF command packet.

Initialize vid to 0 so that an empty RCU list cleanly hits 'if (!vid)'
and returns -1.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building net/ncsi/ncsi-manage.o with LLVM=1 W=1
(-Werror) and -Wconditional-uninitialized; not runtime-tested on NCSI
hardware.

Fixes: 062b3e1b6d4f ("net/ncsi: Refactor MAC, VLAN filters")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 net/ncsi/ncsi-manage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 1d63958c4429..f7eca228c281 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -640,7 +640,7 @@ static int set_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
 	unsigned long flags;
 	int i, index;
 	void *bitmap;
-	u16 vid;
+	u16 vid = 0;
 
 	if (list_empty(&ndp->vlan_vids))
 		return -1;
-- 
2.56.1.708.g77570a6a1d-goog

