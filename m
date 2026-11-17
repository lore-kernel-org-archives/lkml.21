Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953744;
	b=x6/cCB51bsrRFBgri84VeWz9dbZOlU5lyYLB7BCMCQFGftsE5jyH0poHv6fkF3SgG/au
	 C/GT7+JUsFcTLyv70oTI5xNgK9G9O2cwiziQos7qlNNnuRX1xodtiq+9wAHmtNQtJ6Q6D
	 uQiVOAHGDV9EfTVfnT0X8uvRqjuBDIdxTxzvI43AGRnov0Wlepi8Lkz5EPXSaiJeeNsvz
	 qljDU1vJrzEvhk8aErQzV7MkMEFG+gsjIJKE+4yFakO6ISUKIz3c3PK3QEggnRtFYqAIO
	 ZFVS5a85trgI6K/sHYDuivH6forqQQBw1b6zuAxnJcg3ydvBMUTiCA8wK05fQtosLmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4aMMFkXBmhDNbkMddHOYmKs1ldPvaFgEp/CTY5zVmKE=;
	b=4R5hWyIY7BHF/jBM2QjqYpsE7fn3HBmFrWwWnlTtdLBwkg9Zkog5Q7i5W5saIQX9uT8o
	 /eY1IPhuv1r1e4yjbFgx36K5QBm3qayyvYzfSsXKvnnUCQTGf2qm2DYgadyL+QT/SyuSW
	 W2fHD7u8ZpqfDdjQtj2lAzk4hsBrv0xC4cXF1EJbaXmymm+d/GZqQnlUxnY8ufT1KT14z
	 6aDYuUsar46JVE+2WQ2WEY24PxAsijDL54GhSybbULnmbXPw2IgIrYwL+NkBDePahqhyY
	 L7Xbe0S5/LnUi6iA1ZDtYXq2gOBmvWmkT0wi02cXuWq5tje47qfe5fmOutrc/DXH4JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iLzZAJv4;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059BC606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 059BC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iLzZAJv4
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so194312a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794953743; x=1795558543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aMMFkXBmhDNbkMddHOYmKs1ldPvaFgEp/CTY5zVmKE=;
        b=iLzZAJv4uBcQGjiU0dI/Vsw4/dmlRf4at12apEjV4V6j0aVpQG0bh7yrpkDAr6Ui5/
         i5GuYcg60UhpYMTsWZiSROyIKDeQleH9TJqFeGpbaZo5fRHm6xn8GrX7zdCtROmbUKCT
         o/ZWHqCmNML6o30xb+6UgxPPZp+hgRH99Va5I6c+AoGj5fj93cYZaAImzj4LWxmF2Ebi
         kZykwj8q8Baq9NfsbVDT5L59kFxDAlNd1ZKsWA+sbxTYMka3w0jPuiYqgZT0z1WnaqU5
         ZO+f32Pn/YtPv6p+t7UmfBQ6HWdRY52DnvSLF2EiT0XSQq00Px6OEw7GOD7huiSIcwEM
         LbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953743; x=1795558543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4aMMFkXBmhDNbkMddHOYmKs1ldPvaFgEp/CTY5zVmKE=;
        b=oneRpbU7KjLQ5Me5JGtXtupgt+kGnrRXvprWnUo3TDE88R96QMLAE4+JQ0ORDcAxNt
         wbbBDPT4NsWL4GV7AdE9Qd7bxK3ZHKaGLt399WmBHLMSGU7Vtpk49Y9jBRiDMvOz1NW5
         kphVADZ2OND4weikLQ1xT6nW1/otBa9LTBmifEG/THzYlq+iVsWhH7VS2mg7tSnURW/1
         KCxPJrXI61NL93Ogd7hXX+cPe6CQ/XSPvvtfMgPAuM0+wGujYkL75SOOFZpa+dobC+oG
         W91huXrC8k9WfwJ18+3uWb90skSs35lgJd/MxU1Oa9B1scC/3P1WiXLULQKDsc7+/Gx3
         s1eQ==
X-Forwarded-Encrypted: i=1; AL+hErG3C16R85hHA+Fy2MB0pX8AsA8/zv/JPKG36pm5YY6ds1VuEts3IQB9ezC0Wvc+fUKl/cq7AoQmOm8W/tA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dIIWVxRyMTl//cWSPJfVJ4ENvA1gkjz3u1rlLcxRTzPQEONW2
	U8GaLINtHB48BH4C6R6dgE+1VYWzsjC6axBZuvqs0ukcF/c6NnMGe505zEju9Z1PlWI=
