Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147465;
	b=yIO/1W6sjGFioLJr8RC6Diru4iFEZtXE+Erz5bauIyqzaFXws4ETzQF53V8uzSHvY2pq
	 VMGFiIlIc+C/ml20PZ/wIXtQX6vBZuQtEYz6/UB4mKQ8sz0tgRFb9mX6lIx/+rZTzx5uK
	 N2+00u+y7WSQFXviM+X+8S4kOb+Pi1XAUgXYjg1pvBNegRjECLck87SGqtnBgmV2F76KZ
	 Ga0XbUGIz5QaXl0PXPsrTPfBYmR6Rj2+Gzh/Fk8TdMjSNxpC2tGrWsY/MWg1lA/Uj8Owy
	 9JXGIL/6qyHEnNobwUiO/DiBy1stZZw8/yPM2xkhU+/kVnpMLKPxjfWuwLgSjFftDqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=15P/O4uHafhoF2a9GtiIC0oqae4Qc4Z1UYDUjewxzlo=;
	b=vY6KMiV/3nX5phVqq7Algrnfoo2B68Q3F+xH0zeoMI3+1szD63u+7aUp1TX4q8VpOcCH
	 Y1O/cLhZY4eK4UZqQYe7VSIoYAmiKLc2jxQK5DdI0xsIeu/jCBeaFMo9X+a5t5AImcTxu
	 nUXd/s0v7DunEGTEM6i0v0LFLcCYTJ4toJmDtnqs0ro/v6FmdaOq+v6oRsnhCSOCxmTYM
	 oZBWt1r+ee//XG/Ne82/rgUIPpLmtBKZvv9cEbnp0KWEREzgaC76JtuRJk2H+WnRLZHbZ
	 Ud5y6O4YQnqBvZp2P57EyFj+gYnhZhXcfU3GMobZKEis1xfbEOioLZevhk56+TBVckQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMG2Z+FH;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75A4606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C75A4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMG2Z+FH
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-380b40319bdso560027eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147464; x=1795752264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15P/O4uHafhoF2a9GtiIC0oqae4Qc4Z1UYDUjewxzlo=;
        b=jMG2Z+FHtU1LU5SI1rsFk4/kUDnnKw28HrdplbJLF90h7sLzeavxq9ItJAH94KSwmP
         ZuvQZFMJ4txSQmEKjLh6DIu0/tG2GNYKKGU2V8oL7ot0xezAWWv82Vc/MAAeL6Nf7qqj
         tYKubD247JCwnhnjRXv7YKKtwnDJubFM2V6tkSVifHq27I/xgHK1NFFxzh2unZRGIaGM
         j0GK9qwUhbGQX5fjj/2GtqlbfDY69mC7nheyAna2ykdVU2dse5sqHH74wvSst2DxfEi/
         YSlF6plmQkxu53pacuNgrTqYZxstVlWE08LkAXgF2JLz5nsHZmCSzpHRniVW207247A+
         amAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147464; x=1795752264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=15P/O4uHafhoF2a9GtiIC0oqae4Qc4Z1UYDUjewxzlo=;
        b=K1m8hNIfxw16AvHtJXptiLpyRc50LU5QJcqHigEBDmQeL+eQj+tnWROYRYAWPi9sFn
         9I5SISr3YS+yENXBWGuYSSIMUNFVJHtLDYtzkjhjOxRJyo5/i/t45MauszGTlFnkM61c
         xTIvPFMd6vuC6e3W/Kdbmb2yR+Uxlm2pO6wubgegYfgp6xeC4fngPzrcRDemTJYWAap9
         bEX8Xi1KbQS5h2ck4kRilweGFaS9yPgXnp2ghwaGm5fflSgViu/zdEjCVPQ/QziRHKxv
         z0TnSWpd9qzwIUofGcwsGMOU/bfMYtuzWcq5ThhSvtSb7epY10y4YN4HKPbEGUBG1YOv
         1tAQ==
