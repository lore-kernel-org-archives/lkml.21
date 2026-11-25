Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605995;
	b=J30WRQ8mKrL5pbYA6ZNA7HtyV4WpwUQeYQ0iCSvM0oTaFcZiY69+Tonz3uw9KebJXCDg
	 lnafr5mCQXoJYFhBHI9D2Gq/FEu6nQ0NTegllnC7P+UAt60KYGyPi8BnaTHUAgE6Ouc+D
	 b3I83Qo3Tf8WQJHPsZ4TzM/4473LcvTyBbSwvKboCfF2/3bjRPWqRqqUn0oMuCnRTLhM1
	 gk0DVPu+mlxYkynCzGaUmjO5WKhoiawT+tIm/sGcqR5AErcUouWjV7FXVgocd01xdzpKT
	 ffz2MFckGAZ4ys4VE90ufQgThBVJBnJElLy4sPCYjwM3Lg2+eNAVyJSwpYD1xkW28NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BDad+1Q3j6dYRY0ykgld/Vjl2b9srpFqahkLGtGJZw0=;
	b=NlmPv1Fai6+OLhwqshpTSfRpWGJouBmq/mu3IlmiuWFpaI+YrnarDSzMUPpn5iMn6zXr
	 qp2DRpWRa7X04hA0fqBUzcwCwdN4C1k8lBhi63MGikPhbTwtecEf5mgVFCwZabIzfCVlf
	 Ac8j1gSLreMBaRo3f3fNO7bZXGHRowmB7woX9xll3z8R3jou3pulDJLRyMbc7NOAEd/W+
	 +1Qgr4GzkNVMLUzv2MS6Zp1IXeY1CBkiJE6CLX/qlHmtp76I8uvmdH2Sx4/PpDkMx5MyQ
	 /qJ0nCh0lVmR12SN38D0Jwv/O8ppu+K0ft0PQXBYOiTx0jDqCbUZzbpO6k6TFFVhMKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GKTJIcj7;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15DB60A2607
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15DB60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GKTJIcj7
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-385c497bf94so2470891eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605994; x=1796210794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDad+1Q3j6dYRY0ykgld/Vjl2b9srpFqahkLGtGJZw0=;
        b=GKTJIcj73MSRc19WpgkJbHmsS4u+4Tpwr7Uylx2HDb9gBLQ3yYKKDWfDoUz+qjBh17
         l+f1UW181QgUoSuZPVNP+wCWw4Tyx96GhUAl443Ha1d87gqeV9osLo+EkhfFnQopmzIN
         moffBKvOT2BONJD27Zg0v8t9eti06H/7n12UYIf2u+uWHI0qHROIOukxS72eTSAxE3ML
         UbHJSo8737BMbGyiI8ciSkn035J2Xr3W5L/3+unJGNC1nzeWLqWtBI5yy8BBthR+36rl
         34dRXp2VABuVWP0rYjgMhTOwRuEuia4ylhWF2zsK+SVwyxNGq4UCujKdyKJM7iQOwA0u
         xVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605994; x=1796210794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BDad+1Q3j6dYRY0ykgld/Vjl2b9srpFqahkLGtGJZw0=;
        b=R639TCtIJBFt8W350xAoo8o7tR+FlqM1Wismd+QFFWnPC2TbJ5WQpm/HXs4/l5d1uJ
         LelvAu4aYnI1erIJCZjFqzLSQcrrD8wF2MIcluCp8/rktxLF1H256E7nsjCGNH3Pez1S
         OrQExa543NbwSxk49qoTEdTRaqxv7MfdEyt7H/sLfD1O4kzUiacDNdOjtFYqiQzgJbTT
         4UULJW8n9G30ENxi6X2J58xbwo67Q3Eigpik5ukW6Av9C6lCJ3r49xohEUveXTUVTQPm
         DMg6LvU9MBZR023f7LtmWd611JRou7Xcoh9HBVF/9R6U/2M7wwlnyvGoCVaUxwLw6CQg
         0FNw==
X-Forwarded-Encrypted: i=1; AL+hErEpb0FaUx0AfgZVy2wxjWwcqVms8NZAat7l5iOXkSA80cx4qm5pp1ho57pblqi59c7yet2aX1IzsUratP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nqcYnKqRA1JbjJNzK78qrXKNXQTY75zegn7SaPsFKgseJTrvC
	0XLCF4Qxsun2aF2ORXh+v3wpun4KPg90xozR5Lmg9thtkmzaM5ZnKH/M
X-Gm-Gg: AZFdTZclfLM85+oDmZR2resrlYfIb3FKCBQpt1ofUMQswS4S0pTZlkH1JUihOZ2ul4o
	znHedEnTnKFXXGcvJ8192Kr1YXhgiasdvODPYs81UBnMyhGD1EiXb0A8xIj0pnOB0tMPn9JohA/
	FmQvyvC8VqlPswH/9hzY+QWxTnNCv027EFSNrtWSPrHfPLzw5s5jSsw1HgCph6uZCnRAnYBPgf/
	KQQ4eqQxLmxF6SWl0HXLlIw8psyEvjfO2so0BhjwigJrC+9kSRPtcWNtDDK2BN21JiSsTl4SbKe
	M33K9iClfj5ujr9K11UdjQ5y/oW79aKWWYevW38MbmgVUEHPzsnZwQDBG91XTJ3mnE0PIRT/dJa
	PNcSqs8SmGfSLf+iDprAA6E8Cc7kiWBZXkS44i4bDzD0d3a0EV6XoIvlvNAClZnm1k36PCz+wy8
	YQH/YKn7MKfkaKRtuqjuOyd3JSdHX0uQRW8aAyjL5gifT/cHroTM8WI9xCRpRU3o0INNlCeRmhk
	mcuSpCmoulbTdiffTMQc5VgPWjdGnN2AGEDND2KDeLjPRJqN+GzsbSpmNBU5iAIfqy7hVoJZd7R
	v7JoyAEd+aeBe2ADMV5dZ3k6c3dEa+HpcA==
X-Received: by 2002:a05:7301:700a:b0:384:988d:6ec2 with SMTP id 5a478bee46e88-3856f6524acmr19373422eec.33.1795605993905;
        Wed, 25 Nov 2026 03:26:33 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm11778380eec.17.2026.11.25.03.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:33 -0800 (PST)
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
Subject: [PATCHv4 4/4] powerpc/kvm-hv-pmu: Free hostwide stats buffers if perf_pmu_register() fails
Date: Wed, 25 Nov 2026 16:56:06 +0530
Message-Id: <158060809f1d4d3708693a6cf33d40365c3af2e8.1795603946.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795603946.git.ritesh.list@gmail.com>
References: <cover.1795603946.git.ritesh.list@gmail.com>
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
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
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

