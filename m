Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578411;
	b=vh0XacUZeC3TwadjtMSton5EoXsAlsRG8cSzwhxYMy3LneYnCTdALcLbFzZnw78w2yIA
	 2l2g8ZvKqcO1CoUEMzVdpoIOJqcm94omxi5dRJmfSiHIVaiBv5owACKr6gA/Pi5lmHKu0
	 1joXc50fotfUbbQ3i0OlUfP99amWiTOT6eV9kk+lzwXCWQ3QttdL+tW0q3CU2/tZjqo5P
	 D5i8cuxVe7UdpSTsMT99+9Mcs0LSlDaldUgYN+oMdvYBmUo6T3cEXlkZSi0yXmkyZTwfg
	 cd2cXjLmqFLoygvvzl5x1WZaMlaE0u8Agx0ePgZRs5Dzb67uOUmm12b4v3UyQDbIRNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578411;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:Reply-To:MIME-Version:Content-Transfer-Encoding;
	bh=UBXcku4BANKUZbouEAZSdvrf1Tj7sDqkutD5xhyaTdU=;
	b=MxCTkia3Kgxde9bGljUk6SD1Dh5+YEGh2bUoYV972sMrVMgLMdBJxh/MPDj2NLOVnATl
	 IEHAxzys+hkJW8T4zyixYFp12kz8EwI4FlD0vA1UsOTyBN4OAbQxUcRXeWDg8AbMfSvoz
	 JVfeq0odle+Z/WM+VD8ga05SYf/yheQNF/GNMiraGHv1gbeTeWO7gP9EA5cdVKCWFJrHa
	 cckpKuUBD1N5ARXukHpcmj1Gl2KdOESBiA8WzF5e4QC7dUxYeJNJmJa+E3bZUv8bchaCR
	 XpAAkuuCs3krT905WMfq77xUOvqh5rJtMO2E98dvvf2D6Nz6jxYlh9ngF4RNM9/hNKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=D3z9PhsR;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OiBXUgTn;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D9A606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D9A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=D3z9PhsR;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OiBXUgTn
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3DAE41400319
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:46:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 24 Nov 2026 22:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to; s=fm3; t=1795578410;
	 x=1795664810; bh=UBXcku4BANKUZbouEAZSdvrf1Tj7sDqkutD5xhyaTdU=; b=
	D3z9PhsRibw/jyqnbd/8dr8DJKN+MwbzBNR2DYz6yI7s6PJhWjN95ZMc3t9QevST
	fgUANP+XeTEKYRHXXPV0Su+JQ3TA9nQpBm+Alij+YJ+O25ispInHAJNKVfon2iEp
	ZATaQkZq5GtxckU/qeGHHSr4asGmVtJg33ofoQS3Dj7ynzVv2+5c2MRMbBq8wEtn
	Auzu11LyMAOuFLpWtjdP3hEXLB15gAbnl0q9U13kCXGSmu/VZ6MndrYmYiF7ffsU
	mg1EIl3dlSud2LyGPevtQnZOfOHFwvcx0maCU1QZA2jIuMB2QzIYUE7MG9e/SSCD
	Wjk34Clz9rxVi1//dv9X8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795578410; x=1795664810; bh=U
	BXcku4BANKUZbouEAZSdvrf1Tj7sDqkutD5xhyaTdU=; b=OiBXUgTntQ5FeIDi9
	n76km4wA9oBDeWcYm1cIGPkHZRGW6N6ApFlJU2BdUWqvjo8OgCB0lO3sluWhLIoy
	TtE0XNZoD0Yhk4QvGAGlNdJ2VIpljleK6bLVpjGm2LbGV0H7W/kzQeCJN/IHNQJh
	0Zo4VdEjUPkeXASS/Oyysy75ra0GQufJ+fMIW8cr9cifFziDc7Y5+oUQAP46QYpa
	7oDLRqiKMq2lZwQ202e/fsftpMndRdE+BZtT2kV/gOX81z59XOqjNPYkp2YAsxrJ
	K/eq7a91d5mkPQtPVotIekz+73IzxbRoUWt0Yz/JlAu1JWKBYgzMSrs3fv35+N+u
	0j2Lw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795578410; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:tkotTl7PCvzZhkeSeONnfxlhTdlK5dyUg4xbRkHF5azKP+6
	HHjEmHm2nUcscYz7J29vOVK9YtsJ5WW/5OeezhrLhhtR0u1THq1WzpafE9Sr3FQF
	O+xz3Cibv4LQXg+gMsSPwYTZ9AXxVpD7H27/13Brqeyn2IMvA3lK20fh5fC000mD
	2Nih17N1WuaOJ6lC5S7jbOAohBlqw54TOKkuB0P6U2sMNTPr/TB96QpEQVVTEXoO
	iAeQrSZ9dPvfkOckM24RTTD/NDpRyZvaYKNl+ds7F74oAUoVVStJsKxjw7zkhNJ1
	B9K3OpArdUdNhHipdCP4XhKmLvHbP3jMFAyPwqQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,reply-to,subject,
	to;
