Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795826364;
	b=WZbPRxc/igFmEloWjnq/swEHogeyZcbhI8mMPd16dQ3HCzzuXKXuKlB7zHy5MtiKWxIC
	 Q8LgWxCqFJtyHov2XfERWsvzc9fKw+BhrqvkEuu8DynJyFFWjkVFiYjrx8y9rUgXY4/9D
	 Hogn7xVUm2+31ZYZNxc+lK5bkgkcvQ4/PzGQ9uryFt7bPrYDR+75O5m18mZThUv1xTt5g
	 pyOlNQdVyuyW3PsfgNaF9CJOseo6GQWg/h1gKecVfygwQM8v9gcFS0fngYM9Zi94UazQq
	 hUZNfsZ0cC4L1ZPBmu1b1Ox6AC2yLa7kyWpEQhgnUdMomYgO/hfM3ipLBv1eZM5p5dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826364;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aeeXEgRGrXBp0WNIg3HPkypWo0vJUr6jXxVIO9eyi/c=;
	b=Tk1mM6FIQ0EOeu4+DoaxmNxs9IIrj98sLddwzVp+qIB9QJe3LPM/EdZ+3I5H/qR2vQte
	 qZXpW4mwfe4VSCbc74/DdGqPufOUR2h8HyxRv0vyJdknuIxWj1TOU20JK9KHsOm8FEudz
	 DHOys7aixXuXnAsQG/+UctXba2tw/YfW0p8l+bwegcUtMfkJuNrilbVjDtEciXe/FRVZs
	 RfyiF4OQbmQWS7tU3GFFl9XdtPmTRMd5WDfJj3bzGi/wTkDuLUZMtoPrJS1ALkhw7Lnbz
	 4isGZmPanttTobH5M4/POyqH4oVmMdGo0r7IB1qo0Su6+NhJyxIWLEZjVxdpA+ohIPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=pass header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=oMq3Tc3V;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=j+Sj57zA;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AFE606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AFE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=oMq3Tc3V;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=j+Sj57zA
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 58C307A050A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:39:23 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 27 Nov 2026 19:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1795826362; x=1795912762; bh=aeeXEgRGrXBp0WNIg3HPk
	ypWo0vJUr6jXxVIO9eyi/c=; b=oMq3Tc3VS/rw1Odc1HBgC7Nk9M7WpSBwLbDxF
	Xdb5mmsT4hH21WK3hNHkDO3BOAPyzTGg092cGWKMGPMPg1SMNP0iBQWnUxMYSho9
	ip/Ck4RvgosAcdB5lk161bzZPeZFQv7XnglNpUAVkZWmJ8s/J6Mo7gaZ4wQdgy1L
	I7r64N+7CwJ4ICI+YyyeMENyq8gClSSH4wPbpov51ezJ5V35MuP4T5iP9F7qPUmK
	RiCMTvFSBU+Ez6rOTMLxANPQ64amdSEB3SffdXd5Ul9RLuknfntShXArEb+F6a9v
	UY0MkeSR4Oc6fTdOm+ruyKIG3sgT/mtXjGC+qY1nvQfGCmR9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795826362; x=1795912762; bh=aeeXEgRGrXBp0WNIg3HPkypWo0vJUr6jXxV
	IO9eyi/c=; b=j+Sj57zALFe5ugbxVWKpwaPrEeCq8hZbAc/ouhouwaDNSEBXp3X
	s8zUMGw8zF/Elmsq7iC/pFNghh0xVodHKGxSqAF6ezz3t0ci4LdwxYV00ujl17VW
	UA9XZdEkBI8rVKQdJ1sGm/sWyUFCSCoE1oZlCadRXUdF7ZkR/dgj4/psh0NgZp8i
	6aqtVyOFX/zAndc5B/pOJFuqiWB7wZcScVaDY6yV/zYaNwd65y30zhMB+p8QyOb0
	G7bRDc69SVdb1attyqA2Mg/4I6qujVhGMQe/IYtMV/c2cy7JKU4ZO/irAF9lZKAT
	Tp1Yh5cq0yLWlUTOCp0V/nUZppMA7v8mOXw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795826362; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:wkT7z2gFllQ/4ANErQxCXiEGj8hPTUBSDteHrycXv1TwOYL
	/fQB6ulargAFDWWsQpcBWuanwabZUykuCWnTBlON14AOtdJvT8coy32W8e7ZEkh8
	kO95JWLNuZG6xc+Vy5Rx9ElNETTfTvuDrMWOAlylt+IyXVIYchFfKtCzIPNQA1Ry
	Z18u0LSsTF4A+DY+wSThMIZ4yCGJYvLgJUzZAgXMx5P1Va90lREhXEfR4iN/iBGY
	6McIyq+70yV1oqd3++B/lNFnyXnLLfQz2xyC/I3kKwDuaYw58AHTAWX0ZgAoQIOO
	XVkz9+b287DxY8kNoDmp84R+XssGCfON4oZl48w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:gXaEZubuebzK0oJKahd3fl4fqe2d2VUQPEIDAYbIXTI=:55cN1rUFe0VIv/p1QQczzqnZDu49c3rQHebGxb15qBs=;
