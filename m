Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467030;
	b=PJeaoOIbLE3CyQgWDBhX5U61HDF5zUFCfv0gnnu/O7dn0c6w/KTT2HDBgU73lCk5Gyph
	 +g919pVuS2ehpgBMnouQTFUlSarfR8uFkkdGDJFTgVvBUhxsFeGb7udRk1pVZrwpnMfIw
	 8L10sObMNmhU+AiYuk3CpF+1alaIw9L6bTk6QrmJnw90yRZhJGRsy1bUW73LbSHaOescQ
	 Kh+MB8w5PQrTCFSqZtF1MubxNZe25+LWaDpaACpYuFO2vUR9oSLyXz2FZIeToQRQRtFOv
	 T2HuA8koakCtHXkd6cv4ZMcBmJXn5h+YIH/dACeQJHY3KC01e35zeComBTgJ7m1DhhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467030;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=7wNwm3nBSKYEO3ZsBLQilTK2hdyTPsdyQ2l3ESaYKDQ=;
	b=mLHcFI4azqL9XmaU5yUSTGBJFLtf28xcD6Zt8jlPncgrsyxmoYNAb9oIJA4VRq7OJ7Mf
	 tgRz+RguopNsdHO6FRAteQNf7cFbHxmhavuUGrDbTkRGF1mGG7h619J1Rw1tf65M1QmIl
	 81eOnxjcRuC9IM7LWBLFQREEGG+5Q5VC1yo0dWhKenk3mD/RwSjOZz1a+j8d9aRxQ+NET
	 +fusn7TjU5me1yIigDX8lQRkRej0UFXxMYctXER2hTBNOoqK0/p2gAI6fT/3IusRVMJtF
	 zlKFVrnhZwXyXXc2fAr8KSyCZ8iRM6IvliW8/RsUSYcl92UkYJ3fgNKiZxaUwgjkKIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=Qk2zZbxU;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="UfMUy/Ss";
	arc=none smtp.remote-ip=103.168.172.158
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6905606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6905606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=Qk2zZbxU;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UfMUy/Ss
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B533714003A7
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:50:28 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 23 Nov 2026 15:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
	1795467028; x=1795553428; bh=7wNwm3nBSKYEO3ZsBLQilTK2hdyTPsdyQ2l
	3ESaYKDQ=; b=Qk2zZbxU2Aui9OQqqvYvqyPFFydbIhediLXcMerExjkx/xb+T8M
	h/Qu/BOiv0zkkO7IaTm+Bl9RAHezGJjVpRT0dIodJqclRh43bL7Jhgu9pULqv+Ja
	KmxyvzgM4NAhmBQZe9jg9Dno1/1XSACw8jleRt1qMaB8zShiengb7J5PIy9qu26w
	BSsjr7eNpRePlF4io9DVr9Kq9wzWQCowR6m5Y2OmFmUT23izjYmAqdNybGgl9mnu
	au4bDV8zDHJGg3nZMHw+HSBEYc52wCwqd1apAPnIs2u9nw4M0xQJm3mBi7HYQ1Pq
	RXAIYXWAjT3ErfePIklQ1nP2L6fdUl9PJOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795467028; x=
	1795553428; bh=7wNwm3nBSKYEO3ZsBLQilTK2hdyTPsdyQ2l3ESaYKDQ=; b=U
	fMUy/SsP1HWB/ZWJlerzDa+vezVqwgWDqLWCe1vnDDKcfE/bmxCM6QIRpq+i16nh
	ECxW4/17qdeb9ZUx0AsHxpyja2K2zIICcab0YD1HQhsUS4zV+r4UjiXdfIQf4XeD
	/Bzaa0Q0bigLbG+DriwEXkDoxz6AaP/z8JM6SZ0rR2r4t2HjLH9VSW3xPvsAPBZ0
	v5x5UZFTg1crf5p9arXzhkiiWZfsY55MLk675B9cVzTvAMBVcV7eYk2TYqn3/H7X
	iyLZ/SyWGb7FW7zL4bvug53L+Gf0I6pK1t5DenOLw82Vb/1LjkwB67whjS5GSyPE
	6q87D1xEg2aGSEnlgLaaA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795467028; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:oSM4VwmdCRqJY4bePiTqZBFMgo+ee7o9MrtPxsAUBQqUkKi
	j6JdZL+ejUnRYlAp/VLBGj5qU7eXcAMdL9anM/thIB/Yb8e27y6B7aWDpy8IR2SE
	JksexsMZowibxUAz6IFS2QEGNf1me0xpWUxtRAAU3cU7PdN/JRXaLQQy72hd278c
	jK4CI+zGRErj7ZPJu3yXwIxW8JsWJYNXTo4gWbqqio0XEc50P6r/zUO6/ef9xUZ0
	ZS5x9g64drBXACfl6u7j1EI0XJKKCsnfnEEEMmEPkMqBuKMpFyHPmbK/cOUh3kXD
	Nb51J4NHsPKhUFUAt+vFd9fpKwwuAfYh4ia+6iA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:Np/fWzmHZC5erycw7HnvO+QCIip28SFy+uUQS6N7pK0=:m0FG7+Uh2WED7ZvyFUpiUoHsdyufIrpxlBwM/xTCTIU=;
