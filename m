Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795061281;
	b=257LV2nhgclg2zJGX/7mbtfcew0kDrkpaxZbxBaQ57flBAeRAXwnfq6ewbzFySLEjXkZ
	 CEaqGI04nlfC0fH1FEwEck1qqE0W6gS8vr+w9AGwUGuGcrXKM4pniHK3c+eXVjHIZ/7PX
	 B44MxijvkHOpJIoaFPjXwlDRtFirY0UpfAYSN64tR1nQVYWcI8Gp/aZTgMh04ODKxTJP7
	 uRMP12vZOtP8aatmQn4jx3pkQtmpzes4HVCTWiS1ZTo7Nw21TR+CvhbqHwD956fm7yxIB
	 WaZtD88sUdQmK/WEJubAv8kq7NyoqS4NFtRDtmXUUqJXoWa1MhWeaScbgxy5dlnKEwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795061281;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=kLKS48Jp8tiJlHiHIYikMYJJUfyYjdtIZNLX/D/xEyk=;
	b=QUKFOeZf6jxHowJ6gdnoxz+vWiZlwemINhUpuLmXnGS9HfUSPv2k5C+FgUHg/Fbu/nmP
	 p08gZbUeccOxFSaQ7U8z9F1axJ+f61I2S9o1uNOrfrUGuK8As3H35qDNHVxk5CQZtnnYq
	 gAbdR54eN/KF6hX9gUKuWwahha4EHoGrcq7glEqMp8mDxmancDG+Z/ed2MezuU8ntakL2
	 PIyit188IhmW0wM43oTeHbBSAjfoui7xOibaOklkB6tBTHMVn4Thq9wrpLlE+hUawYcgB
	 TAu7MqZZa2UI1D6Mmc9YSODfN6HnKuuBwrfmEtwxLMX0JA6+bre/3Aj6OdjbxTIF/RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mwxjo15b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4878606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mwxjo15b
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795061281;
	b=nkMjcZbgsh4y3iYf0PU0WK7amZqkdAIlmcJn0BWMXfb3zf2QXzPjYKNhM4pL4MKSG7cc
	 fN24Us1Y/BQPHTbaqtmo0p8W+3fNeTUO9NbI0pElgdJyE0dNPl8bqdft5mQ5k8wXGPtbH
	 Vzl5/2bBKAd49SqusXDbCGo2A12yoGIdZMc8JoaOBqpam1cBVezptdcu5xUpx5irY/XSd
	 UKQ9xOmJYFwoQZDuQyOyc4jBUB56OPbcECDCj1Ygg3gabEH/rsFM95r8FKO6XOMI8/Hvw
	 ReUYyF9e9Q43+1TE8jLAQn7d72WRw0urRFAYDMceak3YdOjRK1aikVc1ygrqh93iPHw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795061281;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=kLKS48Jp8tiJlHiHIYikMYJJUfyYjdtIZNLX/D/xEyk=;
	b=DYO1yOSNTzLalgUHP4V2yRzUxZneqwxwpTFTBtPwA54/HLm1vcN/N34a4cFeg6fgD6Wb
	 FG4wph5k/AatXgU+WvWrHPWrmHBOo9HlAhHj+62A+MjCjj0Q3+O/9atxmPcw8IuUUC7IA
	 f7tKtUvOgMBz0dyB9I4XBwgHwfvZqDhBa6ej1Hcbi3uRhdAw4++hAeffTuYeB0FJ3o0tn
	 hn76fAeNW2obS6hirXnLHQrooXAEfvisJz2I2vEMHeu1j7zqvlNznQq6DQ1py4TFI28Me
	 sXPggKI651Vrm53ypeE2uSCuUcmIPyGw/4LdkJl92P/sVb8crpmnSrK19fr/VnTyDgg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0DB61F000C7;
	Thu, 19 Nov 2026 04:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795061281;
	bh=kLKS48Jp8tiJlHiHIYikMYJJUfyYjdtIZNLX/D/xEyk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=mwxjo15bkly5HwNs/OZOJ406TVya4OTR4hIsP4IUkP1qi/4cTyYFLHfLDar4EoedG
	 WWdQKECFdm9uzuX8ShY+CFgI5SPS9JlAAGwLtHKIiGNC2bn5xLi9R2ktjCtoLQ4H3r
	 Izf3Jl1Ynbd1zZsGYTTaZmrcSaJCHspSBxj2PHhZMoEAiMneVCMYDluAMRSzxtTb6C
	 v89rTDn5cfF71mYGLJk/bMz4qsQNgFwCK6gevOPFakeUD74yyrTd/ldwUuQ895UqYa
	 Ts5+9MIMuEh6/q/Mr3noGFthb5vcDhCp4zoXkwZp0kakEz8BRrsOvC9XqZJIXPuDJE
	 2IMAOYCnOMFRg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5638F4B0C3;
	Thu, 19 Nov 2026 04:08:00 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 04:08:00 +0000
