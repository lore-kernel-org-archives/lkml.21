Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625576;
	b=WQqHaJ6iNkSN2vc2krGtE0NwAyTgUgXGJ+37Y3WhxV2lSHitWsMscMcL1D1pOvB9z3n5
	 qbKRgDp7H/PhV7TViRLm8raBYK2jey/+1AvO39In/KTTVR2GFfTV43YYc8TE7DljWdbcM
	 mRZ5d+RMrXvmFkCYdsqAOTHM2J4h4GqeqJt1FF40a5F+ddeV6gkMttOLZ2Cu2A6DphjTo
	 BcPxmgyvRjwXeGBJaAQChcnqtfFlxkqeu7SoUFUtOosXaSo3/4TOoTytDyTWALEfTASVT
	 cCVOQoT7DgNYlOnbBIRt9aqa9+7xbblsfZzR6/CmBNdbA3aO4Z9zY3gPvQDO6fnvU4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JaZ96BFP7w1Op/oWAR3qnpvuRVSOJcqekj9/BhNvATA=;
	b=CYJsgS2vNL0QDYqU9sqamaFUJjihSZ4KFDtVOJ15eDW2D70vEePjD435rM2ZFXF8QYqi
	 aoVI4Kn4FVAe9dLWtHs5SGOqqnsKIkLGLWGIWOB8f64BAAGrGJKwUHUxiyOcHIKKPN+hW
	 BLwPeKzjwmxY+Qm2kNufgT0LTgPoPk9OHpK+MShzZOil4e3CEOrxboIn7OUzqjfCG+FRB
	 Yh/Z8LnOzSvpFdvb8xUzvlHECJaG1UXBDkFUCqE0KAmQoSN18J5uXdRHKo858i/edzsQb
	 OBZY0Q6CDxC0U8uAohuZsvrQrF3IQel+i0G4WPDwV4kowNQSKzLEw0Ruqnp86rj4Q2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UscAfx1C;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D59606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D59606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UscAfx1C
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so487058eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625575; x=1796230375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JaZ96BFP7w1Op/oWAR3qnpvuRVSOJcqekj9/BhNvATA=;
        b=UscAfx1C3V8CukWgZfB6n+f9a55aETVDV6iBrDj0BbpivO31v8/9/37pLcffTvGohb
         MVCKH3t8eeUGKoMlawedRyNhAA9UOcvhqppaeknIar/EXc0CPeaDrpUslAP8Z64Ib53S
         htvKvUIBJV8vwOh8Tm4OutLPZrKdVxfzgcqmjf4xMu1hq77Vm22O5eU8C4BBQ/MC2Acn
         Ht4rU2QR6Ui4lp2g1SsRBv1TMuXmQN2QbJyXjKs2zxMHWxkrr6PDH3MPQmHev9MmA8UU
         GLlWD6Q6AzYXaF2cmnCtbkj2wurv1XjaZL68g0bqhPTuOMLWUTJwwunJwBqJgWltowlg
         NptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625575; x=1796230375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JaZ96BFP7w1Op/oWAR3qnpvuRVSOJcqekj9/BhNvATA=;
        b=DsYMOlxHMQKsAw1fl6Y9Zn6pbZd5axZvNIqG8v30t6ifm8k7AF4cYmQKER5gHE4Ibj
         DL308CFKCkhzjl4lkvwYe9jhZLOToqjl8fUq4lXLjadcYeloT4tLUU7IgT7Fl1V8DolY
         hEz+6CkaoYQIpRgqP6ePUeKFBcLr38HdCLSB5lEAbQnI/A6Wvrg05qcYftHoQid4rQxk
         9EEn/f5aO31hnx+70ssM/tRO3sSLsLq+R3p938iv30Ulbkzf256EXgOQ18E9YUcd3lOl
         QrI+p0pEMVCbWRpflTltKa/G2p5iZ9TmruyFjwKPnROV4AQlUgUtJ8QOs4FZw84nCC25
         +AoQ==
