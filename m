Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130944;
	b=nyzlmBHNIV1St2noHR5VN7/bhe/FUYHlxCVUlFqwOmDMxh7YGjMYJTJhlrEHiEe/AJ/i
	 Q+TTG4JzxTaHuM7wt8RXcyVrMS5CoXpKVl86MSBUGVS1e93WsXoF7JbAj394w+k1Sg3ve
	 c8XIL349LlYwIcGMxMYfwNy5lQQ0/xtVy6u0XyzEO1ZcGhoc/G/V7GfVJ3x8TNgQaCYol
	 9Tv/cZjDtxIE5lAmyUPGzerd476creZA7tFsslCtxebFrAeKGVlwXb7iNrfRFDaLZ77Wu
	 JI/FLR+NuWQb2sG7xvNDNsFsmaYlizsC9pd5rqCeOsa4YGuSpnLBjCAc6teg6YAgDSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130944;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=nV770Y5+ls6kyvkMU7FuB9vsMQeJ/HbkmEK0Zyh4MY0=;
	b=TXv6I5zgU9tuhj43wkY1r4JJaHDTSEvRxdqrBLktyXBZ+11x0yn8YeWUiD0F8ldT/WTx
	 Dfgs/SGwEI6C9M8GiHOm3Ja+UM5tSqQHJzeuT7UZn5yVGm+3BAQpr4MP5+Xh3Pj3vq/oc
	 njdqmaKUyep5xp+t/ENvL4yM2neGhnv6On7fgY25/7pJOfZ0KPgsWbH+dNdBhp6DdAdqf
	 Kp9ICttuHppKPxNK6iShGCLMeYtwMjtOYAof6p9cT5eaaPxcfAyYzOMXn8YpeaohFx3BY
	 v0zQeheZex4mzOgfzesJYeDr/uRaO/8kNVBDRp5kNzg/T7KCqR4ZiRVs0Hbs2cWJjcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=D0b8EKRV;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1dBv9NU4;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15A0606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B15A0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=D0b8EKRV;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1dBv9NU4
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id F10571D002CB
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:29:02 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 19 Nov 2026 18:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
	1795130942; x=1795217342; bh=nV770Y5+ls6kyvkMU7FuB9vsMQeJ/HbkmEK
	0Zyh4MY0=; b=D0b8EKRVEFxGf30TJoHX5Lv4/lCMc5d9/UTf4/8HYHHgwXZ6B2v
	yNrO5E77nNhEn76iNP3RPjl+kIKCnAoauh8+eCESDmAJ3QVBH5hPXjn7nxG7UacI
	Xk6A3kM8WVo3Kaql5qt0R/gh07qoGgw3CQbxT19WY0fEyUNQPNROMcu2A7lNvt4l
	22aR0aw0nIAdd0+0+9Wll3Yc3B+eFltmTJ4t2otk+2nFuSXtB/tydFfmJi+NdWqo
	RgNVjLyc+ai42PTKqVxiZWKzmjHa3MFDbWdNgWRantQc5q/VReYUIzm2/bw7nT0Z
	3oPThFjki0bS8dSWAmm2PuSKB0EYP8y5DJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795130942; x=
	1795217342; bh=nV770Y5+ls6kyvkMU7FuB9vsMQeJ/HbkmEK0Zyh4MY0=; b=1
	dBv9NU4fG4h9uDPxohaGPfCdOV3x+r6p0FzQ2eP0i6Dk6TuyD3fT+rqB5ci9z1I0
	5MfqYn++W2IePO6WAP/9GqmsdR7vPA9RFsK3kZakvgLQIT1AiqpAFJWSdpl8xFhJ
	A6wBJCGVQTbvlWzbU8iusILtejf6IBuw/XZMg8wr6Mdr8GwJKSLJPHssoX1GBF/D
	gYGybfXuuZHKcDoVB12FcZymERJAmTcvDajwezw3fR7163hodnS8HFVEmfj1bH3K
	10yubAJIye3PHYPGfL6A4ADoBB8beYmhI3RDo/XVJ3pTd1t5ABgnFHrc5hG69FxV
	2P32cNA5wxu6sEr4zVHUQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795130942; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:YkE2NA0eAMdhHK6U+1GNgEH467Gp8KgHFEaRpsKtBQkPetL
	o6yasIfsolRMSG1SNsCWnnQxvHDBvrUYXjwo9SsHRXfdJp4FXu66Eg8KD6cw8ZhH
	7G8o+hj/JWESlAZRrLoijWrRdqCei499XBuVBf7hfzo2BUzs2MLBe5EMPqsRb7iW
	g3pdDOWb3qkhHETHHjkJBLq5OjVlRw7XM795Jj8ps0tIdQlB9nMDWfKkSt+PFC0o
	ErdNj1uwgsys2pCHzp7gkALk0K287LkRpOKiC55lSO28ilKZhR1frZXF1YoTlBW9
	TA+zwhG4CUJfJgEtpvcFCv/M41pH9VsRSq+M0og==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:PmTxIsN271fo4Nvn8ZFdNJKs8NEuuK9lBD3s24RFk2E=:7szfggsi1fH4qDras4xNp5mLLpsAhKaKO98jQjIkBRI=;
