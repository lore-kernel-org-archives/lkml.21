Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004944;
	b=bxdNqgZDSNe8N1LCakupHbuupBsi0iP/QgeN6guQp5YxO6kq9dWqMtQlm34JOHmFh+EL
	 hMDbZio0QRIxRwzpW1Q9wiM8X9nQazXGfUInBVhUPHc/UzJwYiCy8GxDSJI9Uo30+wD4J
	 txRXZ8IQr4XmAHXW06bQcWzismjle8I015ve5LRxYRWzKPBoYWJzylmO+CsDtgNJCIo6V
	 EAXFH/vihbqOhgvkzwwMepdgqoeLXNDmEobEuANzpX0tLJZDgtrgw7UwBgKgZoTJ4rW1r
	 AgimZA9bWF7dSVCfvpnLEtxI4LSVd4J7x8t0deGuKUmTmMoVSLao4kCW1Lz4ZHLEhHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rBHUNIeg71PAnIVFvGQABUjBmJpAmg4Ag12k4fFD3zs=;
	b=eiCjE5Tg6s34o2E+twfyxI+0kL1gVu1GYCMbDKGC71SYUKlqv0+keSc+4RoMV0HUHCN9
	 RAD39HVrNxYrfuALjzaiW0JPMWCjhBt5yWhXzaWhC5Hidq8VRdLPPdbY4RfCEJzrAqRkS
	 qptY6Rb7deO81xR6ZC/99EIbX9EJRJdWD9/rlaO8MiTKXKfWzBX9KijDan5McLsU/Pwi6
	 zjPoj5YNJ1j3LUaKpdvPmxQd3sKDqTI6brFXt21uQVvPtobnETMvB8VDaUlmsqH134Ncz
	 kRxBiJzYAcLtgTh7mBg+hAY8ZlV/OJOVBX9DL8faVxJw+LKFLy6nz5MYydSCyBqSihA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOFCtPLR;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E853D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E853D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOFCtPLR
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so2233200eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795004943; x=1795609743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBHUNIeg71PAnIVFvGQABUjBmJpAmg4Ag12k4fFD3zs=;
        b=uOFCtPLRh6NiXcbVdbUMDTaueXMu9tBgVehZNx1X/7saTLLqJJH0TeWDC6935IlAE5
         CKVOJbMQOHsmEBnuN0YSguK8etPgLd2L5/l4Dn3wlr44jq9cPLX+aHG/bENtqnp6A7cS
         seSwO/na0zf0KB5ckjcceImRMOjtCKDOAohMAn5/CWRaVYXxP87oj4YC/Cx6tbgucJwV
         lZRGYwEgxMG3FfHrvqjnLetz8+2k/7v8ZTFI3Xs6qRNJeWgj+wRmGJLQYaWJwAlKVj0L
         ZBSHkPGS/f1laGbMvuO4fFcv9wrYvRvtbvcBIX2Qqqvm+o41Tr4rB5kjU8YS7PzbE4E9
         na0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004943; x=1795609743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBHUNIeg71PAnIVFvGQABUjBmJpAmg4Ag12k4fFD3zs=;
        b=EhQITb64b7oC949tQb4o/W1Zk4nSJnC5A/XPLW4IHy2fAuBAA5lb9vWZDFUUspWc2k
         979HJDB1zt2RIyJl0f0VHLoTE8Nq2St5UtPlDEbKV9W0DId5eB6J/GdK0QuTX4tdTKb6
         MQxpd+QuC8gKclfmHo20NW0kYcSTse0fu+u7sht7wVog1zT94I/Vo3pGTePF79QQdE7K
         vHj0oI3JPS6W2Fzna4Mpwv04lkQVL8Fh+Yu/ZzV3UDYEwg7WOqCVgec3C/T4eiGsXbol
         8bW91U8HPukO96IakTC6qE9x2Ihqh6/WdmwOECvL26sRLrd3+xj0CA6IIsq+OwubSeld
         nPig==
X-Forwarded-Encrypted: i=1; AL+hErHlwVTd8sp96Pxe/KQlXgOQkVsLBCUIKsoueyVWd2r/pvrDEUEcGv1T1S3+n7x7XqCq+I7IkJFaxlsbhOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XxlTkdTXOVaGBip8W5HN0iWMkL27Q1XCh0YxHORunfLfKoulh
	ZJ33rD0piWLqeDSTaSldk/TyMim77PmDZkUnx02NsquvK07CRkzGc+/V
