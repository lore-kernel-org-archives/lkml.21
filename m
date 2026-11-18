Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976197;
	b=Q2kwJOwJ66PeXaXHvrj3IPOyliY/SucQx3RWn3+ANML4f31eO8re9Ca1w09z2VSSnObA
	 W2p9xk8WkrsAWtZuErDud1yjObuJD2l3a1pGCsc8h5PZ9KsVID8bpu6PaxN4KxY4lVdRK
	 1csEv6+U4jiVfRYoQPQkK4dbXOIbwLihIPRiM8dc1b2LCkBWL4oF6TxnEFEW5ZuqYDMdo
	 3gwpskqUXHnQmNQ0CbusIe8eDeFzT2aeTNV1IBQICuYaMnStDxDw1bODFLxLbBPlnS2Lk
	 jkQ9Q+SfpOn7uFOQQtnicV94vR5b3qapDMGSISuwhxu+BPl04R+aOA5SNX5+A+At8LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LJ9gCj2jGGmLVFKvuakf/3ErIiC4ZxE44mtjMvsbMAw=;
	b=EZ7QZCtsgwV1cU6v3ZxIbHO9Gkn7cpK0sydj1ftISZWL1/+cIc9HOfjhuAK59QyBu/F9
	 jz6gzXvw44WKgkfmiu9IH2CIkuMX3NyXP6OYu5iLdm0l99L525HX+AWbSEPd6wrywHZS1
	 0PuM+b6WC71Q1Qij7YKbKlMRKBVfbpwcjM8u4DV3RmUvkmAZV6Dsp29QiXmvdRbnmzcTu
	 FIjNDohRyV2rsD9lWzwiqqU7X09DXL7Ou6vQO8I24K12rmkBijl91E08E7UvHI30ZIUnk
	 LFe01gt06Xiw78euAi1LCFoWEdwMQp0RcmGUuEEuuB1Gr+eDQhfEGuMSUhvQZaVP9Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX6CghMX;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B797A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B797A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX6CghMX
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3704d30b84fso872852eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794976196; x=1795580996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJ9gCj2jGGmLVFKvuakf/3ErIiC4ZxE44mtjMvsbMAw=;
        b=KX6CghMXtqwmXH+k2x/YLE7ck2w8PI3LkWfSrobtdaskFNDxfHjRjdQHJwSlA2lp3v
         M2Lma+VM5Mvr2z4dHyaAPidQnBDGfDc0BzaIz57a/eAz57BrEnOY4Cw1kjjsJdJk6cBk
         i4DjvGrvP+HoXxsx9ANrheHnFYwYxTnAWJPoXSRzVQCGBx2OaY/aLQP7+3z8xscMCYa5
         o0E/xqMWa3vPnUq5p8PMF7vAkaa8FVy8z7qKC0Ur5llGkwwywXPNqZuYg1lXYqyEj9mI
         H1rWSWz5uaQoszbm2uVYFp/yzLrfBwZ+bTbROX9Xe07+AGtBOS78t3g/KhHB1OL8AsiO
         xpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976196; x=1795580996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJ9gCj2jGGmLVFKvuakf/3ErIiC4ZxE44mtjMvsbMAw=;
        b=0wOn/GiFV5wjGG+rNszhBd+pJNylUm4Nf3gW2LABqaqzKXPgT8PcuRwIDOxSIPFjpy
         QmsQ8rQAnAxrQ9hwZ0zudtT9iQhHY5Pisy2elcNxEYEjCHv6KJ0SVe9CHxp715BFvvyZ
         rSP3rKC8CV2E/7Sn0D83ynGZCwY1cSuvkZYzY/ZEjxYATm8o6ZBP2IhAbNA1dU1PJcf1
         WBA3nIZ5EIX/HWTNWKP2domX65SQZsbWff3zqm+BszvP0Zs8bxp5XBW0hpzti5lrAcqO
         aVp+iriSVNxqDIqZnQPX2Ur8WmAF5GixUgE8YkNEKQWrzkQbeA3VMShTh2IHTrf1dF3u
         dihw==
X-Forwarded-Encrypted: i=1; AL+hErGMPY7Xk3EmenEQ8qG1yxNeS6XJsT8PYh8ot2ZeKSvDFu8jv8yp+5TeSAVNLj4aVzMVJEOAoxYsYrjsIH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z99hY/TnwUeS94D6/H1ZqxnxdZD9dFLLDDEmwC9DXOxrpbrrNHO
	9aXOlG01wVpm0SaJTDgp5FCmjnjxqOPP4j+MbKdO6TFond90n1rnFxmk
