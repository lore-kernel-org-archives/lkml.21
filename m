Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138477;
	b=IbkFGwWVafYgOP8ZCMiKNEWsT/PDge61XVm7qKyx9c+qv+hPMg4CYKW7hpMkAJlDMVAM
	 NNTICYGLARf2Egd4Sy+VykbbDnGIsb8wU1qPjzlyjJircCD45cQ6//R0vlsYnqsZVDd6n
	 cHfO9JgCHyLbLBwtTLphRwejeKyiD0AExNj/cvXvX4TqCqcP/r/fhSwuEDkJO/A73bSiv
	 lfS8K3C4PB3V+7AzG089AQ1fMWm3z0P8M5kUrpznJjn3DL4XAdtInmu/XT957zBfydH/T
	 KZj5d3J9SM4dnC2Bdtb/a0ckIMtpDEZ37uTrLwTpAN1RdqXpz1LQvWRxbYz8VHR+OWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138477;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=oAbOakfRk9ckjXo2B20LiiEmqlOjg7fhO7zwUDZOYsw=;
	b=oJU4JZNQ9I+FwpwXibVzAJ2Q7/Oqr0i/DLFE4IcpI2de4XxnpdSjBJmmO3y52EJi9Bdk
	 c06J5QG0t9RV+3GINGNpwkyQSVTQ+CsU/Ow+lqz3TyZ4LwfG+e9I+jgDTQfuUgvGV9glU
	 WQzWuulyZFZXCCqaLb8KB8dj2zfF9DqIRusvPavasoiTovcICCoVa2ZNodgefXA0yCOiE
	 FEbEfp0ueIDv5S/SmQnjbrdK2WfTBtYJ43+fQXb1QF39CTRkovBRW4TnkDBA22Wv+0T8x
	 x3zKyNjFC3gU/b2Xd03hd1kAFS8AJB9YQxUb/dTmLVHTsnQPCbaIKJ6X3igQQpXlpjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tr+D51hS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="Eom/zv6U";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87C606A320;
	Fri, 20 Nov 2026 01:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F87C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tr+D51hS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Eom/zv6U
Date: Fri, 20 Nov 2026 01:34:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795138469;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAbOakfRk9ckjXo2B20LiiEmqlOjg7fhO7zwUDZOYsw=;
	b=tr+D51hSNbOygUMOZEPayjdIDZ93/oqhexL906qs+UghhjCsZItuDpBymLUQNymzFkLj1x
	QR7H1QhtWLWUVxiMk/eMVata6I6aY9ijtkcQZekvK5cgKHnYgCadaR9MWtgVVnvMbBjx0F
	+4ymfR608kPv7TRLCJvHVdGYTsBf/8WT7hvOeVeqBTrI7JaNxma/GJB6UYgsTD3XqHqfm2
	lteJRWeKRVYoVSL2tiNw4zR46Nk7Uu3qvY7mh6vYLC3aybSLnYvJzALZLgNEredznNrgiu
	wYYnH980EoVbz8D1J74DXn5834pUhGAbraIs16dn3iS8I5TdjB5+FZEb7d+Rqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795138469;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAbOakfRk9ckjXo2B20LiiEmqlOjg7fhO7zwUDZOYsw=;
	b=Eom/zv6U1ZHI0jouJrse/49Mt6xG51gJesAGjVHdE/POe3C22yN9yGvjEH/IQTdDJMv+ru
	tayepb+3hy9BBiDA==
From: "tip-bot2 for Tony Luck" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/urgent] x86/resctrl: Add SNC support for Granite Rapids "D" CPU
Cc: Tony Luck <tony.luck@intel.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
  <stable@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119184524.12846-1-tony.luck@intel.com>
References: <20261119184524.12846-1-tony.luck@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179513846588.3191731.9971076433435016491.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     0833bc1d4ad71144500f6ca8601672580624f24f
Gitweb:        https://git.kernel.org/tip/0833bc1d4ad71144500f6ca860167258062=
4f24f
Author:        Tony Luck <tony.luck@intel.com>
AuthorDate:    Thu, 19 Nov 2026 10:45:24 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 19 Nov 2026 17:19:54 -08:00

x86/resctrl: Add SNC support for Granite Rapids "D" CPU

Sub-NUMA Cluster (SNC) mode divides available RMID counters between
NUMA nodes that share an instance of an L3 cache.

Granite Rapids "D" CPUs can enable SNC mode, so Linux must adjust
when SNC is enabled.

Update the table of SNC capable CPU models.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Cc: <stable@kernel.org>
Link: https://patch.msgid.link/20261119184524.12846-1-tony.luck@intel.com
---
 arch/x86/kernel/cpu/resctrl/monitor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resc=
trl/monitor.c
index a6a9090..eee7657 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -381,6 +381,7 @@ static const struct x86_cpu_id snc_cpu_ids[] __initconst =
=3D {
 	X86_MATCH_VFM(INTEL_GRANITERAPIDS_X, 0),
 	X86_MATCH_VFM(INTEL_ATOM_CRESTMONT_X, 0),
 	X86_MATCH_VFM(INTEL_ATOM_DARKMONT_X, 0),
+	X86_MATCH_VFM(INTEL_GRANITERAPIDS_D, 0),
 	{}
 };
=20
