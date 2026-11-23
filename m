Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441947;
	b=yyuccxBSwI0ZCpRaHCoCLf1+ZXHOzoHc25l2ZuvvGtWliOwbXYwoGLrKGWExR+n3FiIM
	 e36z987Waj7mH+Vfu08lulZnYUCGqeGW9GnjHZHvyQB8NNG1/oC8NTh0/yOrTMuDp14nB
	 z/EzAiYDa4m/+ydLa09orb+flwEWQm7/f+16RA22bhWF0/Vs4L5etBGOcGURkGD2+FJjG
	 6VsJO6Hd+bfGwpotEo0J1ZfO8dCnRd6uxag6dpLKLtq9/cLd222LJatyswv6GQkKCN5Sn
	 wnM+7fAEwg0GV0RDJGPfDHtbZbeKdMJoem/T6w8L2AbRjfG9QW4KadOdArWTpJWzbyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qTTU/HttU3fjnx/LLkySkKgelZHAjJmF566oK0Z4Ap4=;
	b=kdhZ8AzGWPEK8FVZPeHQ5wxQFBBK2G2KjWMzCo6wo7G2LOGqeLvtTMLoXKi6G2XboujC
	 KM0rtYaYC4p2hOVjDDugt/XN3HR+8dKSlqvcNc2OBiQQM1HjlwAq6XxNOj+bqbnyJ2W/s
	 mKm+oLWo6WTr6xYwMsue6yumpqTDWN4/vskWI3w+81H7Xnm9OFR74BbL4OciG+xDGAZyP
	 A13/j27x9QDAs/+WhBV6mvTcVUN7tujUH+rajrgWeTwGzwdorEoIB9VWXMTlekymLp/5X
	 8krv4i9b5SUwOniU6MeMIqHA1/7O3vOGXYt5Yrj3NlwKZOcKE6G+Ow/1ScBg/qmHEYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+sKvCWW;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B1F606A337
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B1F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+sKvCWW
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso1282620a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441946; x=1796046746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTTU/HttU3fjnx/LLkySkKgelZHAjJmF566oK0Z4Ap4=;
        b=D+sKvCWWkugsDPcUD//j61XqpK43oeLeZI49ZkHsDvNaK3pVKTlj5bAnu909xhDZHn
         0AB5yDbH64SGRTREMoW+6P/WlIEk5jDqTad0ppTyzsXermU5M0St6RUsd8tHa3CfJkJi
         tML0hOXu4UuHqrtIWBbE1AyzNVWBSRvm37TXcuH1IiVQhQgdhpOFCcLSnTbhUGTxX43M
         opEVqbckBmyp91Yp+/jTRRYiI/GF2Mr+Uj/vy1Y0rSGXloP0tD+LO5dn0LcUSew5Ff+4
         dMvnSt0Fci9Rushp7JKuvGIvE8U+Wa3HPNDd8fUewaM2p4K42WAKK43wObH6UzrKs4H1
         2kLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441946; x=1796046746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTTU/HttU3fjnx/LLkySkKgelZHAjJmF566oK0Z4Ap4=;
        b=LauyEWge5xsQAARfSg2VeErcxE3zVXs96mzF3uKkYnm427Xt1MUdU18gI1NwRGgMXy
         8HsS+xG3WZ4WZCwtOBS2maYu4bY3lpr6mq5c8Tr7EH88OE+Lb1wMrGARq3qTDgJciAF0
         FOnHcTbmsxUjo1dFbtBjv+rVte4exML9RveFfUYMqpZR03UVSkUqKFOI5UvOo30cHMzR
         9sJ7Y6/PNLj7d+yIezxLerqoDq/9mfvPkjj5hUu1IZwTT0qF+Pp3ApSzCXDoq5HXRiOf
         vSrt/duZKR2IdHrpjVH7nhf593gn4w+qxO+q43GBLI3yNEW3dVozqa6snt7xDTIoBnlE
         qMrg==
