Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147461;
	b=1wtqgcLtbOnJeVvA7Y3Ul6I5rBoPTh71ntlJC79YrVRrAya1FFjKFsByjiXFZhcvly6g
	 BKsSrpzy8x2TrBoSegPn1T6OTADUOQOOCu2GTjGEW+jBnl6LHuHe3VN9ToX7gXrCT/DKU
	 NjBqF6jDwqp7glXXGZFJH+453Z+G9QlcuKypZnVRZIWuiAWvUw2pCJBhcTUIkuvoFY5lb
	 IuZXuQjB1lrtrh2qQYEzrowG87XtK/tstrrI4ES1fkICBq6gINtlzFU/0+EPnfXmiSal1
	 wpAx+j0kqfret1jiLQjl4sS4FyMsrnQFJT0Vd0EfcIeT1dJ+Zzpo86Qouh0SpvAn41A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gNfLUpbUrpvHXxk7v5s6Ji6TChmuV33nC5/6JAhIS7E=;
	b=EvunOjpOgRmsJDZLh8f8+gtxocET4ZytV6NClx9H6dy91Q1LQCp2KxEF2O1N4XvkI/uo
	 3wqa3CVtivsMH71aoN/PxqSE+OvgN4YM8LAqczmgfN2S4CHImyja8A4Pe3Ay+xfiCD4ZX
	 RKx8L73IX7ylBQUU28jWzgYRI8qCBjIf6WOQkaBrl9PRu2T2rSuXluAusb9WwJexJr9yX
	 iBrL/jmSNrBIrLZRnbWKFMJAhsBxUdeORIf2Qx9qUo7pdRoSfMApfZypFAwG+UYFu4/c+
	 tOxYu9F0nvCeX7qpH5xXiSY+EdR2hSoMGsWVfunm57OnEN/E8jBCyWyl36BZlFRUsnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vNqWMyXI;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26E7606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C26E7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vNqWMyXI
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-382f4710a17so725843eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147460; x=1795752260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNfLUpbUrpvHXxk7v5s6Ji6TChmuV33nC5/6JAhIS7E=;
        b=vNqWMyXInDBkKCwdCzC2jW/veKs8B4U98GsINQKv3/SrPdyWDvSdrKoFkm/d2pkqkr
         wP8tKKGFx2VicMMCYK+iONpKR8ToC4gyIRB60pMRIsOMhA/QYXZA2oDc4BlpAQKO9nMh
         ZoFW712/u0LtrtiectKTMUoh8hvwj+XLQe30lullfSEQcD2j2K8V0MRHP15Jtr6vQ/do
         FzhzQG8iSko20hAbR7pElNHfJPJL+UQThE1evGa+suZ5yEno6c3hNbh8F7WwozJn5lZb
         aJ98vQK0OWgs15seFiJFBRO6gw5smyzRDXywtqn0dlrqRqgvOQbjdClrLNsaZsLBpxtM
         DzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147460; x=1795752260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gNfLUpbUrpvHXxk7v5s6Ji6TChmuV33nC5/6JAhIS7E=;
        b=qpATKKi9eism3PjT7TWueazfppm7ioBBKFTXBpISOugnf/AcLDGsTc8W8uaoW+pDbL
         D4GSoInu1CF+O3n/fzLF5GzVRKKEK3/PQj/qcLd9gcxp3yAeQUqqD0pXdpDpCGFDLU7W
         fwHs3Cxdg+pmGX9Gh8tO5A+raALM2+k5rSEzgco/AL4N3spYgoEKloZo0L2jjwqWshbu
         aW3JkqPP6JcdW+dY6c33K1RZDp+94NSFg/IkQ2nJb05zADTuF0braU0s0PsZSHuiGfc1
         56UicW8QKKIBadsSRzZLb3J8cce02HE3oSIZNyf5h51Hv6WolVQP70ZV9l1VTsfpWyPz
         UZgw==
