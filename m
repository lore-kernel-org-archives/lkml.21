Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596046;
	b=BEjzOzf5GPyzxS62lI4Dyc4Md4Z/xf8MmeBY8vOQMP89BU87JEvUmt/4E7jmCwcB/3tw
	 NJaoJFjFC4p+13fCvUpAqJJ83bDmcl1Yv7yIEIJk5u7lyvhd7uqPveVqJBep+RHysZiea
	 Ztg36lDRnEb3QKalRkdXz+GBcQ053BmwKDzFsHHdcbGw8vCfDYOgc9sGYcJ7mN78/h/vk
	 od4n2JXbFgRTy+loi5jFm4opDwZQyaItxOp193GvogTfB+cqv0vZDXXI6qDz5dFYi5XnU
	 CRyaGdoAmHBncQEf8JhlIu8wAotaFDsBxcq42/1Y5gVUr47mo5Ti44Ww5KjGMdz4DLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596046;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=apcGwBa7vNOB1JZdkm4822dAO6dUKeUdTW9gSKLI5gc=;
	b=dD0qouRLDJ3fBlwDypylx8FP8MSvlhwE5P5qhUggrrE7uz+7dKZ/KZ6Rn+r1wUImRyy7
	 9PpZBvjlVyokLSUft/a8XhQDZNqY76+aDkD1o+hgilKcud8kOSOKE3QQXFrGySNpPTCJh
	 7m0mvmKCipnqhxG89uQmrX9mqO4YEeB10rk+rAuear8PEAVudGQPHCvwnDD13U8xfonv6
	 BhvbBc4NUcwv/ojxrNYe61pAedXnSP+bjvmSkVi4Vev5+GuUQaQ1y9wEtzbaumYsXqf0W
	 5DLtcPFpw/jh7+0I4V3SXt404SGlMbU0Th4Rh1B/ynKxQZe9/czWArdh63f7d9NE1AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Qn8Lvs3u;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SxdrBj1m;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E3F606A688;
	Wed, 25 Nov 2026 08:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E3F606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Qn8Lvs3u;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SxdrBj1m
Date: Wed, 25 Nov 2026 08:40:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795596044;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apcGwBa7vNOB1JZdkm4822dAO6dUKeUdTW9gSKLI5gc=;
	b=Qn8Lvs3uJuqSJQjUz9YFdgJHoGEx/9ll+f+eU4ZZULYb01JSDF4gYOV6vgX+POJzCi5pgM
	VSpHXf8CvbF7k2HsiSdtcZhnApAFviNBanweViwGDAmCdk4e6zlPU6fTeaS9xFMDvacwrI
	PfHKTxepm8hR7HzwfLXeyajzcUzv7x98W+MAzWybayA35OJgWI1qZQIudmQtdl2pwjhoxO
	1TqfmnDmw0KalBNs3OKa/z1+YHRiRYwQZceuJmh9ZDWf8RDzDMKxN+ClLNhBHsoJCf5gn1
	LgRKQqsdHKtSCoe3zZEVOJWvCcUPVl546OR8AsCauHEAwM3BH89C4nqxe7twSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795596044;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apcGwBa7vNOB1JZdkm4822dAO6dUKeUdTW9gSKLI5gc=;
	b=SxdrBj1mBsIiUeYrqO1hMPpEzLA0cIXxFdRjnNoxLXCI8H77FuWF1QF1s8pJlKMxRG4vtQ
	0yB6HE+EXNjrh8Bg==
From: "tip-bot2 for Hungyu Lin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] klp-build: Use kzalloc_objs() for object and
 function arrays
Cc: Hungyu Lin <dennylin0707@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261020072712.12633-1-dennylin0707@gmail.com>
References: <20261020072712.12633-1-dennylin0707@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179559604210.92412.2297958434620654008.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     0397eb93362723345eb3a0ffbda0e19e654c0440
Gitweb:        https://git.kernel.org/tip/0397eb93362723345eb3a0ffbda0e19e654=
c0440
Author:        Hungyu Lin <dennylin0707@gmail.com>
AuthorDate:    Tue, 20 Oct 2026 07:27:12=20
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Sat, 21 Nov 2026 23:38:32 -08:00

klp-build: Use kzalloc_objs() for object and function arrays

Allocate the object and function arrays with kzalloc_objs() so their
element sizes are derived from the destination types and multiplication
overflow is handled by the allocation helper.

Keep the extra zeroed entry used to terminate each array. The default
allocation flags remain GFP_KERNEL.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Link: https://patch.msgid.link/20261020072712.12633-1-dennylin0707@gmail.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 scripts/livepatch/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/livepatch/init.c b/scripts/livepatch/init.c
index 16aff8f..df041fe 100644
--- a/scripts/livepatch/init.c
+++ b/scripts/livepatch/init.c
@@ -34,7 +34,7 @@ static int __init livepatch_mod_init(void)
 		goto err;
 	}
=20
-	objs =3D kzalloc(sizeof(struct klp_object) * (nr_objs + 1),  GFP_KERNEL);
+	objs =3D kzalloc_objs(*objs, nr_objs + 1);
 	if (!objs) {
 		ret =3D -ENOMEM;
 		goto err_free_patch;
@@ -47,7 +47,7 @@ static int __init livepatch_mod_init(void)
 		struct klp_func *funcs =3D objs[i].funcs;
 		struct klp_object *obj =3D objs + i;
=20
-		funcs =3D kzalloc(sizeof(struct klp_func) * (nr_funcs + 1), GFP_KERNEL);
+		funcs =3D kzalloc_objs(*funcs, nr_funcs + 1);
 		if (!funcs) {
 			ret =3D -ENOMEM;
 			for (int j =3D 0; j < i; j++)
