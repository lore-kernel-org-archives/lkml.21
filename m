Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565477;
	b=QhHwLni6FilJ1LccQcX6wUVhJpyQUYjRvOi60h/FC/bXQUBOriOxAvOoUZNHh1b4dNxk
	 zRO2/ou8WfWyYctviEABSxoH/DwRqg6x816t1DeK5Iuocu6OXLofSsFjtgLgirIzXe/oR
	 iYLX0jKo9HbLrIPFei8/ui5mk688rAmx58ymGQ/jP71QB5l2ZXhO0AsWxjaKmX9Go5Pva
	 G0VgMBHgOgw0qFRy6cmayk9rkbuNYud1Mja/eLW+/K13/Cy3yXJCWcx39Kfixim+7taIF
	 Jk8UyDfYbjN6PeHTniJzGAGqOrnVE90oMhQFR9CdsL4zcJSOIkXxk5QLjRnsUROLTZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565477;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:Reply-To:MIME-Version:Content-Transfer-Encoding;
	bh=KbjHZOXe3yXd2LuwCz1TJaWB6CC3H3w5sW7AffeKu8U=;
	b=YruAZbkuddLyLWQh5mFGSgJFsx4zGdn0YFokeXQVw2nQng9EBW0Z802QVjHBzPxJnmj1
	 ocK8TuT+ev1Rru3n82r0gGco8HvltKprDkVarXMKFkxOpQn381NdRsO0btOlGmuIVAqa4
	 n3i456ImLKz1l9cON0c8uSFfQGxiScnboRsFOFHO+XWezAA3QacwGw1mmhE/DlMRsnInw
	 yDdUzHRztgRDN+t6ArD7X0NFmaN/q8DhO7hGvBHgGXdJftUVZVv1MlgRIGrXsNgORc5w8
	 FXzLIzrHC7XHjp/al084lAqidJg4phmTSAGFisuyIaplufJ4WR2EAAsMNlikiVdnINA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=Pj0Tvhwv;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1WsyIDMN;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B86606A339
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B86606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=Pj0Tvhwv;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1WsyIDMN
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id D0B53EC09EE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:11:15 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 24 Nov 2026 19:11:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to; s=fm3; t=1795565475;
	 x=1795651875; bh=KbjHZOXe3yXd2LuwCz1TJaWB6CC3H3w5sW7AffeKu8U=; b=
	Pj0TvhwvQZOy82u8aP3+euA7keu3aomf7R8oRuDR/zAlUuyRikas64kZLf3j8iQd
	ewwb8EJDzbu38ZwmX35Gk8AXPY1bD4vh1dPndeaOSLS7hCwp/Oa8K58pYEHKkJNS
	pvMhuQ34PaId68yj36tFkouN2pD0D9eQ3TULG0645PLCv9TOvDS7fYeQGAOBKGVk
	pojcPc1NxNPmoh779uiPUN+Zs0wZXx1a176UmsQK8u4svYt9eyKSDfEvAUrzogtK
	Xew02at6ZMJyzmSGIxlIXcD9+JHjomUuu41PmdN9w9X/3ODLwfUGvXgCU3fq9SAE
	jmdxcArN+4NPE6V3io47lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795565475; x=1795651875; bh=K
	bjHZOXe3yXd2LuwCz1TJaWB6CC3H3w5sW7AffeKu8U=; b=1WsyIDMNlk5kPZb3o
	LYBPscth3dYHKiqDPwc9iTRpRpjokcwjCKdc6/3HuJ82Sw6MAhS0OaqEc1rHv5KZ
	N//Q+M1/MNwVZKGTU+0Oy4LxJO8pWJkXYFswmL0vt2mjeptL4R0J/Cc2csb7m6l2
	boyNdSCwyG+pGT4+JaycyTVzCES0jEVsmxnP/0/PIEITWIUYlw9S15otUc++c+gL
	+qkYFVclXov3knoy2YQLt/7d1zkCOom5d/iKAA4lKl3id+RraAUx8npirPUwjF7t
	dzfGiRc0t1f3AWgjc8WCTGG4sDDXfduKqIdZ5nDyjHGN6FktsR/TIkCfxzc77yXC
	cnUhQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795565475; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:NDwcb5OSjBvW97/gt+Sec4oyl1DNtb0dSRd1lM+do2kAo26
	AK8cKa5+mt4bcBRTXKDLC9qxcVAhwQBqdQrHyUbPHJJkG+tAPVsEIwnj/20X2vnn
	AWaWYewH0XR1rx3fYcgSHK27PWeylEidhty539baSg7XTS5ZQLXfHxZ7UOOgDLgF
	AY8auYdA9oZkMD6mSz5vDitvpxXP6oTgBMCOJltlaS7PNV9rpdJVw4lnMBgFWoea
	jMwv0bJktv3vN5oTB38iY0AlV1DJuBkPCuEkJ/K9urjMHYSL+kIZwEzvX2G62dAT
	y+SXh5AYMZr1QQVuNdOqVuA5G013+TfjZSdGK3w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,reply-to,subject,
	to;
