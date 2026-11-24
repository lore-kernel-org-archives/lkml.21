Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537603;
	b=qbAEmVQa+9UlWrwuXIIVx9s3HoRP80e08GczUDhNDB+l9GuAlW7/sqRx2MORK2wh4u0W
	 dKX5XBhv6udACzsH8GCMvjrLjPVb8ePIHozJIkCsMRdL/z6Uy/FpFCfryXJlc7RTo2OQF
	 mZueVTFQ5Wl8mg3a9ElkteVU8KUSMfkYy+hXa4WFbfotPYb9xuxNQnpzhlJ7udr3+MsQy
	 7l/HlTTP4xjdhgnzz2ZEBe5woSg9aNbPisqkHbXwVTQ8O8y49fbu96sfsmW5fS3vGPvbH
	 mi8ajtOb4F+aNJwqLdYoldAKd97lXN/kZwHHmzQojFHm6t6qEBxp/eDXWzayjOLr2VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537603;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=wKWWkVhBM+aDCG8hh6diNwqhckWB9+QqXMA1orCpxL4=;
	b=eRlSqTEswd5/7roUJ1016BRx5vgvkIocTki8iWVZ2JADE1htwmZ+V5sRxjS43tvfvoqI
	 az5j1V9cQGv+uQomZZHg2XUzZ3bWki0gRAPNCbvK0AR/Zs7t5VjRe7A4dPzFaQS/w5ilL
	 wSmNxRa5wDgFFHunvRbE26+Daz/enrIdGv1ulKMSaELLjh9vKh7eayp1MoIq7RsyvaP9g
	 DSdoudZsC8fCmgYPrymfaExC1BtWx3VR4D0bXw74gPmMNjeu6RLY1qDyQkuEBNP7Pt3bf
	 Sx4bBnDNgNXOyvbGlo9kxrrAoWjMrNtLDbIk93JvV8881WIs97Ju9/vGJPASRWHQ71Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZBDyVbzT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nfqIGNNH;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD367606A321;
	Tue, 24 Nov 2026 16:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD367606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZBDyVbzT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nfqIGNNH
Date: Tue, 24 Nov 2026 16:26:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795537601;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKWWkVhBM+aDCG8hh6diNwqhckWB9+QqXMA1orCpxL4=;
	b=ZBDyVbzT/LpPJ9PgJwT7X+ngiUgWmo2Al5YO5fESGt+qS3enbpFKi32JIcJdt7B4IbyXCx
	Rt1bhbW3WtgwdZWzaHTbEr+My+rvPLxYUA7ANH8IAFIrgWR/D1WmAXKBqTBa3m+N3p8rek
	P+KS3SOSPIzBKMJYG4mY3/5GlpTt1klxCTK3FjCuIJrVKgf7I3l0F7bmWdEDGZCvpJslU8
	ThLB/yBNTmZkxUhRWWRycHhJGxMwtsTZjbt6HJqJ5zXpQnni0m2nyRxlvj26A0xMHzitdd
	0Rf5Z7gU7S3uFBm8hPY6ICk7rl7VmPzJDsmjcgTUb9abrAqU/m+Wqt+ibCUEow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795537601;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKWWkVhBM+aDCG8hh6diNwqhckWB9+QqXMA1orCpxL4=;
	b=nfqIGNNHLfLPxGPzqBC0FE6uLOs0K25EvRjCqpkw+sQ/hip/LwHYu7BxmuJJug20fvDzDv
	6/fUeZiMUxMr/GAw==
From: "tip-bot2 for tip-bot2 for Sohil Mehta" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cpu] x86/bugs: Replace RFDS model checks with VFM ones
Cc: Sohil Mehta <sohil.mehta@intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
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
Message-ID: <179553759918.92412.12569381104394619003.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cpu branch of tip:

Commit-ID:     c9b08a72a6bab2ca4c99f073e62bdc3130615e7e
Gitweb:        https://git.kernel.org/tip/c9b08a72a6bab2ca4c99f073e62bdc31306=
15e7e
Author:        tip-bot2 for Sohil Mehta <tip-bot2@linutronix.de>
AuthorDate:    Mon, 02 Nov 2026 04:31:25=20
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Tue, 24 Nov 2026 08:23:18 -08:00

x86/bugs: Replace RFDS model checks with VFM ones

The following commit has been merged into the x86/cleanups branch of tip:

Commit-ID:     07479e8845c8a3a17d49a707a7178e9fd8360ab1
Gitweb:        https://git.kernel.org/tip/07479e8845c8a3a17d49a707a7178e9fd83=
60ab1
Author:        Sohil Mehta <sohil.mehta@intel.com>
AuthorDate:    Fri, 30 Oct 2026 12:52:14 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sun, 01 Nov 2026 20:28:55 -08:00

x86/bugs: Replace RFDS model checks with VFM ones

The RFDS vulnerability check uses raw model numbers to identify Alder
Lake and Raptor Lake. Most Intel-specific code has already moved away
from x86_model checks, but this one got added recently.

Replace the x86_model checks with VFM ones to make them more readable.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
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
