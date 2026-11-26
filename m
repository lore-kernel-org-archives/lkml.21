Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795667190;
	b=Whe183qnm29tuGW9SdJxpn5qrl9fEt/d1Hxi+1DrAtukYckKQM1GTKMlUJhAI6l23KVc
	 Xnc2BfcJnM/Bv11W4ldnaFx9CXQWlNWbyhSeChxrLlKtxyqQ/cdF3Jn3n29ajt4UjCigL
	 F/wKbIuBUoLfpE51y6apy0/5Nyvpa0TI27zc0KzsxzfKYm1jmIw3LIa1Qg0VulhlF7BYf
	 F17UnMqEWPxE9bbomNKl5WrGMoOCvOL4uu6AABeHkSdXWOH6Qkx0g8RoAqInpS8mYzye+
	 y/jJkeRArsHUEf/qMo+RkOMw4dO5k6XVsYKB6w8eLjO5FofV8thj5bLlJ1H7SPFNyOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795667190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JaZ96BFP7w1Op/oWAR3qnpvuRVSOJcqekj9/BhNvATA=;
	b=R1O0JMy3mJy2i94jkmbeYer++K+LfkPd4DnSGanSWwMxKWlTjQVotc89vjX7YZdX3ash
	 Ps8Ht6Wj6zXHxlnkVl9uLwKAUbjs19/JzNFAc5whHJs5dWtm6nM4dqI5cvGpX8cNVE7fC
	 5NKNGyXkMtdaEVF0gDqwwpS4auB5/7ofXBlTyNOGXnDg8FH0wxU1jDPxRtdOkPnUMa4zd
	 XDZvHIOBzhptfsgXCnGYeW9I5rXxAz2aYb47MQrjPxiFgs4tH9zLvFdGLqhTaKO8mPURY
	 xJN3lK3PqnrtEIB4nSbf18HfL1RhII0V6KOvPkTHWtqYzsW4Y2aagThD6B6zDcvY6bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFQc06jj;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C688606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C688606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFQc06jj
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385c497bf94so4558057eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795667190; x=1796271990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JaZ96BFP7w1Op/oWAR3qnpvuRVSOJcqekj9/BhNvATA=;
        b=dFQc06jjG4VJswMjvfAj6TFjxSzALkbieL9Jd+Qu6ZbspCX+2D95RBYWzecsTmWEsc
         Wd0Rlfa3FrYbbUBAc0kNw23P0Mrcb0nU+8Wpd2jRsFp6Tz76UiBxlp5mIOgB9NodHNLz
         Q4Ry7pyRESMD+BNNsnJxKbgFBJf/UHxU1Tsd5dG8KGLe72PYvq+igJrVJWvNfUtCv6Hj
         SAXA7PjPZP8kVjCxrQHzpRCcK3DUPJ9Yyv3DqtYAGF71CyxD0U1bp02ENezf8SNwrrdT
         15opX3FTeA/N0SSGL5rKwtj1qm+SKu6WQCjTF/ylSXOczPFC0QZ1CWyuh1yjEYV6uciS
         EZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795667190; x=1796271990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JaZ96BFP7w1Op/oWAR3qnpvuRVSOJcqekj9/BhNvATA=;
        b=PfUoqNeXPiCBwQkSZVYZGMaKpVpSmC+FFePDeAhRBQkMkzNT1qobCcotdB1Cl+oO1V
         h9USjjpm52P+tvH/gruzI+qFkeshYaBresL/bGXOu9IvbEA8h57yAsm9yGGj7ajvNlJZ
         sAN9fkrbxr3D+nbNwWpo6VAy6Rv9C3l1nfx5XC0fVx2lG87Z1CyGa1Ra0oCKjCJ2mLXa
         Sa3WCPhAeRq63QRSRE0AjhLnsgbkniQqTlp0bfiolzPbpvVFeWmH2JU2DXK9MR6TW5J1
         +I4HpHqvxTRSH17h7o/SW8t8NwXaLhgKtb7hUdACWq6kIGyighWTCPKemsZV1wia7dJE
         MzEQ==
X-Forwarded-Encrypted: i=1; AL+hErEnLa2zs7VKygdzwOx5595tpmVjwK+4KPoJB3TaXo4tkLOcIu2RWb/4YDrhVbzAqRg09FQ7jG1VBNFf2kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z93NFt3PJUe2JdLvWZ6yedpHvcd3ktC8IqhZh3Qqzz/fvO+BWkG
	cawk5DZzouuMQrjcptmUpJY5opfxDvFTYN5uYuuCNYd7RhtdtqH4EUAR
X-Gm-Gg: AZFdTZeizsou33cdOTQ3BEEOB8MeoaIWsSt70iwT+Qa2qmxnzIkkl/UgmD+uwbLTLFn
	x/jTxokcml2Fq/SsA3d7/DGhfk4cJcrAVmGzRO6i+BJeCV0vIXRv+f4oYp41IjLE5CdNEVSI69X
	aUKzd7DvGtxV3P0v6uz9WRIspWlG8sFbn0ytmDu1GyXcx7oSBpFx7sVjv1so7BEY4v4Z2MHJgHo
	YiqyjaEbSZLbMrP1uL1ZtUFUTHyBnZeQA3L92MAap2x5PGw16Jclmu0M6FUOfUVgom5DBGjdzO0
	I8uynY+uMWaOEoZzyIbOKMBC4uK8O+CTJUinhdvV/XRazUTZ1kvx9EQdHF/L79/dKa7DWHZI45J
	SzTeQvf4+NcPmF6ks/sEqapyPsp9oTjArJId4OgXeeW2pQ4O4moXd3uyC8zyuVRPEEmwvwiSW+M
	Fqp0bzwsdcWugNJF1h6DhgwVjh7JPTxEer0MyrKhw3KJEfYoaDrBtXNSjh2X7q5XfY96w0U46Re
	dUpQPUQ39LLIMN8rIMa/+I8uyL769AaToAeZvQmuXpGH9WuoGoP+/BzKqYh0ksDR4Y4h8UjA8s7
	U8eNKEW1AW31N2DwjBlLFG/dyDOzD3Ob4g==
X-Received: by 2002:a05:7301:fd06:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-3856f549471mr20273704eec.28.1795667189587;
        Wed, 25 Nov 2026 20:26:29 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54542185eec.7.2026.11.25.20.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:26:28 -0800 (PST)
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
Subject: [PATCH v4 3/4] powerpc/ptdump: Show the exec flag of kernel mappings on e500
Date: Thu, 26 Nov 2026 09:56:01 +0530
Message-Id: <4f37adb9ce2d3e2cc485e97f67121b4006a2053b.1795666663.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795666663.git.ritesh.list@gmail.com>
References: <cover.1795666663.git.ritesh.list@gmail.com>
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

