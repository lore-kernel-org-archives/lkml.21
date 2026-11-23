Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795472063;
	b=DlYa6tWLoGLM9etIl7bw1GfihKvDtSFBB20wPt5UU+9ihbyIDL+a0w7N9ZNZxO3xnz8m
	 DKuirH4Kdum4LgbUY7WqD03nd1k0qIgpADdNckyt8owZw3wELzxnoE4fmXcxuzkx5lTmr
	 JfF/OSDEqCYlxRQSQ5BFm58jvzMA0GWINXlbYJsdgiWHAZn8/u+TF2l3LaWmlOn58K8e4
	 I5E9OW5d9ugmCBNejwZp0tbzx81DZ7V1+9WrW7UngmVvWCzCIq7lBG8+ljZzCO+lyVyAB
	 9qofRuT0xn4P1vdC3xYjjRmK6qtOCu6J5WJl6iTCcCVjhuJ/VCUaGKa9oyWR+dJwFaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472063;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:Reply-To:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IbCiR8d2eZiKOk58JEVx47w03etPQT8jvh2gktu/Xvc=;
	b=ngLELwCggbW3DVTMHke3g0sJ426hBtdn9wjbKsJ8tqYrYlcwOZ5sgAPTppaldZpeYCgL
	 TVVKJdO551TkdcrAuOXku0CPjnacz6pEnrT5r3gWzt2nb4Hlq6Ga6UVrZhh8FUO4611nk
	 B3S6lIUTxs683P6UoErrCQ6Yh8E2XQk3M/m2WOTCbMUeg4RKZniy5NLnhc9NGS4ffX7X5
	 fsHlAFaV1ho3mfT+kHB+PR/kQ2PthnGOnmuw/RYeXQjMYHBL6Cy/zIiO/ytAmdbI5bGnR
	 K3kEkjf4jUe+Tjks+fSXrvCL/FneHiZSN4fMEzSo+RI+d67Ban3v7FmwxQgqlo6kenA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=mfe1rNXK;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="FTz8HZ/q";
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117D606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2117D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=mfe1rNXK;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FTz8HZ/q
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 36CC11400329
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:14:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 23 Nov 2026 17:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:reply-to:subject
	:subject:to:to; s=fm3; t=1795472062; x=1795558462; bh=IbCiR8d2eZ
	iKOk58JEVx47w03etPQT8jvh2gktu/Xvc=; b=mfe1rNXKzs5m6kdSoIt5YhrX2a
	zIAA4X8DHpe3MVf5CjrYRbL3TxSTp33cnFGbMsZ/6Oz0jg95I+1KdfFM+y8NKOzn
	2pE94vMPH5gRfRf1N9WG2LQlfGhAwCCbPoB2LqdDlcyeSgoGK9jHamHj/7ETu8ib
	41E1SzxHapgneV634bGRTjt+JYsKhZW5ofvu/s8r+GgD3Gi5x+8PNLsLZEh9ZMJe
	uLieccoF5rRQh7RaPdkPpBNHm8GnGC/8yModWM2mZPMp8JOE/H2rvjikQauxI6TX
	kU1yZCFgkk3dGaByEVdY4KtvU5ECOMZRYyWnXKb2T0lLPCNX8ocS2Ik8XucQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1795472062; x=1795558462; bh=IbCiR8d2eZiKOk58JEVx47w03etP
	QT8jvh2gktu/Xvc=; b=FTz8HZ/qBKBnYpqILOr53voObqrpktkMQub3OanJoBZF
	U0jLgZY2/q2fzxTFMJ3eQzCAACrKsF6e4OrIjCN3ircFz4rb8GliJFtb2xymeEZ3
	Bitq8B+vjag9S1KpHes/Nny8PHaTYQFOhEwK6IwK5d2xAvNAMIDI4ytihjjQ3bjT
	tToD/8npPlR1BoIp3FwNnmMaG7g4gr3QiSNZnFS0qFV0jKc+1eXqVOKj0jTKHWwf
	fohUN2t7aySjZjBg+A77WLRG2RDjp0gNF2/qxakVwRr8PMBZm29bTLIdSRGPFuy7
	HJvE5RxDpbslrHPhoMCQWhigH+jRliZMJoi1eL+1mQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795472062; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:Z2TQ9fdsgK8IbhQA7pBnSERgR/wzif0Va9HiTYX/zjwiInH
	336irKKq9Egkh2CzPgb7oqMniyLJY+ZH85NaZ2ZS85CiYUmSLlkWyo8wXNawoBQq
	7IarFhqEsmjxcD46jxaNlrE+Et+kj/eCARkD8aGXYW85C5YHOmOMkVEMlXm2Ul1L
	td2KkriW2g5QxKKjHsc3rx5ZBBaBuW7ZG1eGOeEFpuHlSJW0ulTjUuBNDM5hmezv
	DK67Us3Y1Cu9HWxntkfXiqPI8qTN+kXd6LWkLxatIj/eL9ummSTTPHdr1lZx6IJZ
	1pCIMIiXgV3Rf1rcic77MlPnZq5/5hKJ2kmyRbg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,reply-to,subject,to;
