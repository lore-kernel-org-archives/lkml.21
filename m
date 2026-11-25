Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596043;
	b=JBqoaXW5JQtSC8VH7sAvSieapi4sRbBCgXW0tYulyV534apAOND4soF7p0RycCRWcoAq
	 Vz+UgRquejg3YgGqCleKqMZUvgrN+DBQBJwavCTCgHqzTmdVAOaNATGw9k1zZCIAuQwZo
	 ASODLvdCUSjkEIkFicEK9SkErQqpiMipmsXNRneFGTwXjz7HyLXlvIAx99UCpYnuSpEPt
	 4aKaJLGLDigaBLjwt8Ua2Ef6e9TlZtPNk7jdoiBuM5xGcvh+/W+jU/L4UNT67HO3D5lKW
	 uISUEF+7XBBUmy6G/wa/DzctOruTD6qb8oNSU6w/3IsNfyj70mXQOYuvd5XOsQLYHTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596043;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=hX1DE+NNytj3hpBEk9oo0+jldMWRJp8YQvfwa/AMVjQ=;
	b=JagUDcSSO9/BqHdc7IEbJCiRLkFTUHv3trOD4YazP1BFMfJ636Pwdaolc/10qzT+SNzP
	 o/mkFrvs7D6xmQ5kvh8hpy14O6tvJQFlFutT8jyps7ZSDD+lPY6cx0R2HZX0YRbzZ2JhO
	 LQ5rKFXV7Rdfyn/waqbJrJMRA80j/4Iasbwha/sl7t3hV8fwOH/b/Qjb2Ray6cTt7Tm5t
	 OMPHr7rgymFIwebYQINmxwniFrVMc4AWuvCeUophmbxORopjbi/0TU7gTJ/775KQT5Ihn
	 4ivpFmOswJVrhiIPhChbK6zxeK/j7AZxb1uQ92YvhRFBZdInkL6DQ+iuusxzXLBPAqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ggL3ws9i;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SmpybIu5;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B131606A32D;
	Wed, 25 Nov 2026 08:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B131606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ggL3ws9i;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SmpybIu5
Date: Wed, 25 Nov 2026 08:40:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795596040;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hX1DE+NNytj3hpBEk9oo0+jldMWRJp8YQvfwa/AMVjQ=;
	b=ggL3ws9izlvUfJAHDwUwheCi83UmiNf+Qxj+Nc1zHPSL6HobBJ2o2iM6yssQx0DAjBPM/T
	nURMJNvupoobi1xX14/VbnwobtyROKnUoXnb8CPRVYD1QBqa77245OYQL9M+fEAvFau0Ks
	6p7yD9PTqoWMLp65wBkUJI1xdeOToyuXoAq0l7O2/IsTFMDy5e8Gylgwp2+bYZHvLMGjzU
	eRv8x9JdW8wE1xlW1vQrSm6Uv2vGaWQX4Pe3Pxz1NRnPmr2ZarVjt+1CQbiHaJXCmAAQVH
	DIZAt7/r+MS1SMEPqB0M4u7Ei+QPf2PHvp3F4BLvw1xDQo2nXo/9uNjV47l7cQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795596040;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hX1DE+NNytj3hpBEk9oo0+jldMWRJp8YQvfwa/AMVjQ=;
	b=SmpybIu59L3y30wlq3nqmTDXZmc0OUI4aZbaF/h82aZOfqw2kZOy26vlbGgnJsAuV8PwR3
	mZlIu676L8qilcAQ==
From: "tip-bot2 for Yafang Shao" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] klp-build: Fix memory leak in livepatch module
 init error path
Cc: "sashiko-bot" <sashiko-bot@kernel.org>, Yafang Shao <laoar.shao@gmail.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261016122314.81476-1-laoar.shao@gmail.com>
References: <20261016122314.81476-1-laoar.shao@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179559603877.92412.6766601683491256340.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     b99a5337da3c847db216476d645b69acd714c3ba
Gitweb:        https://git.kernel.org/tip/b99a5337da3c847db216476d645b69acd71=
4c3ba
Author:        Yafang Shao <laoar.shao@gmail.com>
AuthorDate:    Fri, 16 Oct 2026 20:23:14 +08:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Sat, 21 Nov 2026 23:38:33 -08:00

klp-build: Fix memory leak in livepatch module init error path

The klp-build generated livepatch module allocates the patch structure,
the array of objects, and the per-object arrays of functions with
kzalloc() in livepatch_mod_init().

The result of klp_enable_patch() is returned directly. It bypasses
the err_free_objs cleanup path when the call fails. As a result, all the
allocated structures leak.

Save the return value and go into the error path on failure.

The per-object arrays of functions must be freed in the shared
err_free_objs path as well. The cleanup loop in the funcs allocation
failure path is removed instead. Otherwise, it would cause a double
free when the new error path jumps into the shared cleanup.

Fixes: 59adee07b568 ("livepatch/klp-build: Add stub init code for livepatch m=
odules")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-173837@kernel.org/
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Link: https://patch.msgid.link/20261016122314.81476-1-laoar.shao@gmail.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 scripts/livepatch/init.c |  9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/livepatch/init.c b/scripts/livepatch/init.c
index df041fe..097c11f 100644
--- a/scripts/livepatch/init.c
+++ b/scripts/livepatch/init.c
@@ -50,8 +50,6 @@ static int __init livepatch_mod_init(void)
 		funcs =3D kzalloc_objs(*funcs, nr_funcs + 1);
 		if (!funcs) {
 			ret =3D -ENOMEM;
-			for (int j =3D 0; j < i; j++)
-				kfree(objs[j].funcs);
 			goto err_free_objs;
 		}
=20
@@ -78,9 +76,14 @@ static int __init livepatch_mod_init(void)
 	patch->replace =3D true;
 #endif
=20
-	return klp_enable_patch(patch);
+	ret =3D klp_enable_patch(patch);
+	if (ret)
+		goto err_free_objs;
+	return 0;
=20
 err_free_objs:
+	for (int i =3D 0; i < nr_objs; i++)
+		kfree(objs[i].funcs);
 	kfree(objs);
 err_free_patch:
 	kfree(patch);
