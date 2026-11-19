Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094634;
	b=hWZpOzSVRG9/aa6Z5Zwx7YiljA+OrT20dIzxVwiVDs2YXFnGbximJ7hJq25NobQlTzrq
	 Afrwws4A8RhSTuDLKpvr1f7bp5u7PcE1TawRjpj+OmImbpQs7hNGa8GcVsp4TTQTBsvYv
	 bgQHteEjaUJ0aR6ekef83z1f4FseXpFIRqIqlq8fFKN95KdMQ+Fh/INCAe26KeWZRri/j
	 c6nme8Ex4ZXzmTFoAFnBVDEMHigKi9Bb24VWGExr8ry9wEe1CyzHN68iJq1W6ab/tFflL
	 aiqZxhzbppBnRt/py79S+QyZ9tcPPQ8du6j63tFgSCn/+RYb2rMBx2tJUF6+UAJfauQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094634;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-malware-bazaar;
	bh=lHO6Al5D1UOJ2GkOXkMdAANMBrRrim44AFinn44VGFc=;
	b=PQXuGCf3YlwNp9oF22GrNthisykyXTrzCTRV1H+RP9svoa9SMecSChRZHoFzGMh510C6
	 vWhjzkntLjmPaYoRei7SWECNLMv1XyzwmOD2cMWSixitC6aBpgCAhq7D6Tw+sSxsHrBru
	 5xdTyAWZrijvTROTA3cqvuDPGFsQQsYQ5PKUuhwcjNQfY3cX2+cr2QxOWvs2KBedSbvMJ
	 /v1FQ9OaiSaEXbuTvWcnW4SIavaCEoH7SOceA/g/z9X6vTr+yaYdkvkTAMt3+DTACDLZ4
	 S1p6fMiJ/BPaLTRsGrv+6tpw6YwFBCXeY18TBbUJhSVU5f+18ITjg4JPt0ByneDeVdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=izXtjslC;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC3606A339
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=izXtjslC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=lHO6Al5D1UOJ2GkOXkMdAANMBrRrim44AFinn44VGFc=; t=1795094633; x=1796304233; 
	b=izXtjslCi4yOPZsBxjLoSgcSyGIADdzXS1eTMDQ0oqH/03vu5oQljnBjov/zGlKKKGJaRrNFsHt
	tGBGVVn0EcMoPnNi26kRzWr7z21MBoRDtw7vIfD8dajat1aXP0avk/5gMhiFxK0V4fyCf3n+PhqL1
	Ep+z2waFwRN/SoP/txmtO7kwJavdLRt5ysjFfnMsOH//WvY2A/dPp8z19qSn0X4xeyqsJc4e1J1u2
	4MdCKwcWbFOaaU6Ka1Vpp/7SF+NZEfzqzqme/B5UncQqwsMf5BGx+hirlIgcvRB7d8NrJlQ0Q07vh
	6km3hEejk+DpKqtNT5SDpWc4VZxXMeW9P5rw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xU275-00000004LIl-3aJV;
	Thu, 19 Nov 2026 14:23:44 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-um@lists.infradead.org
Cc: =?UTF-8?q?=E5=AD=9F=E4=BB=A4=E6=BE=B3?= <menglingao@xiaomi.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC 0/3] um/random: reproducible random
Date: Thu, 19 Nov 2026 14:19:11 +0100
Message-ID: <20261119132340.225696-5-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned

So these patches are *clearly* (except the first one maybe)
not something we actually want to apply upstream, but we've
been carrying them for years out-of-tree (no problem there)
and Lingao just asked because they have the same need when
testing BT (we did it for testing WiFi):
https://lore.kernel.org/linux-um/D2219FFB-73EF-4E27-B84A-5C8E550E3553@xiaomi.com/

The idea is to even get things like key derivation into a
reproducible state for tests, to make it easier to compare
and be sure the runs are the same.

So at least I figured I'd send them, maybe we _could_ consider
doing something like that behind a scary Kconfig option or one
that depends already on time-travel in UML, or ...

But even if this is going to fly like a lead balloon then the
patches are now out there for whoever wants to pick them up
and run with them when they have the same need.

johannes