X-ME-Sender: <xms:FKcEa5kO4iN0rylq_HdwL1JiMb7xxFJs7Whg83Gr-DQS9CHLmoMkEA>
    <xme:FKcEa2NEhOVipYCXS_EJCKd7oCiPIXG5Eda5s8aZo8bhb3fnbd7V8wtceTw1HPtCq
    gQFI1v_wZrEdmptyzpP2lQdSzW4mqb61933chuxO8VjF3Oql8o>
X-ME-Received: <xmr:FKcEa47PvA8BntpSaUFEQDceUQ76YK2njWNe8DCCqa_6uGHOaYQzOlxFwK729TxFyMs9WQ068bMfDRM__QAg-FVnFhW-CAc>
X-ME-Proxy-Cause: dmFkZTGC/swz0pxpsPkswi5DsSiLwwOeEwGs5e7U5/fwF8vzMGgEmQupo2yU3CQdPHeXr7
    mGbCB/U88ktr6GSAQSn2dc2ASCs/k0e580Zj3lhFBFNM3un6r2cd5t4uCPBIpA+E6XZckt
    YseQXMD5tnrMT/dOTg2cmfHREwHGKsjFQEjfrvSPts30IHDXrMhIhLjlgST3xVcTeAEtL+
    YZv0a4E/fdIWeSB2bkuGjkOJL6KZUHWY2633W5wDKYU/UlNG02mgKVLCuyGZM67SJx1jiY
    Y5x3kuNlP3ieJWqhWTO7+wIJiXN/JSqg+jHnFH+4WSWoDhLO7B8xm8kQXOWSlXnXk1YNJ9
    H8EmltLrurw0ZsY+f5DiqCGpygE2tNHDiRDFdkv5VsU6b/bbR5Hv2u9kAKg1iUsi7XNaVH
    LK0gYGLPXKC7XjvJqsHxikpkoBdfEQjFffnFIE366sSgvXq9OjCmZ5q8PNFodunZ7OupbG
    vWhJTsRg3TG8Kuz4ZUGZwAf8OxI+ihuuBnOUunjPrqxi9LyJkqWNa2IW1wk747kWJJsdP+
    WrldQ3MUv5DLkWkOX2Z42puMLD3OJyJJlCpzlrHv9aSz1FfmB6uqpncg4058UbDveFiBMW
    qY05guPEhXiGdsQBLfHO5mPnhXZbecKnJMt7y0ZCj2q5DOzEwp5UfRFnLn8w
