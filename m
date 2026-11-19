Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058349;
	b=Cg/zHGyuUGXgoMlj82+FHF9cJtX/U+g8FQrfZ9wc+O4Hq6cH+EJRLa8WLdqIyxHvcw+Q
	 13SCATH1qkSW5kZ6U6yplz++4uZLATy92z7EpuxBuqY69sWeYMwKHwfienFz0A+MYkww8
	 tlFHP8E1MC4qWg0nw1DyR34+6TBtU8SkYizcWIrMsl56sy2ttUq0BKWHBKpR9qYIuGQ3y
	 fWiB0IxPYpQnsgDvojMAaDbB+XzRZK2ztBpaEluiQwMabyzVcA0WsAMQIcoAM+QKi4IOk
	 AloWf40W7mM7YNOvv5fJOeL1mBGexGu5W/qw5RwUV0DGFnMyZZb24enCANBYq6JAH2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058349;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=gh2X/zFYqgYOlLC3WUu28FKyw1o/i7RlIc6Qo/iaW1E=;
	b=kHrq/DJUCN9htnq4DG9ZlsKk6w7v/wpdvhK1TEImJLKW+fxqAsQhBT6NFoTGSir8jkoa
	 K94zMZFgo/ukQPB/ofzMdcUfTNiSMSP1Lg9jrmmnNgClbRARno3hPOSUNdxB35PBPCodt
	 je4GeDIqPOZXoinKZ2AZmfVOqS4AB2WRcqTkiSU+t02yUnX2BOe86n+sRlZqrNf9gpM/L
	 jXaDXxcnAKmHY+zUzzjxEAn1dUeUKTzzALOt/XyD8bui96YIOw0IoL/f6Y5t8Hx7CH6xH
	 379Mpf5Aqnm32kS5wiiNHNsZNE1+dZQ93FuEobny1bho+ZUqiS3TpSGKD9EM3tAXdhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XS0MnQxD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AVVlju6N;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE4F606A31C;
	Thu, 19 Nov 2026 03:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE4F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XS0MnQxD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AVVlju6N
Date: Thu, 19 Nov 2026 03:19:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795058347;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gh2X/zFYqgYOlLC3WUu28FKyw1o/i7RlIc6Qo/iaW1E=;
	b=XS0MnQxDhwKGQmL4Oy8i2jaE3awoJzjv1RuXi17TSu+qwWTZCw21t7iBeVchiEnNpg0EEJ
	vVw/TdH0dnFR2LijNcH2DA73h1wd23zm++npayMxOjx7NZ23A7S6LKO3YhKWohhtSk7ze4
	PH0qNYL+lgAFmdRhLtNwy3obKTUzOjvoKSP0xs5VRuuy9HVq7IrXExX1BXqAmhRF3GvtT6
	Ym+KjPYcqDoRnjZW57uPPRoaNiH2YHCW97a66FXcdbhyPNkjTw5khNhw9Si3zrE1hSCGSh
	xiRAht8XkEAzyV6dy4Mg/M9QyApTviXplKoW80u6QiDFpi9XQQIGxQ1yPpTzTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795058347;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gh2X/zFYqgYOlLC3WUu28FKyw1o/i7RlIc6Qo/iaW1E=;
	b=AVVlju6NCFE2Os/fnYwFQb2mxTKoCxrx4r1UyYWhARqRHOaWha9cM/3vtOeZgeKYHaNJ72
	EyEZOvB7mR80mRCw==
From: "tip-bot2 for Tony Luck" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/urgent] x86/cpu: Add Intel Coral Rapids and Razor Lake CPU models
Cc: Tony Luck <tony.luck@intel.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261113174145.13513-1-tony.luck@intel.com>
References: <20261113174145.13513-1-tony.luck@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179505834266.3191731.11936263773659430970.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     e83cac046ded56962ad4d4eb6ebd7910d62c287b
Gitweb:        https://git.kernel.org/tip/e83cac046ded56962ad4d4eb6ebd7910d62=
c287b
Author:        Tony Luck <tony.luck@intel.com>
AuthorDate:    Fri, 13 Nov 2026 09:41:45 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Wed, 18 Nov 2026 19:16:57 -08:00

x86/cpu: Add Intel Coral Rapids and Razor Lake CPU models

November 2026 "Intel Architecture Instruction Set Extensions and Future
Features" published the model numbers for the upcoming Coral Rapids server and
four Razor Lake (two desktops, two mobile).

Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20261113174145.13513-1-tony.luck@intel.com
---
 arch/x86/include/asm/intel-family.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel=
-family.h
index 66d964a..2a5761d 100644
--- a/arch/x86/include/asm/intel-family.h
+++ b/arch/x86/include/asm/intel-family.h
@@ -129,6 +129,8 @@
=20
 #define INTEL_DIAMONDRAPIDS_X		IFM(19, 0x01) /* Panther Cove */
=20
+#define INTEL_CORALRAPIDS_X		IFM(19, 0x08)
+
 #define INTEL_BARTLETTLAKE		IFM(6, 0xD7) /* Raptor Cove */
=20
 /* "Hybrid" Processors (P-Core/E-Core) */
@@ -159,6 +161,11 @@
 #define INTEL_NOVALAKE			IFM(18, 0x01) /* Coyote Cove / Arctic Wolf */
 #define INTEL_NOVALAKE_L		IFM(18, 0x03) /* Coyote Cove / Arctic Wolf */
=20
+#define INTEL_RAZORLAKE			IFM(18, 0x06)
+#define INTEL_RAZORLAKE_L		IFM(18, 0x07)
+#define INTEL_RAZORLAKE_U		IFM(18, 0x09)
+#define INTEL_RAZORLAKE_S		IFM(18, 0x0A)
+
 /* "Small Core" Processors (Atom/E-Core) */
=20
 #define INTEL_ATOM_BONNELL		IFM(6, 0x1C) /* Diamondville, Pineview */