X-Gm-Gg: AZFdTZdmMES2bGgBkGI9GuFNSHTDnniAlSKK+HB1LgoUertnu0EuvssfJcvA3jtGCFA
	tKTEY+cYDqQPX6nDN4aN25T5Peu7rhNwSzoLpLuf0Z94NCH1meTLml90egMdh90+uS/RNzgzZKb
	TiFPOTYD9e2BdsKVB1nXcWf8yMEr2S6MrE3oppG1wHa7lFUT60Hwbg4Y4R3wN1wkq0dF55BO1HQ
	T5ptzKzrC/oXlYKDYuhnkOireXOlnT3WQ+JtMnulY7IKkHujZaWb9WIDp+tquITbBBDZSaiIl4c
	EnMRznKT0hUZ5AGKgOvH12XRFqrPiiKcJIQzRmpdGWm4B/MmgIsreTzU6NEw0sb6jVgSIhPZdLW
	dXRSwzB9cOrPruz1HVyEeZvmw+DIXKdP/Pw32q5Ls1f1n04hK8ss7wixAR0LjVG7xSjbogJf94Z
	IflBE0Z9kSr4Z9VwyrQy+95zJYXQyfZdmyzxAQ6ruXVrfU/8ct7Jt5yM/FdTOSUwYLQwsQywRZe
	DLu/IHPYs/IYAftBkCV2Pki49HgxYtNIKtYKZQhEWdQ5/1njdVy+CtqYaYYl8lHTsasNNagEF2b
	NRibkxdZhnzFYiJohRNAccxsIUZWiPed7KD0FxDDAz0RRRM75hQyAwTHktwRE/7bC8/yys1/Tgw
	kCQ2OEDFnNcac5X/Mt19ODC1L51qlIArs9D6+sdYYlndUGhW+w3gZSDruDD1op6CRjqNJXdpZtw
	Lat/Q4tNpva0PzHbJ8TGpfYhfa6P9Q49mfj++fGvQMVvg4KL1dtlouCuCGWfiQq0gEVfrGFqITX
	64VZBnD6SvS
X-Received: by 2002:a05:7300:2150:b0:383:bc0:77ea with SMTP id 5a478bee46e88-3830bc0895fmr1468156eec.30.1795004942743;
        Wed, 18 Nov 2026 04:29:02 -0800 (PST)
Received: from FT6N242TWK ([223.181.117.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7eaf3b3sm8948312eec.27.2026.11.18.04.28.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 04:29:02 -0800 (PST)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v2] netfilter: ctnetlink: support port filters for SCTP
Date: Wed, 18 Nov 2026 17:58:56 +0530
Message-ID: <20261118122857.86193-1-jain.sm@gmail.com>
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

The kernel side filtering of ctnetlink compares CTA_PROTO_SRC_PORT and
CTA_PROTO_DST_PORT only for TCP and UDP entries. The SCTP l4proto
parses these attributes into the filter tuple
(nf_ct_port_nlattr_to_tuple()), so a filter such as "protonum SCTP,
src port X" is accepted, but the port is not compared and every SCTP
entry matches. A filtered dump then lists all SCTP entries, and a
filtered IPCTNL_MSG_CT_DELETE removes all of them.

Compare the ports for SCTP entries as well. The SCTP port has the same
offset as the TCP port in nf_conntrack_man_proto and in the dst union,
so the existing comparison works unchanged.

Found by reading the code with LLM assistance. Tested on x86_64 under
QEMU: with three SCTP entries, a delete filtered on one source port
removed all three before this change and only the matching one with
it. Filtered dumps show the same difference.

Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Changes in v2:
- Target nf-next as a feature, not a fix (Pablo). Drop the Fixes tag
  and Cc: stable.
- Drop GRE, which has no ports (Pablo).

v1: https://lore.kernel.org/all/20261118042950.83129-1-jain.sm@gmail.com/

Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

The QEMU test above was run on v1, whose SCTP part is this change (a
small raw ctnetlink program in a busybox initramfs, x86_64, TCG; TCP
entries behave the same before and after).

 net/netfilter/nf_conntrack_netlink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index 4b6abe3..798c11d 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -1127,6 +1127,7 @@ static int ctnetlink_filter_match_tuple(struct nf_conntrack_tuple *filter_tuple,
 	switch (ct_tuple->dst.protonum) {
 	case IPPROTO_TCP:
 	case IPPROTO_UDP:
+	case IPPROTO_SCTP:
 		if ((flags & CTA_FILTER_FLAG(CTA_PROTO_SRC_PORT)) &&
 		    filter_tuple->src.u.tcp.port != ct_tuple->src.u.tcp.port)
 			return 0;
-- 
2.54.0 (Apple Git-157)

base-commit: d0107f38162279d9cb0e012210731176265f835d