X-ME-Proxy: <xmx:FKcEax2qvNRJSOyrDv1A_bFGjj_sEnoxtPuthY-rxGsIJVt4Dd_GLQ>
    <xmx:FKcEa-qFjCO3QcdkyfwzYV2dje60Uw_vo0KlqdPjlLqq6b-BzzKIBw>
    <xmx:FKcEazmewNerqlvgmX7-hf_Y5pTmi_UOKaNjCSUaDMVrXlFfShtLcQ>
    <xmx:FKcEa4TmpeeewTZFgRHFWFGR2x0LlzKzUNImlqWe2FSnBP9Rpc8Taw>
    <xmx:FKcEa--DIOSc6ypvM7zC9IJlcYJzptHEu_Bv1ZVhnaSd_GHCOovNkxw4>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 15:50:23 -0500 (EST)
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
To: "Jan Harkes" <jaharkes@cs.cmu.edu>
Cc: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Namjae Jeon" <linkinjeon@kernel.org>, "Hyunchul Lee" <hyc.lee@gmail.com>,
 "Carlos Maiolino" <cem@kernel.org>, "Jeff Layton" <jlayton@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 ntfs@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 2/4] coda: don't d_drop() early.
In-reply-to: <20261120173041.bd3xeidt4ndkmimd@cs.cmu.edu>
References: <20261117000115.1433875-1-neilb@ownmail.net>
  <20261117000115.1433875-3-neilb@ownmail.net>
  <20261120173041.bd3xeidt4ndkmimd@cs.cmu.edu>
Date: Tue, 24 Nov 2026 07:50:21 +1100
Message-id: <179546702143.1728055.104338881046944851@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Sat, 21 Nov 2026, Jan Harkes wrote:
> On Mon, Nov 16, 2026 at 07:09:14PM -0500, NeilBrown wrote:
> > From: NeilBrown <neil@brown.name>
> >=20
> > Proposed locking changes will mean that calling d_drop() could
> > effectively unlock the name allowing a parallel lookup to proceed.
> > For this reason it should only be called *after* the attempt to create a
> > symlink (in this case) has completed (whether successfully or not).
> >=20
> > So move the d_drop() to after the venus_symlink() call.
> >=20
> > Doing this also means that if the upcall that handles venus_symlink()
> > happens to look up the name being created, it will get -ENOENT rather
> > then a possible deadlock.
> >=20
> > Signed-off-by: NeilBrown <neil@brown.name>
>=20
> Acked-by: Jan Harkes <jaharkes@cs.cmu.edu>

Thanks,
NeilBrown

>=20
> I was sort of already assuming that the userspace cache manager should
> never ever traverse into the mounted /coda file system tree because
> there is only a finite pool of worker threads. But it is good to know
> that this change would fix at least one possible deadlock.
>=20
> > ---
> >  fs/coda/dir.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/fs/coda/dir.c b/fs/coda/dir.c
> > index a85be5962e62..b47299527b65 100644
> > --- a/fs/coda/dir.c
> > +++ b/fs/coda/dir.c
> > @@ -249,13 +249,13 @@ static int coda_symlink(const struct mnt_idmap *idm=
ap,
> >  	if (symlen > CODA_MAXPATHLEN)
> >  		return -ENAMETOOLONG;
> > =20
> > +	error =3D venus_symlink(dir_inode->i_sb, coda_i2f(dir_inode), name, len,
> > +			      symname, symlen);
> >  	/*
> > -	 * This entry is now negative. Since we do not create
> > +	 * This entry is still negative. Since we did not create
> >  	 * an inode for the entry we have to drop it.
> >  	 */
> >  	d_drop(de);
> > -	error =3D venus_symlink(dir_inode->i_sb, coda_i2f(dir_inode), name, len,
> > -			      symname, symlen);
> > =20
> >  	/* mtime is no good anymore */
> >  	if (!error)
> > --=20
> > 2.50.0.107.gf914562f5916.dirty
> >=20
>=20