X-Gm-Gg: AZFdTZdl35KCfq7pOpfWIihnY74tNXfEuN6hx+OrYb/RH/UpTD8HZEmeeySE872K+Zn
	v5EeoaxwrjZ9znFnR8vC75k5hXtyKqrEHK98S3q5+HoRKkjtE0zgRauqoB4nzI3c1lt+QQg95BP
	ApBpfR+O0pLRpnAtoIJ3oJ/JtApg7FF8A8fc/b0QucqYOUhXsUImST8wbgTKsEbi1kBSufbO+4Y
	SztKGl5/39D152EMbrpNvXpaAKawlut16tDy+98M1uxsYIGXn7EUs3Mt+8ZZ/vw+S4IRpUYT/70
	E47TM8KrodjL9EYqYL7JGO/0CKgd9CdOrSKaPxgOTkrIAt3sn1YE7jk7bSbuoB11BsvTdLycfwt
	MPcJ4iFBpKg7p10evumV3mMYm2sBSkkPOK1Mh69PdPh4NR9TqgNZxZD6Cm51y6MRynJo+KZ96kc
	u6GZ7imezj04cfjHWz1gJz2zHu5cLKWLOQpJtXE5EmLmj/Dw+XI5lQE5rL2XLJtqEfYZH05jxBV
	38XealnoJjQazYgLcETD4KXgMaZ9AtSmrcQ7I76X/1NQ+NHeB9WCMZKBX2zzyqHNxC0NAsNmlD/
	eYvTkxNJ+04IKpBDqfF/7+ZJNuSx7JqJuc4kF9qKiBXEXq1vG1rV/gCCB72jxmV+ddUNb+FadjP
	Nz3nsyVktaeOowIjXxDbm3T3NMiKHgeiFgbUTPsX+cnw4nvsRSaDkaoXfW0m3faV6FZxanK/fEg
	D8QuwHYs0Q1hD/9vYBkgIYgKo8cVOmmde/8S4lFZ56L1+e1X6iGTnXLP+rVBWUdbUNh7+LbIbEV
	N6uWg7bVD09G0MwGoBt52j32o5o
X-Received: by 2002:a05:7301:1823:b0:379:3c04:2cdd with SMTP id 5a478bee46e88-3828181119cmr1441606eec.31.1794976195799;
        Tue, 17 Nov 2026 20:29:55 -0800 (PST)
Received: from FT6N242TWK ([223.181.117.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304efbsm5273447eec.7.2026.11.17.20.29.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 20:29:55 -0800 (PST)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf] netfilter: ctnetlink: apply port filters to SCTP and GRE entries
Date: Wed, 18 Nov 2026 09:59:50 +0530
Message-ID: <20261118042950.83129-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
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

ctnetlink_filter_match_tuple() only compares CTA_PROTO_SRC_PORT and
CTA_PROTO_DST_PORT for TCP and UDP. SCTP and GRE also parse these
attributes into the filter tuple (both use nf_ct_port_nlattr_to_tuple()),
so a filter such as "protonum SCTP, src port X" is accepted, but the
port part is then ignored and every SCTP entry matches.

CTA_FILTER is also honoured by IPCTNL_MSG_CT_DELETE
(ctnetlink_flush_conntrack()), so a filtered flush that asks for one
SCTP port deletes all SCTP conntrack entries in the netns, and a
filtered dump returns all of them. The same applies to GRE keys.

The port and the GRE key share the same offset in
nf_conntrack_man_proto and in the dst union, so the existing
comparison works for both.

Found by reading the code with LLM assistance. Tested on x86_64 under
QEMU: with three SCTP and three GRE entries, a delete filtered on one
source port (or GRE key) removed all three entries of that protocol
before this change and only the matching one with it. Filtered dumps
show the same difference.

Fixes: cb8aa9a3affb ("netfilter: ctnetlink: add kernel side filtering for dump")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

Based on nf.git main 734bef548a96. Tested with a small raw ctnetlink
program in a busybox initramfs under QEMU (x86_64, TCG). It adds three
SCTP, three GRE and three TCP entries, then sends dumps and
IPCTNL_MSG_CT_DELETE requests with CTA_FILTER set to protonum plus
source port. TCP behaves the same before and after. Also built for
i386; W=1 shows no warnings for nf_conntrack_netlink.c before or after.

 net/netfilter/nf_conntrack_netlink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index 1f8d94a05..5e8e0b93b 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -1127,6 +1127,8 @@ static int ctnetlink_filter_match_tuple(struct nf_conntrack_tuple *filter_tuple,
 	switch (ct_tuple->dst.protonum) {
 	case IPPROTO_TCP:
 	case IPPROTO_UDP:
+	case IPPROTO_SCTP:
+	case IPPROTO_GRE:
 		if ((flags & CTA_FILTER_FLAG(CTA_PROTO_SRC_PORT)) &&
 		    filter_tuple->src.u.tcp.port != ct_tuple->src.u.tcp.port)
 			return 0;
-- 
2.43.0