Message-Instance: m=1; h=sha256:qhXvgrzkw6Ruu030e3itkJdTYm3rUf3nAGH3FAeMnfA=:zA9GEHp1eIGnK4tGy8YN/9i+8sZXWBuy1Zpf109ei4Q=;
X-ME-Sender: <xms:KloGa4dlKkVE_dG8XPuSoMuqSZJhxKE8LVXIwM8nhzTCzh9e7hE-Ew>
    <xme:KloGa7rWp-acdw7zo7AC15Gf6Q1kR04aPLtlL2RLLlSePe7bgUfKxpDZUUsIYSTDp
    69QBAvoAuxPKiqexoOAhEp6EwpvMkBmDdLqYicAjfPrTeuSwAg>
X-ME-Received: <xmr:KloGa07Bj2QLpFy4Y5-S0MK4lM8NEImoSveoZT3EFD1RWFxywhwl4D81VdvGJrjfbHUZhe_CvCcfWvIys-t3sQMFRqeWqTQ>
X-ME-Proxy-Cause: dmFkZTE4HtNMS82oETeKxjFsMonchsNmutSXRF8P4Wz/gL5NuR+PmnhI7BdBjNpxinbAbR
    gE9fr8C0GNc0SnxE2B+IXDaaoddndfcEJfJtcWeI4ytNiRF08hWb9RlxFjA1qgM4oFyoJi
    /AdIhJNfEVO0oVTJtQVCvv+X67aNRews2LQwnM5uAbOmmoGahsFhP1aXSbisfk+ds7cJJ0
    OsFbDOPt7ZICh4tniydbOvMlt1+f+7jVXUCHPaOJHWPFgfTUvPivbmMoJSDdfil0VmV1q/
    2QMjPNE1ltm0/CAvjxy3k0MqWfenoOEUWjyOM0HmgbohwH+N/2hScfzSSITnIBzePDS5Dt
    vrEJcWcGcRscohUpQEDjaTWG/IdAvCa37ziXe2Z5To667kLN9lI4AOPPZ2QW3dS//toHMK
    M1ZwFdOXHsGSc3ILp2vVgN6Zc0Rkf4su6sUUDh4gm4bljoZot9WVcaW8assVGalY3Mx5xy
    RHBkQoEgztQZteoFdBmQqEVrNeySVqmG9iqsBHAETgtxlenWh/IjSSYwuGxEchmnvirT9m
    Tt/iNJJmAWzf7iIRk8j9UUolVxg8xm0WEWqTdg1n+tStAFvodxq6NnaZH//ztqcokpBMB4
    2B0N0duNgIhRcYVqYezcO16d6fUZznULSH+l2w9Kw44fr3YMz1HIVPJQFTsg
X-ME-Proxy: <xmx:KloGa7BWKOvNskizRjLpWVYYlNQZm7-TmGn_etbYgKwDv7hDWDEZXA>
    <xmx:KloGa2bgIGVo5fyO04sueOhVd-BUXqae89IPsFLbsR1u4kTPMf_tpA>
    <xmx:KloGa_J37x2RkPpO7f2UopAcjHH2nIoO2FHLKG-EcfumSFjILyvCAg>
    <xmx:KloGa_DM1C90JgLs3zpRQomBAnIcAS1pGlEaCn7QtFBRBiFnLyZ4tA>
    <xmx:KloGaxi9rO0OvJP2zbbRNDcFR028vlWe-RrO3BaalUaHDKeMQKoKGh5m>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 22:46:45 -0500 (EST)
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
Subject: [PATCH v3 07/11] Revert "VFS: Add LOOKUP_SHARED flag."
Date: Wed, 25 Nov 2026 14:16:45 +1100
Message-ID: <20261125034543.4084039-8-neilb@ownmail.net>
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

