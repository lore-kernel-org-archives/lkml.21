Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719234;
	b=n5Na+ATTb4+H9JcfbS/B6V9gMRjxpo0pMUxgQIi+uyId6dN8dhPVrU6KNwxIqjUp/55v
	 8+oUrD7RWT9Wz5ObUsigvDCrWDxy3V0L23bUeLwduaVK7SlydUw/J04LJ2Q474MIkj8ai
	 Om8JdPOXXdkkeVQoZYz9BHu0DfcuV51zoNASG8aNz1U47489BIp2Ew/F752aEojrFaQD8
	 OmnoHfBbB7lQ+zrWDyhqM3XNpTFaL4ueKxiHglwe6GxMRpMq4a2RGkr5wcgvNDcl9KS7b
	 DOxwza4gBxXA8RxvlXdV4t2CtMzPNSc4vCw1I+V4tcMzKi4+TmbCcI9nlO+QyK3NxRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719234;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3EU6M+Wp2gLwVr9V590W83qY+AC7Nd7RBz/JVxH0UL4=;
	b=oggmtnT1fsRN91wDKSmyvx1r0vyeom1HWjOKiErfFgIWzD1c6GWncNkS0aB/HPL7sVdM
	 +DhEWt6VTOdbuX+y1MFTL/uAdYOoaNNy9PMAROJJF8djahkXbncQ4VY2qdwIoNOswfN0u
	 25IZTgn3Gymm4Zi8fmTkUQ1F16p3LmkeuadX7tUD5+HYs+zgTCTN0xifFbmddiuu0dpcx
	 ExBlgQlh12ULW+DKU6dhbb/auyR+MZq1t9dz7ZdshIR9TRtzJNbSZ5+aQUAEZ2IikRUhS
	 QHTeBxxVMeHUdmYjZpcyV4Nl5UYgXKBOiPL7IFPxflPJ1GYNDCVG1vRiSxRBX+h16ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.com;
	spf=pass smtp.mailfrom=fastmail.com;
	dkim=pass header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm3 header.b=YDoZbsje;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yqPCwz6s;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DEE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4DEE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm3 header.b=YDoZbsje;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yqPCwz6s
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id AB1E7EC10C4
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:53:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 26 Nov 2026 13:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1795719232; x=1795805632; bh=3EU6M+Wp2gLwVr9V590W8
	3qY+AC7Nd7RBz/JVxH0UL4=; b=YDoZbsjeshDQN9h/JwAXqyMvLn8yjLoidjbSt
	Vtj/nd6P1CsKy0zECFDdxazLPE4+WtPlg3/CmxxL+TQgZyAiAOuf9ETi7c4fVyB+
	QsbKSczh6JHwh1pexuFblNkMINLg9Xy03U/jn9X7cNzY7Ns+iSfaH2qwQcdqkmgO
	8Y0Qr9XaQo53p9E8f+wC7pmY+30DzlgqGyzselDgpz1/eWfpLXcRqHpynEB21Gh9
	WWtdkWcY/9rHMyEHRSnIs59/N25COtJ3vKjBIQ9s0emPRqRi5UxYf2FlTBBBvbnE
	qvRLSadMZzGFav5JTRSXbg35HpiWcq2UHxnR9C2tbmw4rgodA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795719232; x=1795805632; bh=3EU6M+Wp2gLwVr9V590W83qY+AC7Nd7RBz/
	JVxH0UL4=; b=yqPCwz6sBeOOoilG9q5oRhL+GhuCQUtiVCbEy+sRCTfN8M7w9go
	FH3jAgfKvu9ZNDoeJo4NDmqKnaBfSXIXtcMAPkKroBgBNi9wATqvyeK9sjEEU+SR
	fHU5GV7pLRACkf4tA9XYjoqXVJhjJRRqlsWl3yPy2bTkEVOvjfXKZ+Bnlx5kWo7Z
	tPO7QR+rY1MsRO9f6hBHAhioZgzH9W3K5CvZLhN1VFPz/fRz87Q87+qCQbSFOKgH
	U5NX85XOPNXl/E7sqQY10qeWHprVkqazkj8sKjicdIvvS4BeiOtrK2tJbaRNMwIv
	PFFdsubD88hF6F/hFDJFfFpABbObIQSGYRQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795719232; d=fastmail.com;
	mf=PGJhcmFudEBmYXN0bWFpbC5jb20+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:LusEzjV+p8kWBbN2dC6cuGR8HKoKj019YcnaGPvJaq2+el0
	wl86NI0/R1DFo6pi6kFn1JROrRBl3rS17mvOhg9GuSd5MRNGCXuSLDlT6e0XEXHa
	lQLGeRtzQcTk4pQIEBCsGQfIC1aarK0eP14Rj/XV3AzNLoMIE8WPoFMBtYKDsbcT
	huB5bwBTHDcav0Kv01P5rwk5nrnSGqBQzphOK2Vl9c1fzYOs5+GHzuRpFlcZ4Xg5
	0nQEvWDjX5tlpvGKaapOirIwlBI4y7f1ZKe7CV/H/KrDO0iCxg3Zevs9MCLOiuql
	O9C/YAozPYOSzvW67X27vg/s71AbW2e7jbch6xQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:Wd6zqlSiQ9Kzak3lX2UYbloAm/vQSZyywHugWsSlib0=:011ZT7zJTs1CbYELSJj8ll4UE2qL6QmGKuVc2xAJbHU=;
