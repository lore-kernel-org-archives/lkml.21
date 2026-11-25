Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596047;
	b=vPCRskkyx1UTJ3D4cr3FmwlsdW6BuMkr8cd+CtpctnpoV3UBwleIx0Jgu8nxli/7pteu
	 Nb3zaQuQ/GyJsn/jsx/BdHtipEW9+PlRvNOa4GosTXWr+5qw9CnIcjHHxRKqDD9sLsmx7
	 h4ST6PocPCeei+nKe0pOe7xG777yf3WDSJcH647PrhdPCPn3Jpb/7/6gFrKL5vU/KjQW7
	 JMBVOHV52s3vbO7gf64ov1iIYzsud9BkBP+qtESyMn2JoL/oGE2p+F9/ECK7LJ+uGFNIL
	 EGpyl4vSLkK14OSVp5oAqoiokLW+jD9PFIDARlmCPxJQ7Bu1Yx2SahSeQvyUla0Vb2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596047;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=KBhJWjoCuN7gPkQsIO+HmioAeJBcz2EoxYRJ7u8QXhw=;
	b=yLA/o+jyf+OCf3uLvRTNvdyiUwsXW1NMh0PJDWUXfRAjf3ISYTGUzxcjTTd/1c+u9DRh
	 RA3XlvFFF00o5F0nbqTumi8DIyqmQb8jxeEoUsKwQIqTmOQTMW2vYFad87gZcUUH/rSzQ
	 xGO7ywZLavte7hO8TM5HDzJfWjETIjrKnVoaoiHeTHAidnfF3X9GAyBWQFg4au1mrTaL9
	 SwjGt5y1/5h0uqVhgI/Yt067fXdEoxQLIh+N9HcXtSW3/dp9BBBlCBr1T+NmdEYeKVRDP
	 rkE5iYf9mGb5GiZ8qiGXzpEW/8v68pCJaDDTmUl3Dq6vikYkEEBLJsgcb9QJp7gyLBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kYjC+nyB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=z7PPnUMD;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5EF606A685;
	Wed, 25 Nov 2026 08:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C5EF606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kYjC+nyB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=z7PPnUMD
Date: Wed, 25 Nov 2026 08:40:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795596045;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBhJWjoCuN7gPkQsIO+HmioAeJBcz2EoxYRJ7u8QXhw=;
	b=kYjC+nyBa1ga5OCUKv2TyqYbEToVPaM6bqsU762RB0bh0kGUTgQMQgoExxDfI5AYkHcYoi
	WLXnqROWpRlOWUXGLEcDQfutymoVi5E8RSm75G1mnS4gtg7JGOgethh+yAgmM/HloefYRM
	1SIVvk9b6XRLJl9ZlO4tA7n46SBUDvXyu9A+qOjx4IXTV/qWhvQUH2XQQ1NCWWNdQBcRDl
	aNkxCjuaCwTef8VkgftlC0NtEaIEVrH9D7nGapGeZS/1fXVjlje4YIRABawV55lwl226/E
	jZ7UFOd6gISUdUukgzXNGC1/GBb3W+twk7W/g+I46eIqOnKy0cefbOzxSfyjsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795596045;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBhJWjoCuN7gPkQsIO+HmioAeJBcz2EoxYRJ7u8QXhw=;
	b=z7PPnUMDAtqpZWsVqupgDwEuSHa8P2wRf/iSIJ5V+NMMHuFt2AXxAnyIHg0Y7H1l75Cv1D
	vDxeZ0XQtM5bo0DA==
From: "tip-bot2 for Armaan Sandhu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool: Remove redundant hash_init() of the
 instruction hash
Cc: Armaan Sandhu <armaan.sandhu0504@gmail.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261005222247.566632-1-armaan.sandhu0504@gmail.com>
References: <20261005222247.566632-1-armaan.sandhu0504@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179559604383.92412.5459480762584819642.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     8cfb5b5ca77e6d3c702dc9d64503ba6529c7169a
Gitweb:        https://git.kernel.org/tip/8cfb5b5ca77e6d3c702dc9d64503ba6529c=
7169a
Author:        Armaan Sandhu <armaan.sandhu0504@gmail.com>
AuthorDate:    Mon, 05 Oct 2026 18:22:47 -04:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Sat, 21 Nov 2026 23:38:32 -08:00

objtool: Remove redundant hash_init() of the instruction hash

objtool_open_read() calls hash_init() on file.insn_hash, a 2^20 bucket
(8 MiB) table in the static objtool_file. Static storage is already
zeroed and objtool_open_read() refuses to run twice, so the call only
writes zeroes over zeroes. It also faults in all 2048 pages of the
table on every run, even for a small module that uses a handful of
buckets.

Drop it. The table pages are now only faulted in when a bucket is used.

For a small module (xt_mark.o), objtool goes from 2.21 ms to 0.70 ms
and from 2189 to 210 page faults. Running objtool over all 4856 modules
of a Fedora 7.2.8 kernel (--module --dry-run) takes 17.3 s of CPU time
instead of 23.7 s (-27%), and 7.1M page faults instead of 12.4M.

The output is unchanged: vmlinux.o and all modules of an x86_64
defconfig build are byte-identical, and objtool reports the same
results for all 4856 Fedora modules.

Signed-off-by: Armaan Sandhu <armaan.sandhu0504@gmail.com>
Link: https://patch.msgid.link/20261005222247.566632-1-armaan.sandhu0504@gmai=
l.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/objtool.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/objtool/objtool.c b/tools/objtool/objtool.c
index a4e139d..71e048f 100644
--- a/tools/objtool/objtool.c
+++ b/tools/objtool/objtool.c
@@ -29,7 +29,6 @@ struct objtool_file *objtool_open_read(const char *filename)
 	if (!file.elf)
 		return NULL;
=20
-	hash_init(file.insn_hash);
 	INIT_LIST_HEAD(&file.retpoline_call_list);
 	INIT_LIST_HEAD(&file.return_thunk_list);
 	INIT_LIST_HEAD(&file.static_call_list);
