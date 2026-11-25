Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601011;
	b=3CPB+6ebo4s8TQQpsOnUX0P64DpdQC4Tq1Zk5i8sN2jk7Vgj7hd2CzmWGINc4ysGAuLM
	 y6mA2ZX15JIi7kT51KXhs5fXX4wgYa48yOqGbMTBLhzxtZw/a9Gea670cLwmmWTtuDRD9
	 nStYVARQC/Zxfz/ooqD0YMbevQFRno4sCwJJ1nab3IldbUfknrb7pPy+bI9S3gZ3oyIwU
	 JUrjUY5XZEpDnyziOYPUGgaftsRlx9kjoNKTmbQrCMjtA5FbUv7zMm6hrqhvyjlsPbvsQ
	 zrx4D8zgOamYSGcMUFgBweNA4l7PBcEjlQ1YTnGvdxPaz1+Bp3MKGu8/DaUaii/3A0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601011;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Oey54bd0XnMBiKp07AITA59Mxc7mR2eyt2SUP8f27lo=;
	b=qGEZecTZo9yaC1gOFb+UgFu5+pdkHDLalDkadKUCTfuJO3GwfdERs1QnONpSwa6z28i7
	 dezAfwJJDJXjUBf3WfPeQi3Ib+5OMQYVvkM4hUX0Ns0vqE0Ohb2Cw1+WyNvXcHTJKKfyw
	 2WC0bkmjuzid6N4ozvsAqHPD9FIQl6JNg4aez/W7GiGdVlipVNtzqtYRwEWKcjN8r7lBB
	 yqJUfw1WbR0il4wJJnEM1GD0VsWluig+qPRlJxyuGwoRFQCmS01xEsmHZdvsqPMrGp7FN
	 7Hj3CvEttuuYQwpB1qoJ39AmrrFj1x1zBTFQkCxrcaX5jJRX+xoA70gwuVSz+sSTg9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WIanEbWm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nP3qz6t3;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CB8606A321;
	Wed, 25 Nov 2026 10:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03CB8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WIanEbWm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nP3qz6t3
Date: Wed, 25 Nov 2026 10:03:26 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795601009;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oey54bd0XnMBiKp07AITA59Mxc7mR2eyt2SUP8f27lo=;
	b=WIanEbWm/f+BoW6sfF/ewWfjvKAoRvPq7CH00Z7kYW5J6O/01qreQAKtuCKxaLK+Bdrx10
	ZpN1bX4qTkabW0Gy6AHWlo6PPHTDy+pvFielhM1AoU3NmT7FdJN0OmF7n4jQzSh1gzW2OS
	t6CDchQ3l0lPycUzq2b6X/sUUqIo9ZgADokbpDrZFCBnI1E3Vo8YxqgRbDEAdZP3BA0Qyg
	TU0OJ8fMSNBtXbEdhZTWXQzLsly570FZH7syo5KW+LlOn5+9zd86i9s33beII+dG9DhNLo
	2pUWaRqSJByAhBG1A/tbXML13dhkIMFaVZGnTYqNHgeYTellGmhO73bmsxDMNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795601009;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oey54bd0XnMBiKp07AITA59Mxc7mR2eyt2SUP8f27lo=;
	b=nP3qz6t3qLuVZB/LW4jpqoikP2rC9H7XcBYF+ZJi5Udk2rn7h5PLuSo06ToEb4S98spbu9
	PcyfzAHC+h38HxBQ==
From: "tip-bot2 for Sohil Mehta" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cpu] x86/bugs: Replace RFDS model checks with VFM ones
Cc: Sohil Mehta <sohil.mehta@intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <179359388559.1009794.13162832200073973480.tip-bot2@tip-bot2>
References: <179359388559.1009794.13162832200073973480.tip-bot2@tip-bot2>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179560100687.92412.13730232637974946992.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cpu branch of tip:

Commit-ID:     bbb389a04a410f49a2976125997217ea8747661a
Gitweb:        https://git.kernel.org/tip/bbb389a04a410f49a2976125997217ea874=
7661a
Author:        Sohil Mehta <sohil.mehta@intel.com>
AuthorDate:    Mon, 02 Nov 2026 04:31:25=20
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Wed, 25 Nov 2026 10:56:38 +01:00

x86/bugs: Replace RFDS model checks with VFM ones

x86/bugs: Replace RFDS model checks with VFM ones

The RFDS vulnerability check uses raw model numbers to identify Alder
Lake and Raptor Lake. Most Intel-specific code has already moved away
from x86_model checks, but this one got added recently.

Replace the x86_model checks with VFM ones to make them more readable.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Link: https://patch.msgid.link/20261030195214.1284995-1-sohil.mehta@intel.com
Link: https://patch.msgid.link/179359388559.1009794.13162832200073973480.tip-=
bot2@tip-bot2
---
 arch/x86/kernel/cpu/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 7e4eb70..0374746 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1391,8 +1391,8 @@ static bool __init vulnerable_to_rfds(u64 x86_arch_cap_=
msr)
 	 * both Core and Atom CPUs. Mark unaffected when Atom CPUs are not
 	 * present.
 	 */
-	if ((boot_cpu_data.x86_model =3D=3D 0x97 ||
-	     boot_cpu_data.x86_model =3D=3D 0xB7) &&
+	if ((boot_cpu_data.x86_vfm =3D=3D INTEL_ALDERLAKE ||
+	     boot_cpu_data.x86_vfm =3D=3D INTEL_RAPTORLAKE) &&
 	     boot_cpu_data.topo.intel_type !=3D INTEL_CPU_TYPE_ATOM &&
 	     !boot_cpu_has(X86_FEATURE_HYBRID_CPU))
 		return false;