X-Forwarded-Encrypted: i=1; AL+hErELuh/U7v0zU/afy//tQ6wnO0nxuVwUpQ1c4WwyXCNeIqQ5igqOg47eECDmdZBhF0Fqj95ZW4BS43cxOrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+toqcwRTf+Q4IMty7WoHPh3HAT45vJcZjRMGmCxGAkyo35O1h5
	sjMJPbNrvQP5nlvfxoO9+jBcLvmkuhzUsiIidntdH0y810GlVPClKz6p
X-Gm-Gg: AZFdTZcbGNHJU4wS1eYrcrzSsXC9HEB9mPzztbQUWo0ojaXieZXRmSKXFplKAnuI34b
	L/+fzYRT+dGYpp/wigAJxdR/pFDZfzNSKt/eA8uPm76M2a1+xNPHogOeG1adokP8MCd76Ld3Gex
	0faXSXd+eXW45lWGHvGlOOJVkLM+A+aeAsOUPmhMRC1zu7ef00wdZumW4IxYnBtNWPsuRiKd/81
	riSRoB4iuHGKse5Rh4ZtaJjaPvI5kK+z2vNeVf6vupss+XQB0MHcxlxns2ia+YktC8aWUwnseGH
	z68/DveLl37KHnvlpPEVfRokZxwEIeeyg3EpGbkb0dbZb5apAnwZcEVTZ1jZFFJMr+75m6DRK5+
	9VgAXb5uTPGQq6wYa22414lK5/fopTIgKm/EBX0+w6PhRapRoD7zkAElvIutkdaIpZvzVjzBiK7
	9SV3xDsG0IW+2OV8Xu+PCgiE3DUBBOTojDq5lXVYnbWAA0J+in5qu33Vsao9l5hmSKdUbWboYOC
	yS39qcoylorKGB1c5OWoPi7iPWPGo8zHWqrmkvFQxK2UvKJsWjmFXnLr6UqCZ2MZnX+zUZtc/uW
	TIypQEzFFYEo7Lg24pQxyK/UQ9YAKVZscA==
X-Received: by 2002:a17:90a:e70c:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b41c7bc5a5mr7828786a91.3.1795441946295;
        Mon, 23 Nov 2026 05:52:26 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm20842512a91.14.2026.11.23.05.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:52:24 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCHv3 4/4] powerpc/kvm-hv-pmu: Free hostwide stats buffers if perf_pmu_register() fails
Date: Mon, 23 Nov 2026 19:21:53 +0530
Message-Id: <a9e4029d0e11b3c944f4b4cb781fc5ff1696709b.1795441238.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795441238.git.ritesh.list@gmail.com>
References: <cover.1795441238.git.ritesh.list@gmail.com>
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

kvmppc_register_pmu() calls kvmppc_init_hostwide(), which allocates
gsm_l0_stats and gsb_l0_stats. It then registers the pmu. If
perf_pmu_register() fails we return without freeing them.

Call kvmppc_cleanup_hostwide() on that error path.

Fixes: f0c9c49c5067 ("powerpc/kvm-hv-pmu: Implement GSB message-ops for hostwide counters")
Cc: stable@vger.kernel.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/perf/kvm-hv-pmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/kvm-hv-pmu.c b/arch/powerpc/perf/kvm-hv-pmu.c
index a58634f656e9..ec05b4855736 100644
--- a/arch/powerpc/perf/kvm-hv-pmu.c
+++ b/arch/powerpc/perf/kvm-hv-pmu.c
@@ -402,8 +402,10 @@ static int __init kvmppc_register_pmu(void)

 		/* Register the pmu */
 		rc = perf_pmu_register(&kvmppc_pmu, kvmppc_pmu.name, -1);
-		if (rc)
+		if (rc) {
+			kvmppc_cleanup_hostwide();
 			goto out;
+		}

 		pr_info("Registered kvm-hv pmu");
 	}
--
2.39.5