X-ME-Sender: <xms:P4AIa0a1qp-tnyPPMf_v-g7MTLNJhVcT_M7pBy9GNgWxVxCEPH6y2A>
    <xme:P4AIawGBw7m6UHKoauHDkbwZJDxgJxF0DBaG8LZJMaSaO3r8acv7q_epQYMsxSL93
    jffwSzZLsNUmASuD58oyAkI49SIACKgayXApGbxR010dG4aGB3MZ6gE>
X-ME-Received: <xmr:P4AIa9KnxdCj5lyPfpxjIy9-PrbwTwElS8LRfbiMbkwef92GwxLAwJYV>
X-ME-Proxy-Cause: dmFkZTFJEWeunauByLzowK1zY5L3bjxRCRewE6mjDtiaQDEEaQIGmRrIH45KrL1lQ3RNmH
    zYQhCB6WLYPzorFA8yeB/nSqP/bsIV1fa2E8BoLJ81++D46OP084ZgpC3JNwPMAcckVi8g
    a9BobpL13QGQnz4koYH8yxMXn1e+2KzApxEENr/KmYrou8tzmsrWNxDXiaw0GjZ4crXqk1
    diATTWeIHugoIM9sIPrhCkFxaO06QCpP6ayJ7knIs7D9ToZaZ2SWYmaqItAz/WIgnEs5HN
    fW95N4U6/ZcXgfnqLqZyIyqLd7qp5qcu/LvJA/z7vBGCL2M5lUC+w6gYWe483QeqOOUoX0
    sK3RSs2QY1k70RkrhS/GYbQ5E/6zX92pTHb+sQpPy1GDLAwmknNR05kska3W83Nn19/GW6
    He9YHUec0aatPWmEVAQ2cMB3kJNRDg0rvBnH84cnUh8M46zzZA6waStICcGLkGybNMWmJK
    jrelcBtRTX6H4oEN7pQWS9VyFZ4MVF5uAqcHOdUzTyvItuI7leuOfqScF4KVOAp0Yakw4s
    GV48imWh1Z/eNiq24UVOow1H1pjK2elBY8u/HeZ5GqYIHNXU+PesLEItrvP0wLxOqunRMi
    mLIbrF0VNIjehgJts9uhqv4Sq+J8dvwk6HPTBkMdokWhYmAEkch6lGYf8ydw
X-ME-Proxy: <xmx:P4AIazOA1Jx5AGMTcOnqLsXZ8TY9UUyiGSkTGAToDIX7afouqGb2VA>
    <xmx:P4AIa1nDho5rGSn7WN8aE1pHznLTMCb0H0k0oCjz1aAZtJwtsNIqFg>
    <xmx:P4AIa_4dWJW03GIjh_oehfS55ptYB6QHu2K4vY682JMeIzLw7G4NrQ>
    <xmx:P4AIax23Kz870M2q5_g8JpptVB47uRWtOD3rIw7vr3L61l_luHhxeA>
    <xmx:QIAIa2cMr_3avBdG90OF518z6OGPqWPSrQXGwZu5iXmFK-0ALCTSWOuk>
Feedback-ID: i9dce4b48:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 13:53:49 -0500 (EST)
From: Baran Tuna <barant@fastmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] x86/reboot: Remove unreachable BIOS reboot fallback
Date: Thu, 26 Nov 2026 21:53:42 +0300
Message-ID: <db149668504a7933d4fc78b588f5dc80daa150e7.1795719037.git.barant@fastmail.com>
X-Mailer: git-send-email 2.53.0
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

machine_real_restart() is __noreturn, so the BOOT_BIOS case
cannot advance to BOOT_CF9_SAFE after calling it. Remove the
unreachable assignment and break, along with the comment that
describes the fallback.

No functional change.

Signed-off-by: Baran Tuna <barant@fastmail.com>
---
 arch/x86/kernel/reboot.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 0fed6d0d7e32..28f938a3be44 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -635,10 +635,6 @@ static void native_machine_emergency_restart(void)
 		case BOOT_BIOS:
 			machine_real_restart(MRR_BIOS);
 
-			/* We're probably dead after this, but... */
-			reboot_type = BOOT_CF9_SAFE;
-			break;
-
 		case BOOT_CF9_FORCE:
 			port_cf9_safe = true;
 			fallthrough;

base-commit: 9437ee8b6cf607e883b36e44bd755968daaebd48
-- 
2.53.0

