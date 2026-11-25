Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572275;
	b=j4r4hdd/ehbkbRW488kxRbtjh2Dt6HQIBZ/4fFzj97jKVQjxVcWi+ko3g8iT4uoCc5bU
	 E+r2k3uQ0eSuBS+xGiKF36zvJz9hjctDbstfK2OQLm71GmVDTYukhsijQvzQMVp4inEsB
	 NIp6uQp1ronAQAWCff43vjGaSaT7jd+GYH5wVsdDzWWk+MHvPTklO9fYTrousXN3IPXpj
	 RDE4wijxI+1T2T9HftieStortq+lT+VFpDeIilrSWdIO6tJTReureJwOkQMUFNquFvOR1
	 CgowNVDcCYNY8d6dQOb0PtTfJEFp33RiwlPBeZtBOvxo3dzqmTc7LKXPoRtaCZ3xZaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572275;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=41OnDSHFjZZH2G4j8tC3FE6KAJ7Xk1b9diYJ5haPaGA=;
	b=h4ugcBjaXjWV1aZK2+A8apgciYxV2griBDj9whRrAz3yMUjIeGs8B5CmAg3HytXh0OOb
	 k36+lxZOraI6+VAYc/mEMZIwhgyJ+sQ6F1bpdHfkD/pcpJEoRkqL3HjCjy1rd5Uwz7l0k
	 1sqUXO1dPdPq1mXy04EoG++Kgp8F/ap6pzlPTjn2H7ixTNszksT6CI9D+F66oiyh/JDYw
	 j4vlXY6sY2XheURp4HnsddHtyRB+4+hXIaoyqF9c5DmaOJftoyJVIE/sfCnq1Ian7T1eQ
	 quyjrtk4G2+uzIMVoNZXIEz/rQlMWckhjXbLZ+lRrYikSEzTdwBZalpu8zzqOkAUZTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FkHYVEHS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uJp++6XD;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D71606A31E;
	Wed, 25 Nov 2026 02:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D71606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FkHYVEHS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uJp++6XD
Date: Wed, 25 Nov 2026 02:04:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795572267;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41OnDSHFjZZH2G4j8tC3FE6KAJ7Xk1b9diYJ5haPaGA=;
	b=FkHYVEHSUJKInnQXnAJRcLtgI9eQMuZ2cirya9X2JuErtyPnDSJx6Z4OFrqKJe0I0pvVzt
	p8oz+PlXw7mqJjsFG868ODk/XYUJ60MnvjideN7ZosAiG2+V5nOe9TDi2/DYcI/taSNc3b
	R1IyNRmYF2T951tKfzfGAn2erYrukuk1vDQT/9zwN1ncF7jBybhNmFRMNm2RuaoqNo1A97
	XssZ7rP5E9e2Ue3cw12+NjqG99E1ZKtdhVGwdrMrfwT5DQ5k+E5Rod0hEDWkX2mthmQgzO
	f8/YjFgWWDp7q4mGx3+PLLB2VL4sty1Ge6zLdBYcKK0kHHY7QwFCCLgTxg3a2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795572267;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41OnDSHFjZZH2G4j8tC3FE6KAJ7Xk1b9diYJ5haPaGA=;
	b=uJp++6XDGdS+u9XVP/GcFtadTuODheQ1MRVFhzSR7VMSQvDpuN2pmTXAxnJj0UikC2/heQ
	jh25PcNFvsmwkWAw==
From: "tip-bot2 for Nirmoy Das" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] fs/resctrl: Report unknown schemata domains
Cc: Nirmoy Das <nirmoyd@nvidia.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118205825.3339003-1-nirmoyd@nvidia.com>
References: <20261118205825.3339003-1-nirmoyd@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179557226501.92412.13417626927484226187.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     fa4058444973f352c94c3f4f2acdc0fd94335a0f
Gitweb:        https://git.kernel.org/tip/fa4058444973f352c94c3f4f2acdc0fd943=
35a0f
Author:        Nirmoy Das <nirmoyd@nvidia.com>
AuthorDate:    Wed, 18 Nov 2026 12:58:25 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 24 Nov 2026 16:37:47 -08:00

fs/resctrl: Report unknown schemata domains

A schemata write to an unknown domain returns -EINVAL without setting
last_cmd_status. The status buffer is cleared before parsing, so reading
last_cmd_status after the failed write incorrectly reports "ok".

Report the invalid domain before returning -EINVAL, matching the existing
I/O allocation parser diagnostic.

Fixes: c377dcfbee80 ("x86/intel_rdt: Add diagnostics when writing the schemat=
a file")
Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Link: https://patch.msgid.link/20261118205825.3339003-1-nirmoyd@nvidia.com
---
 fs/resctrl/ctrlmondata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 556032e..a37b245 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -279,6 +279,7 @@ next:
 			goto next;
 		}
 	}
+	rdt_last_cmd_printf("Invalid domain %lu\n", dom_id);
 	return -EINVAL;
 }
=20
