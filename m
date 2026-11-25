Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578374;
	b=G71qyYiOnFckhAja52NeCB6mG90HtXhpR6FM/9oFrreKGOpohMIAPY3u+QdNvKF5F/6W
	 FphXTtOlXznTs/1buvXuzuD0oVmhDiqixwHIziDdj88fN68CfJBHLKOeryPPtjh1lopMZ
	 /+moMBwYoLC5ZAFr0EAGTwRsN0IXBO7INVSeUZzuJATvRDo52vOqT1EJxmqMgY71iOo5S
	 hpMUHdaAE35b0DNugydzMSbWIxADjewrpJediNQiGpIBfpStVDOVmVxYVj70lXJ+w9jCd
	 IdGRKTq3DJysqQwtbsvCm6x0CfJAU+pxASFZ2zf07F45c+mvwCMfa1m+3/bd3HsWW3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578374;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:Reply-To:MIME-Version:Content-Transfer-Encoding;
	bh=C7sWl1wG48MQ07r4zoW2vh68HNiuHxVXcgb2L1fNbYE=;
	b=SYHEXl4G0NgxMTYMJhR6IlB5bNBTbmqW0gtm21zVzqz/iv1dOh+rpLp+17bRcUwjKMQ/
	 vV++igWrM09Hv5Ed/r2m1qzL9hPwe3FOiT7tpMvYxmFJh+0M4wLLrUF8agF/PAbJAtVKL
	 0FKpMASkoQ57f5ho50UXRGmuOZJXZH12eMbwiOlL+o6n+K46rVcQQEYnzCGeIQQvqmlgT
	 NCVqCmCPZqf2x6iZ18l18zzfmJ9uKRNbqIVqJa0672M2f5Dtja8q1acmScJu3aeA9kY0r
	 TWxIHttv6NkiAD8BXJgVTIJrLNQTHzzzf8Ovq5L0iaO95NSM975m88EvFe0l1hCWP0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b="uVJtjK/k";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DlNzxpVr;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFC0606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FFC0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=uVJtjK/k;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DlNzxpVr
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 69E12EC08AD
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:46:13 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 24 Nov 2026 22:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to; s=fm3; t=1795578373;
	 x=1795664773; bh=C7sWl1wG48MQ07r4zoW2vh68HNiuHxVXcgb2L1fNbYE=; b=
	uVJtjK/kqBeLCHeTuAHRJuLlf3RPlcath2fFONrOMLHy+oKwGL1wpxT3pS2agxig
	0J+LVxx3Gbm7TXxFLoKND6VP5K/bjuUB8aU2CbSmWaWmqD7dq8Ra+qHdd69d7yhH
	WrQdVd7GTdbbOmj3DKvaowfj+2/CYrCswVxxc6VT5ZNf73AQjd7ugBDmlVW+3rKZ
	wk7f/uT3ClLF7ZbC8fMVAflfI3ASxPieHksWGlt1qEeGvee4UyuWW7NHvICSiSDs
	iT1Tk0yD4XELKo2AWBFzE/zZ7jnDGgLd8YHEM3eWycSGBXQMWUCvbeqTE0+Ba/ar
	fR27hTwhoD8KywuFByw03g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795578373; x=1795664773; bh=C
	7sWl1wG48MQ07r4zoW2vh68HNiuHxVXcgb2L1fNbYE=; b=DlNzxpVrSoePkYu9v
	NF8GJpmu9FXSNB01Xmzx1wvX0kQgU0j3eZF+eztbtQABZNd2wmFyQrVaFVgtNfz2
	v7bkIuWRjANsIsASGAAqP/WUuHmxIcWa05q8PnsiQxRkv1THlOSkGT6zw+qoQpKH
	ef2WOxyAm8MvZMPdl4jGJJGcyDMWkOjADw/GDrcLcoYQfjQItIK3n1lUxxMShIfJ
	/GT7VsbQbZuNs4mcJP+l7aLK8HouyTW/E8DIx2ehg3dhhh8+rRizrgBdumi0E4kd
	W66/ElL77DmIimEpr+Fg03gujFcLEzaOafsI3mmsQQFDR2tWtAeLhO0hVFa1oUSL
	kHt/g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795578373; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:DhK2uPYPKtYWfCMG90ts7Q1vAjipMk3a01h35IhGRoNw6B9
	BFl7QMzXPiK7ZroziSmixzeROoQ/+0sOVCOrdWb33HerRpvQ6j7Q/86a8XgD33PG
	CCtCMERg8LCcTb/ieDKveVlx6RJr93Bb18gOzZl24tsRAiyAjEe1e9HSJ3h7BmKS
	ROMQh5SdioPKSt8sRWixJPRu93OAh0rXGxN17z32QoxKLqJE1bevNWuogoElyTSI
	hy/LqdHsiUGQcBKAVDP8keynyDsnK7rteXu01+HN+0VhufULPowxbQkk13g9UDNZ
	qaTE/UDEwWsti8eRcRw0BqRZvcvnIXi3e/6HFhQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,reply-to,subject,
	to;
