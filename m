Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155145;
	b=MoxWhyoVa89baDoGzWiASpyz4DW1QlMQuzWk/kLoLT/KuO9VpYdIt7cXYvr/iO3gSW7+
	 Vk2Fl7kGzwSgtTlPdgy0155PBysa7lC5ODJJ3I3fxtwLp3sneQ5apB8rOFDYcX7mIctHl
	 q47adbIwxIebg3+EqOlQxI++r4JJqgZfNYaosGgs97Vi+oJ1KQleDeazmHxgrPvPL3v3C
	 HaN/Y26x6hb+wstcDqfL51NHBFFWPady6MZSwsp8kgSSHYL0Lx8TZZz4rnn34Mld6b3Il
	 gvCf/4jtZ7e1B0u3vFj6th629pQqCA3hBA2E/mBOMSsUaiVBXoYY3DkxyrWe/e/sZ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155145;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=+bNDiqikP4UORmZOWC07ZP3W3L9GbQNvQPbMW+0wf4A=;
	b=wr7VpLW+nvhANClHEosRaUki1OPjn6AyiUdVOzgl6FzuMsCUE7rG4AcduS30CpEaVKQ9
	 BVpEj2+6DRGbr6E5rG6FA/yDvE9tGlqKVTa43lyMqcKVYmByWTNfN/OgL2piHlnJbRKRt
	 Jgbtrhito1XVkcPdt6wgSDwWLzYlsUTgpNVSQT2PYHpEJCg8/pWeEvaforzQh7jLg1PK5
	 xjF7vrM167k8eYhZw24h3vPcHJr+7W6uxFtoHyNcEiRf0EDuZoahCEc1s4zv32Mw7RiC7
	 WeyqQf2/tKsbMf3RbWsnuMUBSomrmvs8leH5UDa4LiAj9LIP2Ys2ucIWxppqFUf1Adw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0+XYBzVD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=W2xIEi7M;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6276D606A512;
	Fri, 20 Nov 2026 06:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6276D606A512
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0+XYBzVD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=W2xIEi7M
Date: Fri, 20 Nov 2026 06:12:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795155140;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bNDiqikP4UORmZOWC07ZP3W3L9GbQNvQPbMW+0wf4A=;
	b=0+XYBzVD+CSFVyJdlogPC/0EGK1uSbsOlmFD6yMFQpJ5hphLIg4DKzRKcXcrm+ZcrwVYyw
	Fdo5Q15B74MkXhZTs+v656L8LMW/L/RkV18in3uv6Axwtan+4CgdQjMktE8HQGw0329bOH
	vjJ63hHjlpKi60Y+PH3T5HZCHT56q/m6paF+pZYmPF57Y8VVltlUMLyLXSPWSRXSZ1caxv
	ah0xBxcvP8mr+3GRrK3PVUCSTsXS+5AhmSTaZcwohD/e9mUqgXp6gA0NGqT+eeF5ren/mw
	O8Be+pKsTwuQAMuJrsE8n7yA7wTenoPeFQUSDj+9X4mMdkRM3Fs7RheMF8AD9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795155140;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bNDiqikP4UORmZOWC07ZP3W3L9GbQNvQPbMW+0wf4A=;
	b=W2xIEi7MQfkLUBUkiFpVncW5X1D+44EGBf8wrrZs1Lty/57L8NQDFD/QgUhBQuqeCtBAt4
	hiMY9SNLEsmyOdAg==
From: "tip-bot2 for Adrian Schlegel" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/mce: Do not treat cache hierarchy errors as
 memory errors
Cc: Adrian Schlegel <me@adrianschlegel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Qiuxu Zhuo <qzhuo@nvidia.com>,
 Tony Luck <tony.luck@intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>,
 Sohil Mehta <sohil.mehta@intel.com>,  <stable@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261012193305.38931-1-me@adrianschlegel.com>
References: <20261012193305.38931-1-me@adrianschlegel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179515513785.3191731.478144865512652784.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     29b74cf57f432d60da2b79c827f1379125409611
Gitweb:        https://git.kernel.org/tip/29b74cf57f432d60da2b79c827f13791254=
09611
Author:        Adrian Schlegel <me@adrianschlegel.com>
AuthorDate:    Mon, 12 Oct 2026 21:33:05 +02:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 19 Nov 2026 21:58:07 -08:00

x86/mce: Do not treat cache hierarchy errors as memory errors

On Intel and Zhaoxin, mce_is_memory_error() also returns true for cache
hierarchy errors. All callers expect it to report memory errors only.

The CEC uses it to count corrected DRAM errors. A corrected cache error only
names the cache line that was affected, not a faulty DRAM page.  With a faulty
CPU core, the CEC therefore soft-offlines healthy pages.  On an i9-9900K this
caused about 500 soft-offline attempts per hour.

Report only memory controller errors on Intel and Zhaoxin, as is already done
for AMD.

Fixes: fa92c5869426 ("x86, mce: Support memory error recovery for both UCNA a=
nd Deferred error in machine_check_poll")
Signed-off-by: Adrian Schlegel <me@adrianschlegel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Qiuxu Zhuo <qzhuo@nvidia.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
Cc: <stable@kernel.org>
Link: https://patch.msgid.link/20261012193305.38931-1-me@adrianschlegel.com
---
 arch/x86/kernel/cpu/mce/core.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 50b1614..eb0e51a 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -540,21 +540,13 @@ bool mce_is_memory_error(struct mce *m)
 	case X86_VENDOR_INTEL:
 	case X86_VENDOR_ZHAOXIN:
 		/*
-		 * Intel SDM Volume 3B - 15.9.2 Compound Error Codes
+		 * Intel SDM Volume 3B "Compound Error Codes".
 		 *
-		 * Bit 7 of the MCACOD field of IA32_MCi_STATUS is used for
-		 * indicating a memory error. Bit 8 is used for indicating a
-		 * cache hierarchy error. The combination of bit 2 and bit 3
-		 * is used for indicating a `generic' cache hierarchy error
-		 * But we can't just blindly check the above bits, because if
-		 * bit 11 is set, then it is a bus/interconnect error - and
-		 * either way the above bits just gives more detail on what
-		 * bus/interconnect error happened. Note that bit 12 can be
-		 * ignored, as it's the "filter" bit.
+		 * Memory controller errors have an MCACOD of 000F 0000 1MMM CCCC:
+		 * bit 7 set, bits 8-11 and 13-15 clear. Bit 12 is the "filter"
+		 * bit and is ignored.
 		 */
-		return (m->status & 0xef80) =3D=3D BIT(7) ||
-		       (m->status & 0xef00) =3D=3D BIT(8) ||
-		       (m->status & 0xeffc) =3D=3D 0xc;
+		return (m->status & 0xef80) =3D=3D BIT(7);
=20
 	default:
 		return false;