Message-Instance: m=1; h=sha256:NWYMezOoetzPdSts5+4im5fr02moGmKyZS7tToDn920=:tcIhJLiDBUg7Vjy/oxda7VGLQUDMtE8Z2KCmsrQOvAs=;
X-ME-Sender: <xms:oycGa_ddqAiF8sHk4rkcxlg5BJGfPw0Bo2MI5dKitpnr-MjhB0l5cQ>
    <xme:oycGayHB7UzQu-ySKenS0vglpJx5nITDdVPsPGCP9kWp4TZ7THOuBHovALynEAsQz
    _mp6Zuhj4-OfG965lCYrnYRIZoe3bzebReVbyZuw1-AbztdJw>
X-ME-Received: <xmr:oycGa4SWtxK3A9iM6zBNZOa90qh3vfX330U4tc8PHev1rZIQ94_f3u_EhPDBp2zUDeZO8659AxEnoOMQQ4fv0md_f8SWFgU>
X-ME-Proxy-Cause: dmFkZTEWLT7VrCmqXFQ/3MlmFKwGsnI42jGU9wsAMLqZ91wz8mggV5m1msJjVSCHxeBUqJ
    t97+mptHMICXthawWKapABbbyhWq7+uuMmApmcH+Yba1WLWrkpVix7mPta4EAT8yMDamx0
    5loYd6jJqeFIrGsONkYYE6J9hbaumuKI+/Omki5Aa4Aq5KfhTiLPUl0BoveVjf5cOUWX5w
    4HMB7hKbpvsoA+vADp3tWal1VkBjpQ6AgmqI+ZRNztjqSQMs2MYuFzBsfnKESIRZVSoi1i
    NXRaNZOSkWUP3rzL/NZtKjvVOieVFii1RhBvtxr3qqxuVDS0tX4ZmqS3Hzxkk/+20l5gEf
    L9OyLHTHo+nOZk9IXVU/b0qIWnqDFqvY34fNs+XkAHPIEu8q/0QN6f1mjMC1ADmIGz1ZDT
    WeL+3prBKujD6Kd/i2ZVbHJqJLHgv480889t1GP+Yq/9jEiaVMz+tgPuEEPxu9DU2BBjsu
    PPA2A7z4rwy5VA1pNhr1MDCCONtm6KsKU02Nr0cmg7fE5Qt/D/UDCEEqjA5zimUklG1uNI
    EiFYZWITdnyPq0bJ4mo0mUy3tVsjVFUax+BqmmeUOdZe1MqitrjMHZ96yniqMnEDmecA17
    OX8E9zw8WkWnxPQL98wTuv5VqKPqjp8dLh2mDzpQ7n5k/irh6frmNKOsAWKA
X-ME-Proxy: <xmx:oycGawbelaThE3hG_LZL9IG-ENrM8KW_EdxO-0RTj1xTDfh1OJqIdA>
    <xmx:oycGa72icqyHwxkc92hJ7l5ojbjbFG7khPumm5StQdN9Njd5Fioqfg>
    <xmx:oycGa7oUSCDQHwMUAuE4zLgdMdFyjIKpIh-Y1C0qwyt8IONCGzu5KQ>
    <xmx:oycGayPWk2AQEzoMpwIaLKuZ7fe8D5HSoUQ7CjVbSM80OOl-H3QcTw>
    <xmx:oycGa5x9kp40FMeTUwad3JPlSzvzfZQ8x6rNdCyHkGVsiqWQslKPmgaH>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 19:11:13 -0500 (EST)
From: NeilBrown <neilb@ownmail.net>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Amir Goldstein <amir73il@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Kent <raven@themaw.net>,
	Jake Edge <jake@lwn.net>
Subject: [PATCH v7 5/5] Use d_for_each_positive_child() in fsnotify.
Date: Wed, 25 Nov 2026 11:03:42 +1100
Message-ID: <20261125000836.3984402-6-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20261125000836.3984402-1-neilb@ownmail.net>
References: <20261125000836.3984402-1-neilb@ownmail.net>
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

fsnotify has been reported as source of soft-lockups when iterating a
long ->d_children list.  Change it to use d_for_each_positive_child()
which will call cond_resched() as needed to avoid soft-lockups.

Link https://lwn.net/Articles/1079407/
Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/notify/fsnotify.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/notify/fsnotify.c b/fs/notify/fsnotify.c
index 58566e6b9679..33c5d10f78ba 100644
--- a/fs/notify/fsnotify.c
+++ b/fs/notify/fsnotify.c
@@ -86,16 +86,12 @@ void fsnotify_set_children_dentry_flags(struct inode *inode)
 	 * their d_flags to indicate parental interest (their parent is
 	 * the original inode)
 	 */
-	spin_lock(&alias->d_lock);
-	hlist_for_each_entry(child, &alias->d_children, d_sib) {
-		if (!child->d_inode)
-			continue;
 
+	d_for_each_positive_child(child, alias) {
 		spin_lock_nested(&child->d_lock, DENTRY_D_LOCK_NESTED);
 		child->d_flags |= DCACHE_FSNOTIFY_PARENT_WATCHED;
 		spin_unlock(&child->d_lock);
 	}
-	spin_unlock(&alias->d_lock);
 	dput(alias);
 }
 
-- 
2.50.0.107.gf914562f5916.dirty