Message-Instance: m=1; h=sha256:KKPLl7NOjgl4PUEDrs6CD/OeuuCjs3Y6C8+VT2udHV4=:Xd1WqezOWR4RGPff0oXZeRAR/TSzcmc9gClT/ovY9uY=;
X-ME-Sender: <xms:BFoGa3PKtOwxUwkZpViaqRwLM60pvm2UTcI_JQ1z0-14fVuLcq8NPg>
    <xme:BFoGa47ixKdcBLDhCGczbRSygGRbY7bGID5BdiwAtbWJVPCJMHnI6j3Gnv3kcIupU
    RssUQLPMMAwsi7DPxbeNe6a7I8vZcvyImfC2QhSGvOJVXo7hcY>
X-ME-Received: <xmr:BFoGa7VcNwOKoKDCpg6IWBH_2M_tw5767rDkPAQypRXCyrYinMLGTdg5Chvih2ajqY6kIBchkPEE2rNxeuGu_vekhZCZM58>
X-ME-Proxy-Cause: dmFkZTEynqFP7J5CyP864zJ/XBXUDXSwXypje4KQHx8Td74dpnR0VUtokV1VIo6Vx6RvWY
    OwcUpg/bo5jA9DF1nhHbEWSmkeBRQExzYYNm6zYQ4OlhmT8++hv04QLhCP77UTRa+ts0Zn
    emG1u4CBc9EwIQZMHpuGtkFzNaPM0COhHCVGi+vUdiGKTo3oTFKBSdfX5nxIKQZvHQpAoR
    JpPaJpl8D3VaaEmf1HZfBeZUeFh1WggTkTCrotD4I8diURcXOaSBUF/YM1mWjxdOr0yho5
    GSRzb/bSajGZoPtTNw69mn1JgOv5z8FPk55EPMBJOvn4tHIN4QhGRcsvm9DrK4aqK7NvD2
    Auh3n7/rDjlV67SzcxugKanVYG5RjCb+2NOn7i5iXuy1FXFNhK6aoTMbjaXLP86pYz8Ryi
    /xaDjmigZlJ9MzIuCR1/cpAYWU8RM0/OSl8D30BwPV295xbiau2P46CfJBhXPmmAmbwfAA
    rMYnwG0NgcznoAzShUK/LdM32r9rzQJvvXIyjKY9pSIX3gv40Ug5iE5k0g+Fqaspj1Stnt
    Q9On8TYylyL1Vwi7PINVpAOrfn5rfcbPZMFI9FpdLNXs+rdEi8K7Q6RAmcTrnkSDl3Ud9C
    7gTClZteLBjWpe1mA2wn5DDy0iuc9YeQ9wLFR38CzkpMdV5riazKCBcxy66Q
X-ME-Proxy: <xmx:BVoGay1Pb62Umx6kGOGGYs5ti2Gs4wBbDevP3TetIprCpZNgrv0qsw>
    <xmx:BVoGa6MYYvfGpcjV5mkkETu-8Z7WFPT_UmOF76FH0StQi9gMWAEIng>
    <xmx:BVoGa93G_APMlc8X2Es31MMyo9WNoNXWyJxQ1I1bnc39BTUkzwXrsw>
    <xmx:BVoGa52CU_oHN-uQUXv_6U9Kw8RijGEzNEj7wU2ccjFQ_3qEPWatOg>
    <xmx:BVoGa2bN0PF56IAc24GwBM3OzhUNEMeljhz6gvsZ7nSZKLA4AQlU7WUT>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 22:46:08 -0500 (EST)
From: NeilBrown <neilb@ownmail.net>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jan Harkes <jaharkes@cs.cmu.edu>,
	coda@cs.cmu.edu,
	Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	linux-kernel@vger.kernel.org,
	codalist@coda.cs.cmu.edu,
	linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-afs@lists.infradead.org
Subject: [PATCH v3 02/11] hostfs: don't d_drop() before d_splice_alias() in hostfs_mkdir()
Date: Wed, 25 Nov 2026 14:16:40 +1100
Message-ID: <20261125034543.4084039-3-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20261125034543.4084039-1-neilb@ownmail.net>
References: <20261125034543.4084039-1-neilb@ownmail.net>
Reply-To: NeilBrown <neil@brown.name>
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

From: NeilBrown <neil@brown.name>

hostfs_mkdir() uses d_drop() and d_splice_alias() to ensure it has the
right dentry after a mkdir.
d_drop() is no longer needed here and will cause problem for future
changes to directory locking.  So remove the d_drop().

Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/hostfs/hostfs_kern.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
index 613146e76dec..7cf25c29cb78 100644
--- a/fs/hostfs/hostfs_kern.c
+++ b/fs/hostfs/hostfs_kern.c
@@ -700,7 +700,6 @@ static struct dentry *hostfs_mkdir(const struct mnt_idmap *idmap, struct inode *
 		dentry = ERR_PTR(err);
 	} else {
 		inode = hostfs_iget(dentry->d_sb, file);
-		d_drop(dentry);
 		dentry = d_splice_alias(inode, dentry);
 	}
 	__putname(file);
-- 
2.50.0.107.gf914562f5916.dirty