Message-Instance: m=1; h=sha256:ooiMroJmkru1/3XCWYzijis1bVvzzcBIH4vbpYzr7WM=:QrdR4dHKgdWvXClJ7lVhfNUmY4YJfqql5vXEq/oKRu4=;
X-ME-Sender: <xms:vboEaxCTPuu7fJIKFuFeMG740Bk2QCcnj3x4nA7mGmJfgKoQi9MUGA>
    <xme:vboEayHeOAd1Rx1hTf2oXAZj45pPqrD1Fn74_Y1TfeYSykpZYr-M-ElxyiXyXxkPv
    qV19EsV7ujRYFU5FxF1K21dvqsqWrcMnIFImj2V7NzZ4Qkgkk8>
X-ME-Received: <xmr:vboEawMPUhZ0HSrlwxZ5V08L1in8CNvsn-j4TD2WsKbfbIQ23LYrvB_Twq3Kc-RGgmPOoBpr3k4OMf1h6_3LC799tSH6UCU>
X-ME-Proxy-Cause: dmFkZTGcNstBYvgmqsYHLz1rqThJgXWMb/LvRu+5qYLtp3QPSnqCMzboC3tG8E7JVB/CBs
    GSpY3QKa/f+w+YW1nwt7eb9lmfQLqf0KDHxkUiFdNFH6NafHdTzQ+v4U3UNzK9Pj3xysJy
    s+8cWV7AU/LdxvIkSiZSIo7jFZ2DLwmAaIK695vY8xUfWclW4xMpBKnOKU/mWG8lv5cnRy
    trQ8Eb6tI9uE02B2cNdLcH9LW7uR3Ts6IzHONb9NRua7xJmC4p82jQZImMkph3cHEy4w3o
    hOvqkrAMZCcXIDefPJK+4ZwmC7ovOEVy1kEaR73zmZyMKT0/emadktoWS6wDj7JQ9lLQcd
    iYfqQHYPCUKFSvAm5qcUqwfb5/AagBSsgTUb9yHeQv16f2tiGJfDo3DHhN/KgwxROwn8VG
    DXyzzprJxOCuiPGJHH7kd0uChQcJHFGFE8irKBQeOMwDAJTjKCiip5z60vqre6rZx+DTQs
    qA1e10l3x/KweMSRYe8XnGR8Wop9G1U8YFnTQG1iqgbfFJ16g5VF0CK2KJN8YJXtdDNKwQ
    eO2WqIFi4Gq/q5ai+n9ov0+B6Ti640iPvDzutMRnWL+KDrzciaRqUqJ0RYLiwinfJXs3x3
    5LpQovU9quwkGA1E1pSIc3/UBy+qR+QiMNfYGFfuUDpbss4qgDAMrSIBrS7g
X-ME-Proxy: <xmx:vboEa77LvbiZvQd_e50-H0Ez5oR3voWeX5uCwN4fjTGW9hZW0K2fAQ>
    <xmx:vboEa7ijhEbYTpreGxgNrrjtIR3kxmDfddUjHFCQa32PBBwYyxY3Bw>
    <xmx:vboEa4e70sDISxB-NyhohEPMLGju7v9bhiZdKNUNG4hetELWDd0elw>
    <xmx:vboEa7wesCmut3gU6LKkh-upaaElYMb-Vmyhhmm78E70aL49MC6MFA>
    <xmx:vroEaxTDGNQP90sSRVlpi01YncudJVnnZ-rlEh_G89GCH9N8QMEDzA81>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 17:14:19 -0500 (EST)
From: NeilBrown <neilb@ownmail.net>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Amir Goldstein <amir73il@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Kent <raven@themaw.net>,
	Jake Edge <jake@lwn.net>
Subject: [PATCH v6 0/5] Fix easy bits of the negative dentry problem
Date: Tue, 24 Nov 2026 09:12:37 +1100
Message-ID: <20261123221410.3328780-1-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
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

This v6:
 - fixes the autofs changes in 1/5
 - updates d_duplicate() in 1/5
 - uses a new version of 2/5 from Amir
 - Fixes the skipping of cursors in 4/5

Thanks,
NeilBrown

Original intro - revised:

 I was reading about the negative dentry problem in
 https://lwn.net/Articles/1079407/ and thought I would have a go at the
 easy bits.  Given how involved some of that was I'm glad I didn't try
 the tricky bits!

 So I didn't try to reduce the number of negative dentries or handle
 them differently to positive dentries.  I just tried to address
 specific symptoms.

 This series addresses two reported symptoms.
  1/ refcounts on parents can potentially overflow if there are billions
     of (negative) children.  This was the easiest easy bit.  The first
     patch is all that is needed.

  2/ Walking the ->d_children list can take arbitrarily long and can
     trigger soft lockups.  I haven't addresses the "arbitrarily long"
     part, but the "soft lockups" is relatively easy.
     With this in place I would feel more confident addressing
     the "arbitrarily long" part if that seemed worth while.

 The core idea is to use a common helper for all walking of
 ->d_children, and teach it to drop the lock and schedule when needed,
 inserting a cursor to keep its place.  This simple idea requires that
 nothing should be holding any other lock while walking ->d_children


 [PATCH v6 1/5] VFS: don't count references through ->d_parent
 [PATCH v6 2/5] fsnotify: update children flags only when parent
 [PATCH v6 3/5] fsnotify: don't hold i_lock while walking d_children
 [PATCH v6 4/5] Add d_for_each_positive_child family of iterators
 [PATCH v6 5/5] Use d_for_each_positive_child() in fsnotify.