X-Forwarded-Encrypted: i=1; AL+hErF/JZnzpmQBZkLk8KGDWa9v1VGDvAUUeP8zs8enBl/pPSoGcJzJ19nVoKwS03AiSncwUs2hqJdWVL/TdzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pOKTrGziA7uwV6KRGhHDJ1VMo3kHuLivw7S0S8ChpdzlfFyq4
	vE9p5YuORVd7pbkOnIcKc7eGRc9fZdGIagOn+FQcsEHUzGWP7akp7cHx
X-Gm-Gg: AZFdTZcNexvGEa2WsnH9kMbeROTjk3H7aTgD8dpdjilg8UJzrqbwvsUxigkp7Ctupom
	DdiT69Vf9v/SYcxoJ4hRdYOFkkgBGVGI3McOgzkYYtvcRVJcX8VeZ+02cKz6FkMgSB9E2c7r24e
	efS6wyVGibSmQu2NIdeNx8KnUOXTKE5fvYWuvrcGcHBLFeO98NSOWs9WJgkXIBIZX1vMPUDznNs
	tf0CvFA/hEZtyBnP13dI25f+Rcq6hAIlQK5RQPlibsyUNmIhQIWJ3tqaFJB03Pbcg+3zYwo7eZ0
	DF2rpUPIbZGn5yqzqxFx9Z/cPAUz+s9scH79r0vY8G4+K/0DK5ecV6Yq1I1/N/t4boRW7ifb92d
	8YMjtEbK/S+yuqj5xvpYkyrM6wInVOsIULr41JPPdB8f0UvUjHowPe1H9ce6X4BCc9UQC92TYsi
	9F1HQqFbocqG9zPrYFNWvGyVBAdgPVfOnkElT0yJ77zCSB2q4f+9gM8V0erdAbf3fjpI2I3iqqP
	yBQ+4wt1y0yLY2uRVWVnVzeTzip/Y7jNZcKNKSSG3ZVIHl4y/iv2F4dPSYaY4DG9o2hhPkhuFRd
	MAQYtzQEn8YzQTvMczYy1j26Wq/ckIJUgw==
X-Received: by 2002:a05:7300:3e93:b0:383:bef:b6f6 with SMTP id 5a478bee46e88-385701574f4mr1638420eec.21.1795147463979;
        Thu, 19 Nov 2026 20:04:23 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:04:23 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 13/19] powerpc/pseries: Annotate the RTAS indices sequence lock context
Date: Fri, 20 Nov 2026 09:33:12 +0530
Message-Id: <4d966d74a0d6c6f5fb4ff04a116796097f4f29ab.1795147055.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795147055.git.ritesh.list@gmail.com>
References: <cover.1795147055.git.ritesh.list@gmail.com>
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

Clang's context analysis reports:
  papr-indices.c:145:1: error: mutex 'rtas_ibm_get_indices_lock' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  papr-indices.c:158:2: error: releasing mutex 'rtas_ibm_get_indices_lock' that was not held [-Werror,-Wthread-safety-analysis]

Add the necessary annotations to indices_sequence_{begin|end}(),
to fix these errors for enabling Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/papr-indices.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr-indices.c b/arch/powerpc/platforms/pseries/papr-indices.c
index 3c7545591c45..3f3b88f708a3 100644
--- a/arch/powerpc/platforms/pseries/papr-indices.c
+++ b/arch/powerpc/platforms/pseries/papr-indices.c
@@ -126,8 +126,10 @@ static int rtas_ibm_get_indices(struct rtas_get_indices_params *params)
  * indices_sequence_begin() - Begin a indices retrieval sequence.
  *
  * Context: May sleep.
+ * Returns with rtas_ibm_get_indices_lock held. indices_sequence_end() releases it.
  */
 static void indices_sequence_begin(struct papr_rtas_sequence *seq)
+		__acquires(&rtas_ibm_get_indices_lock)
 {
 	struct rtas_get_indices_params  *param;
 
@@ -150,6 +152,7 @@ static void indices_sequence_begin(struct papr_rtas_sequence *seq)
  * Releases resources obtained by indices_sequence_begin().
  */
 static void indices_sequence_end(struct papr_rtas_sequence *seq)
+		__releases(&rtas_ibm_get_indices_lock)
 {
 	struct rtas_get_indices_params *param;
 
-- 
2.39.5

