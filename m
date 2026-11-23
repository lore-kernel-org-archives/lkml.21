Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407607;
	b=DN0dWNhWeKZOUjtGMl4UsiTCrwuL8XDaKNoTxpnUiik0RCV0bisqj+fDvL8MV7rKCWqU
	 xihBJKkM+yTGvRDe99mdmWu/cYK0HASqDuA/O96mf26vv9w7TRGW9Tve8EGbhF28Q0eRb
	 Lo7dBTB6GPo/LayGdZy2xE73l456hUfvuCMrYP6zYux+8/Bm6nEXMrovNyCELso2Z7ai0
	 vMW0NeUUQtj7l1MF0hM+tjxuQ57OwhxjnfGiJjBmOeA9Sttm9GBbuUchbnFag5pGk1vpN
	 AZV20cFLMMgfv9KtN1djZ2OgUpKv4bl8+DM2utLAya009g2wyslee2ky0Vb7iUKhLiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407607;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=QmjJJluG72923u6dkKF4E6LX7QpWiZzvPettKxtw9Io=;
	b=tLmMmgJfZfBtYsk7t93+d3aRektoI6SlhD/R3cnaThPeEOWVCN/0NxeSJmP9ybSajlCS
	 147W/BsxiqB/vg+JoazrO7zMFEeyKEN3U1/kf1HyaJvircDL+kVgptZqX2jPIMSdNmIkn
	 JDlSvtH4ipsxENSHEXRGzchSD9Ri38obCfrF467+UwSw+dC+TDkgw//nI8rYQwXy8CofF
	 TCPc5Ys2LnBSFQrgvfkiPxZ5mqnVqcIUkFiru6WjA2d0SZcyMa1fSAlhGzg4TAZPKj8fV
	 KktiWH2YCU+RFIZmZcg8LSkPJvfwqU53L8HKEu2SGNupx4hsfmzVNGnbLoXPHgnDv8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=m3QkiGXf;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T8qyTQu8;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AEB606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36AEB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=m3QkiGXf;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T8qyTQu8
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 5F43A1D005E3
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:20:05 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 22 Nov 2026 23:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
	1795407604; x=1795494004; bh=QmjJJluG72923u6dkKF4E6LX7QpWiZzvPet
	tKxtw9Io=; b=m3QkiGXf2sFup9A3ieASCnPMM7mmCZOy7O2V3R5BjVG++548QJ2
	d8c5OisIzbhCpkz6u68VbhZVXqo9Al71+FFkUr0iiWtR/x5tBvUfd/zkgjZCakJv
	AArZ2RETqgm+TiIl8guRPQpOsjE3zp5SkeXaUmnLItyfIwSdFdtp2eWF+AinccIZ
	gvxM0Ujb5Pn9Tcvy+S/WAGZZcE0kQwHX5/yYvynre9O6lRFmdHSkk79vJ1vDIgHB
	wZO9tnG8YQYOfxTUAqNvf5uwPIPsHNKr5RPovDb03uTTnaU9eJa0f9U03w9TYaAv
	9m6QkcsZtAphxQY2rBca26QtAMXWydg9ZAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795407604; x=
	1795494004; bh=QmjJJluG72923u6dkKF4E6LX7QpWiZzvPettKxtw9Io=; b=T
	8qyTQu82PPSMZDLrmkq6mglH95GwpcGVsKCcpd+v8o5/QOxNuccpTsneTgE07FbV
	5scBTlQL0ZEimWLcPC7pjXEzxgWh2/cLRqMD6JQwPjmnFl1VLMAinYW6OUAJ+WOM
	Weda4AlgHM1KghJ/q8IizM7DVowfqIX1PtO5DzUJiHuDaddTHSly86unvCW4+SVF
	8Lqe91fmdyR46Z9XcXdtinhcE6Jj2qPyFaLvq688Trczd1Y8jqCxyO1R8yX9kwia
	q5/POtvVq0+CXlhFI2D4s7Dm3yPANs9UhGm1QKAsZjN0ZcD5dGf4LPe0j/+0zTcP
	+Brf6dz9G9RBrF+I1/qRQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795407604; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:RTwoHxlW2vGkk5nbfh27vuVNlVSUkaez1DmT/cz3ovKTB5T
	jka2LgiFiHGmYVxhgaVt0nBCrWAU6v6xA3asRb305udClsZOMJPUX91jMaJcbjvH
	AV5sRumq7jM9i8/gGf9XrgQjHI/chGdKokAX0wO5ZrAn4AlYFHzX7avHR9P3RDdb
	al/VqCSMMwgr/v7IayUZ/3NAscKQDXNLvo/D15LreZFXFnK2/U+8wr6+qMS9xPS7
	kiozUHgBS3iIsmS9PzdxyoLV55ooeeC0r4ygLfSimHZ7md0qCXiz8JPVtGXMzFqa
	41Mqci2+RocIkI+/BSMtCci61RIi0Vf2qmbJFpg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:5DqTmm5+Aw5sDP+8zfo/9Yuk7Wsf8Q83qoFB+ud5qq8=:AbnOsTm4/ckYElt94OXxA6epjoXkd2Xej8CH/vMd7vk=;