X-Forwarded-Encrypted: i=1; AL+hErFfsBtTnpR4B1fBSeXLC92TAyWcgTVtia8PbhS9wrGqgutkoOajjFhzvx2CckSBEA36Dz25MIlKBFlG8PU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A6s233mRZUQoCMoUvTFHUNuqBRaxnI5RgXR8NcRZxW8Xg8BIE
	dslQZGzdI0+yiLiOxmCWUGZ+b6NTyOBqgTuNmIuUOPOUBIEtGvovQDAb
X-Gm-Gg: AYBFou3gxSRqfLppN7hZu59EkdOHIw75G29wP3p1IJD7mR5mfYZE2cG93fAAa3NlEnm
	ZyNW2Y5lpxQGnOt+16HlF76E76MThXX3b0BFVGp3PeXS5MGnXIpXTqD8FaddbAZCT9PIySqwUka
	zGM7TomyG8T9nl+PFju/w82Qp3h/EJrC8iaTVCbn+fE0doOxl78BYpLgvza+fqOyHdRlOuBYA01
	UH3lum3tiajIX99BbVUKU8IRLf5T61EpT8izcsKcldF3eBdOaS/2MA6UC8d2oYLTYxpthqRfcE7
	wPchqb1hxMvu9ghNHzlcQGOjQwPYJpzuqkk06IhKy1a4aNvKBqV4NsdO3LAaKm7HA7re7N2h7uG
	XQwUhO6Rv4DatN8QyWh+yCyrbjrxSPvWiQuBt3e09vFr1RAWYOoUjoJ4qKBxE6Cr3E3ZVBuHwwX
	bfKcnnVSVPMFskscQ3rQJca5gHSoWS5rasQdYyLYuIPxdv9a+RwxpXzhV88kmOuC1T//+q47iZt
	UDlm0HsEslUvvUL8/8LbBHkTAGBWdNU460L6mOxaIjgRi+Lmtgt5X46o0Y4m8Dw60O8bBJuzP5e
	3pa3ysZwlRZHU2NX0Cgksi/JHbN2EmxMkTdo7EsGdKlnB+AH7gTmPJY=
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr1616327eec.2.1795147459846;
        Thu, 19 Nov 2026 20:04:19 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:04:18 -0800 (PST)
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
Subject: [PATCHv3 12/19] powerpc/pseries: Annotate the VPD sequence lock context
Date: Fri, 20 Nov 2026 09:33:11 +0530
Message-Id: <13d51cfa826c7c9ab2ce4955a6c6bd18580efe78.1795147055.git.ritesh.list@gmail.com>
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
  papr-vpd.c:151:1: error: mutex 'rtas_ibm_get_vpd_lock' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  papr-vpd.c:165:2: error: releasing mutex 'rtas_ibm_get_vpd_lock' that was not held [-Werror,-Wthread-safety-analysis]

Add the necessary annotations to in vpd_sequence_{begin|end}(),
to fix these errors for enabling Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/papr-vpd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr-vpd.c b/arch/powerpc/platforms/pseries/papr-vpd.c
index f38c188fc4a1..8d210454cff1 100644
--- a/arch/powerpc/platforms/pseries/papr-vpd.c
+++ b/arch/powerpc/platforms/pseries/papr-vpd.c
@@ -123,8 +123,10 @@ static int rtas_ibm_get_vpd(struct rtas_ibm_get_vpd_params *params)
  * @seq: vpd call parameters from sequence struct
  *
  * Context: May sleep.
+ * Returns with rtas_ibm_get_vpd_lock held. vpd_sequence_end() releases it.
  */
 static void vpd_sequence_begin(struct papr_rtas_sequence *seq)
+		__acquires(&rtas_ibm_get_vpd_lock)
 {
 	struct rtas_ibm_get_vpd_params *vpd_params;
 	/*
@@ -157,6 +159,7 @@ static void vpd_sequence_begin(struct papr_rtas_sequence *seq)
  * Releases resources obtained by vpd_sequence_begin().
  */
 static void vpd_sequence_end(struct papr_rtas_sequence *seq)
+		__releases(&rtas_ibm_get_vpd_lock)
 {
 	struct rtas_ibm_get_vpd_params *vpd_params;
 
-- 
2.39.5