X-Gm-Gg: AZFdTZdIhrCnlxNSHFjMPl0gzO3vEhgzqthLz/cC6uPo4Viqi5yPPaAIZ6Q7FabbdPf
	+TyXwMPkjLVNBUOv/wbgIGdzqW+UVpGw0hm7u8WEDeXMNqbA7bo6VPy/vXW0ogrxcu81pF0GG1+
	qZ+nKJQRpvC6YKX/f1wP764B31xRHLlyNazi0Hw2Nl1HusrEaAzHHgXS0+yvY+Ze6V6gc9SNw+0
	pfjwkZhDAwSnjPsMVz8wnsrNOEWLHn7jplXqhnMAi4gYLWu1tq4ZMWxRJqPfTkJAfuiHVt1dTZl
	5E9S6HjKXlXwktdqqtN7HR9zHj+LpItj5/ovUDJVZGPgjP9dP7Ie+hoNKZMHBypvbWvVYuIV6Om
	ahNsjFpnDa8/+uo5gqZuMAVbFhq3559j4AggdDaXgkMceD4IiNh8dnq+UBlrq3sy0nhyL961R0r
	qddugnpZWEuyys6JSL/s9WN+cXnFHf9NZVYdNRKc32y/OlM1/lmwwsNo5HAJOZwuAagpagFxnof
	w1BfzYN6ay57jlAVOYMdBiD9JiMV1LvU2MpXTEC4KyacyXW7aJ5emFNhyuJycZfjzmzGPfTsDNB
	L4U29H1lLO9exUgBgcWhYNMWCH7ji1lJ7sh6yosYfhzy65K209GdmwZt2koWeZxUqIMddQNdUBv
	UAH2WNd9Ov4qQow==
X-Received: by 2002:a17:90b:4488:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3b3d07d5320mr718689a91.67.1794953743438;
        Tue, 17 Nov 2026 14:15:43 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm38067a91.0.2026.11.17.14.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:15:42 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Andrea Parri <parri.andrea@gmail.com>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v3 1/3] rtnetlink: return EMSGSIZE when first dump entry does not fit
Date: Tue, 17 Nov 2026 14:13:42 -0800
Message-ID: <20261117221538.184948-2-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117221538.184948-1-stephen@networkplumber.org>
References: <20261117221538.184948-1-stephen@networkplumber.org>
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

If a route entry is too large for the dump skb, the dump is silently
truncated and no error is returned.

For handlers with RTNL_FLAG_DUMP_SPLIT_NLM_DONE, rtnl_dumpit() drops
-EMSGSIZE and returns skb->len. With an empty skb this is 0, so the
dump ends with NLMSG_DONE and status 0, and the remaining entries are
lost.

The first dump skb is allocated from __netlink_dump_start() while
max_recvmsg_len is still 0, so it is only NLMSG_GOODSIZE. On a 4K page
kernel that is under 4000 bytes, and a 500 way multipath route does not
fit:

  ip link add dummy0 type dummy
  ip link set dummy0 up
  ip route add 198.51.100.0/24 table 100 \
        $(for i in $(seq 500); do echo -n "nexthop dev dummy0 "; done)
  ip route show table 100

The dump prints nothing and exits 0

Only ignore -EMSGSIZE when the skb has data, so that an entry which
does not fit in an empty skb reports the error to user space.

This only covers handlers which report a too large entry with
-EMSGSIZE, such as the IPv4 FIB dump. inet6_dump_fib() instead returns
a positive value when the first route does not fit, so the check added
here never fires for it; that case is fixed by the next patch in this
series.

Fixes: 5b4b62a169e1 ("rtnetlink: make the "split" NLM_DONE handling generic")
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 net/core/rtnetlink.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index e141340172ce..2777796a4ed2 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -7043,7 +7043,10 @@ static int rtnl_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 	 * Some applications which parse netlink manually depend on this.
 	 */
 	if (cb->flags & RTNL_FLAG_DUMP_SPLIT_NLM_DONE) {
-		if (err < 0 && err != -EMSGSIZE)
+		/* -EMSGSIZE with nothing in the skb is an error, as returning
+		 * a length of 0 would end the dump as if it was complete.
+		 */
+		if (err < 0 && (err != -EMSGSIZE || !skb->len))
 			return err;
 		if (!err)
 			cb->data = NULL;
-- 
2.53.0