X-ME-Sender: <xms:874Da_ITcrVk-rKo5AsqLnHB6Oa0XR1bRFMrLL8GFEdbtP2XUVYJBg>
    <xme:874DawVBzhTyASy-xrcN6Zt9H_gIGcEvJS1cuEykVVPC38viJSINzC2dbcbZwwCHZ
    crqlyjeyUqrUufdwfjOds4HM-iySDYN2RohmAZ79fxmmlK_Vo8>
X-ME-Received: <xmr:874Da8Olj2io5CvbpS9lpoKQ5F_K-657FrBXcvpAkbmasQ353BoHHQnJj2GPbzyIV9H8MlEr_rEvE1vczqTGfx8hrRbTJj4>
X-ME-Proxy-Cause: dmFkZTGv0kSxTW36hnuZ2AGsWuxeYAhFz6h0/5Jgx2+pY5uE0D7PdE4Q0ccZruKJ7qyqxD
    2T4Hz4bXAp1qumoqkTdvNfhT4icJvf7xmyYLbk4ZyQcRVrx9ngyL5QuHRT33O2vRuDxnqw
    QFYD6LxjSbc1grMJzygpKS7iBQgFblwMxKjKs6fsCyzSFmqk2EyUFyVHagO+R7mstf138H
    ZGFjPe8QO0Ot1g6TxuMlQxvyEfGjt+S7Kpz3mx50nyZ01Kw9eu/Ekv4c47lxL6g5yz5HQu
    2osoAB8JphtEtJr22E2M4mOyPQqK40EpR/yEGEMcnSjse5jDudxC5yil3Fy4vsRZv3+Ntc
    WTQtF9IYMpiHf/N5GvPWSN5uEUjfVT2lbtygQmuEM9lWUhr/OghNcEykG+n8F/HWqDUYMS
    oh4NKR7JMttnnoi7dSCFATtRHl8yXKKFIa8es3Hr94elzTjXbx/scZ8uA8c7EhfAkk1oHZ
    HPMNlFbNb7DzdF+diwT82ByBXs0nzLdajYoQa9MJGgw6QP0avBmCB24psqotbvb0ZdmqVk
    nZjUY0MJaIQHAzgMIdAU2T1Q6RVtuf0eXw6NhrvCaTKDjsEJYKUsaIBUb4vw/nIMMxMrMV
    MGIdq+h+9IXI9DB7+9i/MyVVds9ZoQUixWyKulcSOiug7Zquo+wPgDRc8aGg
X-ME-Proxy: <xmx:874Da0nNo5PMJ12iVr4b5RiCwQhI8ARzSgfw6ylg9_8wrm8C4R6iwA>
    <xmx:874Da3XjO_tLYiXyXJeSRyM9b6naC5Wlf7HIKOTKSeXa2gADvcXNdQ>
    <xmx:874Da7KdyLK4yOA1cVVtd4Fjg1LlOSb9pjb3ZYrydZJQ9FZ0roWWKw>
    <xmx:874DazatK-fEHcPrUH5a1Zuh6DGLnCPw8dttcZBjfBf1GRooTtsAQQ>
    <xmx:9L4Da_JXeh_YFXHJoErlSwqofBbs1Hd05ytwZIJPk0gekSWXgy5GTDO9>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Nov 2026 23:19:57 -0500 (EST)
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
To: "Christoph Hellwig" <hch@infradead.org>
Cc: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Jan Harkes" <jaharkes@cs.cmu.edu>,
 coda@cs.cmu.edu, "Jan Kara" <jack@suse.cz>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Namjae Jeon" <linkinjeon@kernel.org>, "Hyunchul Lee" <hyc.lee@gmail.com>,
 "Carlos Maiolino" <cem@kernel.org>, "Jeff Layton" <jlayton@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>, linux-kernel@vger.kernel.org,
 codalist@coda.cs.cmu.edu, linux-fsdevel@vger.kernel.org,
 linux-um@lists.infradead.org, ntfs@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 1/4] VFS/xfs/ntfs: drop parent lock across
 d_alloc_parallel() in d_add_ci()
In-reply-to: <awB5mAWm9h1ksRFI@infradead.org>
References: <20261117000115.1433875-1-neilb@ownmail.net>
  <20261117000115.1433875-2-neilb@ownmail.net>
  <awB5mAWm9h1ksRFI@infradead.org>
Date: Mon, 23 Nov 2026 15:19:52 +1100
Message-id: <179540759290.1728055.6042791276963817025@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Sat, 21 Nov 2026, Christoph Hellwig wrote:
> On Tue, Nov 17, 2026 at 10:54:58AM +1100, NeilBrown wrote:
> >  					  const struct dentry_operations *);
> > -extern struct dentry * d_add_ci(struct dentry *, struct inode *, struct =
qstr *);
> > +extern struct dentry * d_add_ci(struct dentry *, struct inode *, struct =
qstr *,
>=20
> Please drop the extern and fix up the formatting if you touch the code.
> Bonus points for spelling out the arguments to actually make it
> readable.

I think inconsistent formatting is not much better than bad formatting.
Maybe I'll insert a patch which tidies up the whole stanza.

NeilBrown
