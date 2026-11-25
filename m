Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630720;
	b=SeZQfobz38jhC8dq39bfJqX3hiCJJC9tmJv/8omrrLmJuEUZQixSRUmok1YFqIPaGtgi
	 HnOaLVsYNfoauisrl2mk1jPisGPPK+8/RPw0s5DRzwNrRyBBeQ+II1kmf2gxSJLdNIqaB
	 MUSMFMuvDUCKNZ2kc7k9P156pYD6yRTFufo44uCOaOqmfqzIgomVEGGEs+aVF11wpBHBJ
	 xQvXPxVMz90usehUEheZ7ce5+w4GBsJeadQ/MMRtDL8YaRM3lqNHgUSPIq6R7o72QOkI8
	 zP8a9sCYitWlYALIWNpPb9ZDClGX3z8UGMO/9tM/szwZ32DykAEqT0j0D6M8kgrfm1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630720;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=c5ZkM2cTBZqL4yfdM8OklCUEgNooVyyyYP/hZJ5+ptY=;
	b=YhfnMrcyokoBDBE/5w1e4ZUMIn3Nu7hWGOiCsfE2oamBVIRwZEhFl98BGZYfN2HV1vhZ
	 34UjCJ60cHqWdh5ZN77jK/RJBpcbgHoQYey//gsOv5COwVTAdkaeeXOVFNJdsnOzaQ+nU
	 K5zd5I3nUmU6fPpL64iPIULkEncPED1H/jZ+b38aSEZ1h7GfifPhjYuqg+32y+ACLV3DG
	 phVec0ie+hpFWaBPZ7Uz0DGItfv35PGQ6DDJUbgBGBhnJhEovj25gT9xNJogoym6hpBYw
	 uShT4JlHYNlvm+MFwZUFfUboD+pkit4B3zA4+lYTruNsfTF97JCnmg+jRR3micRdgkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=X9Mb+VV7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="Sm5mAYc/";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3272606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3272606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=X9Mb+VV7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sm5mAYc/
Date: Wed, 25 Nov 2026 18:18:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795630718;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5ZkM2cTBZqL4yfdM8OklCUEgNooVyyyYP/hZJ5+ptY=;
	b=X9Mb+VV7ahhmRENgHO93GuLAAmswAObmNFfPfVjBmDLciyewnhM4xfrr+wkGLdEse3dc+u
	3DGwVhWxJefD/qihYp+DF/eAkmKM2IPXtKNkDgh0FJeXAsZeCACYvFOGeaB1wgm97m1Wfn
	tRKGe6TcwXWIyfNl9khiYQprhXBh1CW/3h46XLh8qO/bNpG3IQSMbOD/Y7vcmMl2P2XH1h
	XjuEWQFoKxLsKjVzCSE6nuw0yu15vAMGaL3UI8jspvP9mdwYmBjXbiTFfSl+NfyGvRz8hl
	PpGoYtSGrYEZ8MtAerI1lyVMY+vSTByqkqv4Txad5c8AgBNA7Vxpa0hBptWyhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795630718;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5ZkM2cTBZqL4yfdM8OklCUEgNooVyyyYP/hZJ5+ptY=;
	b=Sm5mAYc/mtKDeAQWhzKXIGuleIgD+XIp4eZZvErlovH0inxLZoX8sRB9moaYoTdypenn4e
	l/o1g7TNimnDgyDQ==
From: "clocksource-bot for xujiahao" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next] clocksource/drivers/sh_mtu2: Fix
 the size for the irq name buffer
Cc: kernel test robot <lkp@intel.com>,
 xujiahao <xujiahao@cmss.chinamobile.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>
In-Reply-To: <20261105025718.524-1-xujiahao@cmss.chinamobile.com>
References: <20261105025718.524-1-xujiahao@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179563071645.92412.14547654781597278391.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     097e8c57c1fac343c545c0abcb404a874b8d7217
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//097e8c57c1fac343c545c0abcb404a874b8d7217
Author:        xujiahao <xujiahao@cmss.chinamobile.com>
AuthorDate:    Thu, 05 Nov 2026 10:57:18 +08:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Wed, 25 Nov 2026 17:59:16 +01:00

clocksource/drivers/sh_mtu2: Fix the size for the irq name buffer

sh_mtu2_setup_channel() formats the per-channel interrupt name into a
6-byte buffer:

	char name[6];
	sprintf(name, "tgi%ua", index);

which only has room for a single-digit index.  gcc reports with W=3D1:

  sh_mtu2.c:348:27: warning: '%u' directive writing between 1 and 10
  bytes into a region of size 3 [-Wformat-overflow=3D]

Callers pass indices below ARRAY_SIZE(sh_mtu2_channel_offsets), that is
at most 2, so the overflow is not reachable today.  Still, the buffer
size does not match what the format string allows, and the bound lives
in the caller rather than in this function.

Size the buffer for the widest possible unsigned int, which makes the
sprintf() correct for any index.

No functional change.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202501080036.LH3XAQK1-lkp@intel.com/
Signed-off-by: xujiahao <xujiahao@cmss.chinamobile.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Link: https://patch.msgid.link/20261105025718.524-1-xujiahao@cmss.chinamobile=
.com
---
 drivers/clocksource/sh_mtu2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/sh_mtu2.c b/drivers/clocksource/sh_mtu2.c
index a45bf94..5d1ce87 100644
--- a/drivers/clocksource/sh_mtu2.c
+++ b/drivers/clocksource/sh_mtu2.c
@@ -339,7 +339,7 @@ static const unsigned int sh_mtu2_channel_offsets[] =3D {
 static int sh_mtu2_setup_channel(struct sh_mtu2_channel *ch, unsigned int in=
dex,
 				 struct sh_mtu2_device *mtu)
 {
-	char name[6];
+	char name[16];
 	int irq;
 	int ret;
=20