X-Forwarded-Encrypted: i=1; AL+hErE85Zc8HPPkUK0DBLTTBQ+kh0fJJaGxuiIvkbVMMWTW1X0k+NgPoQbYciir7x4TocRMyXLIR3h78VmsyF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s1XFOnx9HG6BO6KoRC8MWa3wVbOgpHOmNz01zv0T5guTNo0tW
	c1adiWLy57RHEPfbzw010Hytlt5BwXuUGtkuTBSGZgR+DPZAFZdyJPgR
X-Gm-Gg: AZFdTZestwcU+PyIkXElBffykJt0af/ZVyPc/at3ZNskim5m46akThS5GUQUFxFx29d
	LMaIR6pGFSplULNan85nHv6DIOMLyCDfCJn0TBBvF976pxammaS/ZKfy6NFwENC8hyhC5t12A8o
	iw3/8dBvrqRF5DHpx+ZHJmCbc96MfLiWspXFD53/OCqIt9lTKhsS9b7G6dA4KJhro8vc9s77Cda
	DiOcfZbSBXdOGVE/dIUvaO0kFmbpEi7Nn8elHPV6x3lio2qOwPcQeOr1xsFzr02ypLweF8/2n++
	d1fpNhnL0z0PM+9a2LYVkqFD83qK0GN2khqJ5C9PSBMUbRSkNmrvvArMpJTN5yMY9nYowZhbC01
	unv14G/tuF/kJcHOcTpGH9cDvXDesshDYqLes1kKTEz/5hB5qUrVtbEjDvVw34GdiuT7o3jmmXA
	9ucEQzQ4GVUz+PuGGknnEd7Ow38VDGheBhpKkcSXXbyRYOr3fApPQPj6NcENBNJpLfpVyXN1Nmr
	5vSSEI6vPHAA3bLwgaQ8kip94MSGVdwxgqPFBWFIIQNNDVSG+ONOWSZiMkLRPKMqsEsgtzAHmap
	IpLWdgUFNq62P8isgxxTGIXMO+1+v4s57A==
X-Received: by 2002:a05:693c:8083:b0:377:678:2309 with SMTP id 5a478bee46e88-3856ef47a98mr20213276eec.15.1795625575355;
        Wed, 25 Nov 2026 08:52:55 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm98545358eec.3.2026.11.25.08.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:52:54 -0800 (PST)
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
Subject: [PATCHv3 3/4] powerpc/ptdump: Show the exec flag of kernel mappings on e500
Date: Wed, 25 Nov 2026 22:22:32 +0530
Message-Id: <0f0c1087b2ce098cd79e2fff86f00ae1acc57bab.1795625038.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795625038.git.ritesh.list@gmail.com>
References: <cover.1795625038.git.ritesh.list@gmail.com>
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

On e500, _PAGE_EXEC is made of two bits, _PAGE_BAP_SX and _PAGE_BAP_UX,
and a kernel mapping only has _PAGE_BAP_SX (supervisor bit). The flag
table requires all the bits of the mask to be set to print "X", so
kernel_page_tables never shows a kernel mapping as executable:

w/o this patch:
  0xf1015000-0xf1015fff  0x00000000         4K PTE   r          present  coherent                  accessed

Print "X" when any of the bits is set the same way it is done for
_PAGE_READ and _PAGE_WRITE:

with this patch:
  0xf1015000-0xf1015fff  0x00000000         4K PTE   r      X   present  coherent                  accessed

This only changes what is displayed. ptdump_check_wx() uses pte_exec()
which already tests for either of the bits.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/ptdump/shared.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
index edc69da19b85..e28a41a8b1ac 100644
--- a/arch/powerpc/mm/ptdump/shared.c
+++ b/arch/powerpc/mm/ptdump/shared.c
@@ -22,9 +22,9 @@ static const struct flag_info flag_array[] = {
 		.clear	= "w",
 	}, {
 		.mask	= _PAGE_EXEC,
-		.val	= _PAGE_EXEC,
-		.set	= " X ",
-		.clear	= "   ",
+		.val	= 0,
+		.set	= "   ",
+		.clear	= " X ",
 	}, {
 		.mask	= _PAGE_PRESENT,
 		.val	= _PAGE_PRESENT,
-- 
2.39.5