X-ME-Sender: <xms:Pob_ag0AR91kFnoxilT0U-mJ-cEHbuvGDZsJH5OknzeR1cCDCcprDQ>
    <xme:Pob_atqT9oXW4O05rQuf1NKspH5CWB2Z5ELSjTn7NlLgmE3hWKYPDuqPgrgW1K9wH
    qtkOUJ4Z9f9InhUJm5OlF-8SpYgQ5_Ox4-zVfBwuOzPYXPGVRI>
X-ME-Received: <xmr:Pob_asik6HL4YFCX3fmHe88SjohSZhSzCAc0i2baAA7baAuanQO37YWTDCC7QyAgLQ>
X-ME-Proxy-Cause: dmFkZTGImlcKkHeXu47CsFQBmz38FjVRY5feclo+x1apGe4GxCQcsgYDX+SST3qnUmN3bi
    bqos8IVxv0EzcnVUTA0YYpo7xw32eQ6kzHm5pGoSyVZNXxxOlAHwwLYZOqTB2ILolQiBpb
    zj7euQ5T67T8ErjaingJ98Xt0h/BwZP7GIS/wnG0RLRMC9UUCaIW+Y82uCD3vz5G7HdXO/
    wlwgemI8jJi6uCUeQ+SW+MkEbsGV31OtkXL5ZKPz2hDlChZNcq3Ze2n3NbOE6WPcvQalNS
    duJB61RJWWH6WpMXytBX1fkTfqdHzb3XoRaw67N9PnzYPaJsK08PFxsjSgNFyJE+vqTCfq
    aixBprEiykJHAxvRu+SNW7XpgGZpWaK0CVElzsUXOTdrOpVM3r9G4v0OTZSs42/ippI9KG
    hTB6I+VHH46owhZ+EaMe8NiqCxlt1Tbmow5akfcqX1cHWQ4CNNymVgMMdsc8U1YzOVhGaV
    oy+aCfpL2WVZ84oKARxy6FK9XOqTk2EUgqEqIJmjSykVwacvIo8TXpJakKBxFl4PO6oWTB
    SHm7CrhimtU20TqgsK/4r6ovFosSx8A2FISQzx6xtxDLp3sUHFyY8hOl/HpniBUcNNyoo/
    bhaxiEsprQEWClSRQvyTw0SVy2u1qVsv6NZnDWLov8Tz4wyaC8MhY7cGEubQ
X-ME-Proxy: <xmx:Pob_ap-OBleb7q_2Cf4SdcWPoEBxc_Jy0Col-0unYkXeM3Dyk5QROw>
    <xmx:Pob_aoXDAdBr1Q7eLdM5lRYKPCMEIHSWs_Vy8H1Ldwpz_k97C4ZJDQ>
    <xmx:Pob_atBzp8wWJzgnAnxwP5OtllA3MJTPzaMGPlyvZOGPlUb6GRlXqQ>
    <xmx:Pob_atErIIIKEkTCWBFPGfPrh3e9wOGEuKA3-OWnjMWk4yNr9flGlw>
    <xmx:Pob_atnyi3JXxHWwVkFXZvYhpCUvaJogurHNWR5_nwZ69BpBetITlZiq>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 18:28:59 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Amir Goldstein" <amir73il@gmail.com>