X-ME-Sender: <xms:uSIKa29hvsNB2l8hHMK6tWk-6_ve8tjaVpA_WG1xhUeZN6smCRdnvg>
    <xme:uSIKa3aknAbEtliy-uMQ7NzmaL8LTByvh1ZZhpwMhghFG-A9Oc-08E-d9FwubeuIN
    TLaX8Nmsv54YKGOFg3DBnuk-_OtR2BAHQ1GkIYBSoUgB9hf1E_UlOZn>
X-ME-Received: <xmr:uSIKa6Pe8MRqqiWeKaSnDLY4aGjiiaiVs3BFbKeEuJiQEQ2cqcddCCQJmm39uipF>
X-ME-Proxy-Cause: dmFkZTEMtb+Bkbxw0xdEEkXjXievSQYOjZRG4/Key20VA66I2NYvrkjZYsQTcGwAvpJmAo
    J3QjQNUCQaYURc5PBR4bM2//jlJIHxu+A7WRI7/I0eha2podk4asJJsKKOi0mDjqizjolb
    n0TYkzc2uPrmcC7McEn7/OnuZ3gj9gcreywYBv/g3OwRwxBLQ95E43iNkrZZ1uKXJjzUxi
    YM+Kjz+LVvHb4DNiBwAuvxtZqEgOhfy0OsZe/LHAm+7hWeW9J4KzmQCUXPSOCsgvDlBOUU
    BOo9/2fJ4guM7XOC9LsBtOzrSDT7hfn29NAzDSrdprzHm2ii4j+bO8rOb/xtZBGJx54tNY
    shkVN/trL0mGRWucjtgO5vAG67aybNDHlRQ2jMsLLu7zv5TMLc4+9eHb+OTvfZKmMJTGRC
    C89Zfxhtei3XK2zeLhNiagZNslbOCfWdHnqbvliax+uCQxLF5CcmvBFeqh1rhdojSfyKUg
    44I8BMrjSUVO7za0hr4hjKWdxYVZqlzmrYxs4N+qxW69XPdpx6uQ4PmoNsU+PB5oZSXzoV
    qPAHXkW0HOMbebF7ShE2kxoOuE7rD0mDlJ57igCiE8eWo15rRUllDwVO6i0HTBagnS5MdY
    g3L06nFsycVjKSlMx5T0xH2hb4VY471DoyQzanQXTL762JjsI7I8lGjMuu0g
X-ME-Proxy: <xmx:uSIKazCdJi0Y2QxtnpkNCDLuumXaDGbDuzBGwPGND7lDzPmeU81PDw>
    <xmx:uSIKaxJpxOa_m8WeN6T_gf1oKb7H2hi0-qBq5Rxr5sxGW3Hu_OPcTw>
    <xmx:uSIKa8PjB78c-ysuJAgNu8KIehqB8oRJ9-XU3PqFYLKEqicFEisg6w>
    <xmx:uSIKa_7pTRK5CnjIXhKBvnAzhAzTh-SUE5HHWBDl1fHFfMkbiXJMIQ>
    <xmx:uiIKaxRy13-Z3qCrjeuBnRAn0J-3QDvoiV2R8EfcuEbCk1d7Upi-4CQh>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Nov 2026 19:39:21 -0500 (EST)
From: Ian Bridges <icb@fastmail.org>
To: linkinjeon@kernel.org
Cc: senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Bridges <icb@fastmail.org>
Subject: [PATCH] ksmbd: don't create a missing stream for FILE_OVERWRITE
Date: Fri, 27 Nov 2026 18:39:13 -0600
Message-ID: <20261128003913.1684555-1-icb@fastmail.org>
X-Mailer: git-send-email 2.47.3
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

An open of a named stream that does not exist fails with
STATUS_OBJECT_NAME_NOT_FOUND only for FILE_OPEN. With FILE_OVERWRITE
the stream is created and the open succeeds. MS-FSA 2.1.5.1.2 fails
both dispositions when the stream is not found. Fail FILE_OVERWRITE the
same way. FILE_OVERWRITE_IF still creates the stream.

Signed-off-by: Ian Bridges <icb@fastmail.org>
---
Tested on ksmbd-for-next b9eab18ab72e with KASAN. A FILE_OVERWRITE open
of a missing named stream now fails with STATUS_OBJECT_NAME_NOT_FOUND,
and no stream is created. FILE_OVERWRITE of an existing stream and
FILE_OVERWRITE_IF of a missing one still succeed. smbtorture gives the
same results as on the base.

This patch was developed with LLM assistance.

 fs/smb/server/smb2pdu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index f286f9818643..e073b96d92a6 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -3747,6 +3747,10 @@ static noinline int smb2_set_stream_name_xattr(const struct path *path,
 		return -EBADF;
 	}
 
+	/* FILE_OVERWRITE does not create a missing stream (MS-FSA 2.1.5.1.2) */
+	if (fp->cdoption == FILE_OVERWRITE_LE)
+		return -EBADF;
+
 	if (!test_tree_conn_flag(fp->tcon, KSMBD_TREE_CONN_FLAG_WRITABLE))
 		return -EACCES;
 

base-commit: b9eab18ab72ec25abf431cba58e5239f695632f7
-- 
2.47.3