Subject: [PATCH] rapidio: Use file_ns_capable() when checking config space
 read access
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-rio-v1-1-3cf63c5198ff@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB92/moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0NL3aLMfN3EJMskw+TENOPEVAMloMqCotS0zAqwKdGxEH5xaVJWanI
 JSKtSbS0AK9jEn2cAAAA=
X-Change-ID: 20261119-rio-ab9b1caf3ae0
To: alex.bou9@gmail.com, akpm@linux-foundation.org, 
 mporter@kernel.crashing.org
Cc: linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795061279; l=1965;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=1vmJ+AEFgVNlqvJElz4DQk/2859VN6iyvuAYe32lGnE=;
 b=WTxN/On1aehsM0yOUsELqO3xfJyZhV+gLVBo1eoMIWTf02HJ8MOCml2d/5AY1w/VXZTc5nMmZ
 y4h6LMh+T85AC6xkPBSS8uUiB9S1l5aM+yjmqvqpGNO5nANOcZudJht
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

rio_read_config() limits reads to the first 256 bytes unless
capable(CAP_SYS_ADMIN) succeeds. That checks the credentials of the
task doing the read, not those of the task that opened the file.

The config attribute is mode 0644, so any user can open it. If such a
descriptor is later read by a task that has CAP_SYS_ADMIN, the read
covers the full maintenance space. The allowed range follows whoever
happens to read the descriptor instead of the credentials it was
opened with.

Use file_ns_capable() with init_user_ns so the check is made against
the credentials saved in the file at open() time. A descriptor opened
without CAP_SYS_ADMIN then stays limited to 256 bytes whoever reads it,
and a privileged opener can still hand the descriptor to another task.

This matches pci_read_config() in PCI sysfs, and the PCI procfs change
in commit f82f53e75eff ("PCI/proc: Use file_ns_capable() when checking
config space read access").

Found with a static analysis tool and checked by hand.

Fixes: 394b701ce4fb ("[PATCH] RapidIO support: core base")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on x86_64 (W=1, no new warnings). I don't have RapidIO
hardware; the fix is by inspection.
---
 drivers/rapidio/rio-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rapidio/rio-sysfs.c b/drivers/rapidio/rio-sysfs.c
index 0949c869b2f1..a85b73939a9e 100644
--- a/drivers/rapidio/rio-sysfs.c
+++ b/drivers/rapidio/rio-sysfs.c
@@ -123,7 +123,7 @@ rio_read_config(struct file *filp, struct kobject *kobj,
 	u8 *data = (u8 *) buf;
 
 	/* Several chips lock up trying to read undefined config space */
-	if (capable(CAP_SYS_ADMIN))
+	if (file_ns_capable(filp, &init_user_ns, CAP_SYS_ADMIN))
 		size = RIO_MAINT_SPACE_SZ;
 
 	if (off >= size)