Cc: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Ian Kent" <raven@themaw.net>, "Jake Edge" <jake@lwn.net>
Subject: Re: [PATCH v5 4/5] Add d_for_each_positive_child family of iterators
In-reply-to:
 <CAOQ4uxgan=mpQ9yHOyZwZZp8E69+oH3uaPJ5CBkP7Z5BCO-5jA@mail.gmail.com>
References: <20261119025942.2848130-1-neilb@ownmail.net>
  <20261119025942.2848130-5-neilb@ownmail.net>
  <CAOQ4uxgan=mpQ9yHOyZwZZp8E69+oH3uaPJ5CBkP7Z5BCO-5jA@mail.gmail.com>
Date: Fri, 20 Nov 2026 10:28:55 +1100
Message-id: <179513093550.1728055.17648674323193416652@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Fri, 20 Nov 2026, Amir Goldstein wrote:
> On Thu, Nov 19, 2026 at 4:00=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote:

> > +
> > +/**
> > + * d_next_sibling_sched - return next sibling, but schedule() first
> > + * @child:  current child
> > + *
> > + * This behaves like d_next_sibling(), but drops the parent d_lock
> > + * and calls cond_resched() to avoid any soft-lockup.  A cursor
> > + * is inserted as place holder.
> > + *
> > + * Caller must hold the parents d_lock, and must hold a counted
> > + * reference on the parent.
> > + *
> > + * Returns: the next sibling, or %NULL if there is none.
> > + */
> > +struct dentry *d_next_sibling_sched(struct dentry *child)
> > +__must_hold(&child->d_parent->d_lock)
> > +{
> > +       struct dentry cursor;
> > +
> > +       /* always skip cursors to ensure we make some real progress */
> > +       while (child && (child->d_flags & DCACHE_DENTRY_CURSOR))
> > +               child =3D d_next_sibling(child);
> > +       if (!child)
> > +               return child;
>=20
> Why is this skip loop here and not after the resched?
>=20
> As this is written, if the caller passed @child which is another cursor,
> now child the next real dentry after another cursor and hlist_add_behind()
> below will insert our cursor after the real dentry.

You are right of course - that is the wrong way to address the problem.

I think moving the test into d_next_positive(), like with this
incremental patch, will work better.

Thanks!
NeilBrown


diff --git a/fs/dcache.c b/fs/dcache.c
index bacb218400a8..46aca619a9a3 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -2095,6 +2095,9 @@ static void d_init_cursor(struct dentry *dentry, struct=
 dentry *parent)
  * Caller must hold the parents d_lock, and must hold a counted
  * reference on the parent.
  *
+ * @child should not be a cursor, else two threads could potentially
+ * live-lock, each only stepping over each others cursors.
+ *
  * Returns: the next sibling, or %NULL if there is none.
  */
 struct dentry *d_next_sibling_sched(struct dentry *child)
@@ -2102,12 +2105,6 @@ __must_hold(&child->d_parent->d_lock)
 {
 	struct dentry cursor;
=20
-	/* always skip cursors to ensure we make some real progress */
-	while (child && (child->d_flags & DCACHE_DENTRY_CURSOR))
-		child =3D d_next_sibling(child);
-	if (!child)
-		return child;
-
 	d_init_cursor(&cursor, child->d_parent);
 	hlist_add_behind(&cursor.d_sib, &child->d_sib);
 	spin_unlock(&cursor.d_parent->d_lock);
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index 7150ecd81d72..c384b0f8743e 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -697,7 +697,10 @@ struct dentry *d_next_sibling_sched(struct dentry *child=
);
 static inline struct dentry *d_next_positive(struct dentry *child)
 {
 	do {
-		if (need_resched())
+		/* Don't schedule on cursors to ensure we make some real
+		 * progress between scheduling
+		 */
+		if (need_resched() && !(child->d_flags & DCACHE_DENTRY_CURSOR))
 			child =3D d_next_sibling_sched(child);
 		else
 			child =3D d_next_sibling(child);