This reverts commit cc47a1ba1983116ee7a720a79197eb5299ae5d31.

It turns out that we need to make all ->lookup calls happen under shared
lock *before* the places where I planned to use LOOKUP_SHARED.
So LOOKUP_SHARED won't be needed.  Let's discard it.

Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/namei.c            | 20 +++++++++-----------
 include/linux/namei.h |  3 +--
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 925aeb63bfa1..6d63a4c08495 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1939,7 +1939,7 @@ static noinline struct dentry *lookup_slow(const struct qstr *name,
 	struct inode *inode = dir->d_inode;
 	struct dentry *res;
 	inode_lock_shared(inode);
-	res = __lookup_slow(name, dir, flags | LOOKUP_SHARED);
+	res = __lookup_slow(name, dir, flags);
 	inode_unlock_shared(inode);
 	return res;
 }
@@ -1953,7 +1953,7 @@ static struct dentry *lookup_slow_killable(const struct qstr *name,
 
 	if (inode_lock_shared_killable(inode))
 		return ERR_PTR(-EINTR);
-	res = __lookup_slow(name, dir, flags | LOOKUP_SHARED);
+	res = __lookup_slow(name, dir, flags);
 	inode_unlock_shared(inode);
 	return res;
 }
@@ -4446,14 +4446,12 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
 	int error, create_error;
 	umode_t mode;
 	bool got_write;
-	unsigned int shared_flag;
 
 retry:
 	open_flag = op->open_flag;
 	got_write = false;
 	mode = op->mode;
 	create_error = 0;
-	shared_flag = (open_flag & O_CREAT) ? 0 : LOOKUP_SHARED;
 
 	if (open_flag & (O_CREAT | O_TRUNC | O_WRONLY | O_RDWR)) {
 		got_write = !mnt_want_write(nd->path.mnt);
@@ -4462,10 +4460,10 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
 		 * a different error; we'll be dropping this one anyway.
 		 */
 	}
-	if (shared_flag)
-		inode_lock_shared(dir_inode);
-	else
+	if (open_flag & O_CREAT)
 		inode_lock(dir_inode);
+	else
+		inode_lock_shared(dir_inode);
 
 	if (unlikely(IS_DEADDIR(dir_inode))) {
 		dentry = ERR_PTR(-ENOENT);
@@ -4534,7 +4532,7 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
 
 	if (d_in_lookup(dentry)) {
 		struct dentry *res = dir_inode->i_op->lookup(dir_inode, dentry,
-							     nd->flags | shared_flag);
+							     nd->flags);
 		d_lookup_done(dentry);
 		if (unlikely(res)) {
 			if (IS_ERR(res)) {
@@ -4582,10 +4580,10 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
 		if (file->f_mode & FMODE_OPENED)
 			fsnotify_open(file);
 	}
-	if (shared_flag)
-		inode_unlock_shared(dir_inode);
-	else
+	if ((open_flag & O_CREAT) || create_error)
 		inode_unlock(dir_inode);
+	else
+		inode_unlock_shared(dir_inode);
 
 	if (got_write)
 		mnt_drop_write(nd->path.mnt);
diff --git a/include/linux/namei.h b/include/linux/namei.h
index c4436e5c2ba6..da5b4ccca1b5 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -32,9 +32,8 @@ enum { MAX_NESTED_LINKS = 8 };
 #define LOOKUP_CREATE		BIT(17)	/* ... in object creation */
 #define LOOKUP_EXCL		BIT(18)	/* ... in target must not exist */
 #define LOOKUP_RENAME_TARGET	BIT(19)	/* ... in destination of rename() */
-#define LOOKUP_SHARED		BIT(20) /* Parent lock is held shared */
 
-/* 3 spare bits for intent */
+/* 4 spare bits for intent */
 
 /* Scoping flags for lookup. */
 #define LOOKUP_NO_SYMLINKS	BIT(24) /* No symlink crossing. */
-- 
2.50.0.107.gf914562f5916.dirty

